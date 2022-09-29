Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C80D85EFA76
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 18:29:10 +0200 (CEST)
Received: from localhost ([::1]:49626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odwPN-0001ve-Cx
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 12:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odvF3-0005hV-Eq
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:14:25 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odvF1-0004ab-HG
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:14:25 -0400
Received: by mail-pg1-x52c.google.com with SMTP id s26so1716825pgv.7
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 08:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
 bh=+VW5h6ZWtTsESn7LA2BVft0kZ9W7rqCrLSKlGUA/qq0=;
 b=N0BoAZeou8bVUu01IDuwYB7tPrcTVB2wQNiNfPUYLLfql3rx17PB3ji2Rz9DkHAP2h
 dPy7xPR3kSjac0Q00eYn3cXmbMj0or59bvTuYGDmAluweJeVge/mtggj6cfW1Le6Hz7o
 obzDYppNnmojyjJEUzGmCOjTkF+UT6shAXGaMw/jrW4sLtOVY8IsRok3q42DUQq/wLRS
 mzfj8rdRWNOlJhTZEkfVYKS3W5EI1kb1m9zwyaN31aVR3ocRdR7rx7Fp59Z6duoqDgib
 JbcOBqq/cRWjusWmJlL7zM/aEDNA0yqlR5ZTlDV5Lpukai/oE4ouesHcR9fJOuFD6+NT
 Sw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date;
 bh=+VW5h6ZWtTsESn7LA2BVft0kZ9W7rqCrLSKlGUA/qq0=;
 b=oACgn1/Ut5Uh7kCPUaZtXvtoNMXD1DYgzG0nfH9bmZfcWOnQeb5n0hwbsuMSqllI4r
 P+SzNpmbBDBc/z87cBqsS3Jg6rwKQASyAtvY96GhLAmWcBrS07h+eeCyMF6zkZT6D5nQ
 PSBiRPQBilIvxuETdtzEHasF+WTcHicmVA2bDYBJJdek0KFF/UUZ66Wmnm0ZF3pgmyRA
 T2UYlsxt0wwVJeEvHTcYDNjcjh1fW36LdLU01eyTfJIJqpBQpTPfi4P5f84hp/NX7oHd
 I1BzmRAQMtpFEOI644hUSqen04BUASoNR2PYouwNqXANSKw1/ui1/5hRmaxpgWCK7NZx
 +UPQ==
X-Gm-Message-State: ACrzQf0PKuXlpyi4wWPnvOj/1zwtouPjQYiyn4dNuciAyAqAuclZrpur
 dY9z77T/gz+dBG6Ivbqq+vWnsA==
X-Google-Smtp-Source: AMsMyM4JqxuiHh8sKRfsxC7PpS9C0oaxNzni9bfN3zuFHPHKvQHtgUVHAncI4WI1iCfEmmhMlfOoYQ==
X-Received: by 2002:a63:34c5:0:b0:439:a5df:c712 with SMTP id
 b188-20020a6334c5000000b00439a5dfc712mr3286122pga.563.1664464461401; 
 Thu, 29 Sep 2022 08:14:21 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:d5c8:ddf6:4bcd:e3c7?
 ([2602:47:d49d:ec01:d5c8:ddf6:4bcd:e3c7])
 by smtp.gmail.com with ESMTPSA id
 w198-20020a627bcf000000b0052d2b55be32sm6501553pfc.171.2022.09.29.08.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 08:14:20 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------KTFES9ayswJcj6lexsTO6C4z"
Message-ID: <df8ec1eb-f7e4-579b-74cf-d27a85ec6047@linaro.org>
Date: Thu, 29 Sep 2022 08:14:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/4] target/loongarch: bstrins.w need set dest register
 EXT_SIGN
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: yangxiaojuan@loongson.cn, huqi@loongson.cn, peter.maydell@linaro.org,
 alex.bennee@linaro.org, maobibo@loongson.cn
References: <20220927064838.3570928-1-gaosong@loongson.cn>
 <20220927064838.3570928-3-gaosong@loongson.cn>
 <fa9bc59a-a617-a243-7bf4-bc1f07db1a46@linaro.org>
 <c330da65-8069-4ec9-929e-15b2a1b2c47b@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c330da65-8069-4ec9-929e-15b2a1b2c47b@loongson.cn>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.099,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is a multi-part message in MIME format.
--------------KTFES9ayswJcj6lexsTO6C4z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/29/22 00:27, gaosong wrote:
> 
> 在 2022/9/28 下午11:13, Richard Henderson 写道:
>> On 9/26/22 23:48, Song Gao wrote:
>>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>>> ---
>>>   target/loongarch/insn_trans/trans_bit.c.inc | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/target/loongarch/insn_trans/trans_bit.c.inc 
>>> b/target/loongarch/insn_trans/trans_bit.c.inc
>>> index 9337714ec4..33e94878fd 100644
>>> --- a/target/loongarch/insn_trans/trans_bit.c.inc
>>> +++ b/target/loongarch/insn_trans/trans_bit.c.inc
>>> @@ -37,7 +37,7 @@ static bool gen_rr_ms_ls(DisasContext *ctx, arg_rr_ms_ls *a,
>>>                            DisasExtend src_ext, DisasExtend dst_ext,
>>>                             void (*func)(TCGv, TCGv, unsigned int, unsigned int))
>>>   {
>>> -    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
>>> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
>>>       TCGv src1 = gpr_src(ctx, a->rj, src_ext);
>>>         if (a->ls > a->ms) {
>>> @@ -206,7 +206,7 @@ TRANS(maskeqz, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_maskeqz)
>>>   TRANS(masknez, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_masknez)
>>>   TRANS(bytepick_w, gen_rrr_sa, EXT_NONE, EXT_NONE, gen_bytepick_w)
>>>   TRANS(bytepick_d, gen_rrr_sa, EXT_NONE, EXT_NONE, gen_bytepick_d)
>>> -TRANS(bstrins_w, gen_rr_ms_ls, EXT_NONE, EXT_NONE, gen_bstrins)
>>> +TRANS(bstrins_w, gen_rr_ms_ls, EXT_NONE, EXT_SIGN, gen_bstrins)
>>
>> These two hunks do opposite things: change dst_ext from NONE to SIGN, and then ignore 
>> the change.
>>
>> I assume the first hunk is in fact in error.
>>
> rd is also a src register,    rd should be src_dst.
> 
>      TCGv dest = gpr_src(ctx, a->rd, src_dst);   what about this?

Ah, I see the problem.  We're sharing a helper meant for unary operations for an 
instruction that is a binary operation with an in+out operand.

I suggest not attempting to share code between bstrins and bstrpick, like so.


r~

--------------KTFES9ayswJcj6lexsTO6C4z
Content-Type: text/plain; charset=UTF-8; name="bstrins.txt"
Content-Disposition: attachment; filename="bstrins.txt"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3RhcmdldC9sb29uZ2FyY2gvaW5zbl90cmFucy90cmFuc19iaXQuYy5p
bmMgYi90YXJnZXQvbG9vbmdhcmNoL2luc25fdHJhbnMvdHJhbnNfYml0LmMuaW5jCmluZGV4
IDkzMzc3MTRlYzQuLmIwMWU0YWViMjMgMTAwNjQ0Ci0tLSBhL3RhcmdldC9sb29uZ2FyY2gv
aW5zbl90cmFucy90cmFuc19iaXQuYy5pbmMKKysrIGIvdGFyZ2V0L2xvb25nYXJjaC9pbnNu
X3RyYW5zL3RyYW5zX2JpdC5jLmluYwpAQCAtMjcsMjYgKzI3LDM0IEBAIHN0YXRpYyB2b2lk
IGdlbl9ieXRlcGlja19kKFRDR3YgZGVzdCwgVENHdiBzcmMxLCBUQ0d2IHNyYzIsIHRhcmdl
dF9sb25nIHNhKQogICAgIHRjZ19nZW5fZXh0cmFjdDJfaTY0KGRlc3QsIHNyYzEsIHNyYzIs
ICg2NCAtIHNhICogOCkpOwogfQogCi1zdGF0aWMgdm9pZCBnZW5fYnN0cmlucyhUQ0d2IGRl
c3QsIFRDR3Ygc3JjMSwKLSAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBs
cywgdW5zaWduZWQgaW50IGxlbikKK3N0YXRpYyBib29sIGdlbl9ic3RyaW5zKERpc2FzQ29u
dGV4dCAqY3R4LCBhcmdfcnJfbXNfbHMgKmEsCisgICAgICAgICAgICAgICAgICAgICAgICBE
aXNhc0V4dGVuZCBkc3RfZXh0KQogewotICAgIHRjZ19nZW5fZGVwb3NpdF90bChkZXN0LCBk
ZXN0LCBzcmMxLCBscywgbGVuKTsKLX0KLQotc3RhdGljIGJvb2wgZ2VuX3JyX21zX2xzKERp
c2FzQ29udGV4dCAqY3R4LCBhcmdfcnJfbXNfbHMgKmEsCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgRGlzYXNFeHRlbmQgc3JjX2V4dCwgRGlzYXNFeHRlbmQgZHN0X2V4dCwKLSAgICAg
ICAgICAgICAgICAgICAgICAgICB2b2lkICgqZnVuYykoVENHdiwgVENHdiwgdW5zaWduZWQg
aW50LCB1bnNpZ25lZCBpbnQpKQotewotICAgIFRDR3YgZGVzdCA9IGdwcl9kc3QoY3R4LCBh
LT5yZCwgZHN0X2V4dCk7Ci0gICAgVENHdiBzcmMxID0gZ3ByX3NyYyhjdHgsIGEtPnJqLCBz
cmNfZXh0KTsKKyAgICBUQ0d2IHNyYzEgPSBncHJfc3JjKGN0eCwgYS0+cmQsIEVYVF9OT05F
KTsKKyAgICBUQ0d2IHNyYzIgPSBncHJfc3JjKGN0eCwgYS0+cmosIEVYVF9OT05FKTsKKyAg
ICBUQ0d2IGRlc3QgPSBncHJfZHN0KGN0eCwgYS0+cmQsIEVYVF9OT05FKTsKIAogICAgIGlm
IChhLT5scyA+IGEtPm1zKSB7CiAgICAgICAgIHJldHVybiBmYWxzZTsKICAgICB9CiAKLSAg
ICBmdW5jKGRlc3QsIHNyYzEsIGEtPmxzLCBhLT5tcyAtIGEtPmxzICsgMSk7CisgICAgdGNn
X2dlbl9kZXBvc2l0X3RsKGRlc3QsIHNyYzEsIHNyYzIsIGEtPmxzLCBhLT5tcyAtIGEtPmxz
ICsgMSk7CiAgICAgZ2VuX3NldF9ncHIoYS0+cmQsIGRlc3QsIGRzdF9leHQpOworICAgIHJl
dHVybiB0cnVlOworfQogCitzdGF0aWMgYm9vbCBnZW5fYnN0cnBpY2soRGlzYXNDb250ZXh0
ICpjdHgsIGFyZ19ycl9tc19scyAqYSwKKyAgICAgICAgICAgICAgICAgICAgICAgICBEaXNh
c0V4dGVuZCBkc3RfZXh0KQoreworICAgIFRDR3YgZGVzdCA9IGdwcl9kc3QoY3R4LCBhLT5y
ZCwgRVhUX05PTkUpOworICAgIFRDR3Ygc3JjMSA9IGdwcl9zcmMoY3R4LCBhLT5yaiwgRVhU
X05PTkUpOworCisgICAgaWYgKGEtPmxzID4gYS0+bXMpIHsKKyAgICAgICAgcmV0dXJuIGZh
bHNlOworICAgIH0KKworICAgIHRjZ19nZW5fZXh0cmFjdF90bChkZXN0LCBzcmMxLCBhLT5s
cywgYS0+bXMgLSBhLT5scyArIDEpOworICAgIGdlbl9zZXRfZ3ByKGEtPnJkLCBkZXN0LCBk
c3RfZXh0KTsKICAgICByZXR1cm4gdHJ1ZTsKIH0KIApAQCAtMjA2LDcgKzIxNCw3IEBAIFRS
QU5TKG1hc2tlcXosIGdlbl9ycnIsIEVYVF9OT05FLCBFWFRfTk9ORSwgRVhUX05PTkUsIGdl
bl9tYXNrZXF6KQogVFJBTlMobWFza25leiwgZ2VuX3JyciwgRVhUX05PTkUsIEVYVF9OT05F
LCBFWFRfTk9ORSwgZ2VuX21hc2tuZXopCiBUUkFOUyhieXRlcGlja193LCBnZW5fcnJyX3Nh
LCBFWFRfTk9ORSwgRVhUX05PTkUsIGdlbl9ieXRlcGlja193KQogVFJBTlMoYnl0ZXBpY2tf
ZCwgZ2VuX3Jycl9zYSwgRVhUX05PTkUsIEVYVF9OT05FLCBnZW5fYnl0ZXBpY2tfZCkKLVRS
QU5TKGJzdHJpbnNfdywgZ2VuX3JyX21zX2xzLCBFWFRfTk9ORSwgRVhUX05PTkUsIGdlbl9i
c3RyaW5zKQotVFJBTlMoYnN0cmluc19kLCBnZW5fcnJfbXNfbHMsIEVYVF9OT05FLCBFWFRf
Tk9ORSwgZ2VuX2JzdHJpbnMpCi1UUkFOUyhic3RycGlja193LCBnZW5fcnJfbXNfbHMsIEVY
VF9OT05FLCBFWFRfU0lHTiwgdGNnX2dlbl9leHRyYWN0X3RsKQotVFJBTlMoYnN0cnBpY2tf
ZCwgZ2VuX3JyX21zX2xzLCBFWFRfTk9ORSwgRVhUX05PTkUsIHRjZ19nZW5fZXh0cmFjdF90
bCkKK1RSQU5TKGJzdHJpbnNfdywgZ2VuX2JzdHJpbnMsIEVYVF9TSUdOKQorVFJBTlMoYnN0
cmluc19kLCBnZW5fYnN0cmlucywgRVhUX05PTkUpCitUUkFOUyhic3RycGlja193LCBnZW5f
YnN0cnBpY2ssIEVYVF9TSUdOKQorVFJBTlMoYnN0cnBpY2tfZCwgZ2VuX2JzdHJwaWNrLCBF
WFRfTk9ORSkK

--------------KTFES9ayswJcj6lexsTO6C4z--

