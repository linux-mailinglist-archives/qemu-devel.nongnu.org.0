Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0CC47E912
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 22:28:55 +0100 (CET)
Received: from localhost ([::1]:51848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Vdu-0007ni-Nm
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 16:28:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n0RwT-0005lk-CW
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 12:31:49 -0500
Received: from [2a01:111:f403:7010::703] (port=17069
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n0RwO-0008C7-AO
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 12:31:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNiP4vEIIqdYnYGkWgSFlc8hrGGgL3miQUfOAJNCziW7XHPvinuKLxNERk99Q+8TePoQjAjl4ipDa4XkKdCbG3xgkgF+oH3AowwuL+xrFFkgzXT2gVTqfNa4FXSBH/skqeTDQjy3/lZ3pi5pppoF+Ku5arz0NDoBwVH+huExUeZ1gl5N90k/lulgJre7jT/lQFW01lncp8wm/9Mm7pGeUvOPbEeiCXkdcOMtlmYIZwbloieANzz3qjcnkUfHofwYb1NlT8gc+TPlBEyCnjKDRoc4o6cS8FeQqkN2z/+3zzlqkG5v2mLSIJS6O+XlA0j+oG8CqIwZSkYrs+FdPLZZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THHSKqlakTceXQfEqCnuqtCpDBuBcI2vHkZmTt7ouQw=;
 b=Go+qMjWIyYIXSKVhACA1d778qZswdQm3yOYpvGMOsPIDx7N21Y55OfiYRXLvQJBtNXDJLXKQpdZfoLY3MCkUMG+Klje866rU20GIRhrQFkHbatB7V31zxgBiNiW/HuV0IfIDbnZ+8K/vF85lzJLJ3nrnp1O2+LzuwsCDa+CAfT2IrQEXbaK/kXN4LPHwNzyuGNA9k5Gu23LQAuoIpCUUsXA7rEcDWTCHkHidWYMc5g5+ltr3PdRfgtgna6HC3EAxNAKZmAUrc0Qf+p6+ispO7UkxZ25NDGuo0f4lImzd47uvYIfq+wdJTdroeamYgleK2t00xzJd9vvIY3mOH0Pvyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THHSKqlakTceXQfEqCnuqtCpDBuBcI2vHkZmTt7ouQw=;
 b=cSmWOy5ZBfteadRH25Sx+ZAtf2HZLBnxJvbNHr1WKkz8k47gKs28ABvIGoOYvINUw7aV3cNYQK3WVLZzNMoItFDEHnMoprxTxHitMquHwGHdMA01MLHr0zZJfgL1RCwMRbgn+clEtX7g9liGbtAjKalHMAUsxZXdaB5jS2jx+z0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYBP286MB0032.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:801c::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.18; Thu, 23 Dec 2021 17:16:41 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%7]) with mapi id 15.20.4823.021; Thu, 23 Dec 2021
 17:16:41 +0000
Date: Fri, 24 Dec 2021 01:16:38 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] docs: Add CanoKey documentation
Message-ID: <YcSu9rvjKpENmcL3@Sun>
References: <YcSt+qozrl+J8ool@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcSt+qozrl+J8ool@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.3 (2021-09-10)
X-ClientProxiedBy: HK2PR03CA0048.apcprd03.prod.outlook.com
 (2603:1096:202:17::18) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4381bc94-7e65-42b1-843b-08d9c637fc84
X-MS-TrafficTypeDiagnostic: TYBP286MB0032:EE_
X-Microsoft-Antispam-PRVS: <TYBP286MB0032845F7191C8ECDF46A691BC7E9@TYBP286MB0032.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qfmP6qFM9sIC+z2IrTd9qqyoyxcxmnrw8f4kKF+PtjwI48mMgC3Cs8K66aWgzQQ1lf+PZGLIQXhPxW+9lgkzGcn61L/msvhi9dSW5fFcnpzONrAp1HDzzGTkiWsGQrNuaMOe4u031OO885m8OA1spnhfIwc7BPkDAClnE3b0kol6u6sEyyAzwC4BGs2H7SXMSlNHWiHmPuBllgRiPvVjUKec/b580nUGNlVPWbx3YurAI+dgLhcI0sFVB1tpP993y/BaX4NZaY0E14UNwxxd0Ci/p/jnDSQTj9Hks5QEe05voR5q8m5WVIQFq9zlyG1XSZ8G8zva9Wcp1RkuVbl8dl3EPp9fJn3Dw20VqDQg+90wxTMHTEhqcjEDgeypXGuW8VJU0FDsdIXhKjcw+BW5PU65EXKlsQIbBWuM5CmT0zEwuLU4pFhPIkPI2KFGNx9t9cPArmd1/fkh05iqgY5VD5L5ZIzUPAaVKYzR/3Ak9PXvdqCgNkg39aPG3uIHfvU9wEtYBpTu864xxSqyijO2S1IMlRR4nrAid32NnpqN8BWlFqg3SECK1Iz3Rw+WpZsj4bjj0QokTsX5gn7sfeyzv6S6tZJ3v2kv/+12jwK8vjjV8bt/ihftGwrPiqttZINablvHLVnFeVGbH23lrK1g1IqsKbB8WsWbeMmeWEQ3s0FRcV9pCZdaUPPq4SGG9mQNz/cc4tuyG6aZ2cQa5Wkvsa/zbM1Bhvz2H3dkI55RYovm3FhTIsC3nMpsJqRiPbTwnjKaOxn5Vht8nf2C5BxRsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(39830400003)(376002)(136003)(396003)(366004)(346002)(186003)(4326008)(6512007)(9686003)(6486002)(52116002)(38100700002)(508600001)(5660300002)(6506007)(6916009)(66476007)(786003)(8676002)(2906002)(8936002)(66946007)(66556008)(316002)(86362001)(83380400001)(33716001)(966005)(6666004)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PROQ2A6DwnRYlQ6S5OWJOlQFizBTPNQ85/bi/tAmplT2/DNzeMxzeZMRnG0c?=
 =?us-ascii?Q?X6ExWmk6Cj+x7YVoVrJtYemA7LjFfiR5OOqf0u/eMNoXcYvY53gDbGefwtlu?=
 =?us-ascii?Q?xc4kG9L8uSHM/JJh//TYxXS53ZRd6pGV1gQYG59MT90vpOIO7H+TR9hZu7it?=
 =?us-ascii?Q?Q5Qq/rhTivoOSm19VU2JC8uQVq/c53G64EemKjp0pYzWHXD6F7sfBsSLOiVf?=
 =?us-ascii?Q?1ziEVsOnAtbYTgcNqB0c1xu4YF0aETcqfHlcVTtUNXyDpcP7NwvLczFN8+8D?=
 =?us-ascii?Q?6KUq00z0ASoLh2BaSIk/hMusiuKcd0HMUNj6+wemsEnDx+db4rBDEPzhCgPf?=
 =?us-ascii?Q?etYWOm7I+GNJB6q8y5/QEHCjPWnll8vsVc6XQvg4uScT+J6O4DXAt8Byfotz?=
 =?us-ascii?Q?1nh6JVU4ZkQ3VdAUyapwguR/PeWssEeBsL0zlBHVvRbkkgBu0EYV1SDxvGin?=
 =?us-ascii?Q?UmwD7tUuW7kEzW6ysEePv4YpTU7oRnSGkJmv/uWAAxQXCSTRVvsD8/1TXMJz?=
 =?us-ascii?Q?CCLHJlQJapfMM4XPhEp1BDomjK4Ale0XFpuUY9jtqUK4/HKZvxJGhccX4Dv3?=
 =?us-ascii?Q?Cb4J5bosUhx8efg0PSINc7Zr7vcUfeIaJBYjrVC/v0b0QnyOEcr60kNX8/IG?=
 =?us-ascii?Q?G5cpkLiYJc/k6VCRj8LdjbrDKcJKdFr3lVkA6bKGO0MZbDK7tOTLKnV6xSgU?=
 =?us-ascii?Q?V8YrDcDkNXTt6IBgbSxyRelk3lgu2vUHngBrFASbZ57KmuZCp004S0VTiMdo?=
 =?us-ascii?Q?MN2bIcGSKhUxBpuH1JbXfYCsxi1Fw+0iXkoKC6tDmiAgSqnhkni29/JccQRQ?=
 =?us-ascii?Q?e6ptZHUzRyicUffKgrOBOcpagqAmyZBGdJZ+bzYs7swpCCeWMIpmyJSd8ST5?=
 =?us-ascii?Q?H/apOTmJYjCaTj4OgfZsT5CETRZJoV6AJkPqJfisAEOU2Jc6uB0T1lNcRNlt?=
 =?us-ascii?Q?5+FT7e0DTvdV8BmVggCkuRl7nM3D25rLqTYTQLnNU5yNARAOU4zL/geS2iZh?=
 =?us-ascii?Q?yQe1AX8EaGMQHMclEHGddm26OHxtDrx6FtlbGT6zrSWzp1NTyof5+bZbfIhi?=
 =?us-ascii?Q?/QAA1k5yhWD9bK9ep4u0Qq7+T7RxwfUBTLhsmVgO6gZkAScFmvrOXgQXmdCF?=
 =?us-ascii?Q?m++fLLG4yPipKHQoBPoC5VjGpQHbR3s66W476R3oUSMTYW8E2iLIuZMAUT5x?=
 =?us-ascii?Q?XJb1JfIWUEtZm6Fmi/zqIUZg5Xwi3sfLViCMAExwAEJnJvvd9vnorKwMn02Y?=
 =?us-ascii?Q?nVO3OjiRV0e8NzoliXfb3fywwdcmSUWjBXe0RTZA4To1cYNKMdX5Sraq3dvz?=
 =?us-ascii?Q?8mzJgl+SzJruH2GxLr1dBi4+fg7m4/h0JmlV3d29V5VOw2+nSfAa+PjJCU6V?=
 =?us-ascii?Q?fGOzD3zvYF4x/mVNrtfBdVrlB6pSEoJCgLomaO3Q6Q7ApYQniB0GxDzg7RRb?=
 =?us-ascii?Q?N3e1mxO0e//o508n4L+bEEQqYfZZSaHdVgAvRi1opwz++vAbzx0e7zGVHd//?=
 =?us-ascii?Q?aF4/DWfR0RG1+WbxmGj9ml3Zyf7TNDxgggf6sDZ5BI88DMLKwJTkfTOKqI/C?=
 =?us-ascii?Q?pGvcxIQAnqSDNzkFGtUzMeDIEQT7mhAPPcq6WPiC?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 4381bc94-7e65-42b1-843b-08d9c637fc84
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 17:16:41.2929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MP0eiaOI5lXdSwZp6lVDLAfkIWPIxhXekreBSdD5h6dItpg48yFyd+KA2dboNut9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0032
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:7010::703
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:7010::703;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) APP_DEVELOPMENT_NORDNS=1, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 23 Dec 2021 16:25:05 -0500
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, contact@canokeys.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 docs/canokey.txt | 133 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 docs/canokey.txt

diff --git a/docs/canokey.txt b/docs/canokey.txt
new file mode 100644
index 0000000000..69262194c4
--- /dev/null
+++ b/docs/canokey.txt
@@ -0,0 +1,133 @@
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
+ * (virt-card) CanoKey USB/IP[6]
+
+In QEMU, yet another CanoKey virt-card is implemented.
+CanoKey QEMU exposes itself as a USB device to the guest OS.
+
+With the same configuration as what would be done for a hardware key,
+the guest OS can use all the functionalities of a secure key as if
+there was actually an hardware key plugged in.
+
+CanoKey QEMU provides much convenience for debuging:
+
+ * libcanokey-qemu supports debuging output thus developers can
+   trace what happens inside a secure key
+ * CanoKey QEMU supports debuging output, thus it can show USB packets.
+
+Then for developers:
+
+ * For developers on software with secure key support (e.g. FIDO2, OpenPGP),
+   they can see what happens inside the secure key
+ * For secure key developers, USB packets between guest OS and CanoKey
+   can be easily captured and analysed
+
+Also as this is a virtual card, it can be easily used in CI for testing
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
+And if you want to show the USB packet flow, you can uncomment DEBUG_CANOKEY
+in hw/usb/canokey.c and compile qemu again. Or even further if you want to
+show the USB packet payload, you can uncomment DEBUG_CANOKEY_DATA
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
+[5] https://twitter.com/CanoKeys/status/1473647697744003072
+[6] https://github.com/canokeys/canokey-core#virt-card-usbip
-- 
2.34.0

