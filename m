Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917E969C721
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:00:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU21B-0003bH-0S; Mon, 20 Feb 2023 03:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pU20z-0003a8-M5
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:59:17 -0500
Received: from mail-bn8nam12on20609.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::609]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pU20y-0000uY-93
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:59:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kx9K2Mp8gwQSBaAKP9wbhe8/zA2OZMis/R4AyHwo3v1+RIM67RrVbgaCUoHrP3X1zcdAEukYiyc3pi6WWGAw1ATTnQuHRjHNdqWgcfoUE8uJnLAsHwN/RpS6/+1rO46olPPC00jLv8T+wURqI+NAmDMFJnnzhD6tYIeFbg7goraPZeFtgzxp4scnDqy46iyeWSFPsWlUxySncZQhJg8DyXsRcaY598JtbLOgsb/KbzLtCT0dAsk2D8UZGmStGJUtIE9lXhiqZQfjZFuBCpMd51h7zUfjCH3DHMEtVFHL9H/eMUbO8AxibOuHJWh1fzKOod2cyBrevZQXK6V2ZfOc5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMONkbnEFiLJqFBgvBo7ynL3jJPn9++WP6MHNpxXOnk=;
 b=oK8jtVjA7lop8O9+kuIBRMJx9gRQz88tYn7CQAKHRZuncviCOnBkCbjDQqtubV9WE7e14D5FmMM5OSEBsIpyJ2zj6aoQlr/0eYhJ/7gFOtjQ9sdjas1ITRXuG/sbT+ognXWCiqhNkLDJSKpbdNJAuSrN+LGe0qVblVxm8Q+nMiqeyerf2su+6FYOxYQEECeutMOyT1N5UjHcUBoWCFq3QQrzUm/af/KK3GjE9rDxGkuw4kF4kI1qg+ZsGvOykeZO44VwaTQc4RbU2BHI4WZGVVwGxT38rs6iXfXuMjb+kP2WD3J5CG/R+cpMM/2UAdRaCmy7P1yzrNimObmUlAeHzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMONkbnEFiLJqFBgvBo7ynL3jJPn9++WP6MHNpxXOnk=;
 b=Vi8tZAoAzxaRh9ZBTzDE6hyeTNwfAKRm1Xxlez4rb3zyJ8/p+SRXUiyWIxRY4Q6iON5Qi/cHl2YGoy1RTgJex60LaIjmgO+XCYq1C5f+wxGV3XFo+qC0bkqqtwrcmzLsneEEO0DEdjimfd7e+fPBwZiUV+0hhjHQvF6TxK9MB7U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 by PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 08:59:08 +0000
Received: from MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50]) by MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50%9]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 08:59:08 +0000
From: Mathis Marion <Mathis.Marion@silabs.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
 Mathis Marion <mathis.marion@silabs.com>
Subject: [PATCH v2 2/4] linux-user: fix sockaddr_in6 endianness
Date: Mon, 20 Feb 2023 09:58:20 +0100
Message-Id: <20230220085822.626798-3-Mathis.Marion@silabs.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220085822.626798-1-Mathis.Marion@silabs.com>
References: <20230220085822.626798-1-Mathis.Marion@silabs.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0159.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::19) To MN2PR11MB4711.namprd11.prod.outlook.com
 (2603:10b6:208:24e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4711:EE_|PH7PR11MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: 20d08b53-5164-4fb6-5258-08db1320b9f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ik7d07CnUuqNWL1AWKBUSQZ6U4C6nToxOqgOiaq7Z0g0YEqXbvIJuJX87IxYXaiiz5E//JI1cG2ERZoURWaxmkfct9yFCuf966rEr2zPJnA6ND/ifGFpOPf838bEvIvFQDARZkaSJWvBHumpYfVTKs+G9uCKhJfoz/ZtAP5MtcO4wdtY7WYiAFgYdJLM0rwI4Alk4lvDj5YBccsibtE+tlKClwVR2F3eUi2iAjrk8w+zZV+IafFLc2nwZGLfdyER/h02nR5NzEMVOqq3fCOyQxcoj6RDklDcMs5jfU3fpU0IvrCK47361Xkzwh8JakM5cMOw3a+6SmAqEtCzQTJz9WzmTWP8DtOuxyIZv8D6bp+pu8GhJZaLh27If32nyyK1UgY9G69pKIpcUj3SRSTo37MO3Kcj7qOJ8/ifPt6g4+TisuhBAoS15dlqq2dXRWyXcg3njeBs7srIt7jdJF/sOCbtNn1TtB3OYTCiLpIRwLgjkhXs9tdJwX7e9fOhwIwwOGYJTzPLcdsJOb5BFRHDUshFOQyjdNuuaC0XiJU7yTGwydgXbMtRhdLSPdqktgsEcKONzQaxwCtOgBSXUvQpUjTd5H4LYXRvuciBNGUPTfTlY76jvqPcKv7IuhBP/k012hZboPgnqdAIOE5WaBiZ/0CksG8ahzNo3ncN/rPY0mJ5iHW9qrXFgt6zo6LJIZqviaWD+7zo3c9dKteyU2YgzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(39850400004)(396003)(346002)(376002)(451199018)(186003)(2616005)(6506007)(6512007)(6486002)(4326008)(66476007)(8676002)(5660300002)(83380400001)(66946007)(8936002)(66556008)(26005)(52116002)(1076003)(107886003)(36756003)(6666004)(478600001)(110136005)(54906003)(41300700001)(316002)(38100700002)(38350700002)(86362001)(2906002)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MqY1CrtRjrYrv0C/gU+ELHDYhkQx6K0ZtHXrHv6iHw4y/9Hs40zwL8Gr250o?=
 =?us-ascii?Q?QYKBNvdcXK/THZ43+yn0uuGveFbRDC7/a7YlqihjMUrfHFoetpDiaTGbPo4p?=
 =?us-ascii?Q?LIyjl06hOrkQSg8PCmIR58PSGUWCJo7hmV2ta9oo71ebqbi9ZCkm+CgOccZh?=
 =?us-ascii?Q?MuoYGAckqio4VERKWZgnBgEYO43DR59xXW257r6+9Vv/pSSnnVX3dVYCeroc?=
 =?us-ascii?Q?uw9Z6onI7IpPU350MMP4B2woG0MUkinbAsQ3CPOO9ch0nt+GDZ2+w0rWty10?=
 =?us-ascii?Q?aQsFwJydY2fyJ820xaXsZ+vf3/hqLAY8ldLMTWwfFVGaeXmnVkScuXKfdVAm?=
 =?us-ascii?Q?3Wzr2q8MJhWFwzd0uEyGmBAIH6rgTD52khfUqCXQTWrWl82Gm//OEIKszJmj?=
 =?us-ascii?Q?2cj/RSwDv5UOBIIUSh2OngAf0IMK0gddknh0IHEeVwVRawldIguvRh0QtAbW?=
 =?us-ascii?Q?Lega1aXXJ+Erfw2otZ/IittSXSHTLQqAdz4VsWPHRjWbS3ZBnlYKuXNwAjIJ?=
 =?us-ascii?Q?z59BwcJPwIDYV6/uGGlmJ5WnuXBTO7JPxGJ8H1arKS+ELFr0B3JUNML+fE93?=
 =?us-ascii?Q?DiODu6P5vHIQni0SKDI4BCN/7BdI0ZxFylbiDkpbyyJzqV0JHPis/2/PeIju?=
 =?us-ascii?Q?CgypwWzA20s1pcVHXVYatfdG+dV80cZUDKh1U+e9pxf7FvqI/eIQ7oRRj2Xz?=
 =?us-ascii?Q?4pVC7vV28DKEE39/24gRSor5bf+8WTxj6gbOQF092fezKy8uf7d3lYmTXPHS?=
 =?us-ascii?Q?whlooVTiLC8Ocqs3xpvBiV8VlSbQMKIw84e34zKLjTZGHGnsIa5tPZ8vS0/T?=
 =?us-ascii?Q?f5dZxTwRMm+HJoaxDAYFDDcWqbG2hiLYhyiF/vR6zb0d2jLis2yPNyCyOia1?=
 =?us-ascii?Q?K1wshCCQIkMYcXxf3D37dQGb5xRCSA7rMYSZH/tgmZnn9EGMkZexvZ50PfrV?=
 =?us-ascii?Q?//B3rTTEcMqFes56uhQwI9nEUyjrM18Udsjy5gzAwzLW/2ADYabowiC2USFo?=
 =?us-ascii?Q?RIdLMjNdfZVfEA4Bcz/G5xLWVx++u3zDbM3RntsDDHNiLm2zsnsWRBduXn72?=
 =?us-ascii?Q?yHQ2ElVvEX5CMWYyU+/qcpVP0yK28tqgefq2+MoUIfxwB9Q+RO/JE0IOzGEg?=
 =?us-ascii?Q?raItMDppOpYgRRJ96VbzOdXjj05ybuXyagXSpg0rr7nu3ByxoEE6NyXWXvq0?=
 =?us-ascii?Q?NO3h+lHInM5j6sjeaxOAuZ3UaYcvcKYUEYVsJCvIh5kimiLA2LVJWr3HFnJG?=
 =?us-ascii?Q?kif3UjlaBAhsZrahurfvo4JnAjmWAN9qFEU6S5eh3tf6yAcisIN8sq6+56q3?=
 =?us-ascii?Q?JFCA3SP5DWtdxfcDuOjemmXudBDpkC165iW09SVuicC6peeBvHBAVrPuyv/d?=
 =?us-ascii?Q?wOZpwO1sGARUzQHwXIT5P2xS+8El2OF7hEjzNsg3kw0Agj9ZVaBsdnYlj6A7?=
 =?us-ascii?Q?b/wgB3JmyNGkpCzigI8pZFINTDy9R4l2tuLrDpog0BvI9qIl4IBcuYHL0S1f?=
 =?us-ascii?Q?Lbbdy1mSxpi/irmmJjtqr5lY++Xs5CxvrXh9ZMxJ/w9E2ox5StrALZwj1Cci?=
 =?us-ascii?Q?MCMe/QlOliErDV7TVi/EUMHQzvQra2crC/gYtfdE?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d08b53-5164-4fb6-5258-08db1320b9f7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 08:59:08.4025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDWzBukIi6xfvYhyGE3hZYhQRweR58RrfOcuFtav4jAwbYAGDYGZrOJI3Xnomw0B6gooCViC9g1zjQKI6E9C2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8033
Received-SPF: permerror client-ip=2a01:111:f400:fe5b::609;
 envelope-from=Mathis.Marion@silabs.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FORGED_SPF_HELO=0.756, MIME_BASE64_TEXT=1.741, SPF_HELO_PASS=-0.001,
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

