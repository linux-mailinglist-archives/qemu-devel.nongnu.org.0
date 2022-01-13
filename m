Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0E548DD8E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 19:19:57 +0100 (CET)
Received: from localhost ([::1]:37078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n84hY-0008MN-7t
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 13:19:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n84Zo-00015D-Bb
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 13:11:57 -0500
Received: from [2a01:111:f403:7010::702] (port=49479
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n84Zk-0001t7-CV
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 13:11:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMgLLgPBcLcY+bvtisDhdhFe9WgJ8U4+v6j1oOmjZB00W0RTnSC0lXHHlYFbcQL7PzuJDn6fCB3tiLi2m2l4MiKJRVUCX0LNzCZFy2uOVefabmRssLN8HqDMTGOD7uMajWFy6ZEWXaiWrNfNgJHID+p+L0LgqyY6avhzzrPpjb3OIPNCzRY2AnCeyr90L0KS2SiZNiFfGPfm+3yqtF75Y4F1iGcY5hvj0BrlDr+BqrjM9a+DJ76xczNzp1eHP6H6jmUZm/00dfNRPLvvS1/En1rC6z6OUYeSoPWdGr4zjXmWVR6pG8an5JLWGlOM+MamPmw5ydFHvIhp6MpGXwU80A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoJNmgIQB+mGwaqLhSvUkV+y0pydFu6361UWYZyVskM=;
 b=AxJmn76/w9EmCKOnwM1nFdj3slJncNqpjDc6wo3FMavxf8/vebU+5FWwZ7m/c88RKr5LZ7twiTsSlMvMy0LtsgptCgr1gTEypHW5kfWvpqqKFsTiju6GFJ75DktdAA1WsoxFxzMo6WFWMkn1JQYUQTvAUwfv5g2W8KzzQNxZuX1LasAZ2GMSjfI/lijBLle2T/BH63MKSDtQhE6Kei4j1L4HcdlDdDj7VFiZAz+z4iiqpzyTF5An0gBlzPMXIduHdn03R09L0la2qfXcDTxJpPVVw6SHqvU3Ymw3Fts8Boz1TpyFdkTI04mN9fTWY4gIt1QKBysoLKSHlsSlvq31uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoJNmgIQB+mGwaqLhSvUkV+y0pydFu6361UWYZyVskM=;
 b=UQfDW/jw8r6ZvaAHcGCC3sqiNKpBuGDPyjhwX4avUTyuThPHd9balyugKeltgUSWGl9ykpw50Gl2ALIr8bcuaQMMlDdo3xv1G59l+i/ZHxSC8aHDNoMIBWWX+bwbBvqxJkOLaEXcBzMYmDF0gITf7vv3gzhcCB8Ja75e1Il1Dos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OSZP286MB1166.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:13b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Thu, 13 Jan 2022 18:11:43 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%8]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 18:11:43 +0000
Date: Fri, 14 Jan 2022 02:11:41 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/6] docs: Add CanoKey documentation
Message-ID: <YeBrXTTZ2sDISBrv@Sun>
References: <YeBqg2AmIVYkrJcD@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YeBqg2AmIVYkrJcD@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.5 (2021-12-30)
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 099b1937-25af-42cb-49bf-08d9d6c02781
X-MS-TrafficTypeDiagnostic: OSZP286MB1166:EE_
X-Microsoft-Antispam-PRVS: <OSZP286MB116649762C19EE0C208F27C0BC539@OSZP286MB1166.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BTpSXs/oXVFF3vkj7JORmDAhtvHo82qhKXtTzWqfkEC+VWLU4/I3jueSlTPHGAKC0F9DNHYXPSLAahafvZnn0jRKRWNAZcZgruzbFnaGokeSScipNUiUP5i6LhJ65Rxt4w5EMoiDLd1V04Q+6GqOW/jWYhEFj74KjSbXQcsqYRcGPWhQ5Xcn+icINfZw5HA6qI57MOf2xNugQQ29cb8auLU/KFhGNBZFs3xnWyZWimWYeY9MoAcN2otnP5AxsjndMazfLU7ndkdx4yCOkDQCOm3Ta0GpZhhCM4HbAHOPOnTDibTZL4GwGrEeG7Gj6wxTZvyDN1QdDgLBLjzibcKVdYAR5Bijpba4pHuzcEQ77KS+0JqJgCvM7HbM2EnP4hwN116Ias0N7B3ScT5xPepURdGu/M8FNSn+kZ4Zu9hjY9LaJNm9qxi86klInfKj/BipdeSenl9t/4kpXNb2LxfbGMKNmyJXPrW3z+yJkGbCtkUXExeJtPrNaniEgYlhdjUx/PCvOYDecDvXcG1LGRsOdjUsvUPbPKd2Dy1lmX3NMKzKILONAOgnc6O8ZMLvMJIHq25HNgMYEikpgz+Qfy1DfUbNrUQBqQ1l73wcGaXG7i1ELTzxlOyFVCCd9bsbT/nEWWJ/WB9Ay+AcF5EpaQPbIvslv9bAwAT7y/5gFT0EeZ8ySRa7X0gKFMwDmFAOwbP2gVqsSNnDUHsxAPPnm0RR8n4BNmdjP4OnyQkFoJmpS3qADRn5GcI0WR6i220qF/E+jID53cLHpLQqQttRbykikg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(396003)(346002)(39830400003)(366004)(136003)(376002)(6486002)(54906003)(8676002)(186003)(4326008)(52116002)(966005)(5660300002)(8936002)(6506007)(2906002)(38100700002)(66946007)(66556008)(66476007)(316002)(9686003)(6916009)(6512007)(86362001)(508600001)(33716001)(786003)(83380400001)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k+mFOJ8H/rOjPlQSuf4z7OB1serjDvaz/UyPokzn0jJZu914b5cHi/ITgXO+?=
 =?us-ascii?Q?wCMherIXfS2Q4VcUMFhFjttOiZsJDEDSAs1qipp72TVpMHmwmSFGveWTtAxr?=
 =?us-ascii?Q?IHIUw/dSg4xKE1zs97suC58viAJ4bfD2n7OHjcnWhrCx1b8kbtX//y+lFEA+?=
 =?us-ascii?Q?/2qj7YvsKwEv+hwgBTXnYX57Y0foR2FbfD2NdpCvTZLXvgDI090E1wXS1c0a?=
 =?us-ascii?Q?RY2klUCx8TaeU+tkoJC2AUDm7oG/spNBwXWae/t++EwWnY97CA3wv8f/Gl46?=
 =?us-ascii?Q?1jAjjFCxeVDhL1d5EvqjEf/KzuRkTCMN8x5TW5zTLxOCUt4BRbmhuIrD0UYk?=
 =?us-ascii?Q?INex8PZWH3fhsOmXXeFQ40hRiY7bXkEPovLT7z8tnSQuMN8q1ZN/t1p2Ri9u?=
 =?us-ascii?Q?ELw62ebyevX2YdapK1aFjb4zeYQtCJst1/mFuiw0j/pAMlzl43xfI5jsSLbg?=
 =?us-ascii?Q?K6pry+ewJurCoP9GCzV4K5hukVgMlbrWU6O/Ru0GZTznJ3umVRAA/YV2eC9W?=
 =?us-ascii?Q?qL3UsJWkW4tbhHcrUTK607gXpCu2rasgqDfMsPWb3D8zFFDgVdOnBk8x3LdA?=
 =?us-ascii?Q?7uZN7OYUewAu04n+S80COhKtHRgK9tl2TJ0FM0RheL7ZtsK2zKB8TQ5bYsTF?=
 =?us-ascii?Q?bmdMPoVra6yiba7mz9n90ilViUI9q97aOSYGJTYiQLYGBHufwi5nCqn2VJPR?=
 =?us-ascii?Q?jQrp4fBRxMeayIrVKXJNd+0ci3QRZM6BGlQfudOdLcNFLH6+jAZ150V/7TRo?=
 =?us-ascii?Q?ydWjNL9gi4t8U+v6NM+JHk0XMa8sMiJ9SPLXu96tPseXEhayEcbPK05AGUs7?=
 =?us-ascii?Q?rD6KPd79kLSbYITfWYZptuMVuGy8bezP4bUL7Xq6c5HCnWd4z8CKmXnfl+xe?=
 =?us-ascii?Q?45MJX+hp2Zs1nGb1Rqm7f/nfNLD4yzJBrTwOuQjg76S+jcD3OIQ3LgrHb1Zm?=
 =?us-ascii?Q?a0QouDCPfa95GgOfKUY8U5QqNwDuFS+yWjW7/vMFoKOBxxXOaFD5iBEkzasn?=
 =?us-ascii?Q?oZvOtbn483v8D1RoZPtlTOkBQN6WOGcuKuH6YPBQSX1OZ+K5L4VpDo89PWtu?=
 =?us-ascii?Q?mNMLMPiwaMismhgLaOTVsclfL1iWHH/cpCvj++8aa5FkJ9PGpKT7M1dpmU6n?=
 =?us-ascii?Q?Pw2+aM0RZRAi962EOg0ebqb8swvkKtMyS27w6u1LtOsfo/gyCL5FI+zsH/4+?=
 =?us-ascii?Q?H9PLQhThafjXxfpfR9dfU2Isxw8y6bbmxiHAVrHGsdo/YK0+SygBRKH1mHoH?=
 =?us-ascii?Q?ISaP6PicGiwKNi2MO+fpobKb6E+qpo3XM+YBhQa0APSQ7EQHdAWmbh5jK2hH?=
 =?us-ascii?Q?0LevhqE0NTWvD0HUuTZyASNqu6g7STZu3rlvwi9Eo3Yv7N3SS0ZoXtMV6ez4?=
 =?us-ascii?Q?Wju8KNTJn3xIMqc34s6DbXZ+KJ5sMgz8VzgjqWObx60XG68BIEsbw1DlL8Zm?=
 =?us-ascii?Q?DTjsnrvNUzzU0FG/xo9YjWgFYAWWUcjBPazdeGmUpwuUE2RT5lxGf/bGam1p?=
 =?us-ascii?Q?HGKduzOjSm6BviAWkxYClIX2i3c+oFKVvXQslAiJ/6WotG9HnzYGGDMkbth2?=
 =?us-ascii?Q?of9j+quhNsvgytW4ugqPNlSfoPABqU8/AexB49w6?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 099b1937-25af-42cb-49bf-08d9d6c02781
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 18:11:43.6047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5sSJ6Szl9MpKFAa1gmuXX8HIH4vLyLjKG3JeHm8sTvicGbJkR9pkfWX+Y6m3Jbgw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1166
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:7010::702
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:7010::702;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) APP_DEVELOPMENT_NORDNS=1.997, BAYES_00=-1.9,
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
 docs/system/device-emulation.rst |   1 +
 docs/system/devices/canokey.rst  | 158 +++++++++++++++++++++++++++++++
 2 files changed, 159 insertions(+)
 create mode 100644 docs/system/devices/canokey.rst

diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
index 19944f526c..b753fa83d0 100644
--- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -89,3 +89,4 @@ Emulated Devices
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


