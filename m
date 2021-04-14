Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2784535F93C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 18:50:57 +0200 (CEST)
Received: from localhost ([::1]:52306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWij9-00029P-PY
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 12:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lWieO-0001M9-Rr; Wed, 14 Apr 2021 12:46:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38022
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lWieI-0001qV-NR; Wed, 14 Apr 2021 12:46:00 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13EGZgbK184758; Wed, 14 Apr 2021 12:45:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=pQUR8BnUXJEf5Sk9HL6brEZvo2gQ5j1e4L4YwL8PiJk=;
 b=C2LVehY7k7rsFbfcO5SzOZHIZXdpY2mWMbGuNg7bcFWHpPrME379Vtk3ZszrADGJBFF6
 GlKERpkGpaMnfw/BXZd41aznKbtGGiaUL8QIftCh5Tpivfp0I2Z6G9+8LFQzLLWFt+al
 oUvY1zmtJ1RhAGykHni9/qca2eodUGLYt+hBJp2hjC/OMhg5GYPrPfLj7RtfqZBAyD8f
 VyCq6BD1pZrAD9znWh8/1s1+E6VAamAeuN+BqmYu+yRwYlCbYrmq+gXniSapkeCLDjDz
 K15+ig7JkWIm2I3tmy9Wk9xEslyIDoDBYbcafKCjWpq0NLzIGI2kMEitiyU+IKhxhAm3 aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37wxk5jp03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 12:45:52 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13EGaPFU187617;
 Wed, 14 Apr 2021 12:45:51 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37wxk5jnye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 12:45:51 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13EGjogi023503;
 Wed, 14 Apr 2021 16:45:50 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 37u39h9u1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 16:45:49 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13EGjl1f27656474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 16:45:47 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D897AE280;
 Wed, 14 Apr 2021 16:45:47 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7746AE27C;
 Wed, 14 Apr 2021 16:45:46 +0000 (GMT)
Received: from sig-9-145-157-105.de.ibm.com (unknown [9.145.157.105])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Apr 2021 16:45:46 +0000 (GMT)
Message-ID: <28224ba9d61d0d805a162c00903559f3b99bc722.camel@linux.ibm.com>
Subject: Re: [PATCH v3 3/3] accel/tcg: Assert that tb->size != 0 after
 translation
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Apr 2021 18:45:46 +0200
In-Reply-To: <d3d690a0-c322-5fbb-26ae-dcbf08173b0a@redhat.com>
References: <20210414134112.25620-1-iii@linux.ibm.com>
 <20210414134112.25620-4-iii@linux.ibm.com>
 <d3d690a0-c322-5fbb-26ae-dcbf08173b0a@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RsK1AKN8DWQCx4coB4CVUHbFg--hPlO8
X-Proofpoint-ORIG-GUID: oV0MZjnUvty1xwn4LPkoWOWkCny1RXg_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-14_10:2021-04-14,
 2021-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140107
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-04-14 at 16:48 +0200, David Hildenbrand wrote:
> On 14.04.21 15:41, Ilya Leoshkevich wrote:
> > If arch-specific code generates a translation block of size 0,
> > tb_gen_code() may generate a spurious exception. Add an assertion
> > in
> > order to catch such situations early.
> > 
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> >   accel/tcg/translate-all.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> > index ba6ab09790..93b2dae112 100644
> > --- a/accel/tcg/translate-all.c
> > +++ b/accel/tcg/translate-all.c
> > @@ -1913,6 +1913,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
> >   
> >       tcg_ctx->cpu = env_cpu(env);
> >       gen_intermediate_code(cpu, tb, max_insns);
> > +    assert(tb->size != 0);
> >       tcg_ctx->cpu = NULL;
> >       max_insns = tb->icount;
> >   
> > 
> 
> Did you double-check the xtensa issue?

Oh, I'm sorry, I completely forgot about that one. I just ran the
test locally, and apparently it fails because of this new assert, so
I'll have to write the 4th patch now. Thanks!

> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> 



