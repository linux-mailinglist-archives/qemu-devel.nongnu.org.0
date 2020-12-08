Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F332D35C8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:09:43 +0100 (CET)
Received: from localhost ([::1]:58870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlAw-0002kL-Sy
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:09:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kml7d-00010l-0a
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:06:14 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kml7Z-00040Z-L4
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:06:12 -0500
Received: by mail-ot1-x344.google.com with SMTP id y24so271171otk.3
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 14:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MGDLM4skllCoDmoEk+etig/If787U2zDrg6DgpVHTno=;
 b=rCbe3+/XPmFCHDirAutZtQSLmnLl65wBbcvTbTFXLlZlFTp9AE2BNM6Ul60D08tvcD
 CNAx8B4GZtXOK1Oo0q+S9KlZqhuKlEp2U3uvf4Ml0sBI6TJi52q2d7yjPBio8ti7GUJK
 eAWbq4kY6Z8Nsi1gfv3EjB3b9B/jU+YjgQvqFmXWEasC1FbKZVkaxGGBMh9GQmQjz2jc
 1fzAdeIm5jrwlv7lWXzGfsxSdw2/OgooajyXd47RbE8fdhaB195pDmCQ5U0Crb3W6M0O
 syfgAMnoX12iNiy31MIJQjflGIs15eb9980yA+YquFtTjGFv+J1I3MQtDHGjYbcorMK4
 NzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MGDLM4skllCoDmoEk+etig/If787U2zDrg6DgpVHTno=;
 b=meBMqmotUzo4ocJXKbwsC/COWR46K6j3nMUssVg9WX8OlcM4dySiwA6cH6letR9C5w
 h+TGfYZ17LPp5bFAx62cleS7sqg/cD3by9YEV1+XwKe+u0w9g1etMteqxK7hdA4Jid44
 tCNwbs3yEf0LP9omefU6dpyHTkFPECHQ7llzd9LA1hiCXRF7xRjdrL3mVzuHvypAeQnq
 FLu2k6EeIcIh5yj6h4xnpMi6gHYFe0bLNsnPzTqwwL/Y1BpSFsje7Q5Tgz14ZNCMDnf/
 DeziHSVNVJOmAredu+YaZBrCIAjlIq8TtzLjrYS+YpgjG/FSuQ/JdUBhD2kHLWEXQhVp
 Jxjg==
X-Gm-Message-State: AOAM533RALRSjOSXxaLOfDl7yFAqCduiddKpudlt6ibrKSIViLvogfCA
 iFq5tsvPApTvwlna0iKpocl5ZQ==
X-Google-Smtp-Source: ABdhPJzGu1vkEQl9iHAF95ayPIF0SsoBWDvRps0GQgPBGBv+W0ifzemthuvGb0R/rvlhUEiyqT4DYQ==
X-Received: by 2002:a9d:19cf:: with SMTP id k73mr148076otk.360.1607465168294; 
 Tue, 08 Dec 2020 14:06:08 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l142sm25265oih.4.2020.12.08.14.06.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 14:06:07 -0800 (PST)
Subject: Re: [PATCH 11/19] target/mips: Extract common helpers from helper.c
 to common_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ac8afc12-2ab4-a2a3-81b5-b9d75314bf6f@linaro.org>
Date: Tue, 8 Dec 2020 16:06:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201206233949.3783184-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> The rest of helper.c is TLB related. Extract the non TLB
> specific functions to a new file, so we can rename helper.c
> as tlb_helper.c in the next commit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Any better name? xxx_helper.c are usually TCG helpers.

*shrug* perhaps cpu_common.c, no "helper" at all?
Perhaps just move these bits to cpu.c?


r~

