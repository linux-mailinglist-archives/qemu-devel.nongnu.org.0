Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA836DB6C3
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 01:04:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkv7c-0005yV-LW; Fri, 07 Apr 2023 19:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkv7b-0005yL-0y
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:03:55 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkv7Z-0007bQ-G0
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:03:54 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-23d27d721d1so173621a91.3
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 16:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680908632;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hZqP/mMtrcpUQSJ0MIEuq6L7i9BJbItpoxQhlUdV2j0=;
 b=OScsKdJq+aKS4EMfnsQDF1A4ZpE9lHLC3dBugCWoYJ+T+zxfKuy7Bcfowv1Z4sMNGt
 5Tvqtj2tiQHF/cjx4hdeKJ6bZl9Y/HxUihnLOA+u6o+0o8KEhFMiBHXApK9qw2CCJXQY
 B/O1pBojgVNojn4tHZwtZ9Gj8964Bhc4vqVPOXtmkWUbZHDB/khpku9T9hNbVRaYpnKf
 6WkmzIgkqbHy5Lu85TuUalah4TTDdXAr+WRzB+W03rr+p/gGfvJi+W66/flHhGLrSK6a
 w5iWxWFxH44qZpC/JwuKPFVtQLmfZeKHX2acjMCobg3Mcp8TCtZQwPxUU3D6tMzl+TdP
 a4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680908632;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hZqP/mMtrcpUQSJ0MIEuq6L7i9BJbItpoxQhlUdV2j0=;
 b=zn1I6vUY4IQMhVKshL6v8l9c8XX5IsznKAYN9PSBhOHrEemn6rqgK+83EESII7MB5B
 BQcvVdmYPdyTnESdhOlEnDoJKtAOVnd8sl03dT2GJ2x0xfUl1PREiNUdCE1eLUtE4mUO
 oJI3E6dN4NN9g4+prGybjsM7RqavzI+hTEuDSfJ6dCvuQ6saUdISUShuxSxku+hHzI3q
 oQM8Nt0ZUoedl78rBRMkSfo5pvp5vIgKAk1zh2c6MwKOXinKJEZpQvjr+b7nPCAFhopO
 kKgLy+Qv4mumYv+FOkez663ARYCdNaoyQVCPWM31RzvjeGtP7s3djwzG+1tItBA59E29
 ogTw==
X-Gm-Message-State: AAQBX9cQ5UIGPlaNdx/WVK3hm+7OQDPsvt3xbdyvUnbz8921YHSBxYxF
 HkORTVCuKhMVvG5PzyNxP3XjZA==
X-Google-Smtp-Source: AKy350an52aELf6hlPTEwYKQg2oGfdoio44PzUivo7lHIUSuO2HA+GtnFtvlc2ICRNAVAvj8q2M6tQ==
X-Received: by 2002:a62:5e41:0:b0:626:2ae6:31f6 with SMTP id
 s62-20020a625e41000000b006262ae631f6mr3993369pfb.7.1680908631953; 
 Fri, 07 Apr 2023 16:03:51 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 b13-20020aa7870d000000b0062e26487e7esm3525658pfo.155.2023.04.07.16.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:03:51 -0700 (PDT)
Message-ID: <f28d2337-37c0-5a93-438f-7ce0ea7fc565@linaro.org>
Date: Fri, 7 Apr 2023 16:03:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 05/14] accel: Rename 'hax_vcpu' as 'accel' in CPUState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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

On 4/5/23 03:18, Philippe Mathieu-Daudé wrote:
> All accelerators will share a single opaque context
> in CPUState. Start by renaming 'hax_vcpu' as 'accelCPUState'.

Pasto in 'accel' here.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

