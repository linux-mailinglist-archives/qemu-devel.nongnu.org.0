Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0989457CD5
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 11:16:29 +0100 (CET)
Received: from localhost ([::1]:53824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moNQ4-0003i5-Ck
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 05:16:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1moNP6-0002ws-OV
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 05:15:28 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:22242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1moNP3-0007aM-IE
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 05:15:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1637403322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JmJ6qnsjYdx0n+Svks5XhHCNEHvmaz7fM2bjg1IMaoM=;
 b=nLQndlFjQ0pZWnuKtqOXYn5d9MO/nzmxoc1znNZj5lkLWPWo7gtV7Stwt3gx1StISPCKTc
 G0cjmurCYApwZ0E0OR2qciKnrGyV+5Zlz2euiAXqknW4p6lr1YH182cOI4HSG41d8ReTpI
 X/lrGVjr8ETOrbgdnteBKgAmt+9EXas=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-ebOfq8LqM8Kv3tZlCcVMkQ-1; Sat, 20 Nov 2021 11:15:20 +0100
X-MC-Unique: ebOfq8LqM8Kv3tZlCcVMkQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0r6hMi11zlxnZ61t6TMfFZjDsi39kWcxR75wbG9/4JvZCc4AwNBMX9GhegPA2+xQSmthVJXsaSgpsmQXtzFUpwb5loHuidtySSiyFDpQZ8/wpjEqMPx5oomsFAHBefe00MebjN9fNHTQCwP8zDaPPa/y1hRaV7ksuFFBDf58wXahX+BfxB9ZeTO/HXryn2srMLs67lD6/JxUTrmT8sUVLtuu1SfOtSoeP777Vq2PCuQzn05Q+xfHMMDjKmO+V6OsAVppnc3CAKTq2Mn+Ykg9N2I6Wj7v2P+oXiACXBjpXSqh1VH3UX3lFOFCMt9S8/20FC12VH0w6yJvX0Q82YhJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJXSuS9UfPCKUdxoo2jnJ9wTugaOZmuOV1JX1K8U9l0=;
 b=U+EXeQf1e7CdiKIjKS3vYg+pzSv3qgznuCw+Fa7AtDsAOfWsmjnnAhvwqb9WHkpAZEpWC9Udyd7CPlIKqDfnK09dVW4kZKkDM5NQArod7MMr9UAXRnFQrk/Il+CgkgKJKol/nwHa6e8omK2wfO+aFXJzWtEsMKuhvh6DFRE+mj0mdkzF2FcYAOkCW2x2thGKDNrnYnHoMqEuQk+xyYlW7ejh6rJyvceWVqpSBEpwPDiS0F7CI5KUjqiaZt6t8aXhqQ9sDwMRUHt2IvswcUjb0v66tBLboC5vy43Kn/NZnlChkk3FRfdowaDGQILwbxmfBh98YMOEj3ivt5pOb/WBYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AM9PR04MB8602.eurprd04.prod.outlook.com (2603:10a6:20b:439::12)
 by AM9PR04MB8940.eurprd04.prod.outlook.com (2603:10a6:20b:40b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Sat, 20 Nov
 2021 10:15:18 +0000
Received: from AM9PR04MB8602.eurprd04.prod.outlook.com
 ([fe80::c09c:8f01:1370:6926]) by AM9PR04MB8602.eurprd04.prod.outlook.com
 ([fe80::c09c:8f01:1370:6926%7]) with mapi id 15.20.4713.022; Sat, 20 Nov 2021
 10:15:18 +0000
From: Lin Ma <lma@suse.com>
To: pbonzini@redhat.com,
	fam@euphon.net
CC: qemu-devel@nongnu.org,
	Lin Ma <lma@suse.com>
Subject: [PATCH] scsi-generic: replace logical block count of response of READ
 CAPACITY
Date: Sat, 20 Nov 2021 18:15:12 +0800
Message-ID: <20211120101512.7770-1-lma@suse.com>
X-Mailer: git-send-email 2.26.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0013.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::26) To AM9PR04MB8602.eurprd04.prod.outlook.com
 (2603:10a6:20b:439::12)
MIME-Version: 1.0
Received: from localhost (60.251.47.115) by
 AM6P194CA0013.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22 via Frontend Transport; Sat, 20 Nov 2021 10:15:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86a873f2-20f3-49f9-9b68-08d9ac0ea724
X-MS-TrafficTypeDiagnostic: AM9PR04MB8940:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <AM9PR04MB8940BC0167BA647053B72042C59D9@AM9PR04MB8940.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l+TMvtTQe1gP/Ad6/VbZyz1tU9hNxlfLSb5wsEMibfH4/F4+W+R7Ih4/JbKyLnKHTMwzQkpzaNzUHI4zrrloKUpQSjLsGtVaumgjg1hHiFR2JftNqwrhW1J5+4Nn8Ee+vQPEls5YNDEhIndmJDnD7HBlKo89DD8MBi3udS3PNZvHwdAsCtuRYeQ3biYaeyJJa2I01EB3fn5ryABKhkD7s89/6Bd7jD8Gj9Z6uEfV+l22Ghwm1zundTPqq3ps9FZ9LzVSdGeB7t5julSq4Pjt3fIQk3Ki/h1DOuuznQcqHXELFOZxltHerQyoVmEISwnVAw6iv+2mVqYeD1XX4sWiponLOKd33MyQGvBdBqvvYyJ09vLwyZZHI+AEQMjcmmt2VPm8l5Z55AO5r1H3u+VOAuqvmibKbElomOlhdABG8NQTy4yOP09tY7Tcx4lkUZCEbkdObp0E171w58WT7ZmENriy2fdORyocr57Kj7WDC8UZOGrmlHZVjxrQp+gwg2q3v1XpDtgbvEyyhgVPwZ9+Ac7QD5a4kD/kYg9uAgjmtED422YjdYVMYKb1q4ABRruQvLqz00pI4EkUMU0cYH3cX2IHDGQOUjNX94yLLLJ64hNNHdMXQc12odi246BJHoahMD5AgGn/LxHZDbnE35S7PUz3HWpZzVTQd+axZIAd3AhdHOwONNdsd7EXK/BsBg9TpzYsEqUc4PkcQXk8ARLvGjarW2s5tZu68yLiuqpEh9k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8602.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(6496006)(83380400001)(38100700002)(316002)(5660300002)(107886003)(6666004)(4326008)(55236004)(26005)(2616005)(186003)(36756003)(2906002)(66476007)(956004)(66556008)(8936002)(508600001)(66946007)(1076003)(6486002)(8676002)(41533002)(550174008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5gFi5USb70PqxCVqey0tagp9ZzTdKofA0WGN3H5SYZpbQ+rdSlv5SXwsDz+v?=
 =?us-ascii?Q?ILUrk1MWpa8t52ToNPyVi6DPOf2ZERWiHGLonPrwHCmXBdAh2OnHulT/FPdl?=
 =?us-ascii?Q?66zyp4HyFRsCLEjYdC+Uev16E+JoDwOxyoHBgGmtP9HdOBaH76KP9mZHEvIO?=
 =?us-ascii?Q?w42PfspUhVg+1nHxqUIyyof+7MGFgkbSSoBZAfk8KFuNYw14UpGpx8U186Gh?=
 =?us-ascii?Q?gmgXuJp7X9OXXVxVeVpjUdEU6yUTx4vfO0y4ciSlT10gMpuvcyxjEMVSEYth?=
 =?us-ascii?Q?e3QaQWK+ErzdJN9mYtTBO3D5OznYf3C+Akf1duUbSmdYp+8srSfazbIm7qlr?=
 =?us-ascii?Q?wJKOboXkIofmfwJwqgMkhruPYVKX9bpeTnt/bxUVU0WWPGbEOU9Ly3LyulsW?=
 =?us-ascii?Q?GUWgVIY5cRAPes5X9qK8Sna57HGKYFFFE0qYTCL6yMMg51dn3drACGSBub0g?=
 =?us-ascii?Q?baP5A18sVdfqHxntnAWxMrKC8Goow9OTBSBvw70LmhpSnDgaaXaN5pBBSoGT?=
 =?us-ascii?Q?dDjePcxMLoI1gWSPIpj1T/Swpflr+yuT6v7KjwQqGwUlgK6cENeFKjkzUwC3?=
 =?us-ascii?Q?bzV454FMmkArVVQiFpZLUnZ55dhSUoUfP/eD5YuFbHpe8a2mp0Q8o/vb7AjD?=
 =?us-ascii?Q?h3f+D9mTeRYEGZ3H34WZv3fEqIWNyGBoeePA3om/qYC/tJXZIDBRvO0vsJ51?=
 =?us-ascii?Q?AAKyKLo1tXkFVtbB9cZQ/kN3I6wPLTFbjglVIsHLTYluOwPrgUznXkRB/gpj?=
 =?us-ascii?Q?r6h9xw+EZ2uR6W7j59eSknWhp+eH1J9BchQGAVpRXltbp4x4Y4f8jIaZYDP9?=
 =?us-ascii?Q?+hc44fDf35iLCHaRNWUIOqJ4N9CcU9uGD3JXyaQOBRXIzPDSitn/s/Tck7bz?=
 =?us-ascii?Q?CIU62h+f2mxjtIE2UZGo6m22nFj4PXydxH4+3xz13f/CHfS8coLUKYmB/S99?=
 =?us-ascii?Q?ChI84VqaxsoKINFhIlcgiT3VVlyWkAMw6eMIMLEVESy8WzdzuYe3BzHS0YpA?=
 =?us-ascii?Q?GD4qZrL9AIFDxROi4VpMaKcDkQ/rfBzGfiOsNUVOGxMGkSaHaser6dNe9/be?=
 =?us-ascii?Q?YI1aw4IFAp6n6X9NtBVA1MxizXmvO8nlVOOZLa18cvVkser6oMNO7cIipYxg?=
 =?us-ascii?Q?kXGPONeOJsNeVlLyPaTwOrhxM8/1M/OzOPm1bLDsp5I1dpVQhpalmRaqLtNr?=
 =?us-ascii?Q?fkeOoeA62ly6ZTgrFMItWRghEFqFJ/fRNFp6SAWIt6nVAQ00eGhT3K76oiFX?=
 =?us-ascii?Q?bHjtyqQhjuylupOxFJGljzdhaYrXCKxsSKMyQmUdS8hg8Cuo1dkD+AC/RINT?=
 =?us-ascii?Q?yo7AMyqI+Nmx3GLqF/Hl08Xfl+Ejch5IBxsEnCTMfQz6i/GBNYJyKFz068/1?=
 =?us-ascii?Q?O+R9/jd6dJxEnFJZrcEvhrF7KWAW5Cu45j2kxYRO9phkP7b3Sp6BPF0Zsue6?=
 =?us-ascii?Q?L/2SxivMThkEsCFB6/l85ooj/s2CI0hz1c+UPYztGfkBeWOkPeeQVDN/ZyQN?=
 =?us-ascii?Q?9x38oXL0cVX1YA+mJ+0D1omTVWVIA0qM5guJJvdIAoMkujYmJcaMmYDIIYYp?=
 =?us-ascii?Q?aUUTUFL7uojyMi8J1ys=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a873f2-20f3-49f9-9b68-08d9ac0ea724
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8602.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2021 10:15:18.4763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dAdsCEbb9dzf+BP0of5mlMJvvI78yBEZZRFJfcNdH3tAvZoAXH5tfd9aWOY0q1QP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8940
Received-SPF: pass client-ip=194.104.111.102; envelope-from=lma@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While using SCSI passthrough, Following scenario makes qemu doesn't
realized the capacity change of remote scsi target:
1. online resize the scsi target.
2. issue 'rescan-scsi-bus.sh -s ...' in host.
3. issue 'rescan-scsi-bus.sh -s ...' in vm.

In above scenario I used to experienced errors while accessing the
additional disk space in vm. I think the reasonable operations should
be:
1. online resize the scsi target.
2. issue 'rescan-scsi-bus.sh -s ...' in host.
3. issue 'block_resize' via qmp to notify qemu.
4. issue 'rescan-scsi-bus.sh -s ...' in vm.

The errors disappear once I notify qemu by block_resize via qmp.

So this patch replaces the number of logical blocks of READ CAPACITY
response from scsi target by qemu's bs->total_sectors. If the user in
vm wants to access the additional disk space, The administrator of
host must notify qemu once resizeing the scsi target.

Bonus is that domblkinfo of libvirt can reflect the consistent capacity
information between host and vm in case of missing block_resize in qemu.
E.g:
...
    <disk type=3D'block' device=3D'lun'>
      <driver name=3D'qemu' type=3D'raw'/>
      <source dev=3D'/dev/sdc' index=3D'1'/>
      <backingStore/>
      <target dev=3D'sda' bus=3D'scsi'/>
      <alias name=3D'scsi0-0-0-0'/>
      <address type=3D'drive' controller=3D'0' bus=3D'0' target=3D'0' unit=
=3D'0'/>
    </disk>
...

Before:
1. online resize the scsi target.
2. host:~  # rescan-scsi-bus.sh -s /dev/sdc
3. guest:~ # rescan-scsi-bus.sh -s /dev/sda
4  host:~  # virsh domblkinfo --domain $DOMAIN --human --device sda
Capacity:       4.000 GiB
Allocation:     0.000 B
Physical:       8.000 GiB

5. guest:~ # lsblk /dev/sda
NAME   MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
sda      8:0    0   8G  0 disk
=E2=94=94=E2=94=80sda1   8:1    0   2G  0 part

After:
1. online resize the scsi target.
2. host:~  # rescan-scsi-bus.sh -s /dev/sdc
3. guest:~ # rescan-scsi-bus.sh -s /dev/sda
4  host:~  # virsh domblkinfo --domain $DOMAIN --human --device sda
Capacity:       4.000 GiB
Allocation:     0.000 B
Physical:       8.000 GiB

5. guest:~ # lsblk /dev/sda
NAME   MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
sda      8:0    0   4G  0 disk
=E2=94=94=E2=94=80sda1   8:1    0   2G  0 part

Signed-off-by: Lin Ma <lma@suse.com>
---
 hw/scsi/scsi-generic.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 0306ccc7b1..343b51c2c0 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -315,11 +315,17 @@ static void scsi_read_complete(void * opaque, int ret=
)
     if (r->req.cmd.buf[0] =3D=3D READ_CAPACITY_10 &&
         (ldl_be_p(&r->buf[0]) !=3D 0xffffffffU || s->max_lba =3D=3D 0)) {
         s->blocksize =3D ldl_be_p(&r->buf[4]);
-        s->max_lba =3D ldl_be_p(&r->buf[0]) & 0xffffffffULL;
+        BlockBackend *blk =3D s->conf.blk;
+        BlockDriverState *bs =3D blk_bs(blk);
+        s->max_lba =3D bs->total_sectors - 1;
+        stl_be_p(&r->buf[0], s->max_lba);
     } else if (r->req.cmd.buf[0] =3D=3D SERVICE_ACTION_IN_16 &&
                (r->req.cmd.buf[1] & 31) =3D=3D SAI_READ_CAPACITY_16) {
         s->blocksize =3D ldl_be_p(&r->buf[8]);
-        s->max_lba =3D ldq_be_p(&r->buf[0]);
+        BlockBackend *blk =3D s->conf.blk;
+        BlockDriverState *bs =3D blk_bs(blk);
+        s->max_lba =3D bs->total_sectors - 1;
+        stq_be_p(&r->buf[0], s->max_lba);
     }
     blk_set_guest_block_size(s->conf.blk, s->blocksize);
=20
--=20
2.26.2


