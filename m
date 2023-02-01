Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28818686936
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:58:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEYV-0007cp-T0; Wed, 01 Feb 2023 09:57:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pNEY3-0007UI-8I
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:57:25 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pNEXv-00008x-R7
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:57:14 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 311EkKDc030317; Wed, 1 Feb 2023 14:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=joqn70LJALFKlcQKl+0SwCI+xwqrJ6DH1HEI2NISHZA=;
 b=AB4Vxz85iRgt7nLOpooCmHljE5X8QTC3u6dLXqBUgBffBHN1n1qnRzMmS/i5euAqKYxS
 5PMLPYEbIs9h7R1HgPHzdVAKIn5gP13uJy0MWpq29T7aFv0jd+87I+oiAcxnIKUQf935
 IoYNlC5aW0FNKVVhJvVr1k35MozrzwwQTK9Mt3GnHbXH2X7waPHVhGCmbwIcpaP/68sJ
 hPD5nkOcd+XquSkp6q7OnnwdHSqIv5UB8QzTZZMX+PHjagwft8TZWpsDmmkACDhKXk5G
 9nDmr4y9zM09gVUgzBOoOxLxMJjxW4/dJP4PPs46YRxhPFHKaXdypLh9kMpim4l7qgDZ Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nft4mr8r2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 14:57:09 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 311EnOW4012118;
 Wed, 1 Feb 2023 14:57:09 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nft4mr8qr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 14:57:09 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 311DMAFh019250;
 Wed, 1 Feb 2023 14:57:08 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3ncvuqurrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 14:57:08 +0000
Received: from b03ledav001.gho.boulder.ibm.com ([9.17.130.232])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 311Ev7Qe7799534
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Feb 2023 14:57:07 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E4ED6E052;
 Wed,  1 Feb 2023 14:59:16 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88DD36E04E;
 Wed,  1 Feb 2023 14:59:15 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.110.248])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Feb 2023 14:59:15 +0000 (GMT)
Message-ID: <bac451554357676b073d589f7668b517020d9a4e.camel@linux.ibm.com>
Subject: Re: [PATCH] x86: fix q35 kernel measurements broken due to rng seeding
From: James Bottomley <jejb@linux.ibm.com>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, DOV MURIK
 <Dov.Murik1@il.ibm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 01 Feb 2023 09:56:35 -0500
In-Reply-To: <Y9p4sARXUdUOz/6X@redhat.com>
References: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
 <Y9p4sARXUdUOz/6X@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BDGXfUaG4dmVqf4x2GWlmQcBPSgGP7fB
X-Proofpoint-ORIG-GUID: zJAhnO9AUL5Kqn_lcajsDHVu_2RzQfZ8
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302010125
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

On Wed, 2023-02-01 at 14:35 +0000, Daniel P. Berrangé wrote:
> On Wed, Feb 01, 2023 at 08:57:10AM -0500, James Bottomley wrote:
> > The origin commit for rng seeding 67f7e426e5 ("hw/i386: pass RNG
> > seed
> > via setup_data entry") modifies the kernel image file to append a
> > random seed.  Obviously this makes the hash of the kernel file
> > non-deterministic and so breaks both measured and some signed
> > boots.
> 
> I recall raising that at the time
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg00710.html
> 
> and Jason pointed me to a followup which I tested and believe
> fixed it for SEV:
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg00601.html
> 
> but it doesn't look like that second patch ever merged. We went
> through so many patches I think it probably got obsoleted by
> something else, and no one rechecked SEV again.

The kernel file problem is a pretty huge one.  OVMF lays it down on an
internal file system and without the second patch, it now contains
random junk at the end.  Anything that hashes the whole file (which
includes not only the measured direct boot but also grub signatures and
probably other bootloader signing mechanisms) will have an issue.

> > The commit notes it's only for non-EFI (because EFI has a different
> > RNG seeding mechanism) so, since there are no non-EFI q35 systems,
> > this should be disabled for the whole of the q35 machine type to
> > bring back deterministic kernel file hashes.
> 
> SeaBIOS is the default firmware for both q35 and i440fx. The
> majority of systems using q35 will be non-EFI today, and that
> is what the random seed was intended to address. I don't think
> we can just disable this for the whole of q35.
> 
> When you say it breaks measured / signed boots, I presume you
> are specifically referring to SEV kernel hashes measurements ?
> Or is there a more general problem to solve ?

No it generally breaks measured/signed boots because it adds random
junk to the kernel file.  The second patch will fix this if you apply
it because setup data isn't measured or signed (yet ... however see the
linux-coco debate about how it should be).

I also note there was a v3 of the patch and considerable discussion
saying it couldn't work:

https://lore.kernel.org/qemu-devel/20220804230411.17720-1-Jason@zx2c4.com/

Which is likely why it never went in ... although the discussion does
seem to resolve towards the end.

James


