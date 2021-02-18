Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1163031EEF0
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 19:53:30 +0100 (CET)
Received: from localhost ([::1]:59018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCoQb-0005hp-4X
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 13:53:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lCoP4-0005CY-M0; Thu, 18 Feb 2021 13:51:54 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:61164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lCoP2-0004Qm-Er; Thu, 18 Feb 2021 13:51:54 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11IIhtlf099670; Thu, 18 Feb 2021 13:51:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=74MQl8Ay4XKxLiGwRYzpH6Uo6Ed1v1JNfmKArWV92IE=;
 b=ipTLOq42Wt7CfAY8wGvtE5W9EQ1H3HfrKN5X77CZP0+Iv/ugqVRkI1r2jjyvXg5sq6f2
 u+/wln2qAUX6fkpzJ9ZxOyil9ZajCYqVUN96MkQqGd6duAJrSStMHKEtGHrc79eEZhCU
 1sVzZGxjt1sKH/+bYx83Oxq9xEV7PbvlwSNwZeKiI278xASjpWWjGtMDU3/QWJBphxsB
 a/1S/92CYZozg/BJtfNTvuYx0L9URlX/7cRH+Ej+s0b/kAs5aLw/AVmk3r7NpiOjbtxs
 sZQg274M6KLgns59qAfPXsnRVnWj41nRDQoUmJSyC/xkKjMQQZRa6HR1nJb6X+uunpXp vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36sws6g6fv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 13:51:50 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11IIjEFS102592;
 Thu, 18 Feb 2021 13:51:50 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36sws6g6ek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 13:51:49 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11IIgZUc018718;
 Thu, 18 Feb 2021 18:51:47 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 36p6d8jjue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 18:51:47 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 11IIpXRb36962586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Feb 2021 18:51:33 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B050CA405C;
 Thu, 18 Feb 2021 18:51:44 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 433FFA405F;
 Thu, 18 Feb 2021 18:51:44 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.71.158])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 18 Feb 2021 18:51:44 +0000 (GMT)
Date: Thu, 18 Feb 2021 19:51:40 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] virtio-ccw: commands on revision-less devices
Message-ID: <20210218195140.21cf7f2a.pasic@linux.ibm.com>
In-Reply-To: <20210218145109.0c9ce9f6.cohuck@redhat.com>
References: <20210216111830.1087847-1-cohuck@redhat.com>
 <20210216151945.736eb6c7.pasic@linux.ibm.com>
 <20210216165405.57599fe8.cohuck@redhat.com>
 <20210217153936.5e041c21.pasic@linux.ibm.com>
 <20210218145109.0c9ce9f6.cohuck@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-18_09:2021-02-18,
 2021-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102180153
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Feb 2021 14:51:09 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Wed, 17 Feb 2021 15:39:36 +0100
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > On Tue, 16 Feb 2021 16:54:05 +0100
> > Cornelia Huck <cohuck@redhat.com> wrote:
> >   
> > > On Tue, 16 Feb 2021 15:19:45 +0100
[..]
> > 
> > Exactly, so the legacy stuff is not normative, and strictly speaking not
> > included in the standard (i.e. standardized).
> > 
> > But then I find usage of keywords like MUST in legacy interface sections
> > misreading. I believe some Oasis guy complained about keyword usage
> > outside of normative sections before.  
> 
> We can certainly discuss whether we want to change something in the
> legacy sections in the spec -- but that's outside the scope of this
> patch.
>

I agree. I just pointed out that those requirements are non-normative
despite the fact that MUST is used.

[..]

> > > If we want to implement a non-transitional device, the implicit
> > > selection of revision 0 goes away, of course. In fact, I'm currently
> > > trying to make legacy support optional for virtio-ccw, so that's why I
> > > had been looking at the revision handling :)    
> > 
> > Do you mean optional like build time configurable in QEMU? I think the
> > legacy support is already optional when it comes to the spec.
> > 
> > Let me explain how do I interpret device compliance with respect to
> > virtio revisions and first command is a non-_REV.
> > 
> > 1) If the first virtio command after the virtio-ccw device is enabled is
> > a non-_REV command, the virtio-ccw device not answering it with a
> > command reject does not preclude the device form being virtio 1.0
> > conform. I.e. this behavior is conform, because does not violate
> > any of the sections linked in "7.3.3 Clause 17: Channel I/O Device
> > Conformance" in general, and thus does not violate "4.3.2.1.1 Device
> > Requirements: Setting the Virtio Revision" in particular. If you disagree,
> > please point me to the corresponding device normative section.
> > 
> > 2) Rejecting the first command which which happens to be a non-_REV
> > however does not preclude virtio (1.0) conformance either. The device
> > is free to do whatever, because in my reading it ain't specified what
> > needs to be done.  
> 
> If it does that, however, it would be a pretty useless transitional
> device, as a legacy driver won't be able to work.
> 

Clear, a transitional device can't do that.

[..]

> > > 
> > > Replace 'and else' with 'a transitional device needs to'?    
> > 
> > Sounds good but, I would also replace 'The virtio standard specifies'
> > with 'The non-normative part of the virtio specification recommends'
> > and probably also replace 'MUST' with 'SHOULD'.
> > 
> > The current patch description sounds like, we are in violation of the
> > spec, and the change is necessary to have a spec conform device, but it
> > is not.  
> 
> I think you're reading too much into this patch description. The point
> of the legacy sections in the spec is to lay down what a device/driver
> needs to do if it also wants to support legacy drivers/devices. If we
> want to present a useful transitional device, we need (regardless of
> any MUST, or SHOULD) to operate in a way that a legacy driver can use
> it.
> 

I agree. And I was never disputing that. What I don't like is that the
patch description reads to me like a conformance fix, but it is not. The
QEMU implementation was VIRTIO spec conform before, and remains VIRTIO
spec conform later. Are you saying that a construct: 'The X
standard specifies that Y must Z, but our implementation does not Z.' does
not imply that our our implementation of Y is not conform to standard X?

In any case, the commit message ain't worth all this discussion. It
won't be the first or the last one that is not very precise. Please do
whatever you like.

Regards,
Halil

