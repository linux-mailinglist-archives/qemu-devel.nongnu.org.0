Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5546C571A2D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:39:43 +0200 (CEST)
Received: from localhost ([::1]:41460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFB0-0000pn-Dk
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oBF4h-0002gq-8D; Tue, 12 Jul 2022 08:33:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42426
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oBF4e-0005PD-UI; Tue, 12 Jul 2022 08:33:10 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26CAhHWM002261;
 Tue, 12 Jul 2022 12:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=tUZvzFXAlsipVY4kglVh6X+/A1exKg455ahBjAlT1nU=;
 b=PSIDWaE8/pH29DOUKWBT5+AySutLaNsFHMIj6u5X3orA8QyhSFjB4cIHPmr5AfeQs9WF
 QJnLB8CMCQx9Ab8k1w4lpsKLpubZcR5IjuK3FAT0w3EZC/7/n8Pw9XEhf1MxCJb+3qQy
 8XV/xuTZRr5yqcWA/UIOXFmWgPHstxUbprxD/4M/CBK/ITHeWuY16432KpaT3MniJ1bQ
 VUI/BIwOyQ9O7ZLuytsJZMenl0YMoLW+M/2QTMkz1kgNfcrV823Czm0i7qvq+2rTu0T1
 /m1t8Ibgw8tt1/O+0zLs9XJQMXiE72hjl3J0yOEjvdwwcxpSIwVyv3akC8ylGnGmDh9e jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h97erk3dq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 12:32:58 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26CBHf3u030312;
 Tue, 12 Jul 2022 12:32:58 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h97erk3cw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 12:32:58 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26CCK1ZA019521;
 Tue, 12 Jul 2022 12:32:56 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3h71a8v5ev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 12:32:56 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26CCWr7t6160858
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 12:32:53 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D01C5AE045;
 Tue, 12 Jul 2022 12:32:53 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B542AE051;
 Tue, 12 Jul 2022 12:32:53 +0000 (GMT)
Received: from [9.171.48.196] (unknown [9.171.48.196])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 12 Jul 2022 12:32:53 +0000 (GMT)
Message-ID: <c7a32437850ddc70438173ff7f0f0966e5f48384.camel@linux.ibm.com>
Subject: Re: [PATCH 3/3] tests/tcg/s390x: test signed vfmin/vfmax
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, Peter Maydell
 <peter.maydell@linaro.org>, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org, Christian Borntraeger
 <borntraeger@linux.ibm.com>
Date: Tue, 12 Jul 2022 14:32:53 +0200
In-Reply-To: <c7897b91-dbfd-3a32-68c8-d7afa40495ba@linaro.org>
References: <20220712015717.3602602-1-iii@linux.ibm.com>
 <20220712015717.3602602-4-iii@linux.ibm.com>
 <c7897b91-dbfd-3a32-68c8-d7afa40495ba@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IqzdSF_YURs_0NjXAESfMeatsHrlccDH
X-Proofpoint-ORIG-GUID: ziJEqiazl69v5104Mfx05FBtH_tKpqN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_08,2022-07-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxlogscore=950 mlxscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120048
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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

On Tue, 2022-07-12 at 10:19 +0530, Richard Henderson wrote:
> On 7/12/22 07:27, Ilya Leoshkevich wrote:
> > +/*
> > + * vfmin/vfmax code generation.
> > + */
> > +extern const char vfminmax_template[];
> > +extern const int vfminmax_template_size;
> > +extern const int vfminmax_offset;
> > +asm(".globl vfminmax_template\n"
> > +    "vfminmax_template:\n"
> > +    "vl %v25,0(%r3)\n"
> > +    "vl %v26,0(%r4)\n"
> > +    "0: vfmax %v24,%v25,%v26,2,0,0\n"
> > +    "vst %v24,0(%r2)\n"
> > +    "br %r14\n"
> > +    "1: .align 4\n"
> > +    ".globl vfminmax_template_size\n"
> > +    "vfminmax_template_size: .long 1b - vfminmax_template\n"
> > +    ".globl vfminmax_offset\n"
> > +    "vfminmax_offset: .long 0b - vfminmax_template\n");
> ...
> > +
> > +#define VFMIN 0xEE
> > +#define VFMAX 0xEF
> > +
> > +static void vfminmax(unsigned char *buf, unsigned int op,
> > +                     unsigned int m4, unsigned int m5, unsigned
> > int m6,
> > +                     void *v1, const void *v2, const void *v3)
> > +{
> > +    memcpy(buf, vfminmax_template, vfminmax_template_size);
> > +    buf[vfminmax_offset + 3] = (m6 << 4) | m5;
> > +    buf[vfminmax_offset + 4] &= 0x0F;
> > +    buf[vfminmax_offset + 4] |= (m4 << 4);
> > +    buf[vfminmax_offset + 5] = op;
> > +    ((void (*)(void *, const void *, const void *))buf)(v1, v2,
> > v3);
> > +}
> 
> This works, of course.  It could be simpler using EXECUTE, to store
> just the one 
> instruction and not worry about an executable mapped page, but I
> guess it doesn't matter.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~

Thanks!

I thought about this too, but EX/EXRL operate only on the second byte,
and I need to modify bytes 3-5 here.

