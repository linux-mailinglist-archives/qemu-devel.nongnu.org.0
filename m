Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAC449DEA8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 11:02:42 +0100 (CET)
Received: from localhost ([::1]:48810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1c1-0001Sy-C2
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 05:02:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nD1Nd-0004XJ-QX
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:47:49 -0500
Received: from [2a01:111:f403:7010::720] (port=39242
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nD1Nb-0001uC-PY
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:47:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLLKq1mUiX3SEjIcA+PyL4hCTo7cY6BR5uhNj9JO8ckRra606wGEHCJ+3vZWbuaOn9u02ImIwC3ejcBs+5kxKbt54O8o5cWwPKrFYyeI3U5MSwoUtEVaDKMsDW6FMvFMfh96PpLKnf8CtKF9CsNF9vYvkUx8FzlVzHkBVvKTLZHQZNu5lr9fcGYycYPuE3ZVIZ7B2IlO136YZiqpeKWijRVIamSFg1NoY/F/qaHeFBwP7k9/pBgKE6A1ExCztOBLxAPLSg19yypHHhZ7cbM57G9JW3S6elaV7I9kWvdenmAnNoI1DRqmW5tY0NfqoaKK0/ydoUEsk8WIvG/S1/RHcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oh6oRbpWvqqWv9fOKf4bpr7ebCdmfWra7TNIKYtjW2w=;
 b=O1QKo13h2K+Lhk6cpGa3m6wnR7L8IqWt15QQ7Ys/2oXxhWGnX07R96HSDNloRDyjjl7VybFLeBbBlqTXPBktKuHWGs+96TbL5vZF6PxSbYhJI/WfGNz8AHRPDgy2EWAL4K0MG3gytpL74RFoO40Q4nJdbZGzNZ7oFZN+Tu/dkzw8NFlxLlxZsLr47ZCrNCSsSYg5LzYMYrin+iE10iuUFVQ+5yd5EiyE5HAS6OfST80uKDZB8ork9LzUsjxM8nzniM6ZLgLl3jVfgBNZKaVzQkC7ZLV/Qs11rjKMLxNm9ZkmlN7UKYLs9fi/fqDydCOOEbcAsXgirvKE9sIKLnQJuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oh6oRbpWvqqWv9fOKf4bpr7ebCdmfWra7TNIKYtjW2w=;
 b=Flz/FAqBqv8YqEx+eFxlJ4hTOO5FN8Foix2sqlVs7+wCJZCVyg/UIk5iTSBLvOGoY244IgX52EWEC5IY2wdSFApjIZmJj6NmPQETxeBNnJcozDT8QbZRZWkqdiTuniiKl2cX1sza32Xuir5RYtmPtuTRhsoxuAusQjwU+z774nU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYYP286MB1406.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:de::5) by
 TYYP286MB1148.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:cf::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15; Thu, 27 Jan 2022 09:47:38 +0000
Received: from TYYP286MB1406.JPNP286.PROD.OUTLOOK.COM
 ([fe80::3108:c030:a6ec:7a1b]) by TYYP286MB1406.JPNP286.PROD.OUTLOOK.COM
 ([fe80::3108:c030:a6ec:7a1b%8]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 09:47:37 +0000
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
X-MS-TrafficTypeDiagnostic: TYYP286MB1148:EE_
X-Microsoft-Antispam-PRVS: <TYYP286MB1148C67451F1291270B63544BC219@TYYP286MB1148.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jLxnLLmga6uGj13pFp3pjHI5eUvn2cZYZQKdbDoLBG4wDhM77lpW3KPBkQwhyXI4oLoQPquYWDB3ZxbmdFuighcK/Wnv/P8C2UVCtRqIxf4qJZGN9iAAVTlX08TuT+GPMBMU0L1Et+8qA4LcvbHTnPLwdjVJSEl6oXpMo5NW24H+GyQXlNOhI4k3uszqZNl/x7mFaHgliEWK0N2xxyoKvMkyVb3cCJx2MsZ+14FiUHVwDrR7qUwv575ZbO6b1pHFseypqu1H5Pruvzi5UCAnPuIb+9jtVoMH48XYRo3KIbh8QYp/n8Sg4ljaQ78vKJP2RTAPg77eYTGpqSmscVZzadqq4foq6ZNIZ+DmIIPZICWi2cCUWDaGRtht+1T9pcXTFjnvTiAx1UWeirTN9Oxo/QPuLg1SZwaYLVqMUMqFRwitlmqlHRM9W/w35uIAkFOH6UCllDMD0AP8ZxbDudb+bCZiMQxsEFbRS1xfcYyn+7e03PCqxg2qA7gfIXRPQlxjZP78qFHtB5pUQesuhk7Gzevi5EeAQbqOzOwO0QvvHNOv8NTeEtO5GertUC5YtvNvZOjOQJEgc7kfqhVPlbu7RkliLRULdDtq7WJ6QMWqqRgU1pP6XrYRqTRauRQc/7OXcgtaLJsmMODEJHiaUDjbJWrqIxFPWf/QhsZIxBcxNa1fW8ID3h6r/mIAzpoDfpsRPk3ImXmX4HXiDBSnVdwrNiCBY5Dje+hgfdR4+2486yaNiwYA4j5gYubMV/t3v/lEUATdVf1veVg2fhEv05vI3/JRoA7tPPMJozM4ONR4+a5FtKyVR0MeYkU81ZETqakF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYYP286MB1406.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(346002)(136003)(376002)(39830400003)(366004)(396003)(33716001)(54906003)(6916009)(8676002)(316002)(786003)(66556008)(66476007)(5660300002)(66946007)(8936002)(4326008)(38100700002)(38350700002)(6486002)(966005)(26005)(186003)(86362001)(508600001)(2906002)(52116002)(6512007)(6506007)(6666004)(9686003)(83380400001)(49092004)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kIejomlhVl6ZeWBknUK/Gj04tn3AUniL9IH7+H3CoQEM4IspqfcuZW3wz2h9?=
 =?us-ascii?Q?65DO+W0AvgQTm3iR8ZrfiOyida6Rqzj1Ob2lvWcp3XyIGMotAaEkVCgwpKwi?=
 =?us-ascii?Q?ftnVvAXzJK6ThEVY/YWPjiNGQ7Xz/MQzEJW9ltWjZmWkFzx2moTSpDAUe5U7?=
 =?us-ascii?Q?S3jUAF4q3++FVmFQSF73pLQY1e8lRQvJyeseDbNjLAwSR52ii8R1s5J20ovJ?=
 =?us-ascii?Q?cDkYZMZlQ9666mcivN1Jp1IgZtLhsvEWfR2i9akuzIc3z/FvwoguPj6i1/kc?=
 =?us-ascii?Q?sM4l+AvH1PtLKK7AMGJQl6sSE64blz6zYqaotp5oIC/OJb7SaUQaQoAdbXlz?=
 =?us-ascii?Q?hOevLNjviynrsEGGEgGtmhWeoQShj0sanYrde7yA4JbNToJd0qjigVvvtHVv?=
 =?us-ascii?Q?aj4LF1fOtifvsJBFKg7Rl6hOflBC2BQQao9yzkVtfhMVtP+34vR2yohQuAul?=
 =?us-ascii?Q?pHM0DZGb2NJoFk0TjKc1koC68vOAgEf6pPaEN1zzkd+QGrvIN81x8WrD0E8Y?=
 =?us-ascii?Q?y6nJZDW/Uz3fGv9rc/8GdBDkS8m9NrfuzvsHU1dV3QavvX/DuD/N2ekioaGK?=
 =?us-ascii?Q?DDEnsU1M2n2VJfesYM20+f1/DDQvnFaMPexqV5Dw/GGqnF/ZCmzXKmBnIHBc?=
 =?us-ascii?Q?Ss/E1bYEpMVWGW+6MyB3fP8FgxmxqjCGJ88tzOmg0pStaCWlGNZxITQiX7mn?=
 =?us-ascii?Q?MYysnvi0iOVWZB7cn7lb/tKaW+9NGYlQ8GjbgpJEhsiM1Il81viiwuxPsC6C?=
 =?us-ascii?Q?8IkeVQRU5Ce5o0dvYRkIUtNJ776i70FQFRNeYrMsWb6MHquUWwlGhX6AveQa?=
 =?us-ascii?Q?Vy7TXP59CC3pL3YnjPE0c1YiZcf6M40tXFYC32C7iXCsr8o0UiSsDnDuiri5?=
 =?us-ascii?Q?ZimKTJHe8KtQ4Z5tpkRbxded+ux/wIRLW0HrfjITVnZUlki0YzGL2uSGdk/k?=
 =?us-ascii?Q?kCp5yOvLM9WsYm+Vm2+pKLfx8YZrf8Rf25atRYFnA3oBNUauhq+ht/ztGj0q?=
 =?us-ascii?Q?d3SPtbha8Syixm2LBiqGeLNdRBk6BmN8UsVV8MN85ROPJYytu8HF+xX1RCyO?=
 =?us-ascii?Q?DytbmSTV9TelbMvClE/f8QWFNKpcgk9j4kZGJr7a/SihR7/QX4VH2ga0lLPx?=
 =?us-ascii?Q?EHybcLbGDScIWeegL1YLh8xyqO8lRB6Vj0Xd7TJoxD+GrnK7gtuPtg7WFe+C?=
 =?us-ascii?Q?VFPUVeMfxYOG63Skg+uGOmIYvc6TzNPAszC28+kx2BlDSXCOv/xXxV6RC4tT?=
 =?us-ascii?Q?OpkqJ2aEHO0q5h+Oqb8uEK/BmNaLJEY8lLm8VB56l8PdCgC8BEFba4jwxRFU?=
 =?us-ascii?Q?qnEcL4bldP4T22TaGfUJbIw8qfB4p6JyIbxPRcc0wVIfZd9wl0NbfBHEIBBQ?=
 =?us-ascii?Q?mBas+KQbZvRq6QPTJkh//Rc8QuK6dgO+E+6RYGSu8hv+5O94wpcbhlJL96zb?=
 =?us-ascii?Q?t+VwsS7VeyHUwwsDa1JUZYwVmAbD3XLifQSbxwHCz9k3XqN3oeFNMK0nQu7d?=
 =?us-ascii?Q?HMT82Px3ULjJaPwbawPMmxJ2VFj2pmFxXZWP2m02fGwAq2beKdtKDNZNN5Sb?=
 =?us-ascii?Q?7dnsk1inZNqRPO1DUJ0=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 6018741a-85e7-4d7e-08a4-08d9e179f9d6
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:47:04.9900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UduQj7Uwbk17P9VEuIL9fubo/mBd+W+4LxvKj0RPBAyD8pwhmHSRy3cqiN0JpX3F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1148
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:7010::720
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:7010::720;
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


