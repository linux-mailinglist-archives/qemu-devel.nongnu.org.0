Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02CE31DB8E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 15:41:20 +0100 (CET)
Received: from localhost ([::1]:33938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCO11-0006RF-84
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 09:41:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lCNzi-00060u-OX; Wed, 17 Feb 2021 09:39:58 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:65156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lCNzf-0006zX-IY; Wed, 17 Feb 2021 09:39:58 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11HEYikq174279; Wed, 17 Feb 2021 09:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=nieHmvp4XSaMIF9pnARJLNPxAwBhQwVA3vLReJsOyeo=;
 b=KIN+q9IJICk8fR2Jb5AIUfAoCEJXolAkYiUeLGyYNod930CG0h7429iULRGJQnB3GsJD
 l80jwxr3MjVQvLieeNSAOzZQNGmuNIcVu79oAH2z7COWJoJMcPdN55IjnshqOhpw/eJ9
 lCX1DkBtvIuQ7eJhlSpMrzt4A65/jweTYJEdpVPlErVpmczwq2Fbcrpwl5muJROCmXC3
 1qvTyjpYu9bH7R6r4HDikOIw1na8SItqm5xP3htfjQrYWJIGj06ZlljcAF/KRO23lZVk
 PXXJW8nFTGAkrdOjd2t8xhQ9nfj6LQKj2d7RU73FNw3Ik53IFl6i80r6VmDKCSkJRSw7 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36s4t0gmdd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Feb 2021 09:39:52 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11HEZAwM175550;
 Wed, 17 Feb 2021 09:39:49 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36s4t0gm7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Feb 2021 09:39:46 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11HEbshL014520;
 Wed, 17 Feb 2021 14:39:42 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 36p6d8bsbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Feb 2021 14:39:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11HEddgu37945716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Feb 2021 14:39:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D54364C046;
 Wed, 17 Feb 2021 14:39:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 703324C040;
 Wed, 17 Feb 2021 14:39:39 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.71.158])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 17 Feb 2021 14:39:39 +0000 (GMT)
Date: Wed, 17 Feb 2021 15:39:36 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] virtio-ccw: commands on revision-less devices
Message-ID: <20210217153936.5e041c21.pasic@linux.ibm.com>
In-Reply-To: <20210216165405.57599fe8.cohuck@redhat.com>
References: <20210216111830.1087847-1-cohuck@redhat.com>
 <20210216151945.736eb6c7.pasic@linux.ibm.com>
 <20210216165405.57599fe8.cohuck@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-17_11:2021-02-16,
 2021-02-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxlogscore=999 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102170109
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 16:54:05 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Tue, 16 Feb 2021 15:19:45 +0100
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > On Tue, 16 Feb 2021 12:18:30 +0100
> > Cornelia Huck <cohuck@redhat.com> wrote:
> >   
> > > The virtio standard specifies that any non-transitional device must
> > > reject commands prior to revision setting (which we do) and else
> > > assume revision 0 (legacy) if the driver sends a non-revision-setting
> > > command first. We neglected to do the latter.    
> > 
> > Huh, I my opinion, it ain't very clear what is specified by the virtio
> > standard (which starts with version 1.0) for the described situation.
> > 
> > The corresponding device normative section (4.3.2.1.1 Device
> > Requirements: Setting the Virtio Revision) says that: "A device MUST
> > treat the revision as unset from the time the associated subchannel has
> > been enabled until a revision has been successfully set by the driver.
> > This implies that revisions are not persistent across disabling and
> > enabling of the associated subchannel.". It doesn't say anything more
> > about the situation where the first command is not SET_VIRTIO_REV.
> > 
> > The section "4.3.2.1.3 Legacy Interfaces: A Note on Setting the Virtio
> > Revision" which is to my best knowledge not normative, as none of the
> > legacy-interface stuff is normative, but a mere advice on how to deal
> > with legacy then says: "A legacy driver will not issue the
> > CCW_CMD_SET_VIRTIO_REV prior to issuing other virtio-ccw specific
> > channel commands." ... "A transitional device MUST assume
> > in this case that the driver is a legacy driver and continue as if the
> > driver selected revision 0. This implies that the device MUST reject any
> > command not valid for revision 0, including a subsequent
> > CCW_CMD_SET_VIRTIO_REV."
> > 
> > Do we agree that the legacy interface sections in general, and 4.3.2.1.3
> > in particular is non-normative?  
> 
> IMHO, normative and non-normative are not something that applies to the
> legacy sections. The legacy sections are supposed to give guidance on
> how to write transitional devices/drivers that can deal with legacy
> implementations. If you want to write something that strictly only
> adheres to normative statements, you have to write a non-transitional
> device/driver. Legacy support was never an official standard, so
> 'normative' is meaningless in that context.

Exactly, so the legacy stuff is not normative, and strictly speaking not
included in the standard (i.e. standardized).

But then I find usage of keywords like MUST in legacy interface sections
misreading. I believe some Oasis guy complained about keyword usage
outside of normative sections before.

> 
> > 
> > In my opinion the normative 'must threat as unset until set by driver'
> > and 'if first cmd is not _REV, must continue as if the driver selected
> > revision 0' is in a slight collision.  
> 
> I don't think there's a collision. If we want to accommodate legacy
> drivers, we have to deal with their lack of revision handling, and
> therefore treat non-_REV commands as implicitly selecting revision 0.
> 
> If we want to implement a non-transitional device, the implicit
> selection of revision 0 goes away, of course. In fact, I'm currently
> trying to make legacy support optional for virtio-ccw, so that's why I
> had been looking at the revision handling :)

Do you mean optional like build time configurable in QEMU? I think the
legacy support is already optional when it comes to the spec.

Let me explain how do I interpret device compliance with respect to
virtio revisions and first command is a non-_REV.

1) If the first virtio command after the virtio-ccw device is enabled is
a non-_REV command, the virtio-ccw device not answering it with a
command reject does not preclude the device form being virtio 1.0
conform. I.e. this behavior is conform, because does not violate
any of the sections linked in "7.3.3 Clause 17: Channel I/O Device
Conformance" in general, and thus does not violate "4.3.2.1.1 Device
Requirements: Setting the Virtio Revision" in particular. If you disagree,
please point me to the corresponding device normative section.

2) Rejecting the first command which which happens to be a non-_REV
however does not preclude virtio (1.0) conformance either. The device
is free to do whatever, because in my reading it ain't specified what
needs to be done.

3) It is OK-ish, that the device is free to do anything there, because
a virtio 1.0 conform driver will never put the device in this situation. 

4) The following, non-normative section recommends what a transitional,
and a non-transitional device should do. There fore I think it would have
been wiser to use should instead of MUST in that section.

> 
> > 
> >   
> > > 
> > > Fortunately, nearly everything worked as intended anyway; the only
> > > problem was not properly rejecting revision setting after some other
> > > command had been issued. Easy to fix by setting revision to 0 if
> > > we see a non-revision command on a legacy-capable revision-less
> > > device.
> > > 
> > > Signed-off-by: Cornelia Huck <cohuck@redhat.com>    
> > 
> > The change won't hurt so with a toned down commit message:
> > Acked-by: Halil Pasic <pasic@linux.ibm.com>  
> 
> Replace 'and else' with 'a transitional device needs to'?

Sounds good but, I would also replace 'The virtio standard specifies'
with 'The non-normative part of the virtio specification recommends'
and probably also replace 'MUST' with 'SHOULD'.

The current patch description sounds like, we are in violation of the
spec, and the change is necessary to have a spec conform device, but it
is not.

Regards,
Halil

