Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5017B28D672
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 00:33:52 +0200 (CEST)
Received: from localhost ([::1]:54794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSSrf-0000xh-Dq
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 18:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSSpW-0000EO-QW
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 18:31:39 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSSpU-000051-2n
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 18:31:37 -0400
Received: by mail-pf1-x442.google.com with SMTP id w21so717205pfc.7
 for <qemu-devel@nongnu.org>; Tue, 13 Oct 2020 15:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Xct8EB2JXJGbJ3zKytAaLNNDCzXsSOE2AkEo2n5lLUc=;
 b=soWFH3Mr/4mmAuLL6ZtplFJY/h9isZh2f5fqwNZFtrhH+0aQA5paKpn1c+iWBENExf
 jzuTkHbyg29lHM8GbUS2dTbkh+5iU3wWa7jE4D6pU7IGnY53b3SAW+X2RwSG95PlYLid
 Oknkd5+9Hj1X2c/XioRVGnHtaZtYBUe7rAzMcev5iyXLjWxJaqXYTqLiFpBpU0351lJU
 v7yiuimsvPUMBdyCgYS0MFuDxBr+j7bLWATgbR/V6Fiqyn6Zje3zk95NITZoCMXnIwDW
 /EY74w62f0yq6JuZWw3izEiewJfRwcGbCD18O4+JywzIsOCoiv8i1k23mXC5ugoQgHw5
 Jzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xct8EB2JXJGbJ3zKytAaLNNDCzXsSOE2AkEo2n5lLUc=;
 b=g0TSmHr+ZZ9N7i3pZRpmpakTLJrTlsh0jTkrFJfVszP5AfYZdxAk/9lS86M6dSDpIU
 GNV5T2cLiqi9uYn6faY+Y1qelc0c89RBBXgTUqkb7rrutf++JiVoswN2UGOxL5UpZT8u
 XUKgpY8qsikolbu8EAnzaHME/BI71JcquBegCvL6j1aLdDrwiEB9Y5QPMk90o7oLYB1r
 WWw0RgETevYWDRuoZ8eAoZL9v8onjRxdMTkSYHA4QXA8fhdq7q+PcUxqCHLCtrKa9Re/
 /awnDa758sbwMUVEODhh+NEK2lHG4I+fb/tCJYYub9ASgeSFX1hJzs229HttokL5b1NX
 b57g==
X-Gm-Message-State: AOAM5320nFGcycMUfor7JCciRecC6dStUlcDRNpBB0hwaQUdVCoN3xvK
 ijMU9zd8kHsgxdtXoyYfHKSzYpbCA5k9Ig==
X-Google-Smtp-Source: ABdhPJyBBbq1caDu2kVOpDIacGYUb29bI34USsu9N25IxM2qH05UvbQCHDEq38dxXcyTy9L4ilBT5Q==
X-Received: by 2002:a63:5f97:: with SMTP id t145mr1397852pgb.115.1602628292207; 
 Tue, 13 Oct 2020 15:31:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a4sm731440pgl.51.2020.10.13.15.31.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 15:31:31 -0700 (PDT)
Subject: Re: [PATCH 07/10] target/arm: Implement v8.1M low-overhead-loop
 instructions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201012153746.9996-1-peter.maydell@linaro.org>
 <20201012153746.9996-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ad79b081-211a-a591-4de1-7fb0096d331f@linaro.org>
Date: Tue, 13 Oct 2020 15:31:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012153746.9996-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/20 8:37 AM, Peter Maydell wrote:
> +    nextlabel = gen_new_label();
> +    tcg_gen_brcondi_i32(TCG_COND_NE, cpu_R[a->rn], 0, nextlabel);
> +    gen_jmp(s, read_pc(s) + a->imm);
> +
> +    gen_set_label(nextlabel);
> +    tmp = load_reg(s, a->rn);
> +    store_reg(s, 14, tmp);
> +    gen_jmp(s, s->base.pc_next);
> +    return true;

Oh, fwiw, with the tcg optimization patches just posted, this branch is better
inverted.  That way the load of rn can be reused on the non-taken branch path.

Maybe sometime I'll try to propagate the data to the taken path, but that
automatically requires extra memory allocation, so it'll be difficult to do
that without a tcg slowdown.


r~

