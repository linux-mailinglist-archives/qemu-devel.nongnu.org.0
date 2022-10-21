Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0C260753D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:42:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpUM-0000QP-Jo
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:42:54 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpQ4-0005o8-3v
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1olpPS-0004Jf-Vj; Fri, 21 Oct 2022 06:37:57 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1olpPL-0000B6-Hy; Fri, 21 Oct 2022 06:37:49 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29L9g4Ge015674;
 Fri, 21 Oct 2022 10:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=W4SnqShrKjmC7H7YtwzRFbncjkhYDTG8up3CLdQnPlw=;
 b=bAaAYU8If20iAvsTXiF8VPgFrbWvT/TFoq/cPtHGBRPdS5NgxCS3gGAdKcWdFBJwNjnL
 3YdIeD6dt11Fh1jlSz0EyiNFI/WOeJByl3aHQHAf/M4JDW/MrSb5V73chGo6seRucHbv
 jolVu11mGyyZqa6AWtLuLL0wF8vFUwcxVlDXlDk9lMOQHk7Y/LWxP3jrAVdykgIVuQf8
 qSR1D2iFzFdx+3Y0oHYxPHyEcjUh+MNMI7RhtUflNCg9yyrvcztn7aWYfpMQAoawb1gp
 /gjHTJ90XXmIe12eEHl68S06HI0pspFkHtFvU+dBzV9P6tLQnecxeB7SMuYu1NKPGiHG wA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbrkma8c4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Oct 2022 10:37:28 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29L9hLB1022510;
 Fri, 21 Oct 2022 10:37:28 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbrkma8a6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Oct 2022 10:37:28 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29LAaRub017554;
 Fri, 21 Oct 2022 10:37:26 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3kajmru3js-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Oct 2022 10:37:26 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29LAbNOu2228864
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Oct 2022 10:37:24 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAF005205F;
 Fri, 21 Oct 2022 10:37:23 +0000 (GMT)
Received: from [9.171.39.72] (unknown [9.171.39.72])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 400965205A;
 Fri, 21 Oct 2022 10:37:23 +0000 (GMT)
Message-ID: <070768af0b41f810ce05074af00ce1372b2df078.camel@linux.ibm.com>
Subject: Re: [PATCH v3 24/26] target/s390x: don't probe next pc for EXecuted
 insns
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, David
 Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Thomas
 Huth <thuth@redhat.com>, "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
Date: Fri, 21 Oct 2022 12:37:23 +0200
In-Reply-To: <20221020115209.1761864-25-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-25-alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _kRc5E4kXKx54C7F9s7MRu9KnlhnFPyn
X-Proofpoint-ORIG-GUID: qi5FScKFsk1BvuPd-jOeIYL3RMtRVBCr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210210061
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, 2022-10-20 at 12:52 +0100, Alex Bennée wrote:
> We have finished the TB anyway so we can shortcut the other tests by
> checking dc->ex_value first.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/s390x/tcg/translate.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target/s390x/tcg/translate.c
> b/target/s390x/tcg/translate.c
> index f4de8efe3a..95279e5dc3 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -6624,9 +6624,9 @@ static void
> s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
>  
>      dc->base.is_jmp = translate_one(env, dc);
>      if (dc->base.is_jmp == DISAS_NEXT) {
> -        if (!is_same_page(dcbase, dc->base.pc_next) ||
> -            !is_same_page(dcbase, get_next_pc(env, dc, dc-
> >base.pc_next)) ||
> -            dc->ex_value) {
> +        if (dc->ex_value ||
> +            !is_same_page(dcbase, dc->base.pc_next) ||
> +            !is_same_page(dcbase, get_next_pc(env, dc, dc-
> >base.pc_next))) {
>              dc->base.is_jmp = DISAS_TOO_MANY;
>          }
>      }

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

