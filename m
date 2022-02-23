Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679B04C0FB5
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 10:59:32 +0100 (CET)
Received: from localhost ([::1]:42920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMoQl-0000rH-G0
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 04:59:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nMncx-0001j4-Js
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:08:03 -0500
Received: from [2a00:1450:4864:20::629] (port=43752
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nMncv-00029c-V7
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:08:03 -0500
Received: by mail-ej1-x629.google.com with SMTP id d10so50950883eje.10
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 01:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tVhKgPIFamoCxRQE/Xyt1rjw8nEDCdygilxBmFMkEPM=;
 b=Z74F9maTIo5GASnCeJ0dqIqMDGE1afeNhCDSNkNjBs86ra9zRv0WHFerk1FadyZTCW
 8LitmD7PHnM5RgVZmnMKLhV5+lpZYBEIF5FppKXv/23fbHvzxeyvutei95czDbD+prLH
 a8/eH3/Thr2C9V1D6vn67LpPUpq3yUl7ZIwdcrB+4xB6ZQYGoVgtEqCS3qfxmVfXYA2A
 0dCGOlj61j20O7sS4rEVnbUIotqQoJCHsYLNyylL1U+F7xU0773qSvt1QnnlTtJ+Ri13
 MLsRZgJlrKE+cSJEs5ABmlPRznm+5Gl1Ta2eTNoVawdDnbDd3NUtFshKtwRKVA9irfBa
 k7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tVhKgPIFamoCxRQE/Xyt1rjw8nEDCdygilxBmFMkEPM=;
 b=FfIgtDeR4eRQwvVO+/gHnAnYSf/wyorDRkxwG3Jg4jdk4btcywIJNHXjDPWmHUGrTP
 vFI8nCmZmAOIg79bjiEuRfbr7jD508No5UZ248lS2Bj4yCehUlhGP1snN8K5BvACZX0t
 7ea3kDnE2teQyDZruFIRFqBeIdqZILufA2bZTAL0yVEPxu3A3Vz9rgChXL8u+XTtPuCN
 Lap6027WhOGi2aC2mpYu/kTvdgqz3CQlAk+E7P02esoeSPqsb/Z+TLvoWVn3D6ZNEeRx
 YOsbZh697n/M/+7ay/OgAmCrj9/3kkthWjnDXaewZog87TJ3APS23hOGPemXQNLFF6Yg
 xQ6A==
X-Gm-Message-State: AOAM530PbgqabyOXbHqOHqmSNzY2p2VNPYW6+kjQYvr//4allsL/hKEv
 hZuUytyVEaGSYlLygOj/iLsuvZ7Vo5A=
X-Google-Smtp-Source: ABdhPJxJfAnep+B01pR/wXr0FOlq6W40MCd7DrmXs0G4W+EK/xDwmUhjS4DxqiHcdp+JdKt2Z9c5ig==
X-Received: by 2002:a17:906:d0c5:b0:6cd:f8fe:2f2e with SMTP id
 bq5-20020a170906d0c500b006cdf8fe2f2emr23026468ejb.395.1645607280572; 
 Wed, 23 Feb 2022 01:08:00 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id k20sm3779888ejx.152.2022.02.23.01.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 01:08:00 -0800 (PST)
Message-ID: <9cdd93f2-af65-ba5c-c5df-8f9e4d42eeaf@redhat.com>
Date: Wed, 23 Feb 2022 10:07:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/8] meson: drop the .fa library suffix
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220222194008.610377-1-marcandre.lureau@redhat.com>
 <20220222194008.610377-5-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220222194008.610377-5-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 20:40, marcandre.lureau@redhat.com wrote:
> 
> The .fa suffix was a temporary hack introduced in commit
> 1f0a1d8a51 ("build-sys hack: link with whole .fa archives") when the
> build system was mixed between meson & makefiles. It is no longer
> needed.

It is still needed to separate internal and system archives, otherwise 
the oss-fuzz build fails.  Meson adds a --start-group/--end-group pair 
around all libraries, and the fork-fuzz.ld linker script should be 
outside it.  If the libraries are named .a, the --start-group is placed 
much earlier.

This is of course a very ugly workaround; Meson should just use the 
objects instead of the archives when link_whole is used with an internal 
convenience archive.

Paolo

