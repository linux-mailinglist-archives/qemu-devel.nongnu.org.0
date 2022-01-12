Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA66948C56B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:03:13 +0100 (CET)
Received: from localhost ([::1]:44788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7eDY-0003t2-8H
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:03:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7d6R-0006hy-D3; Wed, 12 Jan 2022 07:51:47 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2148
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7d6P-000817-1J; Wed, 12 Jan 2022 07:51:46 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CBaEpM018859; 
 Wed, 12 Jan 2022 12:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=e3wpyUC/JeyRwu0/gzp+TAcNMu3xR5u+hDOLBb242Zg=;
 b=dCeelMxMjmt3k5aygwuHzAbzOtFOQGEO0doTxXG2L6IsX4JbVvQbucastgWvHDSgratI
 FKXcwJMgd3bGm9gUdS77iag3TFTEjGEgaf41OrLTiWpgYlj35IMjqiWRKbZpoPwBtBpX
 cVv/1fNmXvuJ7ltnVsi0WTs5OiBo0QrcWg+LYibA0qjVnvJxsfktYR82Ph5R/q97vSew
 62ubIjmho1td2Xj4UY2cupzcANfjllVkgnKpA+Rbsjsc3T5jVuIEXrb48m9mcFhzuWuG
 3FU6btUlS8lNrL4pdNpQra/IHAMuy9Exm1wJ1F1cHpDmrYEYHwq0i8o2TePfBIRxFjKh iA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhvrc5g9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 12:51:43 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CCYq2D032151;
 Wed, 12 Jan 2022 12:51:43 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhvrc5g9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 12:51:42 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CCgHsF012859;
 Wed, 12 Jan 2022 12:51:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3df289t2ks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 12:51:41 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20CCgZV949152460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 12:42:35 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A98B152052;
 Wed, 12 Jan 2022 12:51:38 +0000 (GMT)
Received: from [9.171.78.41] (unknown [9.171.78.41])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 487C852067;
 Wed, 12 Jan 2022 12:51:38 +0000 (GMT)
Message-ID: <add9d2da455bf9b07cf77c942e95183f5bf6f090.camel@linux.ibm.com>
Subject: Re: [PATCH v2 3/5] target/s390x: Fix cc_calc_sla_64() missing
 overflows
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Cornelia Huck <cohuck@redhat.com>, Thomas
 Huth <thuth@redhat.com>
Date: Wed, 12 Jan 2022 13:51:38 +0100
In-Reply-To: <08948b31-0729-5463-829f-35fb444cf82d@redhat.com>
References: <20220112043948.224405-1-iii@linux.ibm.com>
 <20220112043948.224405-4-iii@linux.ibm.com>
 <08948b31-0729-5463-829f-35fb444cf82d@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NejPGaBIfpsZLA_BgDU9eSNBU9VDLGtu
X-Proofpoint-GUID: oOX2OF7P8SwbzpwBmLkSPF0xyugqjhEx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 mlxscore=0
 phishscore=0 impostorscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120082
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2022-01-12 at 09:59 +0100, David Hildenbrand wrote:
> On 12.01.22 05:39, Ilya Leoshkevich wrote:
> > An overflow occurs for SLAG when at least one shifted bit is not
> > equal
> > to sign bit. Therefore, we need to check that `shift + 1` bits are
> > neither all 0s nor all 1s. The current code checks only `shift`
> > bits,
> > missing some overflows.
> 
> Right, "shifted + 1" here means, the shifted bits + the sign bit.
> 
> But doesn't the
> 
> if (src & sign) {
>     match = mask;
> } else {
>     match = 0;
> }
> 
> logic handle that?
> 
> If the sign is false, the shifted bits (mask) have to be 0.
> If the sign bit is true, the shifted bits (mask) have to be set.

IIUC this logic handles sign bit + "shift - 1" bits. So if the last
shifted bit is different, the overflow is not detected.

> 
> Do you have an example that would be broken?

sla-2 test covers this. I added a similar one for SLAG in v3 and
it fails as well.

> > Fixes: cbe24bfa91d2 ("target-s390: Convert SHIFT, ROTATE SINGLE")
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> >  target/s390x/tcg/cc_helper.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/target/s390x/tcg/cc_helper.c
> > b/target/s390x/tcg/cc_helper.c
> > index c2c96c3a3c..b6acffa3e8 100644
> > --- a/target/s390x/tcg/cc_helper.c
> > +++ b/target/s390x/tcg/cc_helper.c
> > @@ -297,7 +297,8 @@ static uint32_t cc_calc_sla_32(uint32_t src,
> > int shift)
> >  
> >  static uint32_t cc_calc_sla_64(uint64_t src, int shift)
> >  {
> > -    uint64_t mask = ((1ULL << shift) - 1ULL) << (64 - shift);
> > +    /* Do not use (1ULL << (shift + 1)): it triggers UB when shift
> > is 63.  */
> > +    uint64_t mask = ((((1ULL << shift) - 1) << 1) + 1) << (64 -
> > (shift + 1));
> >      uint64_t sign = 1ULL << 63;
> >      uint64_t match;
> >      int64_t r;
> 
> This looks like some black magic :)

Yeah, I felt this way too, but didn't come up with anything better and
just left a comment warning not to simplify.

