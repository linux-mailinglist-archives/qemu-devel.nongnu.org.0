Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6427148C8A2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 17:42:50 +0100 (CET)
Received: from localhost ([::1]:55586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7gi1-0007cm-3e
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 11:42:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7geQ-0005Ir-Sq; Wed, 12 Jan 2022 11:39:06 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:20478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7geO-0007TL-Np; Wed, 12 Jan 2022 11:39:06 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CGMQss029294; 
 Wed, 12 Jan 2022 16:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=k5CJ2iUtMPzk/xhWUG7ag9OacjBzh069HtkvIQmRWzc=;
 b=E5KLsyb0BWW/EeCMruNBIVbIIq67VNeCGAMoki18TOGoWRKBmnUIQrpSnxqVQK58HaZq
 6Q5xcEbVUaWjcnT7vR5p8ABXFgHUwElABB7A9eRCCtEbakn2z3DVqM6+MoPbW4MdeZa1
 jtqxnJAfPRjm0f+72bJMnvsWfXMysBt91d2MefHZOWG5KslOmS3IpWqppcekQf7A9ij8
 OdCV6bTYqdLZtxDWsWbaN7ds8Q1vwYrVwDWFLvEmx+l25qQfqmI8KwJtSRsr2kisBC8F
 Aks6+CohXLqQ5A5SWXfAmnO9K5SbeMiA9kh0IfMSFh43SM0cK4l1Z6/ho5P123ps5zLl DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dj2eyra1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 16:38:59 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CGNeAq030855;
 Wed, 12 Jan 2022 16:38:58 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dj2eyra0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 16:38:58 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CGM8E4019009;
 Wed, 12 Jan 2022 16:38:56 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3df28abwyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 16:38:56 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CGcrqA42205608
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 16:38:53 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8524A11C054;
 Wed, 12 Jan 2022 16:38:53 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E06F11C050;
 Wed, 12 Jan 2022 16:38:53 +0000 (GMT)
Received: from [9.171.78.41] (unknown [9.171.78.41])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 16:38:52 +0000 (GMT)
Message-ID: <4bf54d68d8e35db0c5555404934a3df47cacf8e1.camel@linux.ibm.com>
Subject: Re: [PATCH v2 3/5] target/s390x: Fix cc_calc_sla_64() missing
 overflows
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Cornelia Huck <cohuck@redhat.com>, Thomas
 Huth <thuth@redhat.com>
Date: Wed, 12 Jan 2022 17:38:52 +0100
In-Reply-To: <c9544f5c-545a-8edf-dac6-a960aa00d4dd@redhat.com>
References: <20220112043948.224405-1-iii@linux.ibm.com>
 <20220112043948.224405-4-iii@linux.ibm.com>
 <08948b31-0729-5463-829f-35fb444cf82d@redhat.com>
 <add9d2da455bf9b07cf77c942e95183f5bf6f090.camel@linux.ibm.com>
 <c9544f5c-545a-8edf-dac6-a960aa00d4dd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DgtMU4UnfxxUTztCIWXURE_nUOmAXdqK
X-Proofpoint-ORIG-GUID: nzzZGfZxpgG5E9-5AOPYLUbPNnpm9YyG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120104
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2022-01-12 at 16:45 +0100, David Hildenbrand wrote:
> > > If the sign is false, the shifted bits (mask) have to be 0.
> > > If the sign bit is true, the shifted bits (mask) have to be set.
> > 
> > IIUC this logic handles sign bit + "shift - 1" bits. So if the last
> > shifted bit is different, the overflow is not detected.
> 
> Ah, right, because of the - 1ULL ...
> 
> [...]
> 
> > > This looks like some black magic :)
> > 
> > Yeah, I felt this way too, but didn't come up with anything better
> > and
> > just left a comment warning not to simplify.
> > 
> 
> I wonder if all we want is
> 
> const uint64_t sign = 1ULL << 63;
> uint64_t mask = (-1ULL << (63 - shift)) & ~sign;
> 
> For shift =
> *  0: 0000000...0b
> *  1: 0100000...0b
> *  2: 0110000...0b
> * 63: 0111111...1b
> 
> Seems to survive your tests.

-1ULL does indeed help a lot to simplify this.
I don't think we even need to mask out the sign, since it should be
the same as the other bits anyway. So just

    uint64_t mask = -1ULL << (63 - shift);

appears to be enough.

