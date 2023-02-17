Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDE969B112
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 17:37:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT3ik-0006x9-5d; Fri, 17 Feb 2023 11:36:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pT3ii-0006wW-5c
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:36:24 -0500
Received: from mail-co1nam11on20607.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::607]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pT3ig-0007il-QJ
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:36:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAS2YGsOILjHIjGwuAQEyx47ivQ5OIdgia8ubCLvrGq1ApGAf6Kdp/29Ee9wXkNZYG+EdwtzMHn6GfcIhUNeZm7cLTBWhJDDBytooZgHR0gU/7yIbhtxd3AaYCf9dOpXgEulHHLYJ7hX5MW/LirgCSwkVBYagk2tFkC8xgI7hHX8xkIFcDy/FZHjKmkHpaleP8qKY7fiB3z65TAIfQYaxL0WQHsrN5a432lMcfxM/j70Ux7fkiZw8qo9C5RuDf+A13LPhN7ddL8B18ldTTN0giaiAz2QDFnDw5gliYsa9GDTkloGopAnxKmqHt9DhIbMJHqb8Iyy6Dp/8awST9BSXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMONkbnEFiLJqFBgvBo7ynL3jJPn9++WP6MHNpxXOnk=;
 b=V7zxaP3O+yvOZr28iBArWcTgtk2z3ITDkH/LHsT0/HXWlEP85IKnjyuKjxYsFcQOSUg4Q3H3sZUTO1nltt3ftl1RxOB79xydbbb4TGhUb/+td6jZzIhAjpIKL/J19eghuqqQnzot46lSPlqfAwujRukeCB60CcW1Pp423A7rwZHsbLqy7zN9zePkmztASXi/CB67BSqGh86XL1S1Qe5SaG4fqARRNu4vkl11avWzqrz4kD9P5K2EDPAPqUAdNAkivCPyujEjiQSdh7rTKpkuQU+cniE82y3/cA3o6NdxwkJ+0jGp9kT22NWAsXWhk83Ez6mT0e+RH8lhzJHf5cuUkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMONkbnEFiLJqFBgvBo7ynL3jJPn9++WP6MHNpxXOnk=;
 b=J+sCgpwkcVobqlC3Kt58WTHciNFxNW/wGMPOWItnesgzapDLsqdyf4GpFL6JYWd5EFQheich8hs4suIgvjsoqRly0cYVIiL6kLO3/g44BvbOieRzK4310ScEvLw7hc1Nx9McEf6UTcNUFxO+LMc7bkkg/yBRf48vyoc0m7b8bzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 by SJ0PR11MB5184.namprd11.prod.outlook.com (2603:10b6:a03:2d5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 17 Feb
 2023 16:36:14 +0000
Received: from MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50]) by MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50%9]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 16:36:13 +0000
From: Mathis Marion <Mathis.Marion@silabs.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
 Mathis Marion <mathis.marion@silabs.com>
Subject: [PATCH v1 2/4] linux-user: fix sockaddr_in6 endianness
Date: Fri, 17 Feb 2023 17:35:25 +0100
Message-Id: <20230217163527.619486-3-Mathis.Marion@silabs.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217163527.619486-1-Mathis.Marion@silabs.com>
References: <20230217163527.619486-1-Mathis.Marion@silabs.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0081.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::21) To MN2PR11MB4711.namprd11.prod.outlook.com
 (2603:10b6:208:24e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4711:EE_|SJ0PR11MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bccba2b-26b0-4a8c-a99e-08db11051591
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tI8CuexD3S06YZKtsYkh35hgZYksJa1uk7IgDUmbSwvepTqY/7rqog9CwqOhWR5SeXoK8GbhyPzRluosM6Xprn/uQAD6BwZI8tzju/rDtzupfrCgztHfvYc1pTumwU5avC4ie5vbpsCN7J/E/G2ffFZfYHr9K8COwj72oA1xArdqvgsvQbQEcsBsvlgJ67bMlwGSJZooI5T/x2COZs22WA54lfOPIhDpnxNuSrnw3DCGJztZeCHpgzTJPJsC5CmDlBJToCaRljdWOcHKi1OPdPL+BzDWhDT77VRRrglz44d4tmGQazx1HDso2Gy/XhtZhwF8GL5jAJ4nukcmV4o5cjGHJc2WDoyPOlj8zL/CUP3DMIgEFTtzQou0wBiQutqvz5tFi3zlOX7hjiFQuJQcBloeas/ovlp9uygk7hzWW59l3xksQoFqsiTnX3qXAkoz9/inrDopmx7cDjFBAnrA7Lr/+LwPNUuDAJ48uX6f/dbm3rJbnbRMD3IzP0/4JsQWWCQ5P4zRtZZEFJgqAdBvLpaiJ2UxKXA/Nz6eMQCQ1eos80xQ80+4NEl/e6cb07pKC/s9iSVZYTuM+hkYEZat7F/JlhkfkfaS16Du5Epfhteh+f1dmP2TjXDltbaEQhIYubtYwxNeDWew9DpqvE7AKAWY7iBFS5i3wJhDN4Vbb7ap9d3lQF6WJOG7pR0Q1sTgJOQwlcnzrubAY7y2z/WdQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199018)(6666004)(6506007)(52116002)(6486002)(107886003)(8676002)(316002)(6512007)(478600001)(1076003)(2616005)(38100700002)(4326008)(6916009)(41300700001)(66556008)(4744005)(5660300002)(8936002)(66476007)(38350700002)(66946007)(2906002)(83380400001)(36756003)(86362001)(26005)(186003)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wDWZiBqIuZLOnEeKAMsw6U/hXycwFG0VNw5MbHCzy2CBTBLw5nQfdj4S9li6?=
 =?us-ascii?Q?e5ajRvY9gKhGYdd4t4Dxv5PJ1Vz4Fgsvp91Nr8hnCzrZ9Gs7DOWptgJxYtAo?=
 =?us-ascii?Q?IOAM/yBoEm87Md2kJ1vHEKnAoUgb9ro9haAU0OHEMpji1YUxTQoaHkz2kSg4?=
 =?us-ascii?Q?a/4OMfkkpDlkFEl0dhrrA/kwUWTsVkJ0hXb5Mh1WY3STwVk29kKvwlS+Boka?=
 =?us-ascii?Q?JGK5KGCn6DGpJwOXbJfvREX+MDDJqEfaVEwwERCtScsWFpqpIz9WUuaA2OLA?=
 =?us-ascii?Q?PUweent73TwaWbeK5Pr10W98PWfpxxhNZ2H8TaZUlTUs9xAepqg7pJ18PU7S?=
 =?us-ascii?Q?/AR560qPdHCmAKWYSzDq1Su8ShHdQDSc/uqw4GftF9Io5CBZS+39H2MFHZ9S?=
 =?us-ascii?Q?eiJSIn8O82yWoMhhJpU85SfUlnve7KRpFsmyMvCT9H5NwlSgtvq6aHkLDbzO?=
 =?us-ascii?Q?bwhgIOEzsCmdvtqNCXiTB+yFiTCHRqASum7OBrONYnirfMDAqn6RB1SYaAaa?=
 =?us-ascii?Q?YbDIzaAA0MWrqfhTXpl7SqLhdr9feOtacRbo07hnMVGA9ndhja72EHXLq8Nd?=
 =?us-ascii?Q?mcdsNIYqEpqfU06appTGgvPtPykC4lONKLS1tpOs0u9Th59wDjdp0wJPXpp5?=
 =?us-ascii?Q?NlDn1+sBcRc+W7rzv3JevP6zGTbBaNQvK9xcO076a5mrGzjjd5of8as7TyO+?=
 =?us-ascii?Q?TyMCT7NiS6TMS1GlzIoPSnBAvtJ6JoLg8noIF1Row91Htv2NpCAF0YJ1MhX1?=
 =?us-ascii?Q?Au9kRKHG0eZllHTDPTR/pEojftxCTBORV9L9/ZEzYttXfFHCD7RhlxJf/pY7?=
 =?us-ascii?Q?DfkJ/iDyT8QTDVbyQwRiCRqzLsCLsK0thmq6qyI55HxJpWJo2dO2y7gxPdP+?=
 =?us-ascii?Q?9iksA0aIrI7Ed2ZXVWVZBl1bhChREVfLJh/K+mjpnu4sJi/HtpO01PSaOybI?=
 =?us-ascii?Q?MmYIVNcft29PxR7C4VOQQeprild7Rbsvsm3IDRVchhE8sYVOLvXvxqnJa0OH?=
 =?us-ascii?Q?XYRDEGcqdqC36seW8BUS2eV72/n0leqp1lUv0k+epb+JKwIZCIu4Y59X4cMD?=
 =?us-ascii?Q?Jn/zeHb/Fv4o2Z2cZyjQ8jnH+zuqg6imjyugXXBvcEVr/gt61b0BotDE/8Hw?=
 =?us-ascii?Q?3zrzJIu+P9Af/tJNJxTcpFixyWt145jDRigbNx9Cwq/vcO0KNEzWCLI6rdXZ?=
 =?us-ascii?Q?UMcvhMmcZ1TDuV9HWxV4Zpl59bfv/8iQNI4Fm06rLOnWuHhS6+MrG8DHpieA?=
 =?us-ascii?Q?nYPLwt3AZ0ym818DxZ5aTMKdd1SlYhrGjixlXGukPMaVGjPz/HShlSKNQOYT?=
 =?us-ascii?Q?Y3ehL0UuS93vIM6oWwhjcin5LJHiwGEJF+iY5XYK44IP4VgquDiBnsJTDyqO?=
 =?us-ascii?Q?v6gPIsVEDsRjmAU0yYNRgPH42evEHKrRJLyh3fda99xaywo8qn7Xoj6eUOdz?=
 =?us-ascii?Q?py+3Zk7CjfuQC9/UuGCFdqj7Hrjvq9KHfzzzICbknOoYeeNTOFZ2My6+0aZA?=
 =?us-ascii?Q?+4DHite9ZTMx8LYgfD4flqMXfgphVAZu7J+kKeWsTAf/6WQHx6VjsksktU6W?=
 =?us-ascii?Q?3E9Ry31KtW/t8EI/CPxuRvYfuOD2cQf9+4JdX2iD?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bccba2b-26b0-4a8c-a99e-08db11051591
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 16:36:13.8682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ae6UNOQj27UXFxAzoqmw2A4HupCHPRI0njRWZMk4Yd7nIptwWXysJBe3X+iyyVglaL87WZiY3o6OJ+U7rN5idA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5184
Received-SPF: permerror client-ip=2a01:111:f400:7eab::607;
 envelope-from=Mathis.Marion@silabs.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FORGED_SPF_HELO=1, MIME_BASE64_TEXT=1.741, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

RnJvbTogTWF0aGlzIE1hcmlvbiA8bWF0aGlzLm1hcmlvbkBzaWxhYnMuY29tPgoKRmllbGRzIHNp
bjZfZmxvd2luZm8gYW5kIHNpbjZfc2NvcGVfaWQgdXNlIHRoZSBob3N0IGJ5dGUgb3JkZXIsIHNv
IHRoZXJlCmlzIGEgY29udmVyc2lvbiB0byBiZSBtYWRlIHdoZW4gaG9zdCBhbmQgdGFyZ2V0IGVu
ZGlhbm5lc3MgZGlmZmVyLgoKU2lnbmVkLW9mZi1ieTogTWF0aGlzIE1hcmlvbiA8bWF0aGlzLm1h
cmlvbkBzaWxhYnMuY29tPgotLS0KIGxpbnV4LXVzZXIvc3lzY2FsbC5jIHwgNiArKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saW51eC11c2VyL3N5
c2NhbGwuYyBiL2xpbnV4LXVzZXIvc3lzY2FsbC5jCmluZGV4IDU4NTQ5ZGUxMjUuLjFhNjg1NmFi
ZWMgMTAwNjQ0Ci0tLSBhL2xpbnV4LXVzZXIvc3lzY2FsbC5jCisrKyBiL2xpbnV4LXVzZXIvc3lz
Y2FsbC5jCkBAIC0xNzEzLDYgKzE3MTMsMTIgQEAgc3RhdGljIGlubGluZSBhYmlfbG9uZyB0YXJn
ZXRfdG9faG9zdF9zb2NrYWRkcihpbnQgZmQsIHN0cnVjdCBzb2NrYWRkciAqYWRkciwKIAlsbGFk
ZHIgPSAoc3RydWN0IHRhcmdldF9zb2NrYWRkcl9sbCAqKWFkZHI7CiAJbGxhZGRyLT5zbGxfaWZp
bmRleCA9IHRzd2FwMzIobGxhZGRyLT5zbGxfaWZpbmRleCk7CiAJbGxhZGRyLT5zbGxfaGF0eXBl
ID0gdHN3YXAxNihsbGFkZHItPnNsbF9oYXR5cGUpOworICAgIH0gZWxzZSBpZiAoc2FfZmFtaWx5
ID09IEFGX0lORVQ2KSB7CisgICAgICAgIHN0cnVjdCBzb2NrYWRkcl9pbjYgKmluNmFkZHI7CisK
KyAgICAgICAgaW42YWRkciA9IChzdHJ1Y3Qgc29ja2FkZHJfaW42ICopYWRkcjsKKyAgICAgICAg
aW42YWRkci0+c2luNl9mbG93aW5mbyA9IHRzd2FwMzIoaW42YWRkci0+c2luNl9mbG93aW5mbyk7
CisgICAgICAgIGluNmFkZHItPnNpbjZfc2NvcGVfaWQgPSB0c3dhcDMyKGluNmFkZHItPnNpbjZf
c2NvcGVfaWQpOwogICAgIH0KICAgICB1bmxvY2tfdXNlcih0YXJnZXRfc2FkZHIsIHRhcmdldF9h
ZGRyLCAwKTsKIAotLSAKMi4zOS4xCgo=

