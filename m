Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9FE64AA3A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 23:27:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4rGT-0007Fk-7Q; Mon, 12 Dec 2022 17:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p4rGQ-0007CQ-UY
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:27:10 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p4rGP-0002BQ-52
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:27:10 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCLfqw3011687
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 22:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=7iDLcBfD3hx6+kUe1tYXYGbp8Ybjo5f46J9l+CIvzVI=;
 b=GGbdN/qWssyt6t6Ix0MRN+s7BltICUKD2yzV3ktjXDQDL2T/04es3wkmfQBdn8bQ/V3o
 4mu8EeOxp4gru3UFKK+0zEmdBghbnuQqEr+t7nwnDIYW4mpGPYEUPHV6E00UeElfYtc3
 f6ykNjEommCNGHjz8cQnNuMSghOgbC8VFCjPkDBfExPFT0Ckke/+QcDXHO7hXOWtPWzO
 EKc685ytZJEFcabWYe+it9V0djLLwUkesuUOzxy1rlijfiYQyP/BFEGM4jy05QMqtSf6
 3LE26/bQCmIeDOVODZQI7rHO8EcaAyTTCcIWtE7CuJSaGeEeU5R0RopAqn3L9BBUJHXe 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mecem91m2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 22:27:07 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCMH2E9016591
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 22:27:06 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mecem91kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 22:27:06 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BCKvtZe011509;
 Mon, 12 Dec 2022 22:27:05 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3mchr6fmcb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 22:27:05 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCMR4GB8323594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 22:27:04 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D59F67805E;
 Mon, 12 Dec 2022 23:44:12 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17F287805C;
 Mon, 12 Dec 2022 23:44:11 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.25.229])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 23:44:11 +0000 (GMT)
Message-ID: <289ef2dceb2d94312019d288a3b49c4e786df934.camel@linux.ibm.com>
Subject: Re: [PATCH] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, "Daniel P."
 =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Date: Mon, 12 Dec 2022 17:27:02 -0500
In-Reply-To: <f7119c81-e571-382b-84c6-628747cd9e0b@linux.ibm.com>
References: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
 <Y5dNC77CubqrfXku@redhat.com>
 <b06d31496117c8dd8b8fe60c4bebd96377ca3ff1.camel@linux.ibm.com>
 <f76810cb-3658-84b0-e4b4-a684dff99f38@linux.ibm.com>
 <8066be497c4c81827b24a672a550a805e06eec68.camel@linux.ibm.com>
 <c3fa7405-7d4c-a686-d4c3-a3ff74864467@linux.ibm.com>
 <92daee895872aab2047c3768a9c67b1839406568.camel@linux.ibm.com>
 <dc520ab2-04db-b8cb-15fd-871bb1da0d1b@linux.ibm.com>
 <d2262d8bd5a1d53cb1d4c32e0424dc8727372265.camel@linux.ibm.com>
 <f7119c81-e571-382b-84c6-628747cd9e0b@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: euCjbXIViwvEU_7wtNCL2Vo46n8yPfbh
X-Proofpoint-GUID: lYMRPGEm8hOh9v0NfVdoD6vDwS6_NJ0j
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=721 clxscore=1015
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212120189
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

On Mon, 2022-12-12 at 17:02 -0500, Stefan Berger wrote:
> 
> 
> On 12/12/22 16:36, James Bottomley wrote:
> > On Mon, 2022-12-12 at 14:32 -0500, Stefan Berger wrote:
[...]
> > >   Either way, what is the latency that this introduces because I
> > > would expect that this slows down IMA since the PCR extensions &
> > > TPM 2 response now go back and forth across the network?
> > 
> > Most data centre protocols are now encrypted and networked (NVMeoF
> > would probably be the poster child) with no real ill effects.  In
> > terms of a TPM, the competition is an underpowered discrete chip
> > over a slow serial bus, so I think we'll actually improve the
> > latency not diminish it.
> 
> Compared to QEMU and swtpm talking over a local socket you probably
> have a decent amount of slow-down if this is over the network.

I can only repeat that doesn't happen with other much more volume and
latency bound networked protocols.

> I still fail to see the advantage over what we have at the moment.
> Also I don't see what advantage the mssim protocol brings over what
> swtpm provides.

I think I've said a couple of times now: The primary advantage is that
it talks to the reference implementation over its native protocol.

>  If you are willing to do a 'dnf -y install swtpm_setup' and start
> the VM via libvirt it really doesn't matter what protocol the TPM is
> running underneath since it's all transparent.

Swtpm currently isn't building for Leap:

https://build.opensuse.org/package/show/security/swtpm

And, as I said, this is primarily for testing, so I need the reference
implementation ... swtpm has started deviating from it.

James




