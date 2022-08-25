Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81BC5A0943
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 08:57:14 +0200 (CEST)
Received: from localhost ([::1]:53492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR6nh-0008Lj-5U
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 02:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oR6ff-0003SN-Cg
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 02:48:57 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oR6fc-00018U-8U
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 02:48:55 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so2122434wmk.3
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 23:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=/9XDr49Gi57NeWmiKqv0ke5gZ3ZqEB7c+slLklAGum0=;
 b=KvdbPp+Drdhjzd/DfpAm8M4LxUC5P7GxEw/8OCQigSk2JuQBEDUci7gMm0245DKsdz
 qT9M33oJ/7q+jyFNlUlCQkB943GigLHTF2DYHL3iEpe/B9DlT7ti/vVShv4yXA3VK+x5
 l2/6LGOXuQI1KzLvy0SO/7jQUdEZw8KIv47VdmH04IqWbL+OVlT9HUktIhT8mNVT9UeA
 OJg62CxfknLLxwbtwuZn0eIY4U58n27TSWEC+yyjtOMvuLALttEJj5Q8/OCu+/SCZA+r
 4gdOiAgsvo30uz4Vnj6fa2rJpn9sDk1OUG8l981kQQdHieRP3b0OpJfoDceT3+QjN37a
 Y+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=/9XDr49Gi57NeWmiKqv0ke5gZ3ZqEB7c+slLklAGum0=;
 b=EONJl11pMrKc67SVQ6TRLM0sOJbOxUYQRQNiz8eMXnMupfA3/1RONL/V7Mv188I7zf
 Uyc7mOXYnazOCHa+cIYo7+w3nbR791ETfEzgsvM2wreWB5wViU7E3/5K8UvycRx/v2s/
 JDh6PGrb7OA+V9NoVNI8NY/SugJ7uQ8AmNVlM9hRn/PxOTToKt8fZp0jAZQlsfnF0hdS
 HbWlINrwoBNICa1Dkcf5750wVo8PZOejIVFMrw6j7xi+y7HE0U4pbX4PFT/M2263zK3B
 E7SiE0y9jJ9D4fAG8t5ELoHOyhYgPGJe726bEzeYF8UknFs2Z9/r74X0aB5VOVfGij9M
 wx1g==
X-Gm-Message-State: ACgBeo1P41xa0OEZ8Vp2dq76ckWy96MlyY2UytTqHW+ZG+ocLrT3noFu
 PRB19celhKnhog+JZSqu7Us=
X-Google-Smtp-Source: AA6agR53WeGQ+H5M8Tig4mHxE6w32oGfiev3kgdglUhoWFVUY+eKkSdRqlpy1TQhP96f9gH1Y3uiiA==
X-Received: by 2002:a05:600c:1593:b0:3a6:36fc:842f with SMTP id
 r19-20020a05600c159300b003a636fc842fmr1275292wmf.52.1661410130332; 
 Wed, 24 Aug 2022 23:48:50 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 w6-20020a5d4b46000000b002205a5de337sm18575024wrs.102.2022.08.24.23.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 23:48:49 -0700 (PDT)
Message-ID: <577bfd2b-090f-d324-6a76-5b851a87e905@redhat.com>
Date: Thu, 25 Aug 2022 08:48:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 04/17] target/i386: add ALU load/writeback core
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220824173123.232018-1-pbonzini@redhat.com>
 <20220824173123.232018-5-pbonzini@redhat.com>
 <7b4759db-6592-2bc2-25f6-a762e8a83c26@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <7b4759db-6592-2bc2-25f6-a762e8a83c26@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/22 02:23, Richard Henderson wrote:
>> +    op->v = v;
>> +}
> 
> Surely this assignment...
> 
>> +static void gen_writeback(DisasContext *s, X86DecodedOp *op)
>> +{
> ...
>> +    case X86_ALU_GPR:
>> +        gen_op_mov_reg_v(s, op->ot, op->n, s->T0);
> 
> ... can be used here instead of hard-coding T0.  It should be easy 
> enough to create *_v editions of all *_T0, such as gen_movl_seg_T0.

No, decode.op[0].v is never initialized.

In fact, even decode.op[1].v and decode.op[2].v are never used, the 
gen_* functions just hardcode T0 = f(T0, T1).

Paolo

