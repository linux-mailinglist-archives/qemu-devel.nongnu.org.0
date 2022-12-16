Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87BC64EC58
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:53:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6B9E-00076K-Ox; Fri, 16 Dec 2022 08:53:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p6B9C-00075s-6y
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:53:10 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p6B99-0007Xy-LO
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:53:09 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BGC76So016170
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=hPU1HbTYOYfn3UVKcPkpnKzhRq6W3K8SFuF6/UtK7fo=;
 b=GID+Ew+WhIj80g3pRT5b9DDjhsgU0HY0HkgGkyonq8izGffJT4NQQxZ18xCFGBbnB9LH
 /NS6GDMl9/GXlo2+9dmiXrtiVACheEMLnGjHzaf4Pe5vULSHSkISAN8iVPajhLTiJCAD
 fxtYZU0876IYtI4cmFzs26DbE6KE7s49Js5UPCAsuKQNzOnQ55mtexoHCURi+oYqLISg
 A9xY/bmMSP7w+mqx36zSnHOJCCmADpWFMlyocx0U6XhbM3eeOvHhhtsjJ73wlXsXQC2R
 6uP69RIpZjdI+4sHvr0+FC6M9curY2ygyUoXRyNzRwu1E3dW2JeGFiIL4IZZ4zrYI8tL 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mgq584c5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:53:05 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BGDA8TB008197
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:53:05 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mgq584c58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 13:53:05 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BGC1cqe027653;
 Fri, 16 Dec 2022 13:53:04 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3mf00x28c9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 13:53:04 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BGDr31T64618958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Dec 2022 13:53:03 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABE0F7805E;
 Fri, 16 Dec 2022 15:12:43 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D65967805C;
 Fri, 16 Dec 2022 15:12:42 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.9.130])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 16 Dec 2022 15:12:42 +0000 (GMT)
Message-ID: <158a33b6850db9ef18b240834e06665d7f9e4825.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, "Daniel P."
 =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Date: Fri, 16 Dec 2022 08:53:00 -0500
In-Reply-To: <cb752b76-a8d1-b3e0-b9ae-94e136eed7d6@linux.ibm.com>
References: <6fd1144d09777ddcdb7a1a1ba58cbbec345da9ef.camel@linux.ibm.com>
 <e77a3a76-c874-d279-52bf-18a4e3a36ba2@linux.ibm.com>
 <77bc5a11fcb7b06deba1c54b1ef2de28e0c53fb1.camel@linux.ibm.com>
 <10fbda0f-7c8a-3819-fb22-34a9249ac138@linux.ibm.com>
 <b5d26ab0e54c15c408e9bae136bce969283ed5bd.camel@linux.ibm.com>
 <9fac7d95-d891-413f-93f1-18324c7943ea@linux.ibm.com>
 <a8863d1905aa427543facb68d8892af369262f19.camel@linux.ibm.com>
 <29e99f54-d5e8-b18d-08a6-d24435032272@linux.ibm.com>
 <Y5xH/0bbgFzi+G//@redhat.com>
 <a990f3c8-cca9-86ff-6995-6e49ba90f839@linux.ibm.com>
 <Y5xqgK8UXe28VZQ2@redhat.com>
 <cb752b76-a8d1-b3e0-b9ae-94e136eed7d6@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ufqTDTGHKAPjzP8myXoD2ME1_jV-LHtz
X-Proofpoint-ORIG-GUID: cl3f8z6sSAosUIGRpDSj5TNEQt84wuCb
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_08,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160119
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
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
Reply-To: jejb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 2022-12-16 at 08:32 -0500, Stefan Berger wrote:
> On 12/16/22 07:54, Daniel P. Berrangé wrote:
> > On Fri, Dec 16, 2022 at 07:28:59AM -0500, Stefan Berger wrote:
[...]
> > > Nevertheless it needs documentation and has to handle migration
> > > scenarios either via a blocker or it has to handle them all
> > > correctly. Since it's supposed to be a TPM running remote you
> > > had asked for TLS support iirc.
> > 
> > If the mssim implmentation doesn't provide TLS itself, then I don't
> > consider that a blocker on the QEMU side, merely a nice-to-have.
> > 
> > With swtpm the control channel is being used to load and store
> > state during the migration dance. This makes the use of an external
> > process largely transparent to the user, since QEMU handles all the
> > state save/load as part of its migration data stream.
> > 
> > With mssim there is state save/load co-ordination with QEMU.
> > Instead whomever/whatever is managing the mssim instance, is
> > responsible for ensuring it is running with the correct state at
> > the time QEMU does a vmstate load. If doing a live migration this
> > co-ordination is trivial if you just use the same mssim instance
> > for both src/dst to connect to.
> > 
> > If doing save/store to disk, the user needs to be able to save the
> > mssim state and load it again later. If doing snapshots and
> > reverting to old
> 
> There is no way for storing and loading the *volatile state* of the
> mssim device.

Well, yes there is, it saves internal TPM state to an NVChip file:

https://github.com/microsoft/ms-tpm-20-ref/blob/main/TPMCmd/Platform/src/NVMem.c

However, if I were running this as a service, I'd condition saving and
restoring state on a connection protocol, which would mean QEMU
wouldn't have to worry about it.  The simplest approach, of course, is
just to keep the service running even when the VM is suspended so the
state is kept internally.

> > snapshots, then again whomever manages mssim needs to be keeping
> > saved TPM state corresponding to each QEMU snapshot saved, and
> > picking the right one when restoring to old snapshots.
> 
> This doesn't work.

I already told you I tested this and it does work.  I'll actually add
the migration state check to the power on/off path because I need that
for testing S3 anyway.

> Either way, if it's possible it can be documented and shown how this
> works.

I could do a blog post, but I really don't think you want this in
official documentation because that creates support expectations.
> 
> > QEMU exposes enough functionality to enable a mgmt app / admin us>
> > achieve all of this.
> 
> How do you store the volatile state of this device, like the current
> state of the PCRs, loaded sessions etc? It doesn't support this.

That's not the only way of doing migration.  This precise problem
exists for VFIO and PCI pass through devices as well: external state is
stored in the card and that state must be matched in some way for the
card to work on resume.  Pretty much any external device coupled to the
VM has this problem.  As I keep saying you're thinking about this in
the wrong way: it's not a system directly slaved to QEMU it's an
independent daemon which must be managed separately.  The design is for
it to function like a passthrough.

> > This is not as seemlessly integrated with swtpm is, but it is still
> > technically posssible todo the right thing with migration from
> > QEMU's POV. Whether or not the app/person managing mssim instance
> > actually does the right thing in practice is not a concern of QEMU.
> > I don't see a need for a migration blocker here.
> 
> I do see it because the *volatile state* cannot be extracted from
> this device. The state of the PCRs is going to be lost.

Installing a migration blocker would prevent me from exercising the S3
paths, which I want to test.

James


