Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7102BAA1F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 13:32:01 +0100 (CET)
Received: from localhost ([::1]:36634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg5a4-0000vo-1K
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 07:32:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1kg5Xa-0008Rq-18; Fri, 20 Nov 2020 07:29:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1kg5XX-0004GE-Tv; Fri, 20 Nov 2020 07:29:25 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AKC2Lri025298; Fri, 20 Nov 2020 07:29:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=cMhr/IwsBWh4TXq251nqt3mpQy+ndJrNUTaLgv+JGwg=;
 b=IOxYhf25XIYGU3hA5otVUheeCl5xy+loTLzaGN3JyNvjF4VRm4kgZg482IQUM1gghxcL
 AIEZ+I/0UnBM/jQK7UU1EakRMQ2MEmC2HtR9oT8NOuU193qzwjk1bj+u2GHeWpF4bQMA
 06q49LJ2L5gmZkdr0ymqqwND9TlzHQaS30znHbhkmMxJKzzPyIQUvBftmdnXsaiLC609
 70Qvnikd82SdLcM9bcMhppKihuOfIEYYn97pwGL3nZcGcmqynZuu1Hu+++ZrseGi3vqg
 7K8lfnLJDkS6mPuC0PIL+BlKX3QJ7zNgcqzmiFi26mTNZif9vitFiBqB67HZ1p80/NmI SA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xd7x95he-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 07:29:21 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AKC2Wbb025890;
 Fri, 20 Nov 2020 07:29:21 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xd7x95gf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 07:29:21 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AKCSHxZ012997;
 Fri, 20 Nov 2020 12:29:18 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 34weby1nst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 12:29:18 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AKCTFW83539678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 12:29:15 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3E0D4203F;
 Fri, 20 Nov 2020 12:29:15 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 208D042045;
 Fri, 20 Nov 2020 12:29:15 +0000 (GMT)
Received: from oc2783563651 (unknown [9.171.30.230])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 20 Nov 2020 12:29:15 +0000 (GMT)
Date: Fri, 20 Nov 2020 13:29:12 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: Availability of physical devices and migration (was: Re: [RFC
 PATCH 2/2] vfio-ccw: Connect the device request notifier)
Message-ID: <20201120132912.770d2ec1.pasic@linux.ibm.com>
In-Reply-To: <20201120123837.0b4fc3be.cohuck@redhat.com>
References: <20201117032605.56831-1-farman@linux.ibm.com>
 <20201117032605.56831-3-farman@linux.ibm.com>
 <20201120035107.30688e2f.pasic@linux.ibm.com>
 <20201120123837.0b4fc3be.cohuck@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_04:2020-11-20,
 2020-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011200079
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: Eric Farman <farman@linux.ibm.com>, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 libvir-list@redhat.com, Alex Williamson <alex.williamson@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Marc Hartmayer <mhartmay@linux.ibm.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Nov 2020 12:38:37 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Fri, 20 Nov 2020 03:51:07 +0100
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > On Tue, 17 Nov 2020 04:26:05 +0100
> > Eric Farman <farman@linux.ibm.com> wrote:
> > 
> > > Now that the vfio-ccw code has a notifier interface to request that
> > > a device be unplugged, let's wire that together.  
> > 
> > I'm aware of the fact that performing an unplug is what vfio-pci does,
> > but I was not aware of this before, and I became curious with regards
> > to how is this going to mesh with migration (in the future).
> > 
> > The sentence 'For this to work, QEMU has to be launched with the same
> > arguments the two times.' form docs/devel/migration.rst should not
> > be taken literally, I know, but the VM configuration changing not because
> > it was changed via a management interface, but because of events that
> > may not be under the control of whoever is managing the VM does
> > make thinks harder to reason about.
> > 
> > I suppose, we now basically mandate that whoever manages the VM, either
> > a) maintains his own model of the VM and listens to the events, to
> > update it if such a device removal happens, or
> > b) inspects the VM at some appropriate point in time, to figure out how
> > the target VM is supposed to be started.
> > 
> > I think libvirt does a).
> 
> This seems like something that would be of general interest to libvirt
> folks, adding the list on cc:.
> 

I agree. Just didn't now if this stuff was already discussed and
worked out.

> For virtual devices, QEMU and any management software are in full
> control, and can simply make sure that both source and target have the
> device available.
> 
> For physical devices, we still can make sure that source and target
> match when we do the setup, but device failures can happen at
> inconvenient times. It may suddenly be no longer possible to access
> state etc. 

Regarding virtual vs physical, I gave this some thought yesterday after
I've sent my previous email. Now I'm not sure virtual devicess and
pass-through devices are all that different. I mean if for example
you have a virtio-blk device that use a SCSI disk device special file
as backing and that SCSI disk (a physical device) fails, the virtio-blk
device is pretty much has going go dysfunctional. And it ain't different,
if it's backed by a file on a filesystem, and the filesystem fails.

I'm not sure I understand the reason why do we hot unplug the qemu
device, in case of pass-through.

I mean if I plug a physical device, into my physical machine, yes it may
fail at any time and even go completely silent (analogous to guest view),
but the physical machine is AFAIK not likely to catapult out the faulty
component (analogous to the QOM entity). At least for the machines I
owned, I always had to grab a screwdriver and unplug the device myself.
What I'm trying to say, this auto-unplug is a little non-intuitive
for me, but it ain't too bad.

> Can we propagate changes like "device foobar, don't bother
> migrating" even when we already started migration? Should the handling
> be different if the target system uses a different (compatible) device?
> Should we fail the migration?
> 

Thanks for asking these questions. I guess, I wanted to ask them myself,
but I'm not very eloquent. I have no answers.

> > 
> > I also suppose, such a device removal may not happen during device
> > migration. That is, form the QEMU perspective I  believe taken care
> > by the BQL.
> 
> Even if the device is not actually removed, it might still be
> inaccessible.
> 
> > 
> > But I'm in the dark regarding the management software/libivrt view. For
> > example what happens if we get a req_notification on the target while
> > pre-copy memory migration? At that point the destination is already
> > receiving pages, thus it is already constructed.
> > 
> > My questions are not necessarily addressed to you Eric. Maybe the
> > folks working on vfio migration can help us out. I'm also adding
> > our libvirt guys.
> > 
> > Regards,
> > Halil
> > 
> 


