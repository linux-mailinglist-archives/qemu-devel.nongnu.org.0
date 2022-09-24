Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1660A5E8FCE
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 23:26:33 +0200 (CEST)
Received: from localhost ([::1]:33624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocCfP-0002oV-BS
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 17:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCdy-0001TS-63
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 17:25:02 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:42979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCdw-0001oi-Dg
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 17:25:01 -0400
Received: by mail-qt1-x834.google.com with SMTP id w2so2053592qtv.9
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 14:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=xSIJIj9kNj6XMCKmx4OXMC2UNMXSfrecRNkS7Nmz+PI=;
 b=u5kPDK4eHRgZHYvIgvRRIJirVGwCIL5qDnsqGGdNvzIePAFXk+OP+JMRUOz8j8C2En
 nMdPQ/S06kDPdIzbyOXlCLVdMkxovf1AteIqNN7L/VQFZbLmq4wcvoQ2yUeVOov94aCH
 TjrcuIE+EZRMnnMqAyY+tpgfnj2hMuN/SA0I2K99Fl+9Kz5NpqHMurNUo+73/0JPnzo8
 ltaWgVPRoHhkJRmb1P0/Ax8k1X2gTQjQrKVkzHx6oM7jprck8jAVjKi+MVV7JV2nScGA
 r6yVFuVvYjAYnh7b+8bUSZ9X0PZf/XVgUxlGpPez2bhTHjxdED5MwouAM1809h0KZF+u
 3yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=xSIJIj9kNj6XMCKmx4OXMC2UNMXSfrecRNkS7Nmz+PI=;
 b=d2iw6JsZTyvRaakBxe00kVsKTP6ceFnI1fKnzzuUY13rboy3+6G7uY2gPMz7CNee/b
 CmkIhB5Z9J0GAfMn14q5daxq4FM9O+bwVAs2n2Vw8w2Aq6MqG/tWr4TTOUBsSFF3p2cw
 mnpwr48/ouWTjX44ee8IrU78x3MJ0vNvhlM3AOw/vd/CqtCOy4yivZ5cprcQkjE9g4R0
 /kBOY6LBKW0IW8L9adPb8L1kkhzTYfPcxIky6aRe7WlEdXUyRhIxxzYhUhP/psppYY1s
 +h8av0ChhUlahYhwG2vMtU7jGUhcQ3OwfAEYhqVSZW2ODAdHfdeJGLyC4DUEwIyzCVX+
 qt0Q==
X-Gm-Message-State: ACrzQf3m1cAWks9RQkoS8YLyVh7zVWtK4Nhj65Bu/28U+0OinOylqorz
 GhVX79GtodQ3Xes4aEtq2d5Jow==
X-Google-Smtp-Source: AMsMyM6SFgP3lJ0ZcHavUlmbxBEwnZaDF+H4Y/IgnrSSjPCVwUsbF/x9HETYEqmNKP8X8v2oai0oUQ==
X-Received: by 2002:ac8:7c49:0:b0:35d:ac1:66ca with SMTP id
 o9-20020ac87c49000000b0035d0ac166camr12384463qtv.405.1664054699053; 
 Sat, 24 Sep 2022 14:24:59 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3?
 ([2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3])
 by smtp.gmail.com with ESMTPSA id
 203-20020a3706d4000000b006cf36d46902sm8466578qkg.66.2022.09.24.14.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 14:24:58 -0700 (PDT)
Message-ID: <90479d59-e63c-3330-fa3f-e45e013c3d8b@linaro.org>
Date: Sat, 24 Sep 2022 21:24:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 36/37] target/i386: move 3DNow to the new decoder
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-37-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-37-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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

On 9/20/22 17:25, Paolo Bonzini wrote:
> This adds another kind of weirdness when you thought you had seen it all:
> an opcode byte that comes_after_  the address, not before.  It's not
> worth adding a new X86_SPECIAL_* constant for it, but it's actually
> not unlike VCMP; so, forgive me for exploiting the similarity and just
> deciding to dispatch to the right gen_helper_* call in a single code
> generation function.
> 
> In fact, the old decoder had a bug where s->rip_offset should have
> been set to 1 for 3DNow! instructions, and it's fixed now.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/decode-new.c.inc | 10 +++++
>   target/i386/tcg/decode-new.h     |  1 +
>   target/i386/tcg/emit.c.inc       | 61 +++++++++++++++++++++++++++
>   target/i386/tcg/translate.c      | 71 +-------------------------------
>   4 files changed, 74 insertions(+), 69 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

