Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B114892EF
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 09:01:27 +0100 (CET)
Received: from localhost ([::1]:43230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6pcM-0007wc-MA
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 03:01:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1n6pW9-0001rm-VV
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:55:02 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:46423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1n6pW7-0006fb-FP
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:55:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1641801296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WyaQdzzGEbg5Op9ICvlvhxknZKu0Gx4qaYJoF/3y/LQ=;
 b=VPfZRxtigwJsFnViG6n0tZB8DpKq2Q/SQYQk5ZQgu3NiHu5I7ArscZc8MDdTxoeAu5nywF
 2zp3X/adFq4jt3SJn5nY7TM5jH6YjOUWdEanxBFDHQG6bfkaEiDYvIMN10tsHnaY4tGcr+
 RgMZzFF3F7IQv+KbRJcWiNA7PaecW3s=
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2058.outbound.protection.outlook.com [104.47.10.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-dBXaPvX7M3m4LzBcZcL1YQ-1; Mon, 10 Jan 2022 08:54:55 +0100
X-MC-Unique: dBXaPvX7M3m4LzBcZcL1YQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKNzS+2iZvZn9BWvI573gUZy9kRXNy0t6LfReo1Ux19Ouzzz6b3N4nKXy1D3EJb05QMZomV+crWoxllJiDcyDxkjarDPp65G1oG71poDaZG9TAK1B1VUItMvAOJvW/JFa1moQbUeu/GnCLL331gr8ovuEdWSo4D3nEHRZW8d9zhM1Vght9xo2XxPr+veiFyP/x6hgq5boT3fOB/7lsA/UrOdcP1pqdijVLmH4KDEigW9c8Cu3NsFVffcNCTnlQSDuGvVS3rc2oCqqpOE7b//U/APvKCJUwuGPN18zwzpUaTDpjcVeu3b2kVEGD4t0bcqAHvWdmH0Z3K5+qOzO8T1Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/0RG/tdTqTc7gUrrPcp7XkBZI84Qg5Uc8U4ej1qTOQ=;
 b=DbWKVCcFHZrzdJwACpEcXgLZghxlSAYO24MNILAR1M1D+9WkI/4kRZgJ4JQpYwYeNie7Ilecfu1dNdzxeRHlRXr39j5sp9NfF0t6jM1TnjmI7ve8B+K3SlrspC8Zw5oCO8pYOzUDmrpC1OreFOoRjrOPOrcLNcSPTdinSFS/3qTi3pGnp3B9thdZW+xbNW17N43qkDJ2bs0Qh0YihrpNsBw9dphKlRL4Pe+75aeHWt3Q+PbeBSfPOiimiIgeEcrx/QqxYZYFbI0bTGzhCuEz0pqc4WAf7m1HEsFGJj3oyouxaogxR89MvY5+A/nqriKCd6tmuZ/sdOcXalO1mX3KUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AM9PR04MB8602.eurprd04.prod.outlook.com (2603:10a6:20b:439::12)
 by AM9PR04MB8524.eurprd04.prod.outlook.com (2603:10a6:20b:433::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 07:54:53 +0000
Received: from AM9PR04MB8602.eurprd04.prod.outlook.com
 ([fe80::134:358d:d092:3390]) by AM9PR04MB8602.eurprd04.prod.outlook.com
 ([fe80::134:358d:d092:3390%7]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 07:54:53 +0000
From: Lin Ma <lma@suse.com>
To: fam@euphon.net
CC: pbonzini@redhat.com, qemu-devel@nongnu.org, philmd@redhat.com,
 Lin Ma <lma@suse.com>
Subject: [PATCH v2] scsi-generic: replace logical block count of response of
 READ CAPACITY
Date: Mon, 10 Jan 2022 15:54:46 +0800
Message-ID: <20220110075446.30042-1-lma@suse.com>
X-Mailer: git-send-email 2.26.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: HK0PR01CA0069.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::33) To AM9PR04MB8602.eurprd04.prod.outlook.com
 (2603:10a6:20b:439::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a11371ff-0ed0-4723-fda6-08d9d40e7ca6
X-MS-TrafficTypeDiagnostic: AM9PR04MB8524:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <AM9PR04MB8524A7F8846FDE8857DFF6C5C5509@AM9PR04MB8524.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TfyBAKAL9O9Eq59DoCnX2EA43dKXV/tqaT7dBQsuaiTWhW/XSuMgpZ6Md4cdcJscbqbGrO+jxyVVIGs5xl7GOH9hVB4oL+YaeXZ9IRwNDxmS/2L2Gs+UTeLEuxpUvxritdehSFqPePdbSzOIxlAtSRh3Cq9rcJpi7riy4If6MQDj8Ix2Xjk9QFMoA8gHu+4iC3Gjqoe+GhTmobdR8niGPgQWz5hFmllRGO8gmIDm5fvgpykUIZOCOd7wyKkI5Pn1s9vrwXTAwlHF2B2eseZA/QmVNLVLDJK1mdySLSlxKWzuwUFUvuqByRfdp8qXgf4vrTJYQ7iz5qwNa6geMprogyxcPo5q2bOUAU9AAySAvoXFYpL0KbUX1BqLz5SurtPXwVdvPuW3y5BtTzbdVFEZrZ01sc9gDgJylQMFaCRKOkHB6EhOVS61zhVKWX3TkhAm/FaI9tXNcbqXWLUyqBmc4RVo1MaWnlBqrJj4bgM919ddydEMIpPCunIMfllZ+riunUyQAwHbiiJRcb1roKW+DXAc7WuqdmHSFWoKIgOhO5vt6VvSICsGl8fFYvpM/aYdx4SYn6ysw0f9UExGDgrXmI3b82MwgrdnT7nQlfbjqXtyk+GfTCGdDctE2X2R1AbSQtYX+RczU3H6rBqNQuxWTFQFEcO0S1QVN9uGy7YeFc6BtppoI7yUxDV1aG0JrZMp0Pelou1/KNJtodM39hU33iEtpzr/sdzSW3cpMCagZ38=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8602.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(1076003)(26005)(186003)(316002)(36756003)(38100700002)(55236004)(508600001)(6506007)(66556008)(2906002)(86362001)(2616005)(5660300002)(4326008)(8936002)(107886003)(6666004)(66946007)(83380400001)(6916009)(6512007)(6486002)(66476007)(8676002)(41533002)(550174008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DHGdZcFwLUtt/oz0MxCguTKu2YGojy4AmtjcIMtkKxbEl6MQls6dwUfxNjVT?=
 =?us-ascii?Q?4Ey/oMV+rsSeDzZ6otFcDsACTnDE6r1HjI0GyzCnNl7rcVBJvGO0WlAZaTrC?=
 =?us-ascii?Q?dAUtR4r6aYx93sxOHEwhBELViZJxiM8EMBCvaKM2J6pX8gDgjPysBD500Ik6?=
 =?us-ascii?Q?Khuny+MD7TM6Vpn10BRloQVNhwHejA4ggLyous6R6D3rXs14ocA2ht0bHVZm?=
 =?us-ascii?Q?u/9bIvlCECEYSqPQluTamZJ/kTPFTun7izaWMDoKzbkgn0WV2MaaaxhrG0xp?=
 =?us-ascii?Q?BOKi5gHbAIBB94Ylq7UeQz+AA0plTVfFKCTQmIZR9ECZIoKff3oE/s8RCN0s?=
 =?us-ascii?Q?7+6FfOa3OQiVUCLenFSWVZSmlek/SlfYXQ/MegYbIExmSPsatTAjy7DGPPH6?=
 =?us-ascii?Q?o3Ezwt4B3sTF+nkvLiiFfwGL1AlwIIut0kNAuGQUx1lATMAdEZTbnh8SMiNr?=
 =?us-ascii?Q?dw1urTyDUg9mwga6gTDfaVgQaxwhoHD22d6wlsLK9o82WZBDH22MrenIlPJu?=
 =?us-ascii?Q?6Vsydowvyo9PLaIWQVN3lt4Hu2YxnIK2uRR3wFwl7rPCI2FJFVdb376Il2CX?=
 =?us-ascii?Q?Y4mRzAg+19tAyXbj7SKN1LOmbhguzZFVyO9vZb8DBMODNPpg0/VmcamHvBlZ?=
 =?us-ascii?Q?xMhn6k8Q4Ml+W8ycwcQ3Zun+9gl3zMHborqs7vy90sH9wTGPsBixKckFWuzf?=
 =?us-ascii?Q?QNqzlAFPebTiMZEPO42AogbE0QeptZlwDUXVWvM4j8UJ9ptp1yL1bf5853cE?=
 =?us-ascii?Q?NdWXuS04l4L35hu9qMm0GHByvHT9GnvG1L+rHLeaUj0D4F3N1zgNXR4L6T7n?=
 =?us-ascii?Q?ayZjh4ZKu3rvFf6FCrRl8y5LeYkB0ZiR1OaeggLbgSOGrti8FDWnpIXzLpHT?=
 =?us-ascii?Q?tMwDh7S9B+IVehs+uxtvngHQK5Y9x4ArCE2g13MN6KSjvwVKYGUsRc4qOGDk?=
 =?us-ascii?Q?dm9U2wM5ODWBUaBfeURpNSqbKMZcKgkSSWismWZO9+hFby/W0146rSvs3b5o?=
 =?us-ascii?Q?oEMfN1P8zVRIRkf+dkUZ+GR6/iKwMfUJrPSNmt56W/Pk0FmnupyQWtOu197Q?=
 =?us-ascii?Q?nwYeEgzxyEDqO6J6mWiR7hvJGQF3EUcBI9gjJA+Lk/jgTbAKArRN2+xOJEjk?=
 =?us-ascii?Q?dp+10PGWGlN+nG2h9jayuYwwNe8CTEcOEFyPFaeyUwHbkoTqWgSkEwjpKg0x?=
 =?us-ascii?Q?IHdBtL00XUGNWyUCGZgDamLBqY4yiOzlwJ5p/+UGQ6/Nl1qXjsiCM4dODsWp?=
 =?us-ascii?Q?HwU5Qs4abmnJfMc0FpOGwinqYVobsReAi0GbQwr99YT2P+9mVyAjfDD01SNR?=
 =?us-ascii?Q?DR1L149rX1fQiShdt9b/mvPRzzChqkiaHScTV/NkyX2Gy2sksCjHW4gWQcP4?=
 =?us-ascii?Q?zCDuFW+xci4Gz3tq4+6iYU0uHqE/h4wHENuF6hqdWKIqMRf1Hc8/suTkPiYz?=
 =?us-ascii?Q?F6hJsp4Iat6Ch7NA29UC5Yvmdwg5roKAfakXK8sK6BTNQVEwVZ+59+l4ytMd?=
 =?us-ascii?Q?mWiKpri4ocHKXLQ5U5ppH6U2CN1Q5dfc6XuBRyiitGg2/pLvHKDME28VJPjg?=
 =?us-ascii?Q?xejutd3EbXo9byo/m8w=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a11371ff-0ed0-4723-fda6-08d9d40e7ca6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8602.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 07:54:53.6522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqxysENj07ekZB1keCqQZ/XDRT/duqwanrhpSl/Ijv77Ovnv3BIi0U92adjGQa+p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8524
Received-SPF: pass client-ip=194.104.109.102; envelope-from=lma@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/scsi/scsi-generic.c | 18 ++++++++++++++++--
 hw/scsi/trace-events   |  1 +
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 0306ccc7b1..c9b08a9926 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -256,6 +256,18 @@ static int scsi_generic_emulate_block_limits(SCSIGener=
icReq *r, SCSIDevice *s)
     return r->buflen;
 }
=20
+static void refresh_max_lba(SCSIDevice *s)
+{
+    BlockBackend *blk =3D s->conf.blk;
+    BlockDriverState *bs =3D blk_bs(blk);
+    uint64_t max_lba =3D bs->total_sectors - 1;
+
+    if (max_lba !=3D s->max_lba) {
+        trace_scsi_generic_max_lba_refreshed(s->max_lba, max_lba);
+        s->max_lba =3D max_lba;
+    }
+}
+
 static void scsi_read_complete(void * opaque, int ret)
 {
     SCSIGenericReq *r =3D (SCSIGenericReq *)opaque;
@@ -315,11 +327,13 @@ static void scsi_read_complete(void * opaque, int ret=
)
     if (r->req.cmd.buf[0] =3D=3D READ_CAPACITY_10 &&
         (ldl_be_p(&r->buf[0]) !=3D 0xffffffffU || s->max_lba =3D=3D 0)) {
         s->blocksize =3D ldl_be_p(&r->buf[4]);
-        s->max_lba =3D ldl_be_p(&r->buf[0]) & 0xffffffffULL;
+        refresh_max_lba(s);
+        stl_be_p(&r->buf[0], s->max_lba);
     } else if (r->req.cmd.buf[0] =3D=3D SERVICE_ACTION_IN_16 &&
                (r->req.cmd.buf[1] & 31) =3D=3D SAI_READ_CAPACITY_16) {
         s->blocksize =3D ldl_be_p(&r->buf[8]);
-        s->max_lba =3D ldq_be_p(&r->buf[0]);
+        refresh_max_lba(s);
+        stq_be_p(&r->buf[0], s->max_lba);
     }
     blk_set_guest_block_size(s->conf.blk, s->blocksize);
=20
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index ae8551f279..44d064a656 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -352,3 +352,4 @@ scsi_generic_realize_blocksize(int blocksize) "block si=
ze %d"
 scsi_generic_aio_sgio_command(uint32_t tag, uint8_t cmd, uint32_t timeout)=
 "generic aio sgio: tag=3D0x%x cmd=3D0x%x timeout=3D%u"
 scsi_generic_ioctl_sgio_command(uint8_t cmd, uint32_t timeout) "generic io=
ctl sgio: cmd=3D0x%x timeout=3D%u"
 scsi_generic_ioctl_sgio_done(uint8_t cmd, int ret, uint8_t status, uint8_t=
 host_status) "generic ioctl sgio: cmd=3D0x%x ret=3D%d status=3D0x%x host_s=
tatus=3D0x%x"
+scsi_generic_max_lba_refreshed(uint64_t old_max_lba, uint64_t new_max_lba)=
 "old max_lba %" PRIu64 ",new max_lba %" PRIu64
--=20
2.26.2


