Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A962A64E1B9
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 20:24:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5tp6-00069j-JD; Thu, 15 Dec 2022 14:23:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p5toy-00069I-Hy
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 14:23:10 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p5tow-0005kl-6f
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 14:23:08 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BFInY3U032558
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 19:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=iN+jIUiBpDAtmYioZ9tHWLyr/wEbQT+/CQo1kXre408=;
 b=OvjhM/Xjnxolo0zXHuX/1O60rHqozS9ybjWItr670E8H4qS93zMPv4AwuuwaPAPXU0vH
 TTXWRpbrcbXmSGdVImNRGGkyxkw1YeNrxiKGwJan442JLRnCBe4xxIYKyCma/zlH5OXC
 vXrsnujzmMdOATzPUhVd1vnXRvRMBxUVKZJ2tGxRm6xnSsmzo6SXRRJXWiY12TPLTDcm
 Odv5a1Na5Sa5SLupymGq9BJwLWw7Gv1+eBp5Doxt09BlW3jz/qoxft7ZFvhMHnqx2tIS
 tV2rXRhQqptMOlsYXWicJy2CGqgfeXCLOkUumZF6csje4NUCAVitSjEtL/gj6NniZbxp Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg96u0sse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 19:23:04 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BFIsamu019294
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 19:23:04 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg96u0ss5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 19:23:04 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BFHHfJF005722;
 Thu, 15 Dec 2022 19:23:03 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3meyfe0j0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 19:23:03 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BFJN1UK39125672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Dec 2022 19:23:02 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5D467805E;
 Thu, 15 Dec 2022 20:42:09 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECF887805C;
 Thu, 15 Dec 2022 20:42:08 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.9.130])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 15 Dec 2022 20:42:08 +0000 (GMT)
Message-ID: <6fd1144d09777ddcdb7a1a1ba58cbbec345da9ef.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: "Daniel P ." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
Date: Thu, 15 Dec 2022 14:22:59 -0500
In-Reply-To: <b5cafbd3-d529-3a84-0604-c49aa30bf916@linux.ibm.com>
References: <20221215180125.24632-1-jejb@linux.ibm.com>
 <20221215180125.24632-3-jejb@linux.ibm.com>
 <b5cafbd3-d529-3a84-0604-c49aa30bf916@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9aFeleDSbPQDChNueuJ5Jxxr_XJ-tk9C
X-Proofpoint-ORIG-GUID: Y80ErT6VRbZ510OK58_5hiCfhnaJpU8A
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_11,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212150159
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

On Thu, 2022-12-15 at 13:46 -0500, Stefan Berger wrote:
> 
> 
> On 12/15/22 13:01, James Bottomley wrote:
> > From: James Bottomley <James.Bottomley@HansenPartnership.com>
> > 
> > The Microsoft Simulator (mssim) is the reference emulation platform
> > for the TCG TPM 2.0 specification.
> > 
> > https://github.com/Microsoft/ms-tpm-20-ref.git
> > 
> > It exports a fairly simple network socket baset protocol on two
> > sockets, one for command (default 2321) and one for control
> > (default
> > 2322).  This patch adds a simple backend that can speak the mssim
> > protocol over the network.  It also allows the host, and two ports
> > to
> > be specified on the qemu command line.  The benefits are twofold:
> > firstly it gives us a backend that actually speaks a standard TPM
> > emulation protocol instead of the linux specific TPM driver format
> > of
> > the current emulated TPM backend and secondly, using the microsoft
> > protocol, the end point of the emulator can be anywhere on the
> > network, facilitating the cloud use case where a central TPM
> > service
> > can be used over a control network.
> > 
> > The implementation does basic control commands like power off/on,
> > but
> > doesn't implement cancellation or startup.  The former because
> > cancellation is pretty much useless on a fast operating TPM
> > emulator
> > and the latter because this emulator is designed to be used with
> > OVMF
> > which itself does TPM startup and I wanted to validate that.
> > 
> > To run this, simply download an emulator based on the MS
> > specification
> > (package ibmswtpm2 on openSUSE) and run it, then add these two
> > lines
> > to the qemu command and it will use the emulator.
> > 
> >      -tpmdev mssim,id=tpm0 \
> >      -device tpm-crb,tpmdev=tpm0 \
> > 
> > to use a remote emulator replace the first line with
> > 
> >      -tpmdev
> > "{'type':'mssim','id':'tpm0','command':{'type':inet,'host':'remote'
> > ,'port':'2321'}}"
> > 
> > tpm-tis also works as the backend.
> 
> Since this device does not properly support migration you have to
> register a migration blocker.

Actually it seems to support migration just fine.  Currently the PCR's
get zero'd which is my fault for doing a TPM power off/on, but
switching that based on state should be an easy fix.

James


