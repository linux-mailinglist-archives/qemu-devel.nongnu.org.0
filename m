Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2A14AC33C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:28:36 +0100 (CET)
Received: from localhost ([::1]:53078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5wR-0003ih-Hn
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:28:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nH5Hg-0003yZ-6U
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:46:28 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17078
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nH5He-0001tO-5Q
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:46:27 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217EjOBX004030; 
 Mon, 7 Feb 2022 14:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=M5XxpAxd07NZBpAt2aI7UOJ7MrrIUP17QKHl1zNskAk=;
 b=Oz803pCP2Yq5ulPkDakis4iCDZ4aaw2r/b17OGCuM6N9pwEc+wvk5joGe5KkM3COTdJ2
 0GXqusOsPXDW4W8hpKYcfuR3UCpDO1RwLZ3zqTVCHLRXFex7gw0pTH5v026FxykPeRbR
 lMlSblUHNM46xuXYWxlbns5hxnQks/3033fiKzbolMavoBmZOgO+PE5eljkDYFnUKM7I
 IihQSHjyF2MmBmYCyXg2u/YNTE2YZh92PXD/hda9EGWGMCMsUONq2oWFD3LsilYvMLKt
 ZOSRMwvcqJN2UHx5Oxp8tNqqq1QltdSxwGNBaKh6uXwtyo3eDfq4XULUTM5ytqkxSYQ2 HA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e1hux9ep8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 14:46:23 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 217EkMWQ007747;
 Mon, 7 Feb 2022 14:46:22 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e1hux9emy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 14:46:22 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 217EgvkD007273;
 Mon, 7 Feb 2022 14:46:21 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3e1gv9w00a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 14:46:20 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 217EkIbo44499326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 14:46:18 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A307BAE055;
 Mon,  7 Feb 2022 14:46:18 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 357C3AE04D;
 Mon,  7 Feb 2022 14:46:18 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.70.169])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  7 Feb 2022 14:46:18 +0000 (GMT)
Date: Mon, 7 Feb 2022 15:46:15 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [RFC PATCH 1/1] virtio: fix feature negotiation for
 ACCESS_PLATFORM
Message-ID: <20220207154615.72b8756a.pasic@linux.ibm.com>
In-Reply-To: <7df172fe-008a-0b98-2780-5155c98a71ba@gmail.com>
References: <20220203164556.2666565-1-pasic@linux.ibm.com>
 <7df172fe-008a-0b98-2780-5155c98a71ba@gmail.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: POM08eKI0yGgCJRXbnEJkSQNCgxPE86A
X-Proofpoint-GUID: pvBClVmqMOdKTQDVd2FcfqSE8UG_4tp4
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_05,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070093
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Feb 2022 08:46:34 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> On 2/3/22 13:45, Halil Pasic wrote:
> > Unlike most virtio features ACCESS_PATFORM is considered mandatory, i.e.
> > the driver must accept it if offered by the device. The virtio
> > specification says that the driver SHOULD accept the ACCESS_PLATFORM
> > feature if offered, and that the device MAY fail to operate if
> > ACCESS_PLATFORM was offered but not negotiated.
> > 
> > While a SHOULD ain't exactly a MUST, we are certainly allowed to fail
> > the device when the driver fences ACCESS_PLATFORM. With commit  
> 
> 
> I believe a link to the virtio specification where this is being mentioned would
> be good to have in the commit message.

I can add that if Michael agrees, and if the patch is deemed worthy.
> 
> 
> > 2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM") we already made the
> > decision to do so whenever the get_dma_as() callback is implemented (by
> > the bus), which in practice means for the entirety of virtio-pci.
> > 
> > That means, if the device needs to translate I/O addresses, then
> > ACCESS_PLATFORM is mandatory. The aforementioned commit tells us
> > in the commit message that this is for security reasons.
> > 
> > If ACCESS_PLATFORM is offered not we want the device to utilize an  
> 
> I think you meant "If ACCESS_PLATFORM is offered".

I'm missing because. I.e. s/not/not becasue/
> 
> 
> > IOMMU and do address translation, but because the device does not have
> > access to the entire guest RAM, and needs the driver to grant access
> > to the bits it needs access to (e.g. confidential guest support), we
> > still require the guest to have the corresponding logic and to accept
> > ACCESS_PLATFORM. If the driver does not accept ACCESS_PLATFORM, then
> > things are bound to go wrong, and we may see failures much less graceful
> > than failing the device because the driver didn't negotiate
> > ACCESS_PLATFORM.
> > 
> > So let us make ACCESS_PLATFORM mandatory for the driver regardless
> > of whether the get_dma_as() callback is implemented or not.
> > 
> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > Fixes: 2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM")
> > 
> > ---
> > This patch is based on:
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg866199.html
> > 
> > During the review of "virtio: fix the condition for iommu_platform not
> > supported" Daniel raised the question why do we "force IOMMU_PLATFORM"
> > iff has_iommu && !!klass->get_dma_as. My answer to that was, that
> > this logic ain't right.
> > 
> > While at it I used the opportunity to re-organize the code a little
> > and provide an explanatory comment.
> > ---
> >   hw/virtio/virtio-bus.c | 17 ++++++++++-------
> >   1 file changed, 10 insertions(+), 7 deletions(-)
> > 
> > diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> > index fbf0dd14b8..359430eb1c 100644
> > --- a/hw/virtio/virtio-bus.c
> > +++ b/hw/virtio/virtio-bus.c
> > @@ -78,16 +78,19 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> >           return;
> >       }
> >   
> > -    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> > -    if (klass->get_dma_as != NULL && has_iommu) {
> > +    vdev->dma_as = &address_space_memory;  
> 
> At this point you can also do:
> 
>     if (!has_iommu) {
>         return;
>     }
> 
> and the rest of the code will have one less indentation level.

I have considered this and decided against it. The reason why is
if that approach is taken, we can't really add more code to the
end of the function. An early return is good if we want to
abort the function with an error. My point is !has_iommu does
not necessarily mean we are done: after a block that handles
the has_iommu situation, in future, there could be a block that
handles something different.

Would this patch work for power? Or are there valid scenarios that
it breaks? I'm asking, because you voiced concern regarding this before.

Thanks for your feedback!

Halil

