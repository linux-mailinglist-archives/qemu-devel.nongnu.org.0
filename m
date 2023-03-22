Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA13D6C5275
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 18:29:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf2G3-00071i-TI; Wed, 22 Mar 2023 13:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1pf2G2-00071U-9z; Wed, 22 Mar 2023 13:28:18 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1pf2Fz-0000n2-IO; Wed, 22 Mar 2023 13:28:17 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MGN401019272; Wed, 22 Mar 2023 17:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=qWnQtV/6kizcWTP/1igOtXM6RLmrrVdVptrICSjKjOQ=;
 b=I+RIaO54BlkImNCvxQdtVjjxNMim5ApHtwDl3WdE+xvQ4MWWjBTJTmNLbqlLWqGTAVsW
 6GjA69cs1ofLtWlPldV566qv3qSLAMcPf4iW9x4oZbNRYU1QsMqAzJ5VlYpG/ouqhr0g
 Hmc2KiauuCiMuEgqN+xsoJXEsOXS++ZvIS+ljTSIQVXv5FLayhcxDOcaDBEodza99YI4
 yP72PCvfXP0pSmGzuRcKD31ew1Gh61b4zYThF9N5DHEvwQ8zQ4owiWN8mvCi/nfnokdm
 GsZYgbbP2r5RbqYKT5+6grBb+485bBh6fooLLoqxWXPiojpcAYyXDUXvAzZWK3iQYV0y Rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pg558hn7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 17:28:11 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32MGNFVE019508;
 Wed, 22 Mar 2023 17:28:11 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pg558hn6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 17:28:10 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32MGQ00X015074;
 Wed, 22 Mar 2023 17:28:08 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3pd4jfe7gf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 17:28:08 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32MHS5LE8847898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Mar 2023 17:28:05 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AF5720040;
 Wed, 22 Mar 2023 17:28:05 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C526920043;
 Wed, 22 Mar 2023 17:28:04 +0000 (GMT)
Received: from li-ce58cfcc-320b-11b2-a85c-85e19b5285e0 (unknown
 [9.152.224.212])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 22 Mar 2023 17:28:04 +0000 (GMT)
Date: Wed, 22 Mar 2023 18:24:33 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Carlos =?UTF-8?B?TMOzcGV6?= <clopez@suse.de>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 "open list:virtio-ccw" <qemu-s390x@nongnu.org>, Halil Pasic
 <pasic@linux.ibm.com>
Subject: Re: [PATCH v2] virtio: refresh vring region cache after updating a
 virtqueue size
Message-ID: <20230322182433.695270d0.pasic@linux.ibm.com>
In-Reply-To: <87y1npglk0.fsf@redhat.com>
References: <20230317002749.27379-1-clopez@suse.de> <87y1npglk0.fsf@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CHaQicEbEgbpXbuNFwwcEpMMdghK-Y2O
X-Proofpoint-GUID: xKWu4E-Hv9iVcMXBBC7WjkqROPp-0Ymq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_14,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220117
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 22 Mar 2023 10:52:31 +0100
Cornelia Huck <cohuck@redhat.com> wrote:
[..]
> >
> > diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> > index e33e5207ab..f44de1a8c1 100644
> > --- a/hw/s390x/virtio-ccw.c
> > +++ b/hw/s390x/virtio-ccw.c
> > @@ -237,6 +237,7 @@ static int virtio_ccw_set_vqs(SubchDev *sch, VqInfoBlock *info,
> >                  return -EINVAL;
> >              }
> >              virtio_queue_set_num(vdev, index, num);
> > +            virtio_init_region_cache(vdev, index);  
> 
> Hmm... this is not wrong, but looking at it again, I see that the guest
> has no way to change num after our last call to
> virtio_init_region_cache() (while setting up the queue addresses.) IOW,
> this introduces an extra round trip that is not really needed.
> 

I don't quite understand. AFAIU the virtio_init_region_cache() would see
the (new) queue addresses but not the new size (num). Yes virtio-ccw
already knows the new num but it is yet to call
to put it into vdev->vq[n].vring.num from where
virtio_init_region_cache() picks it up.

If we were to first virtio_queue_set_num() and only then the address
I would understand. But with the code as is, I don't. Am I missing
something?

[..]
> OTOH, all other transports need this call, as setting the addresses and
> setting num are two distinct operations. So I think we have two options:
> 
> - apply your patch, and accept that we have the extra round trip for ccw
>   (which should not really be an issue, we're processing a channel
>   command anyway)
> 
> - leave it out for ccw and add a comment why it isn't needed
> 
> (I think I'd prefer to just go ahead with your patch.)
> 

Provided we really don't need it: Why do unnecessary work? I would prefer
the "add a comment solution" because doing unnecessary work is
confusing. If we decide to do the unnecessary (and AFAIU completely
useless) work, I believe we should also add a comment why this is done.

OTOH, my current understanding is that we do need it. Or we need to change
the order of virtio_queue_set_rings() and virtio_queue_set_num() which
may or may not be possible.

> Question (mostly for the other ccw folks): Do you think it is a problem
> that ccw sets up queue addresses and size via one command, while pci and
> mmio set addresses and size independently? I guess not; if anything, not
> setting them in one go may lead to issues like the one this patch is
> fixing.
> 
> 

I tend to agree: I don't think it is a problem.

Regards,
Halil

