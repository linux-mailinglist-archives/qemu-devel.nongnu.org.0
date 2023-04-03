Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264396D502B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 20:22:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjOob-0006GQ-8d; Mon, 03 Apr 2023 14:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjOoZ-0006G4-4h
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 14:21:59 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjOoV-0006fE-W1
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 14:21:58 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso33572923pjb.0
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 11:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680546114;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VE77E8fNG7+7GdKEiP/hRhr26Mx9vkrvNhVihIWv6Uo=;
 b=C4OmyRrWncFh7AkU85Y2Lg/VNVIICD6Ns5flMtOYjpK7r5nDpzDHvJacvfze2UKACM
 3yL9bSNHaWLoY0zsueeDF9FvvVGkVKGGCSOoRRa/n7zgLlA6Uzrez325gxVp0nd9qIdF
 EKYDBPCB8+Mue+Uaxwd2H2txcr4fZ8VANtay6+ZwMtp3W/gYN8TGt33SGDBNvAUFJLTT
 Vw2S6Niw2qFcWAH3s667I3YlZ0BASje9oLlHKEgAk9FJNuhrdsLoqIOqmN8lB2mbnof2
 EszVxc+jrQwZeJb+Hva8AJLS5lmxxHHoQ9/TdQNw+BEDZtHn4t/Ix6BMFPKFFbL33n9p
 Lajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680546114;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VE77E8fNG7+7GdKEiP/hRhr26Mx9vkrvNhVihIWv6Uo=;
 b=AYRaVFePq2rjTCq3Rj27r/DP/qy6MrsYlrzTdnCcSFetkx4kYKUjm/MSl/ZfSnDVM4
 VX3/bTKzV8013TTcRr92A2045vRzAIVIE9LOgVuBm/xscQSCgGDesQzqCdHEvnXXaNhg
 dmyqWVZi/kxyY3JuapVugwS8QhMuNq8V1xKRsVM9loqLkinOfdW/1IZNSjc1NiALnCeK
 1z+UOCkhLrHyCKq6LW+bEoCrEX+PKPTvoMclnOnn6nZXfCSacTne0qJ2mauyw9Eg/oo9
 WAuCcIVz9NRlP54Og3lhU3jIKQElOFjRqjYDYAW2ka/TjAGEYFU+G0sY9monjxkJ+0Bv
 YIwg==
X-Gm-Message-State: AAQBX9f5Dr59GvBVyIhDDb4QEDFgeBXG0q5UpVrrtcd72jlt5QKxLw8R
 X4El/WTCSI6YUpEbwcTx/XVU4w==
X-Google-Smtp-Source: AKy350b8n885X64iWHe161VRoMLmUWQQM/GnnH3ou2JYlBi59ZzVG916Lj4R583BKalM3r5iy4X8Aw==
X-Received: by 2002:a17:90b:1a88:b0:23e:aba9:d51d with SMTP id
 ng8-20020a17090b1a8800b0023eaba9d51dmr40721273pjb.7.1680546114107; 
 Mon, 03 Apr 2023 11:21:54 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a170902d38100b0019ee0ad15b4sm6927535pld.191.2023.04.03.11.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 11:21:53 -0700 (PDT)
Message-ID: <96faf50f-c3c8-353d-ea0b-0d42c0b7973e@linaro.org>
Date: Mon, 3 Apr 2023 11:21:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] target/mips: tcg: detect out-of-bounds accesses to
 cpu_gpr and cpu_gpr_hi
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org
References: <20230403172906.397188-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230403172906.397188-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
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

On 4/3/23 10:29, Paolo Bonzini wrote:
> In some cases (for example gen_compute_branch_nm in
> nanomips_translate.c.inc) registers can be unused
> on some paths and a negative value is passed in that case:
> 
>          gen_compute_branch_nm(ctx, OPC_BPOSGE32, 4, -1, -2,
>                                imm << 1);
> 
> To avoid an out of bounds access in those cases, introduce
> assertions.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/mips/tcg/translate.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

