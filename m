Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D95A49DEB6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 11:06:25 +0100 (CET)
Received: from localhost ([::1]:54566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1fc-0005QR-Gc
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 05:06:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nD1N0-0002E1-Lo
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:47:11 -0500
Received: from [2a01:111:f403:7010::72d] (port=20398
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nD1My-0001sp-ND
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:47:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhcLdMy/szMwc2EYUCZ/ThDyabxmgBH+uTr3K1lTNDvvVKzdWkHkAuhqvW8ijhmPXzZ44E/7elF+eb+J/zgWRz7hbdip9EJd5bU5gvcKfYr+QRL2/LtXxzgc/vXqxEuAf2iq5AV6sJtDf6+sZbREDGbRdzC0CQq5h6jI3I2CgxBOxvAT/ZkXj9qFPS1OuPZZ7YfPfoEME8JZWy4Svy2GKHczndWQ5l6lqdoD5ATbE1o8Qfj0wBgtno+MyWc6DF5Hm0gAqnPYrNuQJQNPcITtFeHG/HBLuUhxZNVfaGxSkgJ38SI9iRc9XaiAGRZv89/IaHurSM86KkF31eu/rt9gjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oh6oRbpWvqqWv9fOKf4bpr7ebCdmfWra7TNIKYtjW2w=;
 b=TYIRVO6R92bR5oCb2gilV33VUk3gHnc9B71YAMXAv9Sxa7n+upCyrXrMe4rEo0pTbRiFjXLJqz0keC2SefWgfG9zy22NgEuT0aX2dOhKIU5ULcjlJZXaHulI2fnfAFXOp+2U8gE0CJJ+4HOBe49H/C7rWf2uzeG7Gc78J/oRN3LEolE7R1s5/M/wtkOS9FhjVgUqA2+GSOk0STaUuxgK4QY0U3iGODdq3KZpeCIaY0VrDN/eV0ZOfY9ZAfqpctIW9Ci9zo1dzWkxzU3DFNW5UmNKiSXWlOrk3dqrxSJ3m11JGxlK2aDsb4SuuBIoVaBv4xCil9MLPzMWxSWeaLxn9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oh6oRbpWvqqWv9fOKf4bpr7ebCdmfWra7TNIKYtjW2w=;
 b=Flz/FAqBqv8YqEx+eFxlJ4hTOO5FN8Foix2sqlVs7+wCJZCVyg/UIk5iTSBLvOGoY244IgX52EWEC5IY2wdSFApjIZmJj6NmPQETxeBNnJcozDT8QbZRZWkqdiTuniiKl2cX1sza32Xuir5RYtmPtuTRhsoxuAusQjwU+z774nU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OS0P286MB0482.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:ac::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15; Thu, 27 Jan 2022 09:47:05 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%8]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 09:47:05 +0000
Date: Thu, 27 Jan 2022 17:47:02 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/6] docs: Add CanoKey documentation
Message-ID: <YfJqFqp0t286/dId@Sun>
References: <YfJozy5qjVYh24Xp@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfJozy5qjVYh24Xp@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.5 (2021-12-30)
X-ClientProxiedBy: HK2PR04CA0080.apcprd04.prod.outlook.com
 (2603:1096:202:15::24) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6018741a-85e7-4d7e-08a4-08d9e179f9d6
X-MS-TrafficTypeDiagnostic: OS0P286MB0482:EE_
X-Microsoft-Antispam-PRVS: <OS0P286MB04825C93C7DDFD08EAABB10DBC219@OS0P286MB0482.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LRZDsppbANmQzFmttozkx5EAKbN4c6ImDOEVNmLyjJBCdZEKgxyucu8Irn4CjCmzdWkPw3hwvo/UCkGF/GqNTm/Ejbl2bU3oS3RWR42mEotINJz2NoV2819Te9Uao4gAMD2M8v9Go7ZGKX43cNp82JaNXHdvLwfsqJppfEhgmhpse6fYH7R2yfczQ9gaeBvLlMmDafTKs4+0AHZJ5BLpTRSS5dHmAZkea1ctoOQEyfYYQiR+7Cs6yNr2PIiX+pfJxgsbok5zi+H9mOkQ7/aTiMU6apVQpXDv1mdgKAVD7zh2CMtXWIW5nP/3xycz9EN8DejxOCQbCpuJY4p/NmQWb6Kj+3wTZLcx7wHbKJNc5sKhcN6mon8vCmZ2hy/ws/ns/bnOcQcGLG91FFEunN/eiSMyKHHH4l9ekPXpkT1s8J0zDu/sXlRhcPuWIeOXzuy6tt4qqYXZQlTMfQrYkQ3Bxna3W6p1EgMsk1ZKlo7/+Q7HWy3x9pl+xAW8LIzfBuVrSfT6KeG7Iwc0YglYsDGIJoPnqbfCYqG/j1KMThHNI6Xp8KZ3JuY3PXH8eMKQfCargGyDCXF1Np/zVgMignm7e0YfcRQz4KYhhg0gYAAEHx2ta1X6os7hp2y1/oKqwuccGvznLEyP+K9kS4gcUkbw5T3R0n17X/M6YxfejdU6P6/IzqoquBRcZ+9ZvkuRigyq1a571f9FsXx7+1DmCs2CtyIidXnuZ+OkX1GY8FyZ3qijtThMKMHtHVzjhIuSXFtpvyOC92ylnpwJG3l1L6eD/mMfkcIqDa886kaj2D8SsQQAfzzZ81eBuTHp80hAmt1K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(376002)(136003)(39830400003)(366004)(396003)(346002)(186003)(26005)(9686003)(86362001)(6666004)(6506007)(6512007)(2906002)(38350700002)(38100700002)(508600001)(6486002)(966005)(33716001)(83380400001)(5660300002)(6916009)(8936002)(66476007)(66556008)(8676002)(4326008)(66946007)(52116002)(54906003)(786003)(316002)(49092004)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?se0EG6qJGlRpaj6f053oCnOof9Vc82KlBMGmcKYuYERvqVt9gD4sG7XyXgGm?=
 =?us-ascii?Q?RgaN50dz1Vpmc3L2YxEq7Nn5xUU5VvS7aUK95OzkMAohjJi7wLicv0rJlXzp?=
 =?us-ascii?Q?ue7RTm0+erRnC+Dyub6ewTRJ11aujznTEI723o574TG/XLhzTMvk065oRdRb?=
 =?us-ascii?Q?PU2QlD8p23qnQLCpQzQrEsx3U2r6zC0j/g9Mbx6Hi/KU1sm+e11iAGqkJqDJ?=
 =?us-ascii?Q?6kW2payzsgNIM4LX6cmU6+42j858rL6h+OI0OdUgOJO7IWB/ZqipZNSMyKAR?=
 =?us-ascii?Q?Sl8GicCRmvw/3hUoBNRowWPUArDGabgIYQkDndL6CcTSJO5igCpN/E2mHF8Q?=
 =?us-ascii?Q?0pSxBWrInqRkLCBV39zjlCz9lJmrjstin27toT1e1v0+REJprarSKclfXBCr?=
 =?us-ascii?Q?lkutb/aM+/Xp/Y7VR72La5fBWn98XG9Y3wGRVKFG7NeZK6y7PGbmAriJat08?=
 =?us-ascii?Q?1YSU3X8KM+5z1W26WZBOs38xdyehA2bZTe1TPFe/sa+HYgTCBy9mZZGasWGC?=
 =?us-ascii?Q?2yzaNjUwfCYaSEGbmHlYsHlquW8rLcq5JLQ2yChfJSoqH0cW6Kwm0AIATMLA?=
 =?us-ascii?Q?Psu4RkCdj7PZi7vB8TB290G+K6JX+Dc17008WezODlSXScKshd4aiWsjz/Oe?=
 =?us-ascii?Q?QRrH27D5gcgQFaQcRGDxhUoMt094GwFfbaT+z7qgwMRs8QijtmewmQpKX9jp?=
 =?us-ascii?Q?XhAOKXR1J7C9eDx4Ictjnlftbid4HoU4lM+JQ7fEeio2gUGwVh45iQXpEdQ5?=
 =?us-ascii?Q?BZtT6FaX3Txftx+6zDE4sjGsGJ7j0l6rqnBMgH80wrh63zdmq8Plz+nXPZVw?=
 =?us-ascii?Q?dRqYVSzvhP1jFrBYI2976p8bfscOFXIRyRQiuqNiragJaJjJY6g7HdexJ1b9?=
 =?us-ascii?Q?ZDnm7OSK7wIBRAfkMWg3rR+uhIA8RivLJNY2FM7VxjFnqECoIHQR838OVvTj?=
 =?us-ascii?Q?C1ARrp+G4HAYsE7BqMi0S0/hvDV7WGKT0R4/7WsnXLcIArIhwda65j0ep/ao?=
 =?us-ascii?Q?VAUnvqOxrS6coatvebxa5SNVFbSLpgUjjkGPzoD4j+XtVN8G2on4LxNAiDXx?=
 =?us-ascii?Q?NPYoDWQupRF+UN4mU5krxn+ezyRyrrPB4nOE6oG/GCnDWehWszeoEkr1SI1+?=
 =?us-ascii?Q?OtQxcrbnfY3Q+MWTzrQfURh93LUgppaZvavPfVK1IpirPcfM9zngNRmyKPUq?=
 =?us-ascii?Q?+jYhy4oCWxcWl6Sr59bSdNfN+MclAObWg/tM8NwLL80fAviQlRveU604K0zy?=
 =?us-ascii?Q?O8/9fSffEU2N/FoY8vK/sGAgfaIB103hwrEzenB8ctGyTNT+bf4DecaqNs1/?=
 =?us-ascii?Q?zZ18LuhNbkh/eM/8xEOt4N/jQK4+4l3NSu3kCoW0VVS7MVx1YYVYbSgXqqL/?=
 =?us-ascii?Q?E/k62aYnHpPuaXAyUczKRIPynKFuGM1mrDZeSaGh+gENGuMPJwJo1UyYJvOs?=
 =?us-ascii?Q?6AMcV7cORU2XjkRsYnr+dwg7mcT7o7YN9Cf1W1o+v6Wp+MTPG6T1ztwrFZSm?=
 =?us-ascii?Q?DFpIVTqg7GPOi4ew9+lpbGTRcJM18+Rdy7/6fOfJXctX7XF9YrjhJY+o8PaQ?=
 =?us-ascii?Q?Jml9744YD9w5cofHz68=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 6018741a-85e7-4d7e-08a4-08d9e179f9d6
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:47:04.9900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1uePIJynbfmbdTQpfN6mUEYQ9UAHKqzZDfnCPN138kfCu7y4vF090xi7j/mUo5NG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0P286MB0482
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:7010::72d
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:7010::72d;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) APP_DEVELOPMENT_NORDNS=1, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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
 docs/system/device-emulation.rst |   1 +
 docs/system/devices/canokey.rst  | 158 +++++++++++++++++++++++++++++++
 2 files changed, 159 insertions(+)
 create mode 100644 docs/system/devices/canokey.rst

diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
index 0b3a3d73ad..93ba44bf55 100644
--- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -90,3 +90,4 @@ Emulated Devices
    devices/vhost-user.rst
    devices/virtio-pmem.rst
    devices/vhost-user-rng.rst
+   devices/canokey.rst
diff --git a/docs/system/devices/canokey.rst b/docs/system/devices/canokey.rst
new file mode 100644
index 0000000000..3b40bc4511
--- /dev/null
+++ b/docs/system/devices/canokey.rst
@@ -0,0 +1,158 @@
+.. _canokey:
+
+CanoKey QEMU
+------------
+
+CanoKey [1]_ is an open-source secure key with supports of
+
+* U2F / FIDO2 with Ed25519 and HMAC-secret
+* OpenPGP Card V3.4 with RSA4096, Ed25519 and more [2]_
+* PIV (NIST SP 800-73-4)
+* HOTP / TOTP
+* NDEF
+
+All these platform-independent code are in canokey-core [3]_.
+
+For different platforms, CanoKey has different implementations,
+including both hardware implementions and virtual cards:
+
+* CanoKey STM32 [4]_
+* CanoKey Pigeon [5]_
+* (virt-card) CanoKey USB/IP
+* (virt-card) CanoKey FunctionFS
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
+* libcanokey-qemu supports debuging output thus developers can
+  inspect what happens inside a secure key
+* CanoKey QEMU supports trace event thus event
+* QEMU USB stack supports pcap thus USB packet between the guest
+  and key can be captured and analysed
+
+Then for developers:
+
+* For developers on software with secure key support (e.g. FIDO2, OpenPGP),
+  they can see what happens inside the secure key
+* For secure key developers, USB packets between guest OS and CanoKey
+  can be easily captured and analysed
+
+Also since this is a virtual card, it can be easily used in CI for testing
+on code coping with secure key.
+
+Building
+========
+
+libcanokey-qemu is required to use CanoKey QEMU.
+
+.. code-block:: shell
+
+    git clone https://github.com/canokeys/canokey-core
+    mkdir canokey-core/build
+    pushd canokey-core/build
+
+If you want to install libcanokey-qemu in a different place,
+add ``-DCMAKE_INSTALL_PREFIX=/path/to/your/place`` to cmake below.
+
+.. code-block:: shell
+
+    cmake .. -DQEMU=ON
+    make
+    make install # may need sudo
+    popd
+
+Then configuring and building:
+
+.. code-block:: shell
+
+    # depending on your env, lib/pkgconfig can be lib64/pkgconfig
+    export PKG_CONFIG_PATH=/path/to/your/place/lib/pkgconfig:$PKG_CONFIG_PATH
+    ./configure --enable-canokey && make
+
+Using CanoKey QEMU
+==================
+
+CanoKey QEMU stores all its data on a file of the host specified by the argument
+when invoking qemu.
+
+.. parsed-literal::
+
+    |qemu_system| -usb -device canokey,file=$HOME/.canokey-file
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
+.. code-block:: shell
+
+    $ lsusb
+    Bus 001 Device 002: ID 20a0:42d4 Clay Logic CanoKey
+
+You may setup the key as guided in [6]_. The console for the key is at [7]_.
+
+Debuging
+========
+
+CanoKey QEMU consists of two parts, ``libcanokey-qemu.so`` and ``canokey.c``,
+the latter of which resides in QEMU. The former provides core functionality
+of a secure key while the latter provides platform-dependent functions:
+USB packet handling.
+
+If you want to trace what happens inside the secure key, when compiling
+libcanokey-qemu, you should add ``-DENABLE_DEBUG_OUTPUT=ON`` in cmake command
+line:
+
+.. code-block:: shell
+
+    cmake .. -DQEMU=ON -DENABLE_DEBUG_OUTPUT=ON
+
+If you want to trace events happened in canokey.c, use
+
+.. parsed-literal::
+
+    |qemu_system| --trace "canokey_*" \\
+        -usb -device canokey,file=$HOME/.canokey-file
+
+If you want to capture USB packets between the guest and the host, you can:
+
+.. parsed-literal::
+
+    |qemu_system| -usb -device canokey,file=$HOME/.canokey-file,pcap=key.pcap
+
+Limitations
+===========
+
+Currently libcanokey-qemu.so has dozens of global variables as it was originally
+designed for embedded systems. Thus one qemu instance can not have
+multiple CanoKey QEMU running, namely you can not
+
+.. parsed-literal::
+
+    |qemu_system| -usb -device canokey,file=$HOME/.canokey-file \\
+         -device canokey,file=$HOME/.canokey-file2
+
+Also, there is no lock on canokey-file, thus two CanoKey QEMU instance
+can not read one canokey-file at the same time.
+
+References
+==========
+
+.. [1] `<https://canokeys.org>`_
+.. [2] `<https://docs.canokeys.org/userguide/openpgp/#supported-algorithm>`_
+.. [3] `<https://github.com/canokeys/canokey-core>`_
+.. [4] `<https://github.com/canokeys/canokey-stm32>`_
+.. [5] `<https://github.com/canokeys/canokey-pigeon>`_
+.. [6] `<https://docs.canokeys.org/>`_
+.. [7] `<https://console.canokeys.org/>`_
-- 
2.34.1


