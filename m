Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7330534BD5D
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 18:54:20 +0200 (CEST)
Received: from localhost ([::1]:50230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQYg7-0001ih-Gs
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 12:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYeT-0001Dz-FU
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:52:37 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:42928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYeR-0002LN-Td
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:52:37 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 31-20020a9d00220000b02901b64b9b50b1so10025905ota.9
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 09:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vuo4WbUlHAK0+AXDCHF3fAXFUmysAvpj4eutqah7O4Q=;
 b=p/IAQFurzD0dO8cV3goxarkAWksfser+nVcWKPlPt4Xg6DChuEZjpDlu2xvNokI2ox
 zPbcehAERaBNQ4CSsOS3ICjYdswrvtknlcjk9gT7W4C+rf9lk0MO3tcMF4cQDVBXcRa4
 mUVdcbIVDcrphPRwMn4bBm2EMxIEzA03TZ1z1/b+eh+adXNseyPmJIPr95Ya6TPzeddJ
 12aSWUKfLvoWWGIwb88EGC9E02HLokTmnQGrGLS/b0gUM2fkvDVD+J7K9TfFt8HVRXvQ
 yvfQMC5+jTXiZ9f8W+XTlwg+fJwxSoGUYX8fxc4zTwtzmqN2DCz/R5dxuv4Jby335u6M
 Tj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vuo4WbUlHAK0+AXDCHF3fAXFUmysAvpj4eutqah7O4Q=;
 b=VPBRbDE+I3FQp2DpPmirmXhRFAbFIIuHwXvbANgnt0laCuUvkR3xpgcqs5GNye1rBU
 SJ6UEY9n2+cBz/+wsYV4GKu0oQ6llYPbZzpMi3MJv2jpekSXbo52WO7pdl+R6Yk8fbSD
 +m8U0PhOWazAISWplnq4IHQdfa559MRc/2yJHQB4UQ8iIDWpzMxdbaRc4/+tb/5wI6YO
 GL3HbFOOY18EwaMD+OYFVKlWSt+8xzDq1pctxSkBICe0edc1wjJ6CD1BoM6f2NIl7e3E
 axU0ywWUwmARRESVhBbE9nudETmAri9qqSLMnSo80owOE2jEPT4WZ1I4fEEqwJ2Tys5g
 MSeQ==
X-Gm-Message-State: AOAM533QBiDJR8ngr315Qh7uDvBHfA6PsXLCNEwdXleUxI5aKP+qQ1h4
 RA9F8SZFbSl/H48PTmtbKh6o9asZ/BflSn4F
X-Google-Smtp-Source: ABdhPJzlJ3w6WlAdnJXphRuAoeiLzYv3oD4OFqoDHN2p4RaNdeyXJ7wQMRlrx+3QAx1KfduRUzg7mA==
X-Received: by 2002:a05:6830:240f:: with SMTP id
 j15mr19821532ots.288.1616950354629; 
 Sun, 28 Mar 2021 09:52:34 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id u7sm3348927ooq.13.2021.03.28.09.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 09:52:34 -0700 (PDT)
Subject: Re: [RFC v12 33/65] target/arm: move cpu_tcg to tcg/tcg-cpu-models.c
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-34-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <da93afd2-c56c-df6c-c29d-7ea5c0020a1c@linaro.org>
Date: Sun, 28 Mar 2021 10:52:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-34-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> move the module containing cpu models definitions
> for 32bit TCG-only CPUs to tcg/ and rename it for clarity.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/{cpu_tcg.c => tcg/tcg-cpu-models.c} | 9 +--------
>   target/arm/meson.build                         | 4 ----
>   target/arm/tcg/meson.build                     | 1 +
>   3 files changed, 2 insertions(+), 12 deletions(-)
>   rename target/arm/{cpu_tcg.c => tcg/tcg-cpu-models.c} (99%)

I have a notion that this patch should be moved prior to the previous patch, 
and that the code that was moved into tcg/tcg-cpu.c should have gone into this 
file.

But this patch by itself looks good.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

