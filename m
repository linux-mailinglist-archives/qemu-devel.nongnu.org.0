Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CEF4879D0
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 16:40:46 +0100 (CET)
Received: from localhost ([::1]:39750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5rMB-0003Xm-NL
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 10:40:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n5rK1-00027A-2U
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:38:29 -0500
Received: from [2a01:111:f403:700c::70f] (port=58254
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n5rJx-0004No-U1
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:38:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NrZy8DxkOlXOR0u9eTBW+rjGPGVBBNL6+UnzvPZI+RP74yF/4Ran8U/iU4zcyk/GzoITqtGpTXpIfUYc2s/CMyKfHVrMUxXLXw+/+8wsTyVUNNFHE1xjsHdkAWts+iB8uBeK0aokuxGoRc4OdpphvVMWQw0TxI9h71P5jiT84Iot/kpnWm+e/k83nC2+BF0g6ojIJCKgHYDAhJwh1L9yX8TGz9EjKq559xBdWDs3zBIJoPUllVC1s1yDXj+hC6s/11zD8HkfCjz1ziCzRVUcdjXlYx8OtTLqOxNQX2H4FsNsDK5eyW2s7HogGw8pc3uzsUPi5DOkpuGducT1dG0iQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enZqtaJ6nI11NUb91SX5vUZvs5ZaSSPLNivwr8gz1cw=;
 b=ThDf334H0XtgD/xDwkypszBRIyWgjrfrsepzFGUzPCNSEtz52TILXjRfwLCu7NKYjtIeSh4I/Tx0R9EpEZMjmxghCda4fO7nz073IMFS+8gQ/LI78tZDZUP5Ru71cFWyTQTQsbnjIqCF6G6xP19E6KSAqDuAtCxvlFXJjHg/bedn4y7v16rl2kKOM7lq/bmJ+J6wuA27nj2lwYGwZU5zPQg43iQL/6NEXSRnQDACyr0MGM4DcIiVnKV7HY+SNmLHeKGAsr39KnKNeOlV49MF4hcHh2KgjYEM9DbUbEFcn0iPBU5t8+VJLj9xsp6dH6++zSpaJOackAqnHz5VYPXQEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enZqtaJ6nI11NUb91SX5vUZvs5ZaSSPLNivwr8gz1cw=;
 b=gLVahd0W9Du9W9ParazzLWm3gUdh3lrqLluKfZxXuBdhMeGEdfQDPDeKDSjnKFdiU0ACftr8c6P7Z9eLGZxDvwUv89GbBun/UhzeW9Kn73zwA5GZfSF/JI2TGqIs1ZNl/v+PpBNyvCpytQQYcwqIOdaikv5Yi+P+cNorpzVJxas=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYBP286MB0432.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:801d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.10; Fri, 7 Jan 2022 15:37:52 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%7]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 15:37:52 +0000
Date: Fri, 7 Jan 2022 23:37:50 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] docs: Add CanoKey documentation
Message-ID: <YdheTvpyyiAwDafr@Sun>
References: <Ydhc8cTsH0QNINT/@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ydhc8cTsH0QNINT/@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.3 (2021-09-10)
X-ClientProxiedBy: HK2P15301CA0014.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::24) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85593568-9723-4455-7117-08d9d1f3aab8
X-MS-TrafficTypeDiagnostic: TYBP286MB0432:EE_
X-Microsoft-Antispam-PRVS: <TYBP286MB0432421FB915D28EAC1D48EABC4D9@TYBP286MB0432.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ETK382tqUO4fm7FQsRtNSX5GU4o5MrBtaT2W79xr8I69aHaTaELCdz+stZVkKV/WPlGe9ynnE4Epk/3BmU+evVN87x1ScXhvzfA8OfxLetk1BVvGBo7IXbOpfQnxbBND6wlKcY5DCyxp4Z9P+WPxkVzCSABJ9vIEakK7TSrKHjNHgUuGsZyINnKEiV6uGy9oGDG0lzV2zmwO7yx2MFn7i1weS+J7jLv7lEYwQoa+u7k15+xysRLRzcfcjiA+BHS9KAdEoDqxcpJTo3oH+M5qM+DoWV3ZrcW4JgI9d9ErpIKgnk6UOqICHF3wMGWCHelIMm+0BGFbT4ZgCSteXq5Su2jIvzNl7uxhxxBjUP3Xu57gZBPSGjcuGC4Y/mWhMidmSJdgZ5KgXj/0w1okkQLxj4+zXjzd7K4y1az3VoLw7NDu4k3Cq64LjObVmb4KIV3Tsr0BQCfWjjZjvGLFypvSCiAM9mWLTHVAKHuVEPfj4PvHo1YdnB9blHRLhwfu7UXrTyHljNHKvdEGEsMNUnECAzHOPHqQl9soZHwAg0/vPGOg0mUg6ArHikHkgXnHqtjuer1Q7KCpjVcoUB98Gz48algSpYrpF4eibQt+K03SQ0ed+U5LTvvFFYs9cM0AZmNNnLEKJ/bTzeXikbNv8RdfkCyO7W1PKCp1/yh5PFmGknFZYCL6xNgswlGnYI5ZS6963hU5g7f51zf0o2cwdy1uPwC7kT6jjUCqoVcnY0S9xkkfR8ADBumzQBhaBHt6BUA055mLo/DEl44sptOw3TkUcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(39830400003)(376002)(136003)(396003)(346002)(366004)(4326008)(6916009)(66946007)(9686003)(33716001)(86362001)(2906002)(6486002)(54906003)(786003)(6512007)(316002)(5660300002)(38100700002)(83380400001)(66476007)(66556008)(186003)(8936002)(52116002)(508600001)(8676002)(6506007)(966005)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EbCoNb3MDX7m0fnDQZA8Y/uxaYGCOZaBn3uEDjWxyr/IsJu+wGhAPBFwe+Ng?=
 =?us-ascii?Q?QOUM3Sr0sE4fEN4jLLWbTiaamWyWbUsYxtMN8Kh6ppGbTIzt39Z6MIV+UuFo?=
 =?us-ascii?Q?9cq81IEwPQ3ze0K6iPMXGbQMIC/mTUOieJC4aPSRTYTPXirpqQSdUkIg7RKj?=
 =?us-ascii?Q?e0KtP20vkXBWBCp54k1YeQjquHy+VqPK9+AItxvn9VH6bhuQzHkQy0LJK3La?=
 =?us-ascii?Q?6ocwTjAHfehYOnVwFceMUt6j2WukDAT8sDEVyLAFWp5wK7u+oJzXccTyhvM1?=
 =?us-ascii?Q?aFfATC6DzoMglO6U2pN2BtTIvT0kqtjCSqUOrl1m5UYLjO/5fh021LCj2HZQ?=
 =?us-ascii?Q?kRuDTeOmipqFaAr2sDJaoj3YUEmgsX/lh/R/BrjIcSNjmrbdf4dmz5zNckCf?=
 =?us-ascii?Q?tslsUj/3QliWassa95vDIquzi7NW0Id4jb/srIHYy6aezA234K/DTIR8tZLj?=
 =?us-ascii?Q?HZ66W+DehS79VkxVWxMlLZLYsmPM/hITj2OooyOteIg9hB0fw0/WxQzMsfmU?=
 =?us-ascii?Q?ANs3e4YIIw1hC8OPDDkoSDyCXrfOfXAesDJffRmob400R9B5mhr9opKK/3eg?=
 =?us-ascii?Q?BF1kHUeW1ZMxeywZc7icsEavMJnXqvT5Ghe3BUP7HyooLeHgdEp+BsWbxv9I?=
 =?us-ascii?Q?9ksD6QJojvqFtwnHov2k8yWw6iRQ2cYwa8PN+ZLq1AOBiUTifPobQE6U3uQr?=
 =?us-ascii?Q?xkMJo2w9ymJ6VV+MVrkHikjSKf/eIimmJy+Qr/WAJAOOoZ+fz4joKDzoHLoB?=
 =?us-ascii?Q?N70Ahgkl3yXyFa85KVfHmvzQsj1Ca1mcig7AEwwWgRLHLx4G2QlPPvTJTZYN?=
 =?us-ascii?Q?BdhPrN41e3UPqKdgyNNyCu684hcpOmRD7mp3Da6AAS5A/+BVS/Hb6iita/27?=
 =?us-ascii?Q?sEKxYpP46mADxUAywA/XNiaOfJzyPrBlOBOo8ne0GspzO2XvzCcB6XSxgDJo?=
 =?us-ascii?Q?I3Mzuqxmoj05DFedjCJy+TV5hDqS2wkBdl0eSR9oKSuSbv1x0modPypcdlKv?=
 =?us-ascii?Q?1Ov8G5tgN+DeVi1vsiwL7ZZ3AG+tdsgeMO5sCfCTcRfOJg6Uey+NgEWIVAAv?=
 =?us-ascii?Q?Zj+ZmvsD3YPRPDQ2hZm9Kt7Pt2xs0BDhYrMiKfWn5VM+eB+RRLssNy0rud0H?=
 =?us-ascii?Q?I4+4SjifC811HBdta6oWud4vE3a5BwkkvEgbz5cGlnu2V8q/c4ssqeuaotYj?=
 =?us-ascii?Q?5YSiunoD0XsfsDEjsA3Y8zAtYf2SuHu5u46vmOJLsE79xNvzh2JVAaaWcwDk?=
 =?us-ascii?Q?DHTnQm9tstcsNcP/k3cw0eDw6eftAR8aCPfLwPeo9kqaCHsAnXbWCy5+yUK2?=
 =?us-ascii?Q?hdX99cTWzPbULdZov5WSXTts0j/CLkxnADJGA2YRPI+Jl22Xf+Zoaj3BbYrr?=
 =?us-ascii?Q?pauSD4HVRYIRdDEQ+It495HwfvNwdDHqnONC1d9S+LMaAg7PMDu5RZB9sDYH?=
 =?us-ascii?Q?DQyK1qRvZ6BdS6JYCK6ozwAsxHQzHQ7FHn5jowsWmpJKvjFvMF68TFqSO7Zs?=
 =?us-ascii?Q?sn8Cx8zRXpTUu5Z8wG6Lg6hLIQBsf4m0g135CEzurB9rz8hWQbLLl86q/EIS?=
 =?us-ascii?Q?k8PJ6DMf+CrSNjPTvAmpbEhb/AG/fkQjyKTeDdu6?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 85593568-9723-4455-7117-08d9d1f3aab8
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 15:37:52.2357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UuxM0l8JlItSg0s+jQom1mBDy8ENMxqJYyrE4I0IgKGB/AAwDK0MDKzozeLozuVB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0432
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:700c::70f
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:700c::70f;
 envelope-from=i@zenithal.me;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) APP_DEVELOPMENT_NORDNS=1, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 contact@canokeys.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 docs/canokey.txt | 140 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 docs/canokey.txt

diff --git a/docs/canokey.txt b/docs/canokey.txt
new file mode 100644
index 0000000000..6d6ba19740
--- /dev/null
+++ b/docs/canokey.txt
@@ -0,0 +1,140 @@
+CanoKey QEMU Documentation.
+
+Contents
+1. CanoKey QEMU
+2. Building
+3. Using CanoKey QEMU
+4. Debuging
+5. Limitations
+6. References
+
+1. CanoKey QEMU
+
+CanoKey[1] is an open-source secure key with supports of
+
+ * U2F / FIDO2 with Ed25519 and HMAC-secret
+ * OpenPGP Card V3.4 with RSA4096, Ed25519 and more[2]
+ * PIV (NIST SP 800-73-4)
+ * HOTP / TOTP
+ * NDEF
+
+All these platform-independent code are in canokey-core[3].
+
+For different platforms, CanoKey has different implementations,
+including both hardware implementions and virtual cards:
+
+ * CanoKey STM32[4]
+ * CanoKey Pigeon[5]
+ * (virt-card) CanoKey USB/IP
+ * (virt-card) CanoKey FunctionFS
+
+In QEMU, yet another CanoKey virt-card is implemented.
+CanoKey QEMU exposes itself as a USB device to the guest OS.
+
+With the same software configuration as a hardware key,
+the guest OS can use all the functionalities of a secure key as if
+there was actually an hardware key plugged in.
+
+CanoKey QEMU provides much convenience for debuging:
+
+ * libcanokey-qemu supports debuging output thus developers can
+   inspect what happens inside a secure key
+ * CanoKey QEMU supports trace event thus event
+ * QEMU USB stack supports pcap thus USB packet between the guest
+   and key can be captured and analysed
+
+Then for developers:
+
+ * For developers on software with secure key support (e.g. FIDO2, OpenPGP),
+   they can see what happens inside the secure key
+ * For secure key developers, USB packets between guest OS and CanoKey
+   can be easily captured and analysed
+
+Also since this is a virtual card, it can be easily used in CI for testing
+on code coping with secure key.
+
+2. Building
+
+libcanokey-qemu is required to use CanoKey QEMU.
+
+    git clone https://github.com/canokeys/canokey-core
+    mkdir canokey-core/build
+    pushd canokey-core/build
+
+If you want to install libcanokey-qemu in a different place,
+add -DCMAKE_INSTALL_PREFIX=/path/to/your/place to cmake below.
+
+    cmake .. -DQEMU=ON
+    make
+    make install # may need sudo
+    popd
+
+Then configuring and building:
+
+    # depending on your env, lib/pkgconfig can be lib64/pkgconfig
+    export PKG_CONFIG_PATH=/path/to/your/place/lib/pkgconfig:$PKG_CONFIG_PATH
+    ./configure --enable-canokey && make
+
+3. Using CanoKey QEMU
+
+CanoKey QEMU stores all its data on a file of the host specified by the argument
+when invoking qemu.
+
+    qemu -usb -device canokey,file=$HOME/.canokey-file
+
+Note: you should keep this file carefully as it may contain your private key!
+
+The first time when the file is used, it is created and initialized by CanoKey,
+afterwards CanoKey QEMU would just read this file.
+
+After the guest OS boots, you can check that there is a USB device.
+
+For example, If the guest OS is an Linux machine. You may invoke lsusb
+and find CanoKey QEMU there:
+
+    $ lsusb
+    Bus 001 Device 002: ID 20a0:42d4 Clay Logic CanoKey
+
+You may setup the key as guided in https://docs.canokeys.org/
+
+The console for the key is at https://console.canokeys.org/
+
+4. Debuging
+
+CanoKey QEMU consists of two parts, libcanokey-qemu.so and canokey.c, the latter
+of which resides in QEMU. The former provides core functionality of a secure key
+while the latter provides platform-dependent functions: USB packet handling. 
+
+If you want to trace what happens inside the secure key, when compiling
+libcanokey-qemu, you should add -DENABLE_DEBUG_OUTPUT=ON in cmake command line:
+
+    cmake .. -DQEMU=ON -DENABLE_DEBUG_OUTPUT=ON
+
+If you want to trace events happened in canokey.c, use
+
+    qemu --trace "canokey_*" \
+        -usb -device canokey,file=$HOME/.canokey-file
+
+If you want to capture USB packets between the guest and the host, you can:
+
+    qemu -usb -device canokey,file=$HOME/.canokey-file,pcap=key.pcap
+
+5. Limitations
+
+Currently libcanokey-qemu.so has dozens of global variables as it was originally
+designed for embedded systems. Thus one qemu instance can not have
+multiple CanoKey QEMU running, namely you can not
+
+    qemu -usb -device canokey,file=$HOME/.canokey-file\
+         -device canokey,file=$HOME/.canokey-file2
+
+Also, there is no lock on canokey-file, thus two CanoKey QEMU instance
+can not read one canokey-file at the same time.
+
+6. References
+
+[1] https://canokeys.org
+[2] https://docs.canokeys.org/userguide/openpgp/#supported-algorithm 
+[3] https://github.com/canokeys/canokey-core
+[4] https://github.com/canokeys/canokey-stm32
+[5] https://github.com/canokeys/canokey-pigeon
-- 
2.34.0


