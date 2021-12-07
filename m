Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1870A46BE98
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 16:01:43 +0100 (CET)
Received: from localhost ([::1]:34032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mubyO-0007vO-AS
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 10:01:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mubwD-0006Zl-7f
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 09:59:25 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mubwA-0007wJ-Np
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 09:59:24 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B7CrVeJ019190
 for <qemu-devel@nongnu.org>; Tue, 7 Dec 2021 14:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=+2hRxro9VRPgoj4UojBhrwvLlUcMvne9QenPlvGkaec=;
 b=RrPGxkT4xnTfNjqBIkbRXrXc9ZhwhUKe3VW/scPTdf7cF/qffrqlyCQTOVVoy1BRBhRy
 yEOQlcEfLbjgB7BdFYUveYCwRBAoI6YvsH++vrx5bgyh9i1C2TP/+an53/VpWXXUSLav
 M0LtKT5qeDmwpWExSYLgMcGhQhcZhMEHS/AaUYqD0U5EExv/MEhCwLMH34GkIGezW7nR
 FDBme1R2vyNpySQoI3YMToSiYmOF0sX0KVL3nl6nnwzxCDOGSzKpT/cjxqU+Cmj9qB5M
 glIzh2JORPMthjqxmlyv3Khezz46fFbVc9XdIKuTqME7NizOsSmcscvCjldG3KKxFI5X fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct811aqy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 14:59:14 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B7Eei8Y015205
 for <qemu-devel@nongnu.org>; Tue, 7 Dec 2021 14:59:13 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct811aqxj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 14:59:13 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B7EpoZm011865;
 Tue, 7 Dec 2021 14:59:11 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3cqyy9yk7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 14:59:11 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B7Ex86223724354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 14:59:08 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFE2B4204F;
 Tue,  7 Dec 2021 14:59:07 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32CDA4204C;
 Tue,  7 Dec 2021 14:59:07 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.49.113])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  7 Dec 2021 14:59:07 +0000 (GMT)
Date: Tue, 7 Dec 2021 15:59:04 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PATCH v1 1/1] osdep: asynchronous teardown for shutdown on Linux
Message-ID: <20211207155904.51e5a768.pasic@linux.ibm.com>
In-Reply-To: <Ya34a03f7XGIrqql@redhat.com>
References: <20211206110611.27283-1-imbrenda@linux.ibm.com>
 <Ya3yJoUh97+B2EYJ@redhat.com> <20211206124312.0a13b7c0@p-imbrenda>
 <Ya34a03f7XGIrqql@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aOd01uhHx5WXKg4SidBvD8dReyA92zpE
X-Proofpoint-GUID: sl8O-3n9txZh88IVmXlTg_BuWHTCMi_-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_06,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112070087
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 borntraeger@de.ibm.com, pbonzini@redhat.com,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 Dec 2021 11:47:55 +0000
Daniel P. Berrangé <berrange@redhat.com> wrote:

> On Mon, Dec 06, 2021 at 12:43:12PM +0100, Claudio Imbrenda wrote:
> > On Mon, 6 Dec 2021 11:21:10 +0000
> > Daniel P. Berrangé <berrange@redhat.com> wrote:
> >   
> > > On Mon, Dec 06, 2021 at 12:06:11PM +0100, Claudio Imbrenda wrote:  
> > > > This patch adds support for asynchronously tearing down a VM on Linux.
> > > > 
> > > > When qemu terminates, either naturally or because of a fatal signal,
> > > > the VM is torn down. If the VM is huge, it can take a considerable
> > > > amount of time for it to be cleaned up. In case of a protected VM, it
> > > > might take even longer than a non-protected VM (this is the case on
> > > > s390x, for example).
> > > > 
> > > > Some users might want to shut down a VM and restart it immediately,
> > > > without having to wait. This is especially true if management
> > > > infrastructure like libvirt is used.
> > > > 
> > > > This patch implements a simple trick on Linux to allow qemu to return
> > > > immediately, with the teardown of the VM being performed
> > > > asynchronously.
> > > > 
> > > > If the new commandline option -async-teardown is used, a new process is
> > > > spawned from qemu using the clone syscall, so that it will share its
> > > > address space with qemu.
> > > > 
> > > > The new process will then wait until qemu terminates, and then it will
> > > > exit itself.
> > > > 
> > > > This allows qemu to terminate quickly, without having to wait for the
> > > > whole address space to be torn down. The teardown process will exit
> > > > after qemu, so it will be the last user of the address space, and
> > > > therefore it will take care of the actual teardown.
> > > > 
> > > > The teardown process will share the same cgroups as qemu, so both
> > > > memory usage and cpu time will be accounted properly.    
> > > 
> > > If this suggested workaround has any benefit to the shutdown of a VM
> > > with libvirt, then it is a bug in libvirt IMHO.
> > > 
> > > When libvirt tears down a QEMU VM, it should be waiting for *every*
> > > process in the VM's cgroup to be terminated before it reports that
> > > the VM is shutoff. IOW, the fact that this workaround lets the main
> > > QEMU process exit quickly should not matter. libvirt should still
> > > be blocked in exactly the same place in its code, waiting for the
> > > "async" cleanup process to exit. IOW, this should not be async at
> > > all from libvirt's POV.  
> > 
> > interesting, I did not know that about libvirt.
> > 
> > maybe libvirt could be fixed/improved to allow this patch to work?  
> 
> That would not be desirable. When libvirt reports a VM as shutoff,
> it is expected that all resources associated with the VM huave been
> fully released, such that they are available for launching a new
> VM.  We can't allow resources to be asynchronously released as that
> violates app's expectation that the resources are released once the
> VM is shutoff.

I do see your point. But I believe, a part of the problem is that
currently 'can start VM again' and 'all resources associated with
the previous run of the VM were cleaned up' are tied together. And
intuitively it makes a ton of sense. It is just that due to certain
reasons complete shutdown with complete cleanup takes way too long. So
we are looking for a solution to decouple the two. I believe complete
cleanup is inherently hard, so we should not hope solving that. Do you
agree?

Under the assumption that we won't be able to make the cleanup (making
all the resources available again) fast enough, I believe the only way
forward is coming up with a solution if the user explicitly says so
the assumption you just laid out should not be justified any  more.
Maybe something like enlightening the management software about this
'non-interchangeable resources are released, interchangeable resources
not yet fully released' state and add something like a 'force-start' 
operation, where the user explicitly opts-into potentially consuming more
resources (because of the overlap) for less downtime.

What do you think?

> 
> > surely without this patch an asynchronous teardown will not be possible
> > at all  
> 
> I appreciate that the current slow teardown is a pain, but async
> teardown does not sound like an appealing alternative given that
> the app can't use the resources again until the teardown is
> complete.

I don't fully agree with this. I think this statement disregards that
some resources are non-interchangeable in a sense that we need the exact
same resource free, while other resources are interchangeable in a sense
that we don't care which instance we get as long as we get enough
instances from a certain class. When we stop a VM and then start the same
VM again, we don't expect to get the same chunks of memory we had before,
but we just allocate new memory.

Yes we may run into trouble, but we may not. As long as we don't just
change this under the hood, but make it an option that somebody has
to consciously choose to enable, I think we are fine.

Regards,
Halil

