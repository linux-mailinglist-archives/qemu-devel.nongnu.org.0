Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9FF655ACC
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 18:09:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p980B-0003yV-6D; Sat, 24 Dec 2022 12:08:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9807-0003y4-Td
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:08:00 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9806-0005ZS-Eq
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:07:59 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 n10-20020a17090a73ca00b00225cbc4dfaeso3104765pjk.3
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 09:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ExtzzUQAabiwgXUluG2TTntedsJ1EafDlIgqAiiooS8=;
 b=Nlo35/0L8YToe1OqQqKLqg+Uwr+8xU1OZQVElfqbFoqkFxaNAnRDFzO+3VFwn0vJvD
 2kbf4oes2fClJlsr99Bi/Y9N8/BdEOLFTpeEBJNca6l26JS3G1WXeb7bMcY4aCqMR8iv
 7211Q+G/+7HagzQC0beTQop/j7t4XBoE+H+edGe7LRvsTUUKVxXjdP3CPmaF6i9+orA6
 IS4ZnQh+mACSB7SezZstZjl8zbqGagpiBe+mh9QNcaX4uHhIw4nqiXtasz6fS+nl6lbO
 AWs/jItov89wmh++IP1L54PCaGo1mVQD7iA6ydkZgAmU0PnVH9V/LYOaCvKDgTXLR8jt
 tuxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ExtzzUQAabiwgXUluG2TTntedsJ1EafDlIgqAiiooS8=;
 b=ebduEIWmMdNR+8b+Y+OGb3NkGAEfqrC1Ssbrmw/XgEL4s5VPJy9wL1C0yQ2wlwXoaP
 5LaGacgKS+YFrJX3bskHnPFHuUx6egkis4CWwE4N/N0aHeoDPAa2/+yWdC4uYJ5kVfye
 W3CXBXnrDYvPGxuzSMO67j+NthqB020tPfP9N8n6AhJhlO6T/5jZi64OAfpLxW2aAE+0
 I+ykrp93MghrRbxNaY81DbOGkpr51vv1XhGbMXpCcd0NI4hHeckLEPh6L53+sCwOttde
 GUEb2ceN+45JKrdmdCAx348522AuEqbNNoLqn/SEnscAl5Yx/qnEG/HwxlFF53wuCQ8c
 Cufg==
X-Gm-Message-State: AFqh2kr+9/gy10QaS63eMKTvOGHlii7/3hJFlgGii8Tf0u7PczFsOc3P
 XF3u7XKKjdC6D1ZD/d/sgZT8HA==
X-Google-Smtp-Source: AMrXdXsKxCwRWF++oTOkFuEmgWYZOblmJAiwhESP2jsTSdmJTXfUzkQGMSvGd5Du/Z8ftuaikNx9Iw==
X-Received: by 2002:a17:903:2052:b0:190:ec3f:7362 with SMTP id
 q18-20020a170903205200b00190ec3f7362mr13276710pla.42.1671901671533; 
 Sat, 24 Dec 2022 09:07:51 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a170902ec8200b0017f72a430adsm4364039plg.71.2022.12.24.09.07.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 09:07:50 -0800 (PST)
Message-ID: <86018c2b-7773-473d-328d-c11a41406532@linaro.org>
Date: Sat, 24 Dec 2022 09:07:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 01/43] target/loongarch: Add vector data type vec_t
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-2-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/24/22 00:15, Song Gao wrote:
> +#define LSX_LEN   (128)
> +typedef union vec_t vec_t;
> +union vec_t {
> +    int8_t   B[LSX_LEN / 8];
> +    int16_t  H[LSX_LEN / 16];
> +    int32_t  W[LSX_LEN / 32];
> +    int64_t  D[LSX_LEN / 64];
> +    __int128 Q[LSX_LEN / 128];
> +};
> +
> +typedef union fpr_t fpr_t;
> +union fpr_t {
> +    uint64_t d;
> +    vec_t vec;
> +};

You need to think about host endianness with this overlap and indexing.

There are two different models which can be emulated:

(1) target/{arm,s390x}/ has each uint64_t in host-endian order, but the words are indexed 
little-endian.  See, for instance, target/s390x/tcg/vec.h.

(2) target/{ppc,i386}/ has the entire vector in host-endian order.  See, for instance, 
ZMM_* in target/i386/cpu.h.

If you do nothing, I assume this will fail on a big-endian host.


r~

