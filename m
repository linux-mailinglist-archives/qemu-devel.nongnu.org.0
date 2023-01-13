Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA18266A593
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 23:02:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGS72-0004UP-6s; Fri, 13 Jan 2023 17:01:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGS6r-0004Hs-4G
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:01:14 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGS6p-0002Tw-HS
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:01:12 -0500
Received: by mail-pl1-x632.google.com with SMTP id v23so19868215plo.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 14:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fg79wPu6DzfKkM1M68Ys/WsQ0hxdd/okTItA0TVUKeE=;
 b=hOa9c4FOxZPGa1+gJA41OnEqGgr3BClJErbGFmugfmsypBpaGHvrDFaeD9MjmvpINo
 ye/EWeJz1J9ff6tsxemxVz6WNbXEKNPz9X5Q63/dQ5P7gOtkJT3mXT19YUtM7fxOknST
 hP9NvBC9/ycJH2kyOI+qkg8rsS6UXq5SdsQJxs7Fj6DyCZcjF5CeO/DA+RZfAv91iUR6
 46eEZxCuzCvrZrLy7sKDqUg4h8wdSt2S3lt6n2fqYeinu+4To3rVk3AvE9/zAkqBVPIy
 QEVn3olDhU+msaei3DncCvGHulwHjwLVWYoNHbSZZ6BC2zUEA8TFCHPJikW4mNLWoIWy
 4r4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fg79wPu6DzfKkM1M68Ys/WsQ0hxdd/okTItA0TVUKeE=;
 b=rB850H1dKwhMY4mi/KHGPlYRirk83zEHvFLJeL52LF3AVsi9l+QT1xpp1b1O9Xlzmx
 C/BA7rupMTyxXPhvhSmY+i/UUtjL7MGORaJqhhuinaBXyz30BXaJdVkTuBigw7VG1PoE
 sVHY1orFotfoHRzVF3FPRlLrKhxvsHcsvHg6VO5uMrGNw87A8dASRQNRqwDiibTkWd8Y
 ISiOv/RSVOTYHzBoPuktOKrDE/HhI1v2wBkis/mIJRGC1grukQcV3U8jtZdABrTh1GC3
 USNHGVcMl0VwIRjSJ4KoFGJaP+tChSggxGtiRuZA4zvB4rCZm00VJ5A9WSJLRmgp1auz
 LQzA==
X-Gm-Message-State: AFqh2kqkOs0HNzrepSDTnWXquhZZGzl/OnAeQODU5s58t29epinNBZZe
 lvPEa5vatPrXedY0q98Wjvrf3Q==
X-Google-Smtp-Source: AMrXdXsju2fbqKabcLe/Zhbus/ngUzGs4WYDsa3TIEfJKo5WZbehxXbRtQkTi1WE1F4KS3LpHfpkng==
X-Received: by 2002:a17:902:ef8c:b0:189:890c:4f6f with SMTP id
 iz12-20020a170902ef8c00b00189890c4f6fmr11224500plb.64.1673647270133; 
 Fri, 13 Jan 2023 14:01:10 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 q10-20020a170902e30a00b00192a04bc620sm14579835plc.295.2023.01.13.14.01.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 14:01:09 -0800 (PST)
Message-ID: <d1edb6d0-2bb9-4923-ea0f-378b6f944fed@linaro.org>
Date: Fri, 13 Jan 2023 12:01:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 18/28] target/arm: Move common cpu code into cpu.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-19-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-19-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 1/13/23 06:04, Fabiano Rosas wrote:
> The cpu_tcg.c file about to be moved into the tcg directory. Move the
> code that is needed for cpus that also work with KVM into cpu.c.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/cpu.c     | 76 +++++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu_tcg.c | 77 --------------------------------------------
>   2 files changed, 76 insertions(+), 77 deletions(-)

Actually, not true.  This is tcg-only.  As is the bulk of aarch64_max_initfn from which 
this is called -- note the first 4 lines of that function:

     if (kvm_enabled() || hvf_enabled()) {
         /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
         aarch64_host_initfn(obj);
         return;
     }

Thus the rest of the function is only reachable for tcg.


r~

