Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B15E6645BE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:14:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFFPB-0001tL-2b; Tue, 10 Jan 2023 09:15:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pFFOu-0001su-Lc
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 09:14:52 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pFFOs-0005lR-BD
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 09:14:52 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30AE2KDD025381
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 14:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=x2a6o8ca1ISbyyGbjhOimE6yPfrgWv+xTCwU3VQFItI=;
 b=TMqQmn50PEdywit3u8EqM/rY+KE7M/YMMnksqw/tvz4ryi40QYOW8MpP5vLDkx9hwyIJ
 vW1fYmiv4O14VWmWOixhLvnH4If7A2McaJYxfatY6xpYmvhuNyy12lUCQSw0lq0n6iYo
 eP1fh/MRmDJnStEi63vTeVkch3X+iesH4peWytaK4xnU5CglrcCa7BR7Yt7QHOelcXC7
 gaF8heFkoImvpWFsGjzSkASq/fThh5fQzEs4/J9e9sOIRZBKnJs1dc1x06gw/q7mKXYn
 eZEK4rmAmTBnu0R4wey2IcuTZZ7v3n7VRkwPT2PPFqgNKdvJCVF6RPP9ug0yR1aGyeP2 hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n19eagdxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 14:14:48 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30AE2Vru026316
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 14:14:48 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n19eagdxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 14:14:48 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30ACI4fQ010657;
 Tue, 10 Jan 2023 14:14:47 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3my0c7a4f2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 14:14:47 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30AEEkiM24314320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Jan 2023 14:14:46 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2BF17805F;
 Tue, 10 Jan 2023 15:51:53 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 132137805C;
 Tue, 10 Jan 2023 15:51:52 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.48.220])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 10 Jan 2023 15:51:52 +0000 (GMT)
Message-ID: <8a62ef36fe784fe8ef71bcd795d2bba169502ef7.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Cc: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Date: Tue, 10 Jan 2023 09:14:43 -0500
In-Reply-To: <c15c7dd1-0ac2-a00c-0895-2ea41eb7414d@linux.ibm.com>
References: <9fac7d95-d891-413f-93f1-18324c7943ea@linux.ibm.com>
 <a8863d1905aa427543facb68d8892af369262f19.camel@linux.ibm.com>
 <29e99f54-d5e8-b18d-08a6-d24435032272@linux.ibm.com>
 <Y5xH/0bbgFzi+G//@redhat.com>
 <a990f3c8-cca9-86ff-6995-6e49ba90f839@linux.ibm.com>
 <Y5xqgK8UXe28VZQ2@redhat.com>
 <cb752b76-a8d1-b3e0-b9ae-94e136eed7d6@linux.ibm.com>
 <Y5yAz0qzaIW4HwFi@redhat.com> <Y7xH1i0Uvbo0FUwG@work-vm>
 <5c07f6ab6adfe53f7e7fbeeda67f2eb62afccdfa.camel@linux.ibm.com>
 <Y7xUVq9PT9ohGfCj@work-vm>
 <af22847d6e8f3a64720c4d4d00b93f57ea63ad3e.camel@linux.ibm.com>
 <f2e036a7-5cff-4f95-902f-b31fce3c0ade@linux.ibm.com>
 <f928986fd4095b1f27c83ede96f3b0dd65ad965e.camel@linux.ibm.com>
 <a7472cd7-97b2-a063-0065-a78e49d0509a@linux.ibm.com>
 <c15c7dd1-0ac2-a00c-0895-2ea41eb7414d@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VuuOAoRSsVMqvVpLE2q7SdGPknRspg6u
X-Proofpoint-GUID: KaMzOY1pb5uIvZuwCXY6Sm8B0375nMAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_04,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 impostorscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100084
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

On Mon, 2023-01-09 at 16:06 -0500, Stefan Berger wrote:
> On 1/9/23 14:01, Stefan Berger wrote:
[...]
> If you use TPM 2 for attestation then certain TPM 2 state migration
> scenarios may become problematic. One could construct a scenario
> where attestation preceeds some action that requires trust to have
> been established in the system in the preceeding attestation step and
> support for snapshotting the state of the TPM 2 could become an issue
> if I was to wait for the attestation to have been concluded and then
> I quickly restart a different snapshot that is not trustworthy and
> the client proceeds thinking that the system is trustworthy (maybe a
> few SYNs from the client went into the void)

You're over thinking this.  For a non-confidential VM, Migration gives
you a saved image you can always replay from (this is seen as a feature
for fast starts) and if you use the tpm_simulator the TPM state is
stored in the migration image, so you can always roll it back if you
have access to the migration file.  Saving the image state is also a
huge problem because the TPM seeds are in the clear if the migration
image isn't encrypted.  The other big problem is that an external
software TPM is always going to give up its state to the service
provider, regardless of migration, so you have to have some trust in
the provider and thus you'd also have to trust them with the migration
replay policy.  For Confidential VMs, this is a bit different because
the vTPM runs in a secure ring inside the confidential enclave and the
secure migration agent ensures that either migration and startup happen
or migration doesn't happen at all, so for them you don't have to worry
about rollback.

Provided you can trust the vTPM provider, having external state not
stored in the migration image has the potential actually to solve the
rollback problem because you could keep the TPM clock running and
potentially increase the reset count, so migrations would show up in
TPM quotes and you don't have control of the state of the vTPM to
replay it.

James


