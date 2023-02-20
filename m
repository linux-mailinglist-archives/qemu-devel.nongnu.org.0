Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882A369C71F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:00:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU21G-0003bz-5t; Mon, 20 Feb 2023 03:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pU20y-0003a4-0T
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:59:17 -0500
Received: from mail-bn8nam12on20609.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::609]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pU20w-0000uY-GF
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:59:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhQc+oc9M9XhDsTl+Hy+ECz6RDDsrZ4t56wbIypdHAxKWeHGA3OZ0TLy8OCb0EGMNe2XoRDqqI1xeRgYsimgFA9iqFIxW2SSZNrnrCg9Luoba89zY82ZuEIXlxeqE3qGSoMLvJfJ6C/TMY4zBMT7H+78h+P6BE4JjOm0BFcNsLxVlIoSgmgvJrGUp31kyZMlD7oPYQDo1VTP84G47ink7F0wnu9RQ7fTPWnvX4TqIZqWEDixQZ/sEmxHEUXv4yQWXnMcpSv5prO3RfQRiRMq+N4kih3jNoHJkoFIkZvELWnLkNUDWy3NYx06fvZB3sgLYNuVEQymQlqbKSpwQKCoZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRTu4iO3cOWUzbytft7gJEnLrydOhNPFY8IHgCtuoCk=;
 b=VMLGrx2HU/aZoDRZPSq1X7P51Wsjx23/IYogSe+axhBabDJ9zA2vjfDXXpRg4XZPMYEZnu57O3jBSO0CODhSXELTSBsZfUnlkz8BoDr1SN9JWDyNql1GlR0O0oOhb/6fATDCirntHNhvkSSp+VVgEhv/vnr7wVfTx/wcNgZ/MXK/0Qog8PQxuTgfTyjTD8z67WpNHyqmzPH62xb5vjwabiqITXxD/ZPJfR6VFehwgMvFvQe+NZpVb8yl2hYtTlv96yq0xqYpN3T41pEkcER9DhChh/u8Or0tOy08c1qL+ArbRxpFgXa6Rqli/93ioD5aj/VSd7XL1CZ/n5mXjBG5Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRTu4iO3cOWUzbytft7gJEnLrydOhNPFY8IHgCtuoCk=;
 b=JmM6pGN1dNyu7tNbAqn3iFKJF4PNgXJRGhKWMe7bqxA6pFfOgOqMoPiYsCN+I0hJUcXdTgx+nBgKVgZizN2l0WlXzGgG0QRnQqW0re2Rg3lJ5YxOTu2ShJflUNImmLuh9XudFXl9pfSu/j0vbbXLsb33d3oreWZydHnhgbM/DOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 by PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 08:59:07 +0000
Received: from MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50]) by MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50%9]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 08:59:07 +0000
From: Mathis Marion <Mathis.Marion@silabs.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
 Mathis Marion <mathis.marion@silabs.com>
Subject: [PATCH v2 1/4] linux-user: fix timerfd read endianness conversion
Date: Mon, 20 Feb 2023 09:58:19 +0100
Message-Id: <20230220085822.626798-2-Mathis.Marion@silabs.com>
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
X-MS-Office365-Filtering-Correlation-Id: b99a6fa8-58f6-42fa-bfa7-08db1320b946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fixf2P5HThat5HwIyOIYK3ZAo6lpIvnY3ZO3/VGrz4+1oIRDlGjVzSY9NY/D9gGST1zk5Gt1AcbOnIBsCEty9tJjt39itdjWM+q4h9xBGxeqel4QxaiH9BlU+Ex05R3e80WX3x3jwkuefSEPJxhxBAkaRshK1cxMEUnkUAut8SSx7PWbx2+RIJJduCynez6GFBaTLpWMoiTwT38XH1Hw0BCfhuXPD64gBXU7uZryE9AHsNb46DBkdnPPANO1VyWRcFRxP3MXj2RwIkUX4BJUuyU2kKl2NMkPXZbtoDBcjjLEYeopvo579yjY4ooKGsSHa8gGOqH4lvvVXJ5KsZO3RLSxZmWROT51JK4oscpK4QrrgwvyQY/Mo/LXezWeHhJY6XH6dPe12yMLkxEYXsQldf9Giadw4HTCkA/roIIUlRezTzFeIUS8RFWMIh10LSQ56AP+93tuVSiHk3KreB91tWtvd/gqVPNpDZmGdgo/hHJ/k6F7eGkwY18juzfaDGlPjQUYCgPFedKQLu2AM9hQ2h25fK477eof5C5Enm2L3yvfCLtlXWHc6WcTDxozM0G2pjeyvGnSMF/ABuvLBBnnNztgQZLHkgILgrygsKazLH13CD7JpVEvVCTCWclkCAHBgmBF1+dHTDv4UzFXp6aXKBP8UzE3K9c2GBxIp6ZfuLLPyDySil1bpIE1ERsfv0U7tiaD9nKEHKyESdyVRoAnjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(39850400004)(396003)(346002)(376002)(451199018)(186003)(2616005)(6506007)(6512007)(6486002)(4326008)(66476007)(8676002)(5660300002)(83380400001)(66946007)(8936002)(66556008)(26005)(52116002)(1076003)(107886003)(36756003)(6666004)(478600001)(110136005)(54906003)(41300700001)(316002)(38100700002)(38350700002)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yTN/fwLdZ4ZAGX9Dg79ddUYib2t+vPLxCNkxY/5suZ/8X/iwycyi8lNX+XCE?=
 =?us-ascii?Q?F/bp67/HusEgcx6ADi2Ttm2cmyY9Ncv/cfLWa5fKUlAs9EuwvB+KMNN+OW42?=
 =?us-ascii?Q?VJk8dfNkKOP38xlyQEvd3coErZHZUlTALgPv+gH2rdPjeHteecH7NQQ7GorI?=
 =?us-ascii?Q?/ieXTpOJK+l5RtriOsRIwQnxcSF4AIcnRxG05Z4XTa6CH5wHC6PxXQjVhy2m?=
 =?us-ascii?Q?wHO7LeNFPGJZZkxXjEwc1qZwaXzG9u/0VfA6w1O4z7WiEOFS/A1xyJGMLRJm?=
 =?us-ascii?Q?s5k+zbgIANlFm6co4b3sygakbr6PTfz4C19LTFRsIcl5zmtdgsGMvX8QVC3W?=
 =?us-ascii?Q?b/wivQl5aTA/4gbGFNPJWEvYrher0U+vrvBbYzusNeHi+bTTkIqqi1nKo8Qg?=
 =?us-ascii?Q?R//6Y0Rv4pxCJ0rp5lX41CG59kJDAjUNXD56pkaXCYsReF4n7A4OGtD5O/Im?=
 =?us-ascii?Q?Chjr9aNRjpvH8LW9qj1k2Iy89FIFHtoZiXJnd11mBXkBDxwmU59H29dW27oS?=
 =?us-ascii?Q?q5cM3TyYS2fFh+yXh2Ku1xBVkaUey307SUhuy8ieZmPxBxqmxWp6pqOLpuoy?=
 =?us-ascii?Q?TqzuB4wwMpljqjwu/ZhyeGJO4OIFy0QJCRfGLvmYFheFNMN3a7Rqtp1PbuFb?=
 =?us-ascii?Q?2T/GFNKBYGqrAhsLXBHwqOPPqU6ZSStuQ8CzsS8uW+JjROkDbdsPfjlhn162?=
 =?us-ascii?Q?KfN+VO4c1YQXEl/zkfEOBuZvq10roPSauFINB66qk/IUglDP3/wb69Wd/7Ae?=
 =?us-ascii?Q?K2Vl5Hhd8RY6ifG9WFRPk/YwtVPSYHgfdVuibAu1nLIX4o5DfuBJLoO9jkOK?=
 =?us-ascii?Q?EGsIIF9lplxe4ZemCNtEGlrtYdUkNSYHDIxbJVUgfrl2WgXfCsqh9kes6tGy?=
 =?us-ascii?Q?1nYggMbXqJC5FWuEgoO5fwkwfysj+DrcdiXot3kMTa2YUXZ9WtWtRyT2G393?=
 =?us-ascii?Q?X/bpi+xfadqgFPvLmLCJG/eCMFT9pr8jpo+u0/IzE2yCYyKu3WVe82T+1YVp?=
 =?us-ascii?Q?UWKO5fmpj5fOtPs5+vUaKxktUPveLgJB6LJJTt+MbjOcjTVGaiY7VD5N7Ap2?=
 =?us-ascii?Q?XatrmUEJ2Q1MEypiRSKZFlyK3/ZuDEOjyAUh2oBbKqfcu1giOEoEsOi6xkP2?=
 =?us-ascii?Q?SCv/b4QXCi5CcFwxO7mUDYktAqn7Mi1L1goLAo9/RpE5Kc4K+dmPSd9dR+8a?=
 =?us-ascii?Q?OFSRvZw7YoFGmjcASCwxlS1awv3C9ZQn8dU1CJIQDKoIp0eQshoiX7wK9nIl?=
 =?us-ascii?Q?lpRp+GY+EtWpiDzW6oJ3gZfJn6us8KPQre0OSokwYHjQcp+3NlpJaYhXXBAT?=
 =?us-ascii?Q?xL7ItnEsfCG1hhnLwz2iIAVsl06gB4KO7VY10/Qw490csYSkTEsOFneK63d1?=
 =?us-ascii?Q?mUJ4c2noTZi9wGW03g7PN5gbcYzcfi8NhuMa/UZkayjMxLMmDBTtrvBrJIWw?=
 =?us-ascii?Q?HvgT6Txn5mMyxcPoK0xd0wQQc84apK6oqLUKyFR0mW6FksdRdkUjI632Zir0?=
 =?us-ascii?Q?sMZNlzZ06zefmM6E2tQXBQ0wi8MBVHgJTKKIDiMYf8hgusgcDxlVImNbzVYg?=
 =?us-ascii?Q?6A980xQSxzjhefLoID35DdITQidPPBUfT72Sbvg4?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b99a6fa8-58f6-42fa-bfa7-08db1320b946
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 08:59:07.2453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fO8eCVMcvemwnsltuAi8CeSuLHbM4io76o4kNPuHQdtNKIsDihl1dqCVsdx97AcwfG1mRiXo4h/7QxpMUhP+CQ==
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

