Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A5964E1E6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 20:41:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5u5j-0004I1-K5; Thu, 15 Dec 2022 14:40:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p5u5Z-0004DX-KM
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 14:40:18 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p5u5X-0003Bx-C9
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 14:40:17 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BFJ1xgJ027224
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 19:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=szdLU700HGSEg7yNa4aB0auFMI7CGY6xp+ebCbi9tCk=;
 b=ZhOmthULKEflOIN4mCQeee4hR1Q5GuYkgt+yCZf/iYnIPUuZkzbqDUscptA9LeEORf/C
 4lPWYvTNNDTrw37VPbCikA3FmHrNdyv6e6CqrPgeBNJkQqurUBh74pwzbKmAL95Mll2+
 bsRb1utMO0rWR2K4xTBzZVQlf+Wrv77ZXmMzP/POFSVEsqhCEaok4sF2rW7OY2pA0rD8
 4SVTgAyn4Hvn/QUu45aA38WrqpWOwUec7+nzSdrOK7AZq4qiN3VHIlVt8oUiYN6MekLb
 LDtKoEYeyBs8mzQTgz4rA1J67HmgXAo9V6Wdgg0DMC3FQWMy2UVwLwXblWpDHJSKfZlw mA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg9chguvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 19:40:12 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BFJ1wl1027197
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 19:40:12 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg9chguv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 19:40:11 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BFHaYm4011783;
 Thu, 15 Dec 2022 19:40:11 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3meyyj0g4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 19:40:11 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BFJe90t45941422
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Dec 2022 19:40:10 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0CEA7805E;
 Thu, 15 Dec 2022 20:59:18 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDBBD7805C;
 Thu, 15 Dec 2022 20:59:17 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.9.130])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 15 Dec 2022 20:59:17 +0000 (GMT)
Message-ID: <77bc5a11fcb7b06deba1c54b1ef2de28e0c53fb1.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: "Daniel P ." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
Date: Thu, 15 Dec 2022 14:40:07 -0500
In-Reply-To: <e77a3a76-c874-d279-52bf-18a4e3a36ba2@linux.ibm.com>
References: <20221215180125.24632-1-jejb@linux.ibm.com>
 <20221215180125.24632-3-jejb@linux.ibm.com>
 <b5cafbd3-d529-3a84-0604-c49aa30bf916@linux.ibm.com>
 <6fd1144d09777ddcdb7a1a1ba58cbbec345da9ef.camel@linux.ibm.com>
 <e77a3a76-c874-d279-52bf-18a4e3a36ba2@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: baJFxKYIJznpgZrPoE-5oF4OReTpP7Bs
X-Proofpoint-GUID: AmZY35LFw_zlL0NsNvuTHmddFKSyBvCj
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_11,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212150164
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
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

On Thu, 2022-12-15 at 14:35 -0500, Stefan Berger wrote:
> 
> 
> On 12/15/22 14:22, James Bottomley wrote:
> > On Thu, 2022-12-15 at 13:46 -0500, Stefan Berger wrote:
> > > 
> > > 
> > > On 12/15/22 13:01, James Bottomley wrote:
> > > > From: James Bottomley <James.Bottomley@HansenPartnership.com>
> > > > 
> > > > The Microsoft Simulator (mssim) is the reference emulation
> > > > platform
> > > > for the TCG TPM 2.0 specification.
> > > > 
> > > > https://github.com/Microsoft/ms-tpm-20-ref.git
> > > > 
> > > > It exports a fairly simple network socket baset protocol on two
> > > > sockets, one for command (default 2321) and one for control
> > > > (default
> > > > 2322).  This patch adds a simple backend that can speak the
> > > > mssim
> > > > protocol over the network.  It also allows the host, and two
> > > > ports
> > > > to
> > > > be specified on the qemu command line.  The benefits are
> > > > twofold:
> > > > firstly it gives us a backend that actually speaks a standard
> > > > TPM
> > > > emulation protocol instead of the linux specific TPM driver
> > > > format
> > > > of
> > > > the current emulated TPM backend and secondly, using the
> > > > microsoft
> > > > protocol, the end point of the emulator can be anywhere on the
> > > > network, facilitating the cloud use case where a central TPM
> > > > service
> > > > can be used over a control network.
> > > > 
> > > > The implementation does basic control commands like power
> > > > off/on,
> > > > but
> > > > doesn't implement cancellation or startup.  The former because
> > > > cancellation is pretty much useless on a fast operating TPM
> > > > emulator
> > > > and the latter because this emulator is designed to be used
> > > > with
> > > > OVMF
> > > > which itself does TPM startup and I wanted to validate that.
> > > > 
> > > > To run this, simply download an emulator based on the MS
> > > > specification
> > > > (package ibmswtpm2 on openSUSE) and run it, then add these two
> > > > lines
> > > > to the qemu command and it will use the emulator.
> > > > 
> > > >       -tpmdev mssim,id=tpm0 \
> > > >       -device tpm-crb,tpmdev=tpm0 \
> > > > 
> > > > to use a remote emulator replace the first line with
> > > > 
> > > >       -tpmdev
> > > > "{'type':'mssim','id':'tpm0','command':{'type':inet,'host':'rem
> > > > ote'
> > > > ,'port':'2321'}}"
> > > > 
> > > > tpm-tis also works as the backend.
> > > 
> > > Since this device does not properly support migration you have to
> > > register a migration blocker.
> > 
> > Actually it seems to support migration just fine.  Currently the
> > PCR's
> > get zero'd which is my fault for doing a TPM power off/on, but
> > switching that based on state should be an easy fix.
> 
> How do you handle virsh save  -> host reboot -> virsh restore?

I didn't.  I just pulled out the TPM power state changes and followed
the guide here using the migrate "exec:gzip -c > STATEFILE.gz" recipe:

https://www.linux-kvm.org/page/Migration

and verified the TPM pcrs and the null name were unchanged.

> You should also add a description to docs/specs/tpm.rst.

Description of what?  It functions exactly like passthrough on
migration.  Since the TPM state is retained in the server a
reconnection just brings everything back to where it was.

James


