Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3015675B8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 19:28:57 +0200 (CEST)
Received: from localhost ([::1]:51568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8mM4-0002Zp-4I
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 13:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1o8mFp-0005Fu-4x
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 13:22:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1o8mFn-0000c0-0j
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 13:22:28 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265FLGxY024188
 for <qemu-devel@nongnu.org>; Tue, 5 Jul 2022 17:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=LzXZCXmTTPrpWLlBqo7i1sKI1N0ppb4JyXzkaHmWLd4=;
 b=Dyt2kSvYisnkWxb1mHrpQaQoT03Xnt8UzQOmeHkg3ig8BOOQHxUgHRLQ+iuYdC0fp+CF
 tgk/KZn7RUHlwLMRELFv3q86dYxpj7DuNXVLrtZ6Zhd3fWJ4ZXliicZkXahvNiwxtB53
 Q/CCpPB450GYKmjK4M3eCV9pBe0q+JGScHbEqDcnmnpXsNnQhsMewZIV+GCdjiQrAQrE
 hYs883t7iy2tj/+mJLUgwmm6nJdshW6YYlEgTitz1/DZ6gUYbPCqSptF4JROVtXr6Qjo
 F3orqbtQoG6hL3cFGfCchPWs7ZJmnxgNcX3rYaGV2KmOrxyrafOC/42SP0KRn8eoCfTf Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h4qva367y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 17:22:23 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 265HBcri039269
 for <qemu-devel@nongnu.org>; Tue, 5 Jul 2022 17:22:23 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h4qva3676-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 17:22:22 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 265HL61U016123;
 Tue, 5 Jul 2022 17:22:20 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3h2d9hu8dq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 17:22:20 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 265HMISA19857820
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Jul 2022 17:22:18 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1449FAE051;
 Tue,  5 Jul 2022 17:22:18 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5FD5AE045;
 Tue,  5 Jul 2022 17:22:17 +0000 (GMT)
Received: from [9.171.47.233] (unknown [9.171.47.233])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  5 Jul 2022 17:22:17 +0000 (GMT)
Message-ID: <56ee56641ae963e3df2b59e6124aaa2b23033fec.camel@linux.ibm.com>
Subject: Re: [PATCH] multifd: Copy pages before compressing them with zlib
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org, Christian
 Borntraeger <borntraeger@de.ibm.com>
Date: Tue, 05 Jul 2022 19:22:17 +0200
In-Reply-To: <YsRYS7PdeMohyUDi@work-vm>
References: <20220704164112.2890137-1-iii@linux.ibm.com>
 <YsRYS7PdeMohyUDi@work-vm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MqxCBAmF52LcqkWEllMgKgI_f341hHdx
X-Proofpoint-GUID: yYjZ6mJpgFZRHaNUpkHOGxvTk6zCrC5B
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-05_14,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207050074
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2022-07-05 at 16:27 +0100, Dr. David Alan Gilbert wrote:
> * Ilya Leoshkevich (iii@linux.ibm.com) wrote:
> > zlib_send_prepare() compresses pages of a running VM. zlib does not
> > make any thread-safety guarantees with respect to changing
> > deflate()
> > input concurrently with deflate() [1].
> > 
> > One can observe problems due to this with the IBM zEnterprise Data
> > Compression accelerator capable zlib [2]. When the hardware
> > acceleration is enabled, migration/multifd/tcp/plain/zlib test
> > fails
> > intermittently [3] due to sliding window corruption. The
> > accelerator's
> > architecture explicitly discourages concurrent accesses [4]:
> > 
> >     Page 26-57, "Other Conditions":
> > 
> >     As observed by this CPU, other CPUs, and channel
> >     programs, references to the parameter block, first,
> >     second, and third operands may be multiple-access
> >     references, accesses to these storage locations are
> >     not necessarily block-concurrent, and the sequence
> >     of these accesses or references is undefined.
> > 
> > Mark Adler pointed out that vanilla zlib performs double fetches
> > under
> > certain circumstances as well [5], therefore we need to copy data
> > before passing it to deflate().
> 
> Thanks for fixing that!
> 
> > [1] https://zlib.net/manual.html
> > [2] https://github.com/madler/zlib/pull/410
> > [3]
> > https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03988.html
> > [4] http://publibfp.dhe.ibm.com/epubs/pdf/a227832c.pdf
> > [5] https://gitlab.com/qemu-project/qemu/-/issues/1099
> > 
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> > 
> > v1:
> > https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg06841.html
> > v1 -> v2: Rebase, mention Mark Adler's reply in the commit message.
> > 
> >  migration/multifd-zlib.c | 35 ++++++++++++++++++++++-------------
> >  1 file changed, 22 insertions(+), 13 deletions(-)
> > 
> > diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> > index 3a7ae44485..b6b22b7d1f 100644
> > --- a/migration/multifd-zlib.c
> > +++ b/migration/multifd-zlib.c
> > @@ -27,6 +27,8 @@ struct zlib_data {
> >      uint8_t *zbuff;
> >      /* size of compressed buffer */
> >      uint32_t zbuff_len;
> > +    /* uncompressed buffer */
> > +    uint8_t buf[];
> >  };
> >  
> >  /* Multifd zlib compression */
> > @@ -43,9 +45,18 @@ struct zlib_data {
> >   */
> >  static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
> >  {
> > -    struct zlib_data *z = g_new0(struct zlib_data, 1);
> > -    z_stream *zs = &z->zs;
> > +    /* This is the maximum size of the compressed buffer */
> > +    uint32_t zbuff_len = compressBound(MULTIFD_PACKET_SIZE);
> > +    size_t buf_len = qemu_target_page_size();
> > +    struct zlib_data *z;
> > +    z_stream *zs;
> >  
> > +    z = g_try_malloc0(sizeof(struct zlib_data) + buf_len +
> > zbuff_len);
> 
> So I think this works; but wouldn't life be easier if you just used
> separate malloc's for the buffers?  You've got a lot of hairy pointer
> maths below that would go away if they were separate.
> 
> Dave

I was trying to avoid an (IMHO equally hairy) error handling sequence
here. But I don't mind changing this if an alternative would be more
maintainable.

Best regards,
Ilya

