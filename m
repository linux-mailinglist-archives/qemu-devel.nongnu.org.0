Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC7369B114
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 17:37:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT3jB-0007Ul-9K; Fri, 17 Feb 2023 11:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pT3j8-0007Sn-Uf
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:36:51 -0500
Received: from mail-bn7nam10on20608.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::608]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pT3j7-0007zs-E7
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:36:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2fuoxi/Ccdn3Zco9uNndfaz94IRcccoDER1JQbEWApbaMMuiXAjW7M3mGpgkFNcI95DBCi7zdASpKCt246868MDsNltjnzrnAee3YpEu3GtNFY8GYuj9n/nP1Nd3vlRFzXSEM2rKYj9Svw3fUyEDGV3nF6QhMa7NmIo85sTj2f5O1Q4JTUKCTQLcHHP7DJwmOoqQMYSbJZG6NncZu56fqGmVNTSzHHO1SgR0PPOJJP2rl8z8lixsctmGOPzKiiRYJg1IWL8Z4Ge1flE3gu9NMcJDZF45tCA1lcQTZOqx6qME1/ZkEwVT9UXiXfhJqdMFWu1H2SfVCmRnEETwgN0Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRTu4iO3cOWUzbytft7gJEnLrydOhNPFY8IHgCtuoCk=;
 b=Z75ipt7QwhJnIQ+t+YICHXJbq7eOo1Xbk7pgqPe0H4x9W65Qzps5DWjU18K6z8wPYhpG3x9m5y3rH1wWn3OUqQVtlvK8ED1oEsXlcvn3VaBWty+Gtuo3qOS91dJGLdRVzMDlBdb9aG5jSEWiTwhqGpr/bCQpJpeI24A+TJ7ATYqTcUr3D3u76wo6GBBEYemOLe8YtweVfAh5cfBG2Tpg/ILG7VZn84+Jl+hz82ZPDckllF8R+qWqUNZrbwFc+UTD1NbzKuNz5oC6Z/JBmXQ1NKqvanW4s6Z8hbs0io/czHzMFPu2raTIGVavMBjG3rY2OWgzCra9yLoTtYoCYYUXDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRTu4iO3cOWUzbytft7gJEnLrydOhNPFY8IHgCtuoCk=;
 b=ZRhzlcunAXo/An61Gfqz11Iv8wkAW6Qz9DUBe3698LQ88XMD9KA+VZFUwBAkQHUmysJXjEb86ZPxpB/UEQpjd8g7zZZgQ09ctR1RHGqo3jB40PRRia7G6LVBORd5NONlPxPKiLZfMQRLNX+t6eKOKet98ll/v3anTaSyUglKfBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 16:36:12 +0000
Received: from MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50]) by MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50%9]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 16:36:12 +0000
From: Mathis Marion <Mathis.Marion@silabs.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
 Mathis Marion <mathis.marion@silabs.com>
Subject: [PATCH v1 1/4] linux-user: fix timerfd read endianness conversion
Date: Fri, 17 Feb 2023 17:35:24 +0100
Message-Id: <20230217163527.619486-2-Mathis.Marion@silabs.com>
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
X-MS-TrafficTypeDiagnostic: MN2PR11MB4711:EE_|PH7PR11MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: 55cde8ae-3190-4db0-c833-08db110514e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aKHwQdm43YvK/GTOohziIjBMgAisWF1x6ge8poD7oKPoMkS2hXrmGcQsBNLcIr5A7wDgicdxa/lg1QCPDv0gdyTG9RSlKQpmGKfbUQkcjW6+2KtJn7SByoHbvgdmvDUPMugI+N6lQgyY2FUlL5bBkqaEpo+31+54A3PtzIvyhgYj81PYaG+S4jfAC6vLvVSvHmctzYVEsYT6kLfCcY8urBgAL4sDmnbGmFTL7BYb3fzzp73o8HlByW/1IUHdRl0UQ+Lr+SUAtTaatF2fXkP0zxa9PiRx+mRSpBW/XazR8Ch0TPeqHYeUKVKhhKVBkNjryzns2+OA3EUho+gr3ROcs+zmb/aOEjHpGjfA2LsJl3e3c3qId+Kav6W18ff6afV7wCasfDvAt23cHsk83X1OC9nRbSoRcwA8thxDjlCis8EQhhaoNpaQQTyFYLv1Wd6hiW8OPvcsWkeOas5n99wh1OV1ZelWeLfpqdLtWnM3+lUvDflIBT/qNW2/bxPYBDGsZOwR1DRRNGmxZQhr0F6NYmJCnm/q2dJTU+GwpJc7nuE9+8Xseczkq6tEAQW2KSunzLlYIO1A1GsZUILhtOoP/pKfbkfIKDEyC2/805YiZg5NOzrjRG1RFjmuVUqNVQU+t1sPjzMQZkWpgxgXd5LaTaF3S2akRjh+34FiXYI9fmbpbXmCKTK3uofWEwsBroKymHE9oFABM9LUzU2Zx+Q6cw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199018)(2616005)(83380400001)(2906002)(36756003)(26005)(478600001)(6486002)(52116002)(186003)(107886003)(6666004)(6512007)(6506007)(1076003)(86362001)(38350700002)(38100700002)(5660300002)(8936002)(6916009)(4326008)(41300700001)(66946007)(66476007)(66556008)(8676002)(316002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ODTNI/KRR8d0wfor0FhSeGdCqGWe97bASqWGXOJGUdMzs6vZGqlcvpmsZkzA?=
 =?us-ascii?Q?4HkRCRFcnOK8gTkcKPoFfgJ0G+Hx0nBJakEP0y71RLn6esRtUqjZApvNC803?=
 =?us-ascii?Q?guhaZlHC0F/zksUEF91gpMekHkcZppxY42OVSxZExiJ4OcyRFTjk5z5d69v2?=
 =?us-ascii?Q?wZWkfff2DK24AB9WXjVHW0GO2Wc617QwUElJgv2QK+3YiiAkJpkUA/ja0PhL?=
 =?us-ascii?Q?hSwiUKHOOuReQBN4KWoR3BxpIRNTWAWq5lHfkcVwak0xLExEhTyxxzOZHJB8?=
 =?us-ascii?Q?vW5t4wbRma1HqkMGDbWv9//PwZ3R7kqn7W44mONCx71NruGEnS7SmKcH9mgT?=
 =?us-ascii?Q?xIDsbZ2YavbfzaVqIi0e1UsR1dwVp8NKhHqu2oLC3XjIfCV0Y7Z/grko1wt5?=
 =?us-ascii?Q?we9dctI+qj7hqv2hojzwNS8grDnXmtj3/jTzM599yY1h0KBHZPfR4G1JJLZo?=
 =?us-ascii?Q?FosXEYLXmRNx5KM2H0mzooBpFcG0FBCblmDWXWjnn1U9GdhIA1GPcgUZwO/N?=
 =?us-ascii?Q?gI2BgMfZSop+Fbjsv7jxQWoNnoVjhSyyu9cmVWmN7rMAYxvF2aERwQLB8fR+?=
 =?us-ascii?Q?4wDWzee8vaOKeyybCeDmYFYx3yYpVd4LQ9+2p+My1MFTG70Iu9QMY3TZ4Ggh?=
 =?us-ascii?Q?xxLWIVZpGNgiyVL7Ch5EYn+vVqJNoLdi32v9TcMmAtFMuOoJ8pZl4MnwktPu?=
 =?us-ascii?Q?85JNDShZUlNBQK2Wzm7o1bBlh534WbMvDsXUwq0erc+qlWhBOlCc72UHhQY3?=
 =?us-ascii?Q?g2eQUHDOjlfEKm8vLy+7QlESOE86Gl3OXJfFhjIMbmz3hb7OxZ/Bxk6oJHTs?=
 =?us-ascii?Q?/d2bR6Fj/8TCYrvICbcgS9FZ6UmmSaIgrqr7WcIhRWW7ewzk7DchePQDdgxE?=
 =?us-ascii?Q?U3hfTSx0qVLEu3KXg3Gm1kfEEdGpNAjt932GH24R3LemrhPsDI1xG0ijGeVA?=
 =?us-ascii?Q?oUZ6OV9k6DPjUU4OnYTwqEGZfBCiEFE8EXx4M5TOP+DD4e8H6WSUy8Rxck+h?=
 =?us-ascii?Q?0rYfU5nRRihZHIYYia/s6Fb8TWgD9PtjoiQUkvZq7n63PnJy45WOBM67jGai?=
 =?us-ascii?Q?XEZkl9kv51czdzvr0nxgecxlKPL2RUIQG2h2kM07xj7Pe1yp4tayP7DXG1GC?=
 =?us-ascii?Q?37auiEeR+dalv5+HuEL4WxmND5oxPJ+Oex8i2WM8V7W7t148eHDPMXgIx2yz?=
 =?us-ascii?Q?qp0K92Hr2nXDFNr27PTSXH0dflhGPjfts5tgLhGQBHg8bkyrQU/w+Z/bGGsw?=
 =?us-ascii?Q?WlOjYAHwU2Y0+oveSE8QUt47TlfbLBftb5SXBni1ZPm7gmUulMfeSVRgIi3r?=
 =?us-ascii?Q?I+MLgS2QtX+6zms44gcQ9r2fX49ghfLEQbZUIxb6VtZnzw7nylRQxA3WdgjH?=
 =?us-ascii?Q?BhrV0AThDF5TalEsL7lurFlhf14T0Wi6ODOb/fzyVexxvH92hiaFpSvug/sc?=
 =?us-ascii?Q?uIMC6rUsZE6PfDEzDBy4prlQ96YFodvtpyDtJwHYX9U952fTvWE6yQesX8bn?=
 =?us-ascii?Q?eKjoWPrsDbnP13n5vUu43q3XLd5lTOMIm7zQ6paOrHFPAQNTE8ZT7rUpVLAD?=
 =?us-ascii?Q?W2GmjEY6WfyUNuejQy0o3B66/qOOkNEpx7Ivlz+v?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55cde8ae-3190-4db0-c833-08db110514e5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 16:36:12.8043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQ0nywsC/zykmIc6cJfql1Mr1ZcQU2MxXWv+k7CSO+tT5BaV1SB5Di9ZZS7gA82jPerNL39dlSP6dmjE99oKIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
Received-SPF: permerror client-ip=2a01:111:f400:7e8a::608;
 envelope-from=Mathis.Marion@silabs.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

RnJvbTogTWF0aGlzIE1hcmlvbiA8bWF0aGlzLm1hcmlvbkBzaWxhYnMuY29tPgoKV2hlbiByZWFk
aW5nIHRoZSBleHBpcmF0aW9uIGNvdW50IGZyb20gYSB0aW1lcmZkLCB0aGUgZW5kaWFubmVzcyBv
ZiB0aGUKNjRiaXQgdmFsdWUgcmVhZCBpcyB0aGUgb25lIG9mIHRoZSBob3N0LCBqdXN0IGFzIGZv
ciBldmVudGZkcy4KClNpZ25lZC1vZmYtYnk6IE1hdGhpcyBNYXJpb24gPG1hdGhpcy5tYXJpb25A
c2lsYWJzLmNvbT4KLS0tCiBsaW51eC11c2VyL2ZkLXRyYW5zLmMgfCAxMCArKysrKysrLS0tCiBs
aW51eC11c2VyL2ZkLXRyYW5zLmggfCAgMSArCiBsaW51eC11c2VyL3N5c2NhbGwuYyAgfCAgOCAr
KysrKystLQogMyBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2xpbnV4LXVzZXIvZmQtdHJhbnMuYyBiL2xpbnV4LXVzZXIvZmQtdHJh
bnMuYwppbmRleCA3YjI1NDY4ZDAyLi4xNDZhYWFhZmFhIDEwMDY0NAotLS0gYS9saW51eC11c2Vy
L2ZkLXRyYW5zLmMKKysrIGIvbGludXgtdXNlci9mZC10cmFucy5jCkBAIC0xNjIyLDcgKzE2MjIs
NyBAQCBUYXJnZXRGZFRyYW5zIHRhcmdldF9zaWduYWxmZF90cmFucyA9IHsKICAgICAuaG9zdF90
b190YXJnZXRfZGF0YSA9IGhvc3RfdG9fdGFyZ2V0X2RhdGFfc2lnbmFsZmQsCiB9OwogCi1zdGF0
aWMgYWJpX2xvbmcgc3dhcF9kYXRhX2V2ZW50ZmQodm9pZCAqYnVmLCBzaXplX3QgbGVuKQorc3Rh
dGljIGFiaV9sb25nIHN3YXBfZGF0YV91NjQodm9pZCAqYnVmLCBzaXplX3QgbGVuKQogewogICAg
IHVpbnQ2NF90ICpjb3VudGVyID0gYnVmOwogICAgIGludCBpOwpAQCAtMTY0MCw4ICsxNjQwLDEy
IEBAIHN0YXRpYyBhYmlfbG9uZyBzd2FwX2RhdGFfZXZlbnRmZCh2b2lkICpidWYsIHNpemVfdCBs
ZW4pCiB9CiAKIFRhcmdldEZkVHJhbnMgdGFyZ2V0X2V2ZW50ZmRfdHJhbnMgPSB7Ci0gICAgLmhv
c3RfdG9fdGFyZ2V0X2RhdGEgPSBzd2FwX2RhdGFfZXZlbnRmZCwKLSAgICAudGFyZ2V0X3RvX2hv
c3RfZGF0YSA9IHN3YXBfZGF0YV9ldmVudGZkLAorICAgIC5ob3N0X3RvX3RhcmdldF9kYXRhID0g
c3dhcF9kYXRhX3U2NCwKKyAgICAudGFyZ2V0X3RvX2hvc3RfZGF0YSA9IHN3YXBfZGF0YV91NjQs
Cit9OworCitUYXJnZXRGZFRyYW5zIHRhcmdldF90aW1lcmZkX3RyYW5zID0geworICAgIC5ob3N0
X3RvX3RhcmdldF9kYXRhID0gc3dhcF9kYXRhX3U2NCwKIH07CiAKICNpZiBkZWZpbmVkKENPTkZJ
R19JTk9USUZZKSAmJiAoZGVmaW5lZChUQVJHRVRfTlJfaW5vdGlmeV9pbml0KSB8fCBcCmRpZmYg
LS1naXQgYS9saW51eC11c2VyL2ZkLXRyYW5zLmggYi9saW51eC11c2VyL2ZkLXRyYW5zLmgKaW5k
ZXggMWI5ZmEyMDQxYy4uOTEwZmFhZjIzNyAxMDA2NDQKLS0tIGEvbGludXgtdXNlci9mZC10cmFu
cy5oCisrKyBiL2xpbnV4LXVzZXIvZmQtdHJhbnMuaApAQCAtMTMwLDYgKzEzMCw3IEBAIGV4dGVy
biBUYXJnZXRGZFRyYW5zIHRhcmdldF9uZXRsaW5rX3JvdXRlX3RyYW5zOwogZXh0ZXJuIFRhcmdl
dEZkVHJhbnMgdGFyZ2V0X25ldGxpbmtfYXVkaXRfdHJhbnM7CiBleHRlcm4gVGFyZ2V0RmRUcmFu
cyB0YXJnZXRfc2lnbmFsZmRfdHJhbnM7CiBleHRlcm4gVGFyZ2V0RmRUcmFucyB0YXJnZXRfZXZl
bnRmZF90cmFuczsKK2V4dGVybiBUYXJnZXRGZFRyYW5zIHRhcmdldF90aW1lcmZkX3RyYW5zOwog
I2lmIChkZWZpbmVkKFRBUkdFVF9OUl9pbm90aWZ5X2luaXQpICYmIGRlZmluZWQoX19OUl9pbm90
aWZ5X2luaXQpKSB8fCBcCiAgICAgKGRlZmluZWQoQ09ORklHX0lOT1RJRlkxKSAmJiBkZWZpbmVk
KFRBUkdFVF9OUl9pbm90aWZ5X2luaXQxKSAmJiBcCiAgICAgIGRlZmluZWQoX19OUl9pbm90aWZ5
X2luaXQxKSkKZGlmZiAtLWdpdCBhL2xpbnV4LXVzZXIvc3lzY2FsbC5jIGIvbGludXgtdXNlci9z
eXNjYWxsLmMKaW5kZXggMWU4NjhlOWIwZS4uNTg1NDlkZTEyNSAxMDA2NDQKLS0tIGEvbGludXgt
dXNlci9zeXNjYWxsLmMKKysrIGIvbGludXgtdXNlci9zeXNjYWxsLmMKQEAgLTEzMTE3LDggKzEz
MTE3LDEyIEBAIHN0YXRpYyBhYmlfbG9uZyBkb19zeXNjYWxsMShDUFVBcmNoU3RhdGUgKmNwdV9l
bnYsIGludCBudW0sIGFiaV9sb25nIGFyZzEsCiAKICNpZiBkZWZpbmVkKFRBUkdFVF9OUl90aW1l
cmZkX2NyZWF0ZSkgJiYgZGVmaW5lZChDT05GSUdfVElNRVJGRCkKICAgICBjYXNlIFRBUkdFVF9O
Ul90aW1lcmZkX2NyZWF0ZToKLSAgICAgICAgcmV0dXJuIGdldF9lcnJubyh0aW1lcmZkX2NyZWF0
ZShhcmcxLAotICAgICAgICAgICAgICAgICAgICAgICAgICB0YXJnZXRfdG9faG9zdF9iaXRtYXNr
KGFyZzIsIGZjbnRsX2ZsYWdzX3RibCkpKTsKKyAgICAgICAgcmV0ID0gZ2V0X2Vycm5vKHRpbWVy
ZmRfY3JlYXRlKGFyZzEsCisgICAgICAgICAgICAgICAgICAgICAgICB0YXJnZXRfdG9faG9zdF9i
aXRtYXNrKGFyZzIsIGZjbnRsX2ZsYWdzX3RibCkpKTsKKyAgICAgICAgaWYgKHJldCA+PSAwKSB7
CisgICAgICAgICAgICBmZF90cmFuc19yZWdpc3RlcihyZXQsICZ0YXJnZXRfdGltZXJmZF90cmFu
cyk7CisgICAgICAgIH0KKyAgICAgICAgcmV0dXJuIHJldDsKICNlbmRpZgogCiAjaWYgZGVmaW5l
ZChUQVJHRVRfTlJfdGltZXJmZF9nZXR0aW1lKSAmJiBkZWZpbmVkKENPTkZJR19USU1FUkZEKQot
LSAKMi4zOS4xCgo=

