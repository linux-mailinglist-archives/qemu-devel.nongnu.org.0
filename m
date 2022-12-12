Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A31964A7F8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 20:14:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4oEQ-0004H6-Vx; Mon, 12 Dec 2022 14:12:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p4oEN-0004Gp-Tp
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 14:12:52 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p4oEM-00017H-1O
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 14:12:51 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCJC0nt015305
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 19:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=j/V3jNAM5ZDToPHIEpYgDNycBrd67U+5R4EOFIrt3cE=;
 b=OkxXWYVw9pKt04ssXSpLOy+GmBvWKi7S5qdq/WUycYA+/chroLCAKahT34toCHczx9vI
 1Qei4WZF1R9KvwdRqL2oWIygtsxVaIDglxLVyxb5Tvv3ZWgZk6oCxajNjxjb9TsqhWBG
 U8c12UWNjZo9QQj6BftyK5LsV/x4weuqfYk/f/DhPu46EvY+5ew9NUmq1eCOJgtNjasj
 /UlJQqPHjdc7JpSKsmaUgneIQofYudSrRt9px18UKjEvGqCBvEBKCAJHbVOR8wqxbAb1
 PgW9MFIld2lXHR3Owslipgt6uZAei04zao4Ade5wEGG1jl3uLYRlwmToumNKUomTeXDm ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3me87xk5qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 19:12:48 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCJClXw018357
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 19:12:47 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3me87xk5q6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 19:12:47 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCHaKWk014249;
 Mon, 12 Dec 2022 19:12:47 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3mchr6tfdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 19:12:46 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCJCjMT9765404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 19:12:45 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A25A07805E;
 Mon, 12 Dec 2022 20:29:47 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDD627805C;
 Mon, 12 Dec 2022 20:29:46 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.25.229])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 20:29:46 +0000 (GMT)
Message-ID: <92daee895872aab2047c3768a9c67b1839406568.camel@linux.ibm.com>
Subject: Re: [PATCH] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, "Daniel P."
 =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Date: Mon, 12 Dec 2022 14:12:42 -0500
In-Reply-To: <c3fa7405-7d4c-a686-d4c3-a3ff74864467@linux.ibm.com>
References: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
 <Y5dNC77CubqrfXku@redhat.com>
 <b06d31496117c8dd8b8fe60c4bebd96377ca3ff1.camel@linux.ibm.com>
 <f76810cb-3658-84b0-e4b4-a684dff99f38@linux.ibm.com>
 <8066be497c4c81827b24a672a550a805e06eec68.camel@linux.ibm.com>
 <c3fa7405-7d4c-a686-d4c3-a3ff74864467@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: B_M2T4vHuv4PAwWIZdR8GEOH9Yt8zREd
X-Proofpoint-GUID: pYqFzIj34ZbjLHFpHye2v6vIXbIsSq2T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 mlxlogscore=628 spamscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120172
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

On Mon, 2022-12-12 at 13:58 -0500, Stefan Berger wrote:
> On 12/12/22 13:48, James Bottomley wrote:
> > On Mon, 2022-12-12 at 11:59 -0500, Stefan Berger wrote:
> > > On 12/12/22 11:38, James Bottomley wrote:
[...]
> > > > the kernel use of the TPM, but I'm trying to fix that.  The
> > > > standard mssim server is too simplistic to do transport layer
> > > > security, but like everything that does this (or rather doesn't
> > > > do this), you can front it with stunnel4.
> > > 
> > > And who or what is going to set this up?
> > 
> > I'm not sure I understand the question.  Stunnel4 is mostly used to
> > convert unencrypted proxies like imap on 143 or smtp on 25 to the
> > secure version.  Most people who run servers are fairly familiar
> > with using it.  It's what IBM used for encrypted migration
> > initially.  You can run stunnel on both ends, or the qemu side
> > could be built in using the qemu tls-creds way of doing things but
> > anything running the standard MS server would have to front it with
> > stunnel still.
> 
> So it's up to libvirt to setup stunnel to support a completely
> different setup than what it has for swtpm already?

I don't think so, no.  Libvirt doesn't usually help with server setup
(witness the complexity of setting up a server side vtpm proxy) so in
the case tls-creds were built in, it would just work if the object is
specified.  The complexity is all on the server side to front it with
stunnel.

James


