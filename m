Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278053A34F7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 22:39:26 +0200 (CEST)
Received: from localhost ([::1]:49802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrRSX-0003e1-8D
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 16:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lrRRj-0002xZ-Nn; Thu, 10 Jun 2021 16:38:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lrRRh-0005oP-3P; Thu, 10 Jun 2021 16:38:35 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15AKX8Ae158388; Thu, 10 Jun 2021 16:38:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=ZR6nOVyLAZPBhlt4RFed4Xsk4lsQhBP9wUcFvJIaIhg=;
 b=Ng5/IjaP40gozTOFPy6qJR6EQHDcjOeGE8JNbRQUSgbV7XXKVZYDJCAOI87SOfH0SV2Q
 ctxsdCkCxLbkq8E+oro/AMgDriT2XFtTz77phgV+LAsfYnb6OsDkhMTTBsmSTOTPpamY
 aNph4+nLiErPJdmLiIkLmZwCjhvGQ8tiAz9UDt/poM3lKRPeFXUY6irZZzG5E85SE+J6
 NeGkbSE9t8zW2sTlzEe7TrQAoi46EqIiqMc6r3RTnCbRlJIFsiC8N1TnIdxXVqjkulLW
 eulFZmwyBDq/ihu6txwI48Yjq9veqhKaUWmlH/u0qLDj+pa8X4/Rf53FYQvr7bsKIA/L Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 393sbv90m7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 16:38:31 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15AKX7U0158191;
 Thu, 10 Jun 2021 16:38:30 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 393sbv90k6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 16:38:30 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15AKDRM9004934;
 Thu, 10 Jun 2021 20:38:29 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 3900wa5n6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 20:38:29 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15AKcTH235979546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 20:38:29 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE158B2067;
 Thu, 10 Jun 2021 20:38:28 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30B9CB2064;
 Thu, 10 Jun 2021 20:38:28 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.160.30.100])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 10 Jun 2021 20:38:28 +0000 (GMT)
Message-ID: <03fccf6e35356635c5bed485ce4512b3ab4d0067.camel@linux.ibm.com>
Subject: Re: [PATCH 0/1] vfio-ccw: Fix garbage sense data on I/O error
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Date: Thu, 10 Jun 2021 16:38:27 -0400
In-Reply-To: <ce108c12-94eb-22ed-38ea-5356ee4666b9@linux.ibm.com>
References: <20210610202011.391029-1-farman@linux.ibm.com>
 <ce108c12-94eb-22ed-38ea-5356ee4666b9@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZhHZQeOfXj4HMbySqdc8VDoZ6fjPsLFo
X-Proofpoint-ORIG-GUID: e0DOME9eFbit0gzsnZOT7TZNNc7tFIvS
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-10_13:2021-06-10,
 2021-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106100130
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-06-10 at 16:25 -0400, Matthew Rosato wrote:
> On 6/10/21 4:20 PM, Eric Farman wrote:
> > Hi Conny,
> > 
> > Per our offline discussion, here's a fix for the error when a guest
> > issues "dasdfmt -M quick". It basically reverts commit 334e76850bbb
> > ("vfio/ccw: update sense data if a unit check is pending")
> > and modifies the check that builds sense data in the TSCH handler.
> 
> Should it includes a Fixes: tag then?

Yeah, probably. I'll fix it locally so it's prepped for a v2.

> 
> > I opted to NOT disable PMCW.CSENSE, because doing so prevents
> > vfio-ccw devices from coming online at all (didn't pursue deep
> > enough to explain why). Turning it off in reaction to a unit
> > check (in this now-reverted codepath) works, but only because of
> > the corresponding PMCW.CSENSE check in the TSCH code.
> > 
> > I don't know if anything is needed for the (unaltered) ECW data
> > that commit b498484ed49a ("s390x/css: sense data endianness")
> > addressed for the copied sense_data bytes, but figure we can
> > use this as a starting point. Thoughts?
> > 
> > Eric Farman (1):
> >    vfio-ccw: Keep passthrough sense data intact
> > 
> >   hw/s390x/css.c | 3 ++-
> >   hw/vfio/ccw.c  | 6 ------
> >   2 files changed, 2 insertions(+), 7 deletions(-)
> > 


