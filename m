Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CC8563707
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 17:38:05 +0200 (CEST)
Received: from localhost ([::1]:34518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7IiZ-0001G8-Fl
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 11:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1o7IhJ-0000IL-Sq; Fri, 01 Jul 2022 11:36:45 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1o7IhH-0000St-SD; Fri, 01 Jul 2022 11:36:45 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 261FDpaa011331;
 Fri, 1 Jul 2022 15:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=I5BfghYRE310xF9Dm/T4Pn/NZjVJrTgTE+L3H7KQKYE=;
 b=Ro9zbkKHsiI/ASdSqwB6/k74DkR7NY63bzgJdYwKYWUFSfkYbpHwUg4IjEvmyuz/ujQE
 L9oKhNYyKMCKhi7M3/N+f3KlDz/IGp5oU0+1awfRTAT+BJNvMGBht/7vUdZg190IeJ3i
 Ga/jj8jfLcMmMeELUxMglclY+hhH+Q4OGH+gDwZpJot3EExCT5HxQUo75fESKoElBmnK
 s1QzK799gUbnHFJxqAVmzInWK+Xd59dtpJT3Knkh5kBp0dX3fyUBsFigj72K4s8hLcgb
 fS5/fM1X2h56Lw0rrOlCEisnHqO7zNoR5849IxfWVqN5pqlsqqZ5Ts24hpS1PhVFrRUz iA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h23cs0r65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 15:36:42 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 261FFiej022584;
 Fri, 1 Jul 2022 15:36:41 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h23cs0r5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 15:36:41 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 261FZL2Y022158;
 Fri, 1 Jul 2022 15:36:41 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 3gwt0ajj59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 15:36:41 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 261Fae7b7078778
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Jul 2022 15:36:40 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 769E8B205F;
 Fri,  1 Jul 2022 15:36:40 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF045B2064;
 Fri,  1 Jul 2022 15:36:38 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.163.2.135])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  1 Jul 2022 15:36:38 +0000 (GMT)
Message-ID: <7d12be9bea18be40e16fe5411c768c051dd4078d.camel@linux.ibm.com>
Subject: Re: [PATCH 03/12] pc-bios/s390-ccw/bootmap: Improve the guessing
 logic in zipl_load_vblk()
From: Eric Farman <farman@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, Christian
 Borntraeger <borntraeger@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>, Janosch Frank
 <frankja@linux.ibm.com>
Date: Fri, 01 Jul 2022 11:36:37 -0400
In-Reply-To: <20220628131032.213986-4-thuth@redhat.com>
References: <20220628131032.213986-1-thuth@redhat.com>
 <20220628131032.213986-4-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 77fVLbHiDGtldSUVGb0trDBOC3AMvDb6
X-Proofpoint-ORIG-GUID: S-V7A79ckgGsAUKsG11C1jQ7uLSrlpXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-01_07,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207010061
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 2022-06-28 at 15:10 +0200, Thomas Huth wrote:
> The logic of trying an final ISO or ECKD boot on virtio-block devices
> is
> very weird: Since the geometry hardly ever matches in
> virtio_disk_is_scsi(),
> virtio_blk_setup_device() always sets a "guessed" disk geometry via
> virtio_assume_scsi() (which is certainly also wrong in a lot of
> cases).
> 
> zipl_load_vblk() then sees that there's been a
> "virtio_guessed_disk_nature"
> and tries to fix up the geometry again via virtio_assume_iso9660()
> before
> always trying to do ipl_iso_el_torito(). That's a very brain-twisting
> way of attempting to boot from ISO images, which won't work anymore
> after
> the following patches that will clean up the virtio_assume_scsi()
> mess
> (and thus get rid of the "virtio_guessed_disk_nature" here).
> 
> Let's try a better approach instead: ISO files always have a magic
> string "CD001" at offset 0x8001 (see e.g. the ECMA-119 specification)
> which we can use to decide whether we should try to boot in ISO 9660
> mode (which we should also try if we see a sector size of 2048).
> 
> And if we were not able to boot in ISO mode here, the final boot
> attempt
> before panicking is to boot in ECKD mode. Since this is our last boot
> attempt anyway, simply always assume the ECKD geometry here (if the
> sector
> size was not 4096 yet), so that we also do not depend on the guessed
> disk
> geometry from virtio_blk_setup_device() here anymore.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/bootmap.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/bootmap.c b/pc-bios/s390-ccw/bootmap.c
> index 56411ab3b6..3181b05382 100644
> --- a/pc-bios/s390-ccw/bootmap.c
> +++ b/pc-bios/s390-ccw/bootmap.c
> @@ -780,18 +780,35 @@ static void ipl_iso_el_torito(void)
>      }
>  }
>  
> +/**
> + * Detect whether we're trying to boot from an .ISO image.
> + * These always have a signature string "CD001" at offset 0x8001.
> + */
> +static bool has_iso_signature(void)
> +{
> +    if (virtio_read(0x8000 / virtio_get_block_size(), sec)) {

Certainly unlikely, but virtio_get_block_size is able to return zero.

> +        return false;
> +    }
> +
> +    return !memcmp("CD001", &sec[1], 5);
> +}
> +
>  /*******************************************************************
> ****
>   * Bus specific IPL sequences
>   */
>  
>  static void zipl_load_vblk(void)
>  {
> -    if (virtio_guessed_disk_nature()) {
> -        virtio_assume_iso9660();
> +    int blksize = virtio_get_block_size();
> +
> +    if (blksize == VIRTIO_ISO_BLOCK_SIZE || has_iso_signature()) {
> +        if (blksize != VIRTIO_ISO_BLOCK_SIZE) {
> +            virtio_assume_iso9660();
> +        }
> +        ipl_iso_el_torito();
>      }
> -    ipl_iso_el_torito();
>  
> -    if (virtio_guessed_disk_nature()) {
> +    if (blksize != VIRTIO_DASD_BLOCK_SIZE) {
>          sclp_print("Using guessed DASD geometry.\n");
>          virtio_assume_eckd();
>      }


