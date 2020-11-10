Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4712AD3F9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:41:59 +0100 (CET)
Received: from localhost ([::1]:38620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcR66-0005so-LU
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1kcR4f-0005L4-CX; Tue, 10 Nov 2020 05:40:29 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5990
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1kcR4c-0001oH-3y; Tue, 10 Nov 2020 05:40:29 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AAAW6MC018040; Tue, 10 Nov 2020 05:40:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=F0fW1hJkuOf3/VhnupeWAyUM6+1+xeMsg2Usp5BNUxk=;
 b=EUNPTw7jjIdrUiUgZO6jJlT8QzJlzblrMEW0h+yNAkLkzDyN1d9fxKZCRnzxuPRbkkc6
 RKOzu0UMheP6mE4dETVi3LA6m8vBG5EUv058Ummt5pNSYc2kTsioNZ1cTiKGIVAZT68l
 68Tc81y44lqGMIR+suLy1c3Nw9HFmLRdDNmbuu4H9AoHFxQlKdh77iNJetX1yqentfqE
 IJ9EWRbgaRs1glowJ6pxF/mx2a/mNIU6QRAlYUeBKhUVIS25LJC43N+R+smZB79pgUst
 nIgre8Ohc0+zsGbaPeKJaImu8QEyb3I9VsyUxUheD2Z1huudjFEQfecvsFul3432hu+z LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34qmsg89fh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 05:40:23 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AAAWMe3019069;
 Tue, 10 Nov 2020 05:40:23 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34qmsg89eh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 05:40:23 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AAAVVmo011565;
 Tue, 10 Nov 2020 10:40:21 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 34p26pjcs8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 10:40:21 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AAAeIGo7340620
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Nov 2020 10:40:18 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 855D65204E;
 Tue, 10 Nov 2020 10:40:18 +0000 (GMT)
Received: from oc2783563651 (unknown [9.145.34.21])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1523F52051;
 Tue, 10 Nov 2020 10:40:18 +0000 (GMT)
Date: Tue, 10 Nov 2020 11:40:15 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH 1/1] virtio-blk-ccw: tweak the default for num_queues
Message-ID: <20201110114015.1ba4cdac.pasic@linux.ibm.com>
In-Reply-To: <0a6d17ce-ed7f-98e8-2937-f266bb4f0f5a@de.ibm.com>
References: <20201109154831.20779-1-pasic@linux.ibm.com>
 <20201109170616.6875f610.cohuck@redhat.com>
 <20201109195303.459f6fba.pasic@linux.ibm.com>
 <0a6d17ce-ed7f-98e8-2937-f266bb4f0f5a@de.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-10_04:2020-11-05,
 2020-11-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=894 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011100071
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 03:47:57
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Michael Mueller <mimu@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Nov 2020 09:47:51 +0100
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> 
> 
> On 09.11.20 19:53, Halil Pasic wrote:
> > On Mon, 9 Nov 2020 17:06:16 +0100
> > Cornelia Huck <cohuck@redhat.com> wrote:
> > 
> >>> @@ -20,6 +21,11 @@ static void virtio_ccw_blk_realize(VirtioCcwDevice *ccw_dev, Error **errp)
> >>>  {
> >>>      VirtIOBlkCcw *dev = VIRTIO_BLK_CCW(ccw_dev);
> >>>      DeviceState *vdev = DEVICE(&dev->vdev);
> >>> +    VirtIOBlkConf *conf = &dev->vdev.conf;
> >>> +
> >>> +    if (conf->num_queues == VIRTIO_BLK_AUTO_NUM_QUEUES) {
> >>> +        conf->num_queues = MIN(4, current_machine->smp.cpus);
> >>> +    }  
> >>
> >> I would like to have a comment explaining the numbers here, however.
> >>
> >> virtio-pci has a pretty good explanation (use 1:1 for vqs:vcpus if
> >> possible, apply some other capping). 4 seems to be a bit arbitrary
> >> without explanation, although I'm sure you did some measurements :)
> > 
> > Frankly, I don't have any measurements yet. For the secure case,
> > I think Mimu has assessed the impact of multiqueue, hence adding Mimu to
> > the cc list. @Mimu can you help us out.
> > 
> > Regarding the normal non-protected VMs I'm in a middle of producing some
> > measurement data. This was admittedly a bit rushed because of where we
> > are in the cycle. Sorry to disappoint you.
> > 
> > The number 4 was suggested by Christian, maybe Christian does have some
> > readily available measurement data for the normal VM case. @Christian:
> > can you help me out?
> My point was to find a balance between performance gain and memory usage.
> As a matter of fact, virtqueue do consume memory. So 4 looked like a
> reasonable default for me for large guests as long as we do not have directed
> interrupts.
> 
> Now, thinking about this again: If we want to change the default to something
> else in the future (e.g. to num vcpus) then the compat handling will get
> really complicated.

Regarding compat handling, I believe we would need a new property for
virtio-blk-ccw: something like def_num_queues_max. Then logic would
morph to MIN(def_num_queues_max, current_machine->smp.cpus), and we could
relatively freely do compat stuff on def_num_queues_max.

IMHO not pretty but certainly doable.

> 
> So we can
> - go with num queues = num cpus. But this will consume memory
> for guests with lots of CPUs.

In absence of data that showcases the benefit outweighing the obvious
detriment, I lean towards finding this option the least favorable.

> - go with the proposed logic of min(4,vcpus) and accept that future compat handling
> is harder

IMHO not a bad option, but I think I would still feel better about a
more informed decision. In the end, the end user can already specify the
num_queues explicitly, so I don't think this is urgent.

> - defer this change

So I tend to lean towards deferring.

Another thought is, provided the load is about evenly spread on the
different virtqueues, if the game is about vCPU locality, one could
think of decreasing the size of each individual virtqueue while
increasing their number, with the idea of not paying much more in terms
of memory. The queue size however needs to be a power of 2,
so there is a limit on the granularity.

Regarding secure VMs, currently we have to cramp at least the swiotlb and
the virtqueues into ZONE_DMA. So increasing the number of
virtqueues heavily may get us into new trouble with exotic configs.

Regards,
Halil

