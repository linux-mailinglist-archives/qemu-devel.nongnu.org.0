Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEB92DAC2E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 12:39:30 +0100 (CET)
Received: from localhost ([::1]:37722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp8fx-00081i-Ko
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 06:39:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1kp8cv-0006RS-ER; Tue, 15 Dec 2020 06:36:21 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18254
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1kp8co-0005La-Pw; Tue, 15 Dec 2020 06:36:21 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BFB3MMb022868; Tue, 15 Dec 2020 06:36:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=crR2FPRoiQ5k4F7XHP5DwYEekiXwfZ+6Mcub4tUq6Xg=;
 b=hhThoOz/Imir7l6u/8hBNn8IpMDhz16BEUbtSEZbqZM8QdHYWiwNRQz3sj1rk4x/PWDz
 2kf5oJiTHro7jRWf/I/ZyWUyaGBczxZWXKlVupF1MtLE2ljy7xO7kzerNDXnDx/mH8is
 lHz6T/XlaEyPeNrBEoGym4GIm3Avq4iKek/CP17tfaMLinEbX/MsuntDEKL84faaB21U
 Oo8kigTunMFWs1OPlHA3pU0yAZltHR/WTGVHg5zSsyQk/TMMG4lPEoSA1ruY/b+ePb3/
 lTlcTBVZ0/wrRjmpYb1fYxm1lnpyZUUo2CLfHTlSo9df/u2Kb41EBZu8WoqF5jFAsEcz CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35eumx1f14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Dec 2020 06:36:11 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BFB3oYY024902;
 Tue, 15 Dec 2020 06:36:11 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35eumx1f0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Dec 2020 06:36:11 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BFBZA1B026415;
 Tue, 15 Dec 2020 11:36:09 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 35cng8cqx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Dec 2020 11:36:09 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0BFBXajN60096896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Dec 2020 11:33:36 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EBCCAE055;
 Tue, 15 Dec 2020 11:33:36 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF72CAE045;
 Tue, 15 Dec 2020 11:33:35 +0000 (GMT)
Received: from oc2783563651 (unknown [9.171.86.205])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 15 Dec 2020 11:33:35 +0000 (GMT)
Date: Tue, 15 Dec 2020 12:33:34 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 1/1] virtio-blk-ccw: tweak the default for num_queues
Message-ID: <20201215123334.3778358e.pasic@linux.ibm.com>
In-Reply-To: <20201215092656.1b95e030.cohuck@redhat.com>
References: <20201109154831.20779-1-pasic@linux.ibm.com>
 <20201109170616.6875f610.cohuck@redhat.com>
 <20201109195303.459f6fba.pasic@linux.ibm.com>
 <0a6d17ce-ed7f-98e8-2937-f266bb4f0f5a@de.ibm.com>
 <20201110114015.1ba4cdac.pasic@linux.ibm.com>
 <f8c4f54b-3439-1c35-2b2e-c9dae0f5241c@de.ibm.com>
 <20201215092656.1b95e030.cohuck@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-15_08:2020-12-14,
 2020-12-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012150077
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org, Michael Mueller <mimu@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Dec 2020 09:26:56 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Tue, 10 Nov 2020 14:18:39 +0100
> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> 
> > On 10.11.20 11:40, Halil Pasic wrote:
> > > On Tue, 10 Nov 2020 09:47:51 +0100
> > > Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> > >   
> > >>
> > >>
> > >> On 09.11.20 19:53, Halil Pasic wrote:  
> > >>> On Mon, 9 Nov 2020 17:06:16 +0100
> > >>> Cornelia Huck <cohuck@redhat.com> wrote:
> > >>>  
> > >>>>> @@ -20,6 +21,11 @@ static void virtio_ccw_blk_realize(VirtioCcwDevice *ccw_dev, Error **errp)
> > >>>>>  {
> > >>>>>      VirtIOBlkCcw *dev = VIRTIO_BLK_CCW(ccw_dev);
> > >>>>>      DeviceState *vdev = DEVICE(&dev->vdev);
> > >>>>> +    VirtIOBlkConf *conf = &dev->vdev.conf;
> > >>>>> +
> > >>>>> +    if (conf->num_queues == VIRTIO_BLK_AUTO_NUM_QUEUES) {
> > >>>>> +        conf->num_queues = MIN(4, current_machine->smp.cpus);
> > >>>>> +    }    
> > >>>>
> > >>>> I would like to have a comment explaining the numbers here, however.
> > >>>>
> > >>>> virtio-pci has a pretty good explanation (use 1:1 for vqs:vcpus if
> > >>>> possible, apply some other capping). 4 seems to be a bit arbitrary
> > >>>> without explanation, although I'm sure you did some measurements :)  
> > >>>
> > >>> Frankly, I don't have any measurements yet. For the secure case,
> > >>> I think Mimu has assessed the impact of multiqueue, hence adding Mimu to
> > >>> the cc list. @Mimu can you help us out.
> > >>>
> > >>> Regarding the normal non-protected VMs I'm in a middle of producing some
> > >>> measurement data. This was admittedly a bit rushed because of where we
> > >>> are in the cycle. Sorry to disappoint you.
> > >>>
> > >>> The number 4 was suggested by Christian, maybe Christian does have some
> > >>> readily available measurement data for the normal VM case. @Christian:
> > >>> can you help me out?  
> > >> My point was to find a balance between performance gain and memory usage.
> > >> As a matter of fact, virtqueue do consume memory. So 4 looked like a
> > >> reasonable default for me for large guests as long as we do not have directed
> > >> interrupts.
> > >>
> > >> Now, thinking about this again: If we want to change the default to something
> > >> else in the future (e.g. to num vcpus) then the compat handling will get
> > >> really complicated.  
> > > 
> > > Regarding compat handling, I believe we would need a new property for
> > > virtio-blk-ccw: something like def_num_queues_max. Then logic would
> > > morph to MIN(def_num_queues_max, current_machine->smp.cpus), and we could
> > > relatively freely do compat stuff on def_num_queues_max.
> > > 
> > > IMHO not pretty but certainly doable.
> > >   
> > >>
> > >> So we can
> > >> - go with num queues = num cpus. But this will consume memory
> > >> for guests with lots of CPUs.  
> > > 
> > > In absence of data that showcases the benefit outweighing the obvious
> > > detriment, I lean towards finding this option the least favorable.
> > >   
> > >> - go with the proposed logic of min(4,vcpus) and accept that future compat handling
> > >> is harder  
> > > 
> > > IMHO not a bad option, but I think I would still feel better about a
> > > more informed decision. In the end, the end user can already specify the
> > > num_queues explicitly, so I don't think this is urgent.
> > >   
> > >> - defer this change  
> > > 
> > > So I tend to lean towards deferring.  
> > 
> > Yes, I was pushing this for 5.2 to avoid compat handling. But maybe it is better
> > to wait and do it later. But we should certainly continue the discussion to have
> > something for the next release.
> 
> <going through older mails>
> 
> Do we have a better idea now about which values would make sense here?
> 

Hi Conny!

I have nothing new since then. Capping at 4 queues still looks like a
reasonable compromise to me.  @Mimu: anything new since then?

If you like I can spin a new version (we need compat handling now).

Halil

