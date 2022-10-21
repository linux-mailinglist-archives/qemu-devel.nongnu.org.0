Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8BB6075D7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 13:12:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpxI-0002hm-On
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 07:12:48 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpiS-0001l9-8g
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1olpiJ-0001cR-3r; Fri, 21 Oct 2022 06:57:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1olpiH-0006ZJ-Cz; Fri, 21 Oct 2022 06:57:18 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29LA86UG013005;
 Fri, 21 Oct 2022 10:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Urrig5Q4564sBiBiauRWBE9WYFxAnO7D84shDmfEaiE=;
 b=TK/4QMiiufuHmjBEqvJfHSdAvlZZkDS8PBH4cIKhjQH5AJlTvXCLlnmOQNkRAv6IkI57
 VBn6ZJpNfDE1Zl/DC6Xswv7oWlpW0TvieQOJ8jHww4vont/dKSFQz4kuwznXHmjZEN/7
 yKDTcNXJqLp/QjH/ZGsDQvA3x3TGmvSKRX9Al0J6dovDmZLkHzWl6eG1U7/VOx4m+sra
 WuiZke+PvtEQ2NOBh/pUg0gC6vp471N66cNJv9pvnOTlP1Jb6zvLAfOeEod4N73UWBpE
 JHXdHCxl41dlrHeXrTSrxUZB1OcmVR0f24UzC2VZcWaIifuCYX2PeJc5czOuR6pTWvtO 9Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbsdgscn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Oct 2022 10:57:03 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29LA8Kmc013624;
 Fri, 21 Oct 2022 10:57:03 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbsdgscme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Oct 2022 10:57:03 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29LAphcW010398;
 Fri, 21 Oct 2022 10:57:01 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3k7mg9abxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Oct 2022 10:57:00 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29LAuwRN3670768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Oct 2022 10:56:58 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0FF342045;
 Fri, 21 Oct 2022 10:56:58 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D24342042;
 Fri, 21 Oct 2022 10:56:58 +0000 (GMT)
Received: from [9.171.39.72] (unknown [9.171.39.72])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 Oct 2022 10:56:58 +0000 (GMT)
Message-ID: <a7b39d519028801ccfb10898ad1ddcc47b02caef.camel@linux.ibm.com>
Subject: Re: [PATCH v3 25/26] target/s390x: fake instruction loading when
 handling 'ex'
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, David
 Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Thomas
 Huth <thuth@redhat.com>, "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
Date: Fri, 21 Oct 2022 12:56:57 +0200
In-Reply-To: <20221020115209.1761864-26-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-26-alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uG4NECFfyZLUTpo5RmEBp2InQRTz0qI2
X-Proofpoint-ORIG-GUID: XIMPvqZWiD6ZrgZuzK2oC78H5Z_txQmM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 mlxscore=0 suspectscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210210061
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2022-10-20 at 12:52 +0100, Alex Bennée wrote:
> The s390x EXecute instruction is a bit weird as we synthesis the
> executed instruction from what we have stored in memory. This missed
> the plugin instrumentation.
> 
> Work around this with a special helper to inform the rest of the
> translator about the instruction so things stay consistent.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> 
> ---
> v2
>   - s/w/b/ for translator_fake_ldb
>   - add comment to extract_insn
>   - reword commit message
> ---
>  include/exec/translator.h    | 17 +++++++++++++++++
>  target/s390x/tcg/translate.c |  6 ++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/include/exec/translator.h b/include/exec/translator.h
> index 3b77f5f4aa..af2ff95cd5 100644
> --- a/include/exec/translator.h
> +++ b/include/exec/translator.h
> @@ -211,6 +211,23 @@ translator_ldq_swap(CPUArchState *env,
> DisasContextBase *db,
>      return ret;
>  }
>  
> +/**
> + * translator_fake_ldb - fake instruction load
> + * @insn8: byte of instruction
> + * @pc: program counter of instruction
> + *
> + * This is a special case helper used where the instruction we are
> + * about to translate comes from somewhere else (e.g. being
> + * re-synthesised for s390x "ex"). It ensures we update other areas
> of
> + * the translator with details of the executed instruction.
> + */
> +
> +static inline void translator_fake_ldb(uint8_t insn8, abi_ptr pc)
> +{
> +    plugin_insn_append(pc, &insn8, sizeof(insn8));
> +}
> +
> +
>  /*
>   * Return whether addr is on the same page as where disassembly
> started.
>   * Translators can use this to enforce the rule that only single-
> insn
> diff --git a/target/s390x/tcg/translate.c
> b/target/s390x/tcg/translate.c
> index 95279e5dc3..8101f5f569 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -6317,12 +6317,18 @@ static const DisasInsn
> *extract_insn(CPUS390XState *env, DisasContext *s)
>      if (unlikely(s->ex_value)) {
>          /* Drop the EX data now, so that it's clear on exception
> paths.  */
>          TCGv_i64 zero = tcg_const_i64(0);
> +        int i;
>          tcg_gen_st_i64(zero, cpu_env, offsetof(CPUS390XState,
> ex_value));
>          tcg_temp_free_i64(zero);
>  
>          /* Extract the values saved by EXECUTE.  */
>          insn = s->ex_value & 0xffffffffffff0000ull;
>          ilen = s->ex_value & 0xf;
> +        /* register insn bytes with translator so plugins work */
> +        for (i = 0; i < ilen; i++) {
> +            uint8_t byte = extract64(insn, 56 - (i * 8), 8);
> +            translator_fake_ldb(byte, pc + i);
> +        }
>          op = insn >> 56;
>      } else {
>          insn = ld_code2(env, s, pc);

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

