Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1767E616083
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 11:07:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqAdX-0004of-E3; Wed, 02 Nov 2022 06:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oqAdH-0004lp-0S; Wed, 02 Nov 2022 06:06:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oqAdA-0000jy-Su; Wed, 02 Nov 2022 06:06:02 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A28xr9T035041;
 Wed, 2 Nov 2022 10:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=/q/PqvH1EkWN7pwL8D+Up7AZGnhB6n8Dzf39QxbBFlo=;
 b=Yt+aFojbnbJNQBtKVjwy7L29JYQN9P415Z559KsdhQyFcEh8legR0i0DdfiImsXzO+M/
 iviLysBXtZlA8OpFSwB+526MsksJjbSX2k8/9dLBFTWEdGWbDVk6P2i7EL0bSndEaB1s
 x4Ser0Pi4f6gcHUlJaKiE17Q0vm0RAuHhhAv3MdAvEcJerjEPtAMvpWBkfR8GY7iiRsS
 8ItnnyiAwvXlkiVFbQPP8pSqaqPDWq8VxHR3sf+JhvFimBHJsOzOiJVVbXALl6WFW1xX
 s7YrXLLwjkiOgxfMLnlqUQOVwjC/aY1vGjXBAUoBFwO6dpnnGHWCr7SlCubXZUDa0FRP 5w== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kjvnhc49a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Nov 2022 10:05:49 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A2A5YRs013628;
 Wed, 2 Nov 2022 10:05:46 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3kgut8vve0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Nov 2022 10:05:46 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A2A5itM65536324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Nov 2022 10:05:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A2CE52051;
 Wed,  2 Nov 2022 10:05:44 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 301DF5204F;
 Wed,  2 Nov 2022 10:05:44 +0000 (GMT)
Date: Wed, 2 Nov 2022 11:05:13 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: Re: [PATCH 9/9] target/s390x: Use Int128 for passing float128
Message-ID: <20221102100513.5ftpmtg6dlhoeag5@heavy>
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
 <20221021073006.2398819-10-richard.henderson@linaro.org>
 <20221102093848.ewdzokre4vflgyzg@heavy>
 <a5b5c46e-9e6d-bb61-291c-a1f5fba60d4a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5b5c46e-9e6d-bb61-291c-a1f5fba60d4a@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NNdG5SlmJ0aBLuZnqIOEJydFYvaYZ5Ew
X-Proofpoint-GUID: NNdG5SlmJ0aBLuZnqIOEJydFYvaYZ5Ew
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_06,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=512 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020061
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 02, 2022 at 08:47:24PM +1100, Richard Henderson wrote:
> On 11/2/22 20:38, Ilya Leoshkevich wrote:
> > On Fri, Oct 21, 2022 at 05:30:06PM +1000, Richard Henderson wrote:
> > > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > > ---
> > >   target/s390x/helper.h          | 32 ++++++-------
> > >   target/s390x/tcg/fpu_helper.c  | 88 ++++++++++++++--------------------
> > >   target/s390x/tcg/translate.c   | 76 ++++++++++++++++++++---------
> > >   target/s390x/tcg/insn-data.def | 30 ++++++------
> > >   4 files changed, 121 insertions(+), 105 deletions(-)

...

> > Hi,
> > 
> > I ran valgrind's testsuite with this patch, and their bpf-4 test
> > triggered an assertion in the
> > 
> >      (insn->spec & SPEC_r2_f128 && !is_fp_pair(get_field(s, r2)))
> > 
> > condition. The following fixup helped:
> > 
> > 
> > --- a/target/s390x/tcg/translate.c
> > +++ b/target/s390x/tcg/translate.c
> > @@ -5771,14 +5771,14 @@ static void in1_x1(DisasContext *s, DisasOps *o)
> >   {
> >       o->in1_128 = load_freg_128(get_field(s, r1));
> >   }
> > -#define SPEC_in1_x1 SPEC_r2_f128
> > +#define SPEC_in1_x1 SPEC_r1_f128
> 
> Looks right, thanks.
> 
> >   /* Load the high double word of an extended (128-bit) format FP number */
> >   static void in1_x2h(DisasContext *s, DisasOps *o)
> >   {
> >       o->in1 = load_freg(get_field(s, r2));
> >   }
> > -#define SPEC_in1_x2h SPEC_r2_f128
> > +#define SPEC_in1_x2h SPEC_r1_f128
> 
> This looks wrong.

Oh, right - we do get_field(r2) here.
Only the first hunk is necessary.

> r~

