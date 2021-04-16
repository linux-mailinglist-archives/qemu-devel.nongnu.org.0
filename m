Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD77362445
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 17:42:07 +0200 (CEST)
Received: from localhost ([::1]:34368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQbe-0003tE-Vu
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 11:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lXQYD-0001sz-Uc; Fri, 16 Apr 2021 11:38:33 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lXQY9-0003Lb-Nf; Fri, 16 Apr 2021 11:38:33 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GFXcOx039498; Fri, 16 Apr 2021 11:38:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=e2SU2g2/zCBueh66b1Oqp1fW2nAVAIzTaSB+N0Avwbk=;
 b=K8IHvE3X+051R+TOAsTRsGRBLxm28Ft4+nN2Ldii3B4bkpPXjdMlcAScmsH3yY/IUa5g
 mNt9kV7Znf+kGaTvgXPXpNPWiw35coJw8SRpZ6pQWrrMQxEdcH9vxK7L7frBomn8yJjZ
 yAQ01uu6uVwkjgcX7i0NyQpN4MQ19H9MvQUFNMRlyxNJte9LGjFBn38xUia302uREUjo
 6gKBzqB5mGL2Gg4bK1OMtJffFVEPQRZiyf3OGn67wVfhaLM6LUhXofBhUxizprV7Cp29
 pBWT31lv468ND8heiUoyzNd87QiKG3ztySpVz5WxfKinpMQqbhiOFLfPIaf2oQhxw5Qn 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37yan15f6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 11:38:26 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13GFZAAe045774;
 Fri, 16 Apr 2021 11:38:26 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37yan15f5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 11:38:26 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13GFcNSd013843;
 Fri, 16 Apr 2021 15:38:23 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 37u3n8af59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 15:38:23 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13GFcLTv40239462
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 15:38:21 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C5974C044;
 Fri, 16 Apr 2021 15:38:21 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 215914C040;
 Fri, 16 Apr 2021 15:38:20 +0000 (GMT)
Received: from sig-9-145-157-105.de.ibm.com (unknown [9.145.157.105])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Apr 2021 15:38:20 +0000 (GMT)
Message-ID: <367a0f58dec6295474bd765b9cb2010e3e43e3cf.camel@linux.ibm.com>
Subject: Re: [PATCH v4 2/4] target/arm: Make sure that commpage's tb->size != 0
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Apr 2021 17:38:19 +0200
In-Reply-To: <CAFEAcA-8yh2GNEdP5yuY=_rKG_g4TLHauU=nYfGR_O-fT-2oMw@mail.gmail.com>
References: <20210415130305.28640-1-iii@linux.ibm.com>
 <20210415130305.28640-3-iii@linux.ibm.com>
 <CAFEAcA-8yh2GNEdP5yuY=_rKG_g4TLHauU=nYfGR_O-fT-2oMw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CcpTy7wTcHWYepGH6ADNZ2i8H7i1UVQ-
X-Proofpoint-ORIG-GUID: FijzFKZiYCMv358IswAFoya2G544m_yX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_08:2021-04-16,
 2021-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104160112
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2021-04-16 at 15:10 +0100, Peter Maydell wrote:
> On Thu, 15 Apr 2021 at 14:03, Ilya Leoshkevich <iii@linux.ibm.com>
> wrote:
> > 
> > tb_gen_code() assumes that tb->size must never be zero, otherwise
> > it
> > may produce spurious exceptions. For ARM this may happen when
> > creating
> > a translation block for the commpage.
> > 
> > Fix by pretending that commpage translation blocks have at least
> > one
> > instruction.
> > 
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> >  target/arm/translate.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/target/arm/translate.c b/target/arm/translate.c
> > index 62b1c2081b..885f69b044 100644
> > --- a/target/arm/translate.c
> > +++ b/target/arm/translate.c
> > @@ -9060,6 +9060,7 @@ static void
> > arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
> >      unsigned int insn;
> > 
> >      if (arm_pre_translate_insn(dc)) {
> > +        dc->base.pc_next += 4;
> >          return;
> >      }
> 
> Why does the call to arm_pre_translate_insn() in
> arm_tr_translate_insn() need
> this change but not the one in thumb_tr_translate_insn() ?
> 
> thanks
> -- PMM
> 

My bad: the regtest did not hit it, and I haven't thought about it.
I will send a v5 with `dc->base.pc_next += 2;` there.


