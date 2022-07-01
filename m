Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82CD56363F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 16:57:31 +0200 (CEST)
Received: from localhost ([::1]:53072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7I5K-00014M-Og
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 10:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1o7I22-0006lQ-3k; Fri, 01 Jul 2022 10:54:06 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1o7I20-0001AV-FL; Fri, 01 Jul 2022 10:54:05 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 261Efx6h013565;
 Fri, 1 Jul 2022 14:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=J8/ZI8I4KKVoXgT+28jnEIyfV3U0kV+gW8QPciKujCc=;
 b=mNRGZjAss67GRUdFt/ueunwwBPr5FmlDo3drlAY0v3aozP+5h7an2TRkMwuaaj5H4L7D
 5w78M4ItCsnDCyHhc6jQxHbVE4Yj+4oTorqG/XYP4OQ5ULz4P79nkXqgNZ1Bnld2AJdD
 tDnccilQ6KskL2dQbojr+0B2TBtGyUXjj8WWDjx4/jlV7zOa6+AIagmeph6p6X7zqfqO
 cZNY9PxggvV3Qdyp2z+g1w/fi+rGU3zX8B09QNR9nFrV67RTCX6TJRFzP9KsPUiLkTu0
 fsOw/MIBQqnfchFrMn83s0IBUPOsG53C1aPUZvIrHXjQMiBdlbdwuJ1fZNczIJ3FpH0B cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h22wprg6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 14:54:02 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 261EiVOX002468;
 Fri, 1 Jul 2022 14:54:02 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h22wprg5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 14:54:02 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 261EoPuF011815;
 Fri, 1 Jul 2022 14:54:01 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02dal.us.ibm.com with ESMTP id 3gwt0bcg89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 14:54:01 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 261Erx7d18350522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Jul 2022 14:53:59 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B584CC605D;
 Fri,  1 Jul 2022 14:53:59 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB4DCC6063;
 Fri,  1 Jul 2022 14:53:58 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.163.2.135])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  1 Jul 2022 14:53:58 +0000 (GMT)
Message-ID: <a80dfc619123a651d1bb9ed519543fb50cd282ce.camel@linux.ibm.com>
Subject: Re: [PATCH 02/12] pc-bios/s390-ccw/virtio: Introduce a macro for
 the DASD block size
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Janosch Frank <frankja@linux.ibm.com>
Date: Fri, 01 Jul 2022 10:53:58 -0400
In-Reply-To: <87wnd0c49r.fsf@redhat.com>
References: <20220628131032.213986-1-thuth@redhat.com>
 <20220628131032.213986-3-thuth@redhat.com> <87wnd0c49r.fsf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1q8ZgffcToaVMclqPwXAcPpPcSD4MXp7
X-Proofpoint-GUID: rsStzK07gM_XVtMb_LPx6zq1jvu65Qg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-01_07,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207010056
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

On Tue, 2022-06-28 at 15:21 +0200, Cornelia Huck wrote:
> On Tue, Jun 28 2022, Thomas Huth <thuth@redhat.com> wrote:
> 
> > Use VIRTIO_DASD_BLOCK_SIZE instead of the magic value 4096.
> > 
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  pc-bios/s390-ccw/virtio.h        | 1 +
> >  pc-bios/s390-ccw/virtio-blkdev.c | 2 +-
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/pc-bios/s390-ccw/virtio.h b/pc-bios/s390-ccw/virtio.h
> > index 19fceb6495..c2c17c29ca 100644
> > --- a/pc-bios/s390-ccw/virtio.h
> > +++ b/pc-bios/s390-ccw/virtio.h
> > @@ -198,6 +198,7 @@ extern int virtio_read_many(ulong sector, void
> > *load_addr, int sec_num);
> >  #define VIRTIO_SECTOR_SIZE 512
> >  #define VIRTIO_ISO_BLOCK_SIZE 2048
> >  #define VIRTIO_SCSI_BLOCK_SIZE 512
> > +#define VIRTIO_DASD_BLOCK_SIZE 4096
> >  
> >  static inline ulong virtio_sector_adjust(ulong sector)
> >  {
> > diff --git a/pc-bios/s390-ccw/virtio-blkdev.c b/pc-bios/s390-
> > ccw/virtio-blkdev.c
> > index 7d35050292..49ed2b4bee 100644
> > --- a/pc-bios/s390-ccw/virtio-blkdev.c
> > +++ b/pc-bios/s390-ccw/virtio-blkdev.c
> > @@ -155,7 +155,7 @@ void virtio_assume_eckd(void)
> >      vdev->config.blk.physical_block_exp = 0;
> >      switch (vdev->senseid.cu_model) {
> >      case VIRTIO_ID_BLOCK:
> > -        vdev->config.blk.blk_size = 4096;
> > +        vdev->config.blk.blk_size = VIRTIO_DASD_BLOCK_SIZE;
> >          break;
> >      case VIRTIO_ID_SCSI:
> >          vdev->config.blk.blk_size = vdev->scsi_block_size;
> 
> Unrelated to this change, but can't dasd be formatted with other
> block
> sizes as well?

True. I'd guess it's unlikely that anyone is jumping through those
hoops, though.

This is fine.

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> 


