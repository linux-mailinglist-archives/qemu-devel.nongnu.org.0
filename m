Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A838340C177
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 10:13:27 +0200 (CEST)
Received: from localhost ([::1]:52022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQQ2o-0000MC-8Y
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 04:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mQQ1X-00059Q-DH
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 04:12:07 -0400
Received: from out28-220.mail.aliyun.com ([115.124.28.220]:32769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mQQ1U-0002Wq-De
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 04:12:06 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07480622|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0647439-0.0134832-0.921773;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047206; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.LKoX-cE_1631693517; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LKoX-cE_1631693517)
 by smtp.aliyun-inc.com(10.147.40.44); Wed, 15 Sep 2021 16:11:57 +0800
Subject: Re: [PATCH v11 03/16] target/riscv: clwz must ignore high bits (use
 shift-left & changed logic)
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
 <20210911140016.834071-4-philipp.tomsich@vrull.eu>
 <913941ad-2a84-f4a8-0a5a-c64bef026a6f@c-sky.com>
 <CAAeLtUBJB3-X9nXeyFcsHNgS+peZ+T_ZbAu0hwyaRDT9x69dzA@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <50ac9692-2b34-ec39-3754-79568e69aa04@c-sky.com>
Date: Wed, 15 Sep 2021 16:11:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAAeLtUBJB3-X9nXeyFcsHNgS+peZ+T_ZbAu0hwyaRDT9x69dzA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------F423426C07CC0774EA3196C4"
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.220; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-220.mail.aliyun.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------F423426C07CC0774EA3196C4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021/9/14 下午6:24, Philipp Tomsich wrote:
>
>
> On Tue 14. Sep 2021 at 11:15, LIU Zhiwei <zhiwei_liu@c-sky.com 
> <mailto:zhiwei_liu@c-sky.com>> wrote:
>
>
>     On 2021/9/11 下午10:00, Philipp Tomsich wrote:
>     > Assume clzw being executed on a register that is not
>     sign-extended, such
>     > as for the following sequence that uses (1ULL << 63) | 392 as
>     the operand
>     > to clzw:
>     >       bseti   a2, zero, 63
>     >       addi    a2, a2, 392
>     >       clzw    a3, a2
>     > The correct result of clzw would be 23, but the current
>     implementation
>     > returns -32 (as it performs a 64bit clz, which results in 0
>     leading zero
>     > bits, and then subtracts 32).
>
>     As the MSB word of  a3 has been cleaned,  the result of current
>     implementation will be 23. So there is no
>     error here.
>
>
> Zhiwei,
>
> bits [63:32] on rs (arg1) are not zero-extended, as ctx->w is not 
> being set (the EXT_ZERO doesn’t have any effect, unless ctx->w is 
> true).  Please see the earlier discussion on this topic in v9 and v10.

Yes,  you are right.

Reviewed-by: LIU Zhiwei<zhiwei_liu@c-sky.com>

Zhiwei

>
> Thanks,
> Philipp.
>
>     Thanks,
>     Zhiwei
>
>     > Fix this by changing the implementation to:
>     >   1. shift the original register up by 32
>     >   2. performs a target-length (64bit) clz
>     >   3. return 32 if no bits are set
>     >
>     > Marking this instruction as 'w-form' (i.e., setting ctx->w)
>     would not
>     > correctly model the behaviour, as the instruction should not perform
>     > a zero-extensions on the input (after all, it is not a .uw
>     instruction)
>     > and the result is always in the range 0..32 (so neither a
>     sign-extension
>     > nor a zero-extension on the result will ever be needed). 
>     Consequently,
>     > we do not set ctx->w and mark the instruction as EXT_NONE.
>     >
>     > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu
>     <mailto:philipp.tomsich@vrull.eu>>
>     > ---
>     >
>     > Changes in v11:
>     > - Swaps out the EXT_ZERO to EXT_NONE, as no extension is to be
>     performed.
>     >
>     > Changes in v10:
>     > - New patch, fixing correctnes for clzw called on a register
>     with undefined
>     >    (as in: not properly sign-extended) upper bits.
>     >
>     >   target/riscv/insn_trans/trans_rvb.c.inc | 8 +++++---
>     >   1 file changed, 5 insertions(+), 3 deletions(-)
>     >
>     > diff --git a/target/riscv/insn_trans/trans_rvb.c.inc
>     b/target/riscv/insn_trans/trans_rvb.c.inc
>     > index 6c85c89f6d..73d1e45026 100644
>     > --- a/target/riscv/insn_trans/trans_rvb.c.inc
>     > +++ b/target/riscv/insn_trans/trans_rvb.c.inc
>     > @@ -349,15 +349,17 @@ GEN_TRANS_SHADD(3)
>     >
>     >   static void gen_clzw(TCGv ret, TCGv arg1)
>     >   {
>     > -    tcg_gen_clzi_tl(ret, arg1, 64);
>     > -    tcg_gen_subi_tl(ret, ret, 32);
>     > +    TCGv t = tcg_temp_new();
>     > +    tcg_gen_shli_tl(t, arg1, 32);
>     > +    tcg_gen_clzi_tl(ret, t, 32);
>     > +    tcg_temp_free(t);
>     >   }
>     >
>     >   static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
>     >   {
>     >       REQUIRE_64BIT(ctx);
>     >       REQUIRE_EXT(ctx, RVB);
>     > -    return gen_unary(ctx, a, EXT_ZERO, gen_clzw);
>     > +    return gen_unary(ctx, a, EXT_NONE, gen_clzw);
>     >   }
>     >
>     >   static void gen_ctzw(TCGv ret, TCGv arg1)
>

--------------F423426C07CC0774EA3196C4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021/9/14 下午6:24, Philipp Tomsich
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAAeLtUBJB3-X9nXeyFcsHNgS+peZ+T_ZbAu0hwyaRDT9x69dzA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Tue 14. Sep 2021 at
            11:15, LIU Zhiwei &lt;<a href="mailto:zhiwei_liu@c-sky.com"
              moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
            On 2021/9/11 下午10:00, Philipp Tomsich wrote:<br>
            &gt; Assume clzw being executed on a register that is not
            sign-extended, such<br>
            &gt; as for the following sequence that uses (1ULL &lt;&lt;
            63) | 392 as the operand<br>
            &gt; to clzw:<br>
            &gt;       bseti   a2, zero, 63<br>
            &gt;       addi    a2, a2, 392<br>
            &gt;       clzw    a3, a2<br>
            &gt; The correct result of clzw would be 23, but the current
            implementation<br>
            &gt; returns -32 (as it performs a 64bit clz, which results
            in 0 leading zero<br>
            &gt; bits, and then subtracts 32).<br>
            <br>
            As the MSB word of  a3 has been cleaned,  the result of
            current <br>
            implementation will be 23. So there is no<br>
            error here.</blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Zhiwei,</div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">bits [63:32] on rs (arg1) are not
            zero-extended, as ctx-&gt;w is not being set (the EXT_ZERO
            doesn’t have any effect, unless ctx-&gt;w is true).  Please
            see the earlier discussion on this topic in v9 and v10.</div>
        </div>
      </div>
    </blockquote>
    <p>Yes,  you are right.</p>
    <p>Reviewed-by: LIU Zhiwei<a class="moz-txt-link-rfc2396E" href="mailto:zhiwei_liu@c-sky.com">&lt;zhiwei_liu@c-sky.com&gt;</a></p>
    <p>Zhiwei<br>
    </p>
    <blockquote type="cite"
cite="mid:CAAeLtUBJB3-X9nXeyFcsHNgS+peZ+T_ZbAu0hwyaRDT9x69dzA@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <div dir="auto"><br>
          </div>
          <div dir="auto">Thanks,</div>
          <div dir="auto">Philipp.</div>
          <div dir="auto"><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex" dir="auto">
            Thanks,<br>
            Zhiwei<br>
            <br>
            &gt; Fix this by changing the implementation to:<br>
            &gt;   1. shift the original register up by 32<br>
            &gt;   2. performs a target-length (64bit) clz<br>
            &gt;   3. return 32 if no bits are set<br>
            &gt;<br>
            &gt; Marking this instruction as 'w-form' (i.e., setting
            ctx-&gt;w) would not<br>
            &gt; correctly model the behaviour, as the instruction
            should not perform<br>
            &gt; a zero-extensions on the input (after all, it is not a
            .uw instruction)<br>
            &gt; and the result is always in the range 0..32 (so neither
            a sign-extension<br>
            &gt; nor a zero-extension on the result will ever be
            needed).  Consequently,<br>
            &gt; we do not set ctx-&gt;w and mark the instruction as
            EXT_NONE.<br>
            &gt;<br>
            &gt; Signed-off-by: Philipp Tomsich &lt;<a
              href="mailto:philipp.tomsich@vrull.eu" target="_blank"
              moz-do-not-send="true">philipp.tomsich@vrull.eu</a>&gt;<br>
            &gt; ---<br>
            &gt;<br>
            &gt; Changes in v11:<br>
            &gt; - Swaps out the EXT_ZERO to EXT_NONE, as no extension
            is to be performed.<br>
            &gt;<br>
            &gt; Changes in v10:<br>
            &gt; - New patch, fixing correctnes for clzw called on a
            register with undefined<br>
            &gt;    (as in: not properly sign-extended) upper bits.<br>
            &gt;<br>
            &gt;   target/riscv/insn_trans/trans_rvb.c.inc | 8 +++++---<br>
            &gt;   1 file changed, 5 insertions(+), 3 deletions(-)<br>
            &gt;<br>
            &gt; diff --git a/target/riscv/insn_trans/trans_rvb.c.inc
            b/target/riscv/insn_trans/trans_rvb.c.inc<br>
            &gt; index 6c85c89f6d..73d1e45026 100644<br>
            &gt; --- a/target/riscv/insn_trans/trans_rvb.c.inc<br>
            &gt; +++ b/target/riscv/insn_trans/trans_rvb.c.inc<br>
            &gt; @@ -349,15 +349,17 @@ GEN_TRANS_SHADD(3)<br>
            &gt;   <br>
            &gt;   static void gen_clzw(TCGv ret, TCGv arg1)<br>
            &gt;   {<br>
            &gt; -    tcg_gen_clzi_tl(ret, arg1, 64);<br>
            &gt; -    tcg_gen_subi_tl(ret, ret, 32);<br>
            &gt; +    TCGv t = tcg_temp_new();<br>
            &gt; +    tcg_gen_shli_tl(t, arg1, 32);<br>
            &gt; +    tcg_gen_clzi_tl(ret, t, 32);<br>
            &gt; +    tcg_temp_free(t);<br>
            &gt;   }<br>
            &gt;   <br>
            &gt;   static bool trans_clzw(DisasContext *ctx, arg_clzw
            *a)<br>
            &gt;   {<br>
            &gt;       REQUIRE_64BIT(ctx);<br>
            &gt;       REQUIRE_EXT(ctx, RVB);<br>
            &gt; -    return gen_unary(ctx, a, EXT_ZERO, gen_clzw);<br>
            &gt; +    return gen_unary(ctx, a, EXT_NONE, gen_clzw);<br>
            &gt;   }<br>
            &gt;   <br>
            &gt;   static void gen_ctzw(TCGv ret, TCGv arg1)<br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------F423426C07CC0774EA3196C4--

