Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2181863FE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 04:54:51 +0100 (CET)
Received: from localhost ([::1]:33844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDgq1-0000XZ-Ni
	for lists+qemu-devel@lfdr.de; Sun, 15 Mar 2020 23:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50770)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jDgd5-000729-Dk
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 23:41:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jDgd4-00089w-2i
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 23:41:27 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:39839)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jDgd3-0007IW-L3; Sun, 15 Mar 2020 23:41:26 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2153771|-1; CH=green; DM=||false|;
 DS=CONTINUE|ham_enroll_verification|0.146117-0.000291037-0.853592;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03299; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.H06RVuP_1584330075; 
Received: from 172.16.31.150(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H06RVuP_1584330075)
 by smtp.aliyun-inc.com(10.147.44.118);
 Mon, 16 Mar 2020 11:41:16 +0800
Subject: Re: [PATCH v5 40/60] target/riscv: vector floating-point merge
 instructions
To: Richard Henderson <richard.henderson@linaro.org>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-41-zhiwei_liu@c-sky.com>
 <37215373-eead-9185-faf9-f2ebc0cb4193@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <ef0a9b7e-65c4-93e7-61b6-b288afa1c13a@c-sky.com>
Date: Mon, 16 Mar 2020 11:41:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <37215373-eead-9185-faf9-f2ebc0cb4193@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------11784943C168B05E918B8879"
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
Cc: guoren@linux.alibaba.com, wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------11784943C168B05E918B8879
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2020/3/15 6:47, Richard Henderson wrote:
> On 3/12/20 7:58 AM, LIU Zhiwei wrote:
>> +
>> +/* Vector Floating-Point Merge Instruction */
>> +static bool opfvf_vfmerge_check(DisasContext *s, arg_rmrr *a)
>> +{
>> +    return (vext_check_isa_ill(s, RVV) &&
>> +            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
>> +            vext_check_reg(s, a->rd, false) &&
>> +            vext_check_reg(s, a->rs2, false) &&
>> +            ((a->vm == 0) || (a->rs2 == 0)) &&
>> +            (s->sew != 0));
>> +}
>> +GEN_OPFVF_TRANS(vfmerge_vfm, opfvf_vfmerge_check)
> Similar comments as for integer merge, using tcg_gen_gvec_dup_i64 for
> unpredicated merges.
>
> In fact, there's no reason at all to define a helper function for this one.  I
> would expect you do be able to use the exact same helpers as for the integer
> merges.

Do you mean that I should expands TCGv to TCGv_i64 for vmv.v.x in 
translation?
So that I can reuse it.

void gen_helper_vmv_v_x(TCG_ptr, TCGv_i64, TCGv_env, TCGv_i32);

Zhiwei

>
> r~


--------------11784943C168B05E918B8879
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2020/3/15 6:47, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:37215373-eead-9185-faf9-f2ebc0cb4193@linaro.org">
      <pre class="moz-quote-pre" wrap="">On 3/12/20 7:58 AM, LIU Zhiwei wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+/* Vector Floating-Point Merge Instruction */
+static bool opfvf_vfmerge_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s, RVV) &amp;&amp;
+            vext_check_overlap_mask(s, a-&gt;rd, a-&gt;vm, false) &amp;&amp;
+            vext_check_reg(s, a-&gt;rd, false) &amp;&amp;
+            vext_check_reg(s, a-&gt;rs2, false) &amp;&amp;
+            ((a-&gt;vm == 0) || (a-&gt;rs2 == 0)) &amp;&amp;
+            (s-&gt;sew != 0));
+}
+GEN_OPFVF_TRANS(vfmerge_vfm, opfvf_vfmerge_check)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Similar comments as for integer merge, using tcg_gen_gvec_dup_i64 for
unpredicated merges.

In fact, there's no reason at all to define a helper function for this one.  I
would expect you do be able to use the exact same helpers as for the integer
merges.
</pre>
    </blockquote>
    <br>
    Do you mean that I should expands TCGv to TCGv_i64 for vmv.v.x in
    translation?<br>
    So that I can reuse it.<br>
    <pre>void gen_helper_vmv_v_x(TCG_ptr, TCGv_i64, TCGv_env, TCGv_i32);</pre>
    <pre>Zhiwei
</pre>
    <blockquote type="cite"
      cite="mid:37215373-eead-9185-faf9-f2ebc0cb4193@linaro.org">
      <pre class="moz-quote-pre" wrap="">

r~
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------11784943C168B05E918B8879--

