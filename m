Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F643E1D60
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 22:37:28 +0200 (CEST)
Received: from localhost ([::1]:46708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBk7L-0004lq-Lm
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 16:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mBk6O-00046A-IE
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 16:36:28 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mBk6L-0002QJ-2j
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 16:36:28 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175KWeV0048430; Thu, 5 Aug 2021 16:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=VCDMfMIESCRjdZmmv1CWqaBgbqTiJx3NmWjWL7vf2Z4=;
 b=TVTLQIgAJye94OBXQMQXry8ja3TkPUdVyEwdJITGKluFBtNShgysNFGir1yHt8y8KExH
 Yiv0TBVrGbb09JGFfP7uFpRp6/uOJEz/St6Mmb1Wyn51/9ruMATiE/nD6PXQFop+ikbg
 3sQpiDoHz057Dsi+9HCEGZ4sw5vikf/FQzPS3j/N0SBN9Dz9xikYPINOi2KeM6Vy87me
 zoKBLHBjaSRSJWkBBNopuuxxy9edg8wQEB28+gmpKp+QdzrB4fnYVgYVo5XM+NVYIq8x
 2pC2Pf1r3fMgdx/IZeFjxWNNzhylSj+hE6sLVQldv5M5qCrcCsPK2oV8+Y6zevx0rJog ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a88k39pm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 16:36:21 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 175KYvJF055064;
 Thu, 5 Aug 2021 16:36:21 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a88k39pjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 16:36:21 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 175KXdc9024690;
 Thu, 5 Aug 2021 20:36:19 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3a4x58tmtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 20:36:18 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 175KXDZU59244814
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 20:33:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD54B4C04E;
 Thu,  5 Aug 2021 20:36:14 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 532DA4C06A;
 Thu,  5 Aug 2021 20:36:14 +0000 (GMT)
Received: from sig-9-145-77-113.uk.ibm.com (unknown [9.145.77.113])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 20:36:14 +0000 (GMT)
Message-ID: <1ecd7127f9f768a35b48c45441cd461d842be467.camel@linux.ibm.com>
Subject: Re: [PATCH RFC 1/1] accel/tcg: Clear PAGE_WRITE before translation
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>
Date: Thu, 05 Aug 2021 22:36:13 +0200
In-Reply-To: <04de9e20-555a-f785-3dea-add345d4e64d@linaro.org>
References: <20210804224633.154083-1-iii@linux.ibm.com>
 <20210804224633.154083-2-iii@linux.ibm.com>
 <507a0eae-6dcf-68c0-ee5f-40499788e2b4@linaro.org>
 <8481e2b62d5bf3295ffb309ce54fbdaf42fcef0b.camel@linux.ibm.com>
 <04de9e20-555a-f785-3dea-add345d4e64d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: g0MPkvWT0nBiHdCTFwmwvR5Fk60vu-oA
X-Proofpoint-GUID: o5b7RTAEl8g3s2tP2tg7cZ4HAFP6XTpc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_10:2021-08-05,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108050121
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-08-05 at 06:59 -1000, Richard Henderson wrote:
> On 8/5/21 12:56 AM, Ilya Leoshkevich wrote:
> > On Wed, 2021-08-04 at 14:30 -1000, Richard Henderson wrote:
> > > I think that the translator_ld*_swap functions should be moved
> > > out of
> > > include/exec/translator.h into accel/tcg/translator.c.
> > 
> > Do we really need this? In the end, the added code is not that
> > large.
> 
> I suppose it's not required, but they're already larger than they
> need to be.
> 
> In my opinion, if you're going to swap one out-of-line function call
> for two out-of-line 
> function calls (cpu_ld*_code + plugin_insn_append), you've probably
> made a bad size trade-off.
> 
> With your added code, it'll be 3 out-of-line calls.
> 
> 
> r~

Fair enough. Let me send a v3 then.

Best regards,
Ilya


