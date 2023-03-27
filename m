Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9566CA4F3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 14:57:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmOe-00076M-D7; Mon, 27 Mar 2023 08:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1pgmOS-00075O-Ks; Mon, 27 Mar 2023 08:56:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1pgmOQ-000175-2g; Mon, 27 Mar 2023 08:56:11 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RCWwAm000828; Mon, 27 Mar 2023 12:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=9tLfl4EYWTmVSGiwzErzLxYcCL0CMqSczMsb6IDg8VQ=;
 b=oQgNSqwTTSbNt6A+U4rARGeuXC66u9IEj/U8lQ2sI6xtu5697Jst8yHkfJBZYZIs7C/+
 dgMRjRMw2lBlH8YA2Clc7SZGM8XHnHus6CBdKMgIb9pD4ahsJ/9Cij4pE4Sr6WDfxPj+
 K7Zc87tWdtR4SnbYBGyGdXpLF0PivkB+OCv4zsU5xptWKzepTrjm0HIyskxLe2tk74oA
 MjjOh+OyaUYkPkRfDu9RHBPpzjMeBVRjQOJ+2M6vT4jeqijVWs3nFGqrqK9u07hsVGxT
 FuDrXtWz11NcnZfhOuhzoUphvrTrFU9njxi6o6HODK3B7oLX7BqP6ZcM36lkn2uC7IDM yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjaru8skx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 12:56:05 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32RCIIRI006335;
 Mon, 27 Mar 2023 12:56:05 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjaru8sk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 12:56:05 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32R0uMtx023253;
 Mon, 27 Mar 2023 12:56:02 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3phr7fte9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 12:56:02 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RCtwwt7930522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 12:55:58 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A80BA20040;
 Mon, 27 Mar 2023 12:55:58 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7A4C20043;
 Mon, 27 Mar 2023 12:55:57 +0000 (GMT)
Received: from li-ce58cfcc-320b-11b2-a85c-85e19b5285e0 (unknown [9.171.27.215])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
 Mon, 27 Mar 2023 12:55:57 +0000 (GMT)
Date: Mon, 27 Mar 2023 14:55:55 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Carlos =?UTF-8?B?TMOzcGV6?=
 <clopez@suse.de>, qemu-devel@nongnu.org, Eric Farman
 <farman@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Huth
 <thuth@redhat.com>, "open list:virtio-ccw" <qemu-s390x@nongnu.org>, Halil
 Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v2] virtio: refresh vring region cache after updating a
 virtqueue size
Message-ID: <20230327145555.2a00773d.pasic@linux.ibm.com>
In-Reply-To: <20230327082859-mutt-send-email-mst@kernel.org>
References: <20230317002749.27379-1-clopez@suse.de> <87y1npglk0.fsf@redhat.com>
 <20230322182433.695270d0.pasic@linux.ibm.com>
 <877cv2sbbo.fsf@redhat.com>
 <20230327082859-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UZ6bILaxd6F-kn7c8ROtxVP0qYmUm0x2
X-Proofpoint-GUID: zcoTTMCDc4aiBjLzKmIeF832-IwhyGtJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270098
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 27 Mar 2023 08:29:09 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Mar 27, 2023 at 01:06:19PM +0200, Cornelia Huck wrote:
> > On Wed, Mar 22 2023, Halil Pasic <pasic@linux.ibm.com> wrote:
> >   
> > > On Wed, 22 Mar 2023 10:52:31 +0100
> > > Cornelia Huck <cohuck@redhat.com> wrote:
> > > [..]  
> > >> >
> > >> > diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> > >> > index e33e5207ab..f44de1a8c1 100644
> > >> > --- a/hw/s390x/virtio-ccw.c
> > >> > +++ b/hw/s390x/virtio-ccw.c
> > >> > @@ -237,6 +237,7 @@ static int virtio_ccw_set_vqs(SubchDev *sch, VqInfoBlock *info,
> > >> >                  return -EINVAL;
> > >> >              }
> > >> >              virtio_queue_set_num(vdev, index, num);
> > >> > +            virtio_init_region_cache(vdev, index);    
> > >> 
> > >> Hmm... this is not wrong, but looking at it again, I see that the guest
> > >> has no way to change num after our last call to
> > >> virtio_init_region_cache() (while setting up the queue addresses.) IOW,
> > >> this introduces an extra round trip that is not really needed.
> > >>   
> > >
> > > I don't quite understand. AFAIU the virtio_init_region_cache() would see
> > > the (new) queue addresses but not the new size (num). Yes virtio-ccw
> > > already knows the new num but it is yet to call
> > > to put it into vdev->vq[n].vring.num from where
> > > virtio_init_region_cache() picks it up.
> > >
> > > If we were to first virtio_queue_set_num() and only then the address
> > > I would understand. But with the code as is, I don't. Am I missing
> > > something?  
> > 
> > Hrm, virtio_queue_set_rings() doesn't pass num, I thought it did... I
> > wonder whether ordering virtio_queue_set_num() before it would be better
> > anyway (if the guest gave us an invalid num, we don't need to setup any
> > addresses and init any caches).
> > 
> > Smth like
> > 
> > if (info) {
> >    if (desc) {
> >       if (virtio_queue_get_max_num(...) < num) {
> >           return -EINVAL;
> >       }
> >       virtio_queue_set_num(...);
> >    }
> >    virtio_queue_set_rings(...);
> > } else { /* legacy */
> >    if (desc && virtio_queue_get_max_num(...) > num) {
> >        return -EINVAL;
> >    }
> >    virtio_queue_set_addr(...);
> > }
> > virtio_queue_set_vector(vdev, index, desc ? index : VIRTIO_NO_VECTOR);
> > 
> > might be easier to follow than the current code.
> > 
> > Or we could just go with this patch, which has the advantage of already
> > existing :)  
> 
> Yea ... an ack would be appreciated.

I'm in favor of taking the existing one. We can still do the refactoring
afterwards and also get rid of the then redundant update. That way
the git history would also "tell the story".

For the s390x part:
Acked-by: Halil Pasic <pasic@linux.ibm.com>

