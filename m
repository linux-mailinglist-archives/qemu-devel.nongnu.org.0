Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173E72CEF11
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 14:56:11 +0100 (CET)
Received: from localhost ([::1]:36646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klBZC-0008Jz-3c
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 08:56:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1klBVO-0004tJ-4J; Fri, 04 Dec 2020 08:52:15 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1klBVK-0001G3-Cm; Fri, 04 Dec 2020 08:52:13 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4DWNbr014999; Fri, 4 Dec 2020 08:52:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=2aywq7EznNVwW00nCia64dO+HCm8E9XQxwYo7lEOtkE=;
 b=J48rnuTPEceBt7Jt0NaF9FbT2hBslMODIl8ev01clvlA1YrrGimkeBAppZoDhxs+omje
 jCUkUSggRNl4uE3Eoz5/0v9vl1GwvoAMHxizp6bbtY402dv0c18ezrCnpDLyO51OxVtp
 yTz+W/mb1fHUIrfcTpkJJeQ5Mo+Kcy5d2QFHpJ0sC+jgKuWqomV/tY/IlIDyAphB3Jdy
 ZCMwcu14d9mH/X6McnBufbbQ7LQ2Vqm3Hf3hNRGfCoWOx0ZA2J/jfMWEJpDpLA2H9MyL
 p1dbAROAQ/xSQOOVRl7bqhmalTX4GGuZvmVEdwc40l6WXhrYru/C9DqgmLSICFDCuM4A qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3577435akv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 08:52:01 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B4DWg6A015648;
 Fri, 4 Dec 2020 08:52:01 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3577435aj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 08:52:01 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4DmDx1030498;
 Fri, 4 Dec 2020 13:51:58 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 354fpdd2u1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 13:51:57 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4DptwZ8061498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 13:51:55 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBEE752059;
 Fri,  4 Dec 2020 13:51:54 +0000 (GMT)
Received: from oc2783563651 (unknown [9.171.41.218])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id D67155204E;
 Fri,  4 Dec 2020 13:51:53 +0000 (GMT)
Date: Fri, 4 Dec 2020 14:51:52 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [for-6.0 v5 00/13] Generalize memory encryption models
Message-ID: <20201204145152.097bb217.pasic@linux.ibm.com>
In-Reply-To: <20201204132500.GI3056135@redhat.com>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <f2419585-4e39-1f3d-9e38-9095e26a6410@de.ibm.com>
 <20201204140205.66e205da.cohuck@redhat.com>
 <20201204130727.GD2883@work-vm>
 <20201204132500.GI3056135@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_04:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1011 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040075
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
Cc: pair@us.ibm.com, Marcelo Tosatti <mtosatti@redhat.com>,
 brijesh.singh@amd.com, frankja@linux.ibm.com, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 thuth@redhat.com, pbonzini@redhat.com, david@redhat.com, rth@twiddle.net,
 mdroth@linux.vnet.ibm.com, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Dec 2020 13:25:00 +0000
Daniel P. Berrangé <berrange@redhat.com> wrote:

> On Fri, Dec 04, 2020 at 01:07:27PM +0000, Dr. David Alan Gilbert wrote:
> > * Cornelia Huck (cohuck@redhat.com) wrote:
> > > On Fri, 4 Dec 2020 09:06:50 +0100
> > > Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> > > 
> > > > On 04.12.20 06:44, David Gibson wrote:
> > > > > A number of hardware platforms are implementing mechanisms whereby the
> > > > > hypervisor does not have unfettered access to guest memory, in order
> > > > > to mitigate the security impact of a compromised hypervisor.
> > > > > 
> > > > > AMD's SEV implements this with in-cpu memory encryption, and Intel has
> > > > > its own memory encryption mechanism.  POWER has an upcoming mechanism
> > > > > to accomplish this in a different way, using a new memory protection
> > > > > level plus a small trusted ultravisor.  s390 also has a protected
> > > > > execution environment.
> > > > > 
> > > > > The current code (committed or draft) for these features has each
> > > > > platform's version configured entirely differently.  That doesn't seem
> > > > > ideal for users, or particularly for management layers.
> > > > > 
> > > > > AMD SEV introduces a notionally generic machine option
> > > > > "machine-encryption", but it doesn't actually cover any cases other
> > > > > than SEV.
> > > > > 
> > > > > This series is a proposal to at least partially unify configuration
> > > > > for these mechanisms, by renaming and generalizing AMD's
> > > > > "memory-encryption" property.  It is replaced by a
> > > > > "securable-guest-memory" property pointing to a platform specific  
> > > > 
> > > > Can we do "securable-guest" ?
> > > > s390x also protects registers and integrity. memory is only one piece
> > > > of the puzzle and what we protect might differ from platform to 
> > > > platform.
> > > > 
> > > 
> > > I agree. Even technologies that currently only do memory encryption may
> > > be enhanced with more protections later.
> > 
> > There's already SEV-ES patches onlist for this on the SEV side.
> > 
> > <sigh on haggling over the name>
> > 
> > Perhaps 'confidential guest' is actually what we need, since the
> > marketing folks seem to have started labelling this whole idea
> > 'confidential computing'.
> 
> I think we shouldn't worry about the specific name too much, as it
> won't be visible much outside QEMU and the internals of the immediate
> layer above such as libvirt. What matters much more is that we have
> documentation that clearly explains what the different levels of
> protection are for each different architecture, and/or generation of
> architecture. Mgmt apps / end users need understand exactly what
> kind of unicorns they are being promised for a given configuration.
> 
>

You are probably right, but I still prefer descriptive names over
misleading ones -- it helps with my cognitive process.

Regards,
Halil

