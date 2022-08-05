Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1135058AB61
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 15:11:34 +0200 (CEST)
Received: from localhost ([::1]:58218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJx6y-0003si-4d
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 09:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1oJwzF-0002y6-SW; Fri, 05 Aug 2022 09:03:34 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1oJwzD-00064m-4r; Fri, 05 Aug 2022 09:03:33 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 275CV0RZ025258;
 Fri, 5 Aug 2022 13:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=kNbOqvtM1XyfVKdZSaP80F7upA4Ltp0+9EVLRxYWvxg=;
 b=Vz4MPqrZSqWCtnyn2dMCm5Ph/LzOIBceb38n//vURTKbpSpNyAEQhuL7adUgSV/xYmXk
 P8ypECloDgEMGbyWEBkp0ig7JYJEaw/DY0a0mEP8NfQIbyAoAVhXZatA+05Y+3OSfPPw
 5D59vxZKp4DGP+qr276xMoMBhUxomX6Rm2evEKM5qTWiT+1hTUTwAge1BOQdm2Yz3iql
 DBrFlIQ7WumqTX0g9XUWfw8Q4ZhPJaZPdwpfBRM609/W5UPufaAuaCeeh3xrheXC3cku
 gAg41sdF1G/0IvQERUCNvc4jBccNaNL2P0CpU2+hIBofVUnxchtGBSed+xqzy5PWPVUO Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs39es7ft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 13:02:28 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 275CVtGK029753;
 Fri, 5 Aug 2022 13:02:27 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs39es7ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 13:02:27 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 275Co9q7006688;
 Fri, 5 Aug 2022 13:02:26 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3hmv9a5w96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 13:02:26 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 275D2PeO35586516
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Aug 2022 13:02:25 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7381B6A054;
 Fri,  5 Aug 2022 13:02:25 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCD1B6A04D;
 Fri,  5 Aug 2022 13:02:24 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.130.240])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  5 Aug 2022 13:02:24 +0000 (GMT)
Message-ID: <f0994a0d6c712393ab31025875cbf878133b7042.camel@linux.ibm.com>
Subject: Re: [PATCH] pc-bios/s390-ccw: Fix booting with logical block size <
 physical block size
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>
Date: Fri, 05 Aug 2022 09:02:23 -0400
In-Reply-To: <875yj780b1.fsf@redhat.com>
References: <20220805094214.285223-1-thuth@redhat.com>
 <875yj780b1.fsf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: B6HtwGMI_0DmPPO3ZWiUUdrHjZIEH4LF
X-Proofpoint-GUID: M78RQPusi8lNYXIAAJ7MsbqNm7HH74NI
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-05_05,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 mlxlogscore=999 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208050065
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

On Fri, 2022-08-05 at 12:14 +0200, Cornelia Huck wrote:
> On Fri, Aug 05 2022, Thomas Huth <thuth@redhat.com> wrote:
> 
> > For accessing single blocks during boot, it's the logical block
> > size that
> > matters. (Physical block sizes are rather interesting e.g. for
> > creating
> > file systems with the correct alignment for speed reasons etc.).
> > So the s390-ccw bios has to use the logical block size for
> > calculating
> > sector numbers during the boot phase, the "physical_block_exp"
> > shift
> > value must not be taken into account. This change fixes the boot
> > process
> > when the guest hast been installed on a disk where the logical
> > block size
> > differs from the physical one, e.g. if the guest has been installed
> > like this:
> > 
> >  qemu-system-s390x -nographic -accel kvm -m 2G \
> >   -drive if=none,id=d1,file=fedora.iso,format=raw,media=cdrom \
> >   -device virtio-scsi -device scsi-cd,drive=d1 \
> >   -drive if=none,id=d2,file=test.qcow2,format=qcow2
> >   -device virtio-
> > blk,drive=d2,physical_block_size=4096,logical_block_size=512
> > 
> > Linux correctly uses the logical block size of 512 for the
> > installation,
> > but the s390-ccw bios tries to boot from a disk with 4096 block
> > size so
> > far, as long as this patch has not been applied yet (well, it used
> > to work
> > by accident in the past due to the virtio_assume_scsi() hack that
> > used to
> > enforce 512 byte sectors on all virtio-block disks, but that hack
> > has been
> > well removed in commit 5447de2619050a0a4d to fix other scenarios).
> 
> I wonder whether there's more stuff lurking in there; the old code
> seems
> to have "worked" in many cases by accident, and cleaning up things
> might
> expose more odd code. Generally, reading ccw bios code gives me a
> headache :)

Same here. But Thomas' recent changes are good medicine. :)

> 
> > Fixes: 5447de2619 ("pc-bios/s390-ccw/virtio-blkdev: Remove
> > virtio_assume_scsi()")
> > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2112303
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  pc-bios/s390-ccw/virtio-blkdev.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Looks sane to me.
> 
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> 

Reviewed-by: Eric Farman <farman@linux.ibm.com>


