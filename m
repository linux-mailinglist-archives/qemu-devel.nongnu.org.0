Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D382A4C37AE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 22:26:30 +0100 (CET)
Received: from localhost ([::1]:59648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNLd7-0007vt-MF
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 16:26:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNLbm-0006xi-38
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 16:25:06 -0500
Received: from [2607:f8b0:4864:20::42e] (port=34666
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNLbh-00061B-8y
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 16:25:03 -0500
Received: by mail-pf1-x42e.google.com with SMTP id g1so2979798pfv.1
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 13:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hXtFZZRtGHyhfgJsMOW0/NWYcY+NoLVbQG6OaEGdK6A=;
 b=uvbO3u/sJSozH0dX4+N16722YI3DEK7hJsJeLRMY1WZh1U44yV6DhbSBzQhXN53RbB
 DCrrIc5AbS77AQbCIdsSM79xjXUcrBq56uJArS30MUkyYkYY57FAORCrJ+sBMuMDdgUY
 G1yNwFJUl818ENhXsjWIu34Z83pY3RXpzA6OKd+QklcCW+iUmtCJgZWRnH8zXI5utt2J
 7RxMDuHg0RVXb+hIFlDIbzn1Oh7nUhXNOW8kkfB6Vo56t69/qxFdZghf4UhqWeO/ry+T
 /UtrXvUjKEyUCuHwtkhroGLL4hBoVYgzLhd1HAtofAsO/rbuBXG/2oxHNeWVgdGsomjW
 2wlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hXtFZZRtGHyhfgJsMOW0/NWYcY+NoLVbQG6OaEGdK6A=;
 b=gC/0aheTCaW4nEi5hTOf9bbUZ+wLZiA4Qv/qT+E+r+CvVMiUM6TZgiYoGp6A7DPAgx
 tTnCIxIGS0nFTcHIHZq3OrvlE9fXuWp2tj+mVCzrnHRfw6LcLHHUwF6LX+4+ibgJt8j/
 IYBlQmXEVHXJDTw0Sh6paaFqHb+d2/q488m/lTkIFQPM5a0J51l011J+Uwny1firdSTD
 Ec3hgo9Iv7HXTGHyrQHZwqodBQk0hIzH29au6jg5kRfxY7st1GmUdEumA115x2E5WcBr
 LXRFxc1Gr55TlK+aK+d5rj/h4mXQf6FKHhe8Jv0AImS+MuEYVC6grYsGFVU7WxZiguLO
 VKLw==
X-Gm-Message-State: AOAM533FRk+3hX5Ih2NvOzKfkddbE3pbgXpYxMbLre1UCS7nBqAG1ZsB
 tX7o2hV5klHK+vVtnKgaOmi+sw==
X-Google-Smtp-Source: ABdhPJyRNOFWFl2WxkCQq3En+EbfooepdMoPHTLu/CNbdwK6r+tsDLV8Emd8o5D2r61pIWhIq/ndjw==
X-Received: by 2002:a05:6a00:2296:b0:4e1:3029:ee2 with SMTP id
 f22-20020a056a00229600b004e130290ee2mr4382981pfe.22.1645737899144; 
 Thu, 24 Feb 2022 13:24:59 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 j19-20020a62b613000000b004e1b0df0713sm359525pff.188.2022.02.24.13.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 13:24:58 -0800 (PST)
Message-ID: <2d7941f4-caa9-d3a7-3528-1a9cff8f048e@linaro.org>
Date: Thu, 24 Feb 2022 11:24:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 38/47] target/ppc: Refactor VSX_SCALAR_CMP_DP
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-39-matheus.ferst@eldorado.org.br>
 <c4e1ed69-62a7-dfa8-302e-c74845803098@linaro.org>
 <b8280b17-4124-92ce-c647-95de039f31d3@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b8280b17-4124-92ce-c647-95de039f31d3@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 09:16, Víctor Colombo wrote:
> Could you please elaborate more on how do you think using
> float*_compare and its FloatRelation result would work here?
> I noticed do_scalar_cmp modifies CR and sets FPCC flag, which
> is not what VSX_SCALAR_CMP do. Using that function would require a
> rework.
> 
> An option I though would be to bring into VSX_SCALAR_CMP the
> important necessary parts, something like this:
> 
> #define VSX_SCALAR_CMP(op, tp, cmp, fld, svxvc, expr)       ...
>      r = tp##_compare(xa->fld, xb->fld, &env->fp_status);        \
>      if (expr) {        \
>          memset(&t.fld, 0xFF, sizeof(t.fld));        \
>      } else if (r == float_relation_unordered) {        \
>          if (env->fp_status.float_exception_flags & float_flag_invalid_snan) { \
>              float_invalid_op_vxsnan(env, GETPC());        \
>              if (fpscr_ve == 0 && svxvc) {        \
>                  float_invalid_op_vxvc(env, 0, GETPC());        \
>              }        \
>          } else if (svxvc) {        \
>              if (tp##_is_quiet_nan(xa->fld, &env->fp_status) ||        \
>                  tp##_is_quiet_nan(xb->fld, &env->fp_status)) {        \
>                      float_invalid_op_vxvc(env, 0, GETPC());        \
>                  }        \
>          }        \
>      }        \
> ...
> VSX_SCALAR_CMP(XSCMPEQDP, float64, eq, VsrD(0), 0, r == float_relation_equal)
> VSX_SCALAR_CMP(XSCMPGEDP, float64, le, VsrD(0), 1, \
>      r == float_relation_equal || r == float_relation_greater)
> VSX_SCALAR_CMP(XSCMPGTDP, float64, lt, VsrD(0), 1, r == float_relation_greater)

I was thinking along the lines of:

     bool r;
     int flags;

     helper_reset_fpstatus(env);
     if (svxvc) {
         r = tp##cmp(...);
     } else {
         r = tp##cmp##_quiet(...);
     }

     flags = get_float_exception_flags(&env->fp_status);
     if (unlikely(flags & float_flag_invalid)) {
         bool vxvc = svxvc;
         if (flags & float_flag_invalid_snan)) {
             float_invalid_op_vxsnan(...);
             vxvc &= fpscr_ve == 0;
         }
         if (vxvc) {
             float_invalid_op_vxvc(...);
         }
     }

     memset(xt, 0, sizeof(*xt));
     memset(&xt->fld, -r, sizeof(xt->fld));
     do_float_check_status(...);


r~

