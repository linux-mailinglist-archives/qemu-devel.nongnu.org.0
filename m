Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AE268F17B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 15:58:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPltA-000318-KD; Wed, 08 Feb 2023 09:57:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pPlQV-0007VK-4d
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:27:59 -0500
Received: from mail-mw2nam10on2069.outbound.protection.outlook.com
 ([40.107.94.69] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mathis.Marion@silabs.com>)
 id 1pPlQS-0007Wu-VI
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:27:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmkP0sVaCFVfISa0dZByfZIUYP6CrGKD+f2Xk3trjD2C+Ks/DlGW8ZP//Je4EbnO2KPXMmJtyccda6qOLyKpuvGxlObNhq2s8bzIT9J55Hfzed9a447BXmccqOJXRZzrB4TNlRWK6ULaK7w16Q4KA39J+tr1IjqNqR8ET8m8PDwaVinVaRwx51L2dYcPJ2dH0quCQH1XWDF8SQedb5chQOpEeoSQIMqNEsaHUTtOvuy/GsgmaGRuzR5jHfyReTqjDkEst0Iw997FrYOGwGK74M8C4+tokK3XJfEjXs9k5sSugkflwoWKzWSvraSOK9A+bP/8HEOOCoiidtNiyZvoXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRTu4iO3cOWUzbytft7gJEnLrydOhNPFY8IHgCtuoCk=;
 b=Can9thUyWTetqKCtcbcnUjjpNTF0g+2DnuBQuxs1XHQqrDBzAA0yWWuxnVB5xtmKy96niaGIoNKms+Ewwqb/nPns28RNaA+O/ND7alDpBYyN+zV1b2JWsZu6jHsPXpy2b1c4A8eXx2NEYB/Txeo1qChyzXgL/+STOivclU0EogOsA+JUZV5HosrphmlTF2bpKDr6C59sTG53mKu8uvp4mPTIPwpS6pcW8bXIs+b9yekudyk4hkJUS2tC3mQ8Jeps/C67wahg1HrjlqZQaSwjQCMmBK258BkyuKT7k3yUzCdH/CyqMRlULq2OiCz78fC9z1rWYKImSnxeclkwlFuLhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRTu4iO3cOWUzbytft7gJEnLrydOhNPFY8IHgCtuoCk=;
 b=O4IP0V20LEOcYkoIM5R6WkllzJq2OACvT2fquQbkTZRVMeVLe3BYlY/TOJWE2vK4757EXwZR7mz7uFesjs4hm2V6DfqLzgQFFALfdY1mW3hX79GsU/NC4tXbHVbgY29y1PAud/r7HuLbMXUTc7uqy8nP0DlS4ly4mX8GvdPGMm8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silabs.com;
Received: from MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 by MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Wed, 8 Feb
 2023 14:22:46 +0000
Received: from MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50]) by MN2PR11MB4711.namprd11.prod.outlook.com
 ([fe80::bc75:99b6:488f:fd50%9]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 14:22:46 +0000
From: Mathis Marion <Mathis.Marion@silabs.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,
	Mathis Marion <mathis.marion@silabs.com>
Subject: [PATCH] linux-user: fix timerfd read endianness conversion
Date: Wed,  8 Feb 2023 15:22:15 +0100
Message-Id: <20230208142215.56314-1-Mathis.Marion@silabs.com>
X-Mailer: git-send-email 2.39.1
Content-Transfer-Encoding: base64
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0110.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::26) To MN2PR11MB4711.namprd11.prod.outlook.com
 (2603:10b6:208:24e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4711:EE_|MW3PR11MB4748:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be5f775-b5eb-406e-7a94-08db09dff31c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xc3kxO6k2jC+76P8lUTro3F8enNdWx+xBhp6AD5HNYWH+wCkZHw2QPQ6iS6tlxlBy08yjXcUMAehqa8oCnQsqjoy0U+RygibEHSUD3+IFveCOeT+exDDwXk0xutZhxDx2V7151YPpciwJq/hzcnPU8ZVnupJvu+RTjmnIAwqO6rf9jqCVU334Ax5+LsW0mME7H7yRfRD5h7BDZxY0eVHVpSAtsKWm+v4RiOrKvulzHRgjaepqCWygeFXtFWDy4WGvODm4d2jSXPF/9hFo/oyL6I+cfkYWnf8D+r1ncbIlckeLdZsc71YvcPlh584XFykJtJVdywJb5GWUZvyAmQfgBNSRIhXi8++oV/J6qVTT8fLvod6RUe7qNyoklj0EhRMCt8tWZD6M2OeW8MN1o+mKp3Mp0xgCemISpnJ8qaH+f5h5IsIk63B6mkiAjdk5DGDV2hbKGuxO50UQraiQzE5L4Oyrl6QSS2hWor0RFUrbnIcWh6Sf/yo63u2Pgh3sHcTAzhGK7fxwsHALQdTqt1n00ssDuyTDDe2dskBe4ySqk+kiz+OCCrzA1Yh9OBiQ2wLUMM1pY4CqT9h593nvQ2bgnLS5Ym157Eh7BRMB3BsD1UE30Wj2jOAgu+NMSU28n1dIrqkINtLrDDtpu6MXBj6V+aSDGuprLAdaTYD8wb+VFt2UuvRFwA3/oL9DJYlCIFN/zRxaQVl7EIHb4pGx35aFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199018)(66476007)(66556008)(6486002)(6916009)(66946007)(41300700001)(316002)(478600001)(83380400001)(38100700002)(38350700002)(52116002)(8676002)(186003)(2906002)(86362001)(2616005)(6512007)(26005)(107886003)(8936002)(6666004)(5660300002)(6506007)(36756003)(1076003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zyszIf1kexW6dpPmieHAYO9uIkTUBVPYFDNMqsT+o5QQ5dmrEA+/XE5A+Il1?=
 =?us-ascii?Q?SOCbx9LFeVN2fw+7k8N7nbuex6Bg1SjiTjj/ImSLgEA5dBTKzhYni6JuSo2J?=
 =?us-ascii?Q?G+gzb/yskT2fX7oIFIs0v07ZlDvtkFd74GyYnG/nYuvt03hrpn5FRhSWdgqa?=
 =?us-ascii?Q?ysEU0/GLw79R8k6NCJIZeFbwIhb4s4d8BJgM5yN6IntjU2cPoeELEOE7wKSB?=
 =?us-ascii?Q?E8mrH1vLI1mM907kM39ONqFgW0sU/6SwcQUVX3P3Z4ES5P4mgogtInOzfONj?=
 =?us-ascii?Q?/6Pq9BBzGF7Noo3MSbhDztsLmqoijYWBd0wBgis7S1603k6nPsCcEO8z4kev?=
 =?us-ascii?Q?e2Xl84op/rCUCHmDMiF8PcAKc7ABmUDaUGRa7sZF/3/23qjCUa+ll9JnXimo?=
 =?us-ascii?Q?+x66vDUvgSpcSdi0VPRbFVOqpZDKaqDU1MmEBd/N20EoKIZnKFjvuouKR5bj?=
 =?us-ascii?Q?QJL1FY72+xRQXVUSPND+1uEgXPf73RQ7/MmlyJRNOkoBbmAQTQepWJBUiGCo?=
 =?us-ascii?Q?9ZBpaVf/r3j7pF+dM9mTElNRqNCKhX+dw74LTcLItqD3n6EjGBdsvuKktTuB?=
 =?us-ascii?Q?c9RNG05mXaDgISVx5u5Y3gImYXct22soCw3/fXlxfeTKa1xpTsuuw3Shax0U?=
 =?us-ascii?Q?6oFQBDrAgnxFWVOoc9oeV6MI1EWI3K+VzQJRUirTjsONXiiGNFb8Z9qJZC4f?=
 =?us-ascii?Q?IO3YCDTii4D8pmOLP3xr8EVBDwDLB1xBW9wr9yD/d01t2hZIpVnIH19l2JMd?=
 =?us-ascii?Q?BzTFyoE+wNg0piiRMhLjPMVVZEvJJL4dYrK1tVX5Hr1nhoXFByzf4UM0XeTT?=
 =?us-ascii?Q?B0lnvM7kvalTBblf8u6EFLrcRC+M1YgRTfh8GTb4tAivrbxHG8jgMaiRNzfm?=
 =?us-ascii?Q?EOVdoLkldQvc5YXQe9SRikpGYZHAQRE0mh8ZZS0LYWeRtKOcnv2lgI+zwuIM?=
 =?us-ascii?Q?NTrB2imoc6tjLi8HCLh5Elj9QaFIvJdH0xbV82mYgbm0ofaBDFXPDkgl+THd?=
 =?us-ascii?Q?8Cz7blA0KrZegokIwMR1dNSeBwPSOCKCrQPYItypDenPhLNFeBMoVLq2myS4?=
 =?us-ascii?Q?KzTRhVo8uUvaQoaTUjAiTmvFyRwi61B3FgBTeRx+QB/5PQKn/UgAKPx3Ddus?=
 =?us-ascii?Q?58mOUvcp/lRxwAvq4PlCMtoswe/eWOMD5V9fRLV1kLFKx0m3id2Vd10SMkq/?=
 =?us-ascii?Q?2TWIyIMMK0/23e6QZrdk/jbXBonTkrUXRRInr9UprVmALdvRJOSZ9u2qS/QS?=
 =?us-ascii?Q?mc8z6XY8gIE1wUbET7RtxfMr4+4ltde8tCKxQS022J1DGJD4nXW6TDTkL81l?=
 =?us-ascii?Q?hCuj5LO60ETT4WqYK/OeKsMxMxG2rESKfBfNlq97PQY9LqsMtL2NCIK6yR/T?=
 =?us-ascii?Q?51h7sss1ojO5q0/6GLVV6agy0tylqqD/aj5IbJElFoR9JKgYgI8C9t/Wci9W?=
 =?us-ascii?Q?PKgo1Gdos8ecIUS6m2kni+IjnHcxEKWTgxdMEQu5JCNlTN/ZrnfWcAGAgoxA?=
 =?us-ascii?Q?pBCl/BayocoR1KKKLOQXVtqZoQcfU4Y/nBM9jDeoYpI52Vyycl4NxOMRd/bj?=
 =?us-ascii?Q?dcIoGc/m60ppK88XNRJvl4M48bWMzZVdxYAoz93L/PNjaVEBfXW+wxbcdLTh?=
 =?us-ascii?Q?jA=3D=3D?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be5f775-b5eb-406e-7a94-08db09dff31c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 14:22:46.5706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iY5QODZeJ73VjO/F4itWfdudpTSxSucsTOrEQNSlr95wEr3RwcBhE/Ch35Frg0aw8dqbCehzW081Qyg8P0cZ5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4748
Received-SPF: pass client-ip=40.107.94.69;
 envelope-from=Mathis.Marion@silabs.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 08 Feb 2023 09:57:34 -0500
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

