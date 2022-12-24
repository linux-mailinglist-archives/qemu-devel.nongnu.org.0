Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0DC655AD5
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 18:33:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p98O1-0003SC-Ta; Sat, 24 Dec 2022 12:32:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98My-0003J4-HE
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:31:56 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98Mw-0002XO-QU
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:31:36 -0500
Received: by mail-pg1-x529.google.com with SMTP id w37so5072457pga.5
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 09:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pdRRwhksejbdrcCKw+JKb6eNznF1CUEjvihXr34XHAs=;
 b=xv2Ue0SYcpK0LeCMYqRj8ZHQ88pNV6lqRT0UcOwYUcl3BT4VgNA4doQIelUgmH/EiI
 z4fn5T7DxdNhLa8mImYNixI4BQZ3bhL62nzSj/Hr3i3dtoYaEFgbNXuBbiAqxc0dX3RL
 6JDNXcAsDgm9+RuPyHDyT9uJ2GbWFDi31wNvNIOU1WpjeVzfgGJTIRQcU86qpYpAy1gL
 TITEylmFVmM0mu0YxSA5P8Yr4qlNCfBhRg6LmTQaNg5r9s4c0OX8OowzaY64DRuhXR5A
 wFh5B/S2pYMaeCVfyAgsLfKrHZocIcjs8wsIN9YR06wjIY2NICwcpvHdE281kltpZ51q
 Uslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pdRRwhksejbdrcCKw+JKb6eNznF1CUEjvihXr34XHAs=;
 b=jFEvIsqzUQKFf4PL8IjVyLlmns9Z3aPSQ/y1z4neAJQyz/qEeztAMzzRT/1Nxrb38x
 Fs3jT6lI+HyePfefywPR7Get+9sxNVlSKqy1FOlSlDCoC4iPPOhpnK/cQYugQ2GI+tl0
 10swu+skiDRCLu4NGo/mvEYKwKA0pJnWaGCnmDKqLwDYD5hs/gt79gNC4slvy44cYRaI
 kFYFNQJxHu+pHXCZMgCuVv6nbKosP/DJ1ETQPNxchKrWOcqJCwwNSF/FsBeUgaQvwuaQ
 2k/Iif7yClir0TbhMBU17Leq4E+KTVHwWQVyyX1TtlZm8jEXJ8uuutX7B4sCSUV8f8hX
 ujTA==
X-Gm-Message-State: AFqh2kpuRRXVKnIqcvsk7iioTm7/oIpxeOaNDyj8oJfBpMjKpv0XdPIo
 sN/+amPqoQWz3JKUcsqpFJRIAg==
X-Google-Smtp-Source: AMrXdXsczMiNhrgacytHjnCTKJBZGmADYwr8zorO8ZO2HMUBQJx5jD1CI1STVuvywNXv9cjBBFZi0w==
X-Received: by 2002:aa7:8c46:0:b0:575:ff07:cb1e with SMTP id
 e6-20020aa78c46000000b00575ff07cb1emr16253805pfd.31.1671903093253; 
 Sat, 24 Dec 2022 09:31:33 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a621c16000000b0057716769289sm4303543pfc.196.2022.12.24.09.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 09:31:32 -0800 (PST)
Message-ID: <a579bc16-87bb-b432-372c-91fdef6d2e7d@linaro.org>
Date: Sat, 24 Dec 2022 09:31:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 08/43] target/loongarch: Implement vsadd/vssub
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-9-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-9-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
> +TRANS(vsadd_b, gen_vvv, gen_helper_vsadd_b)
> +TRANS(vsadd_h, gen_vvv, gen_helper_vsadd_h)
> +TRANS(vsadd_w, gen_vvv, gen_helper_vsadd_w)
> +TRANS(vsadd_d, gen_vvv, gen_helper_vsadd_d)
> +TRANS(vsadd_bu, gen_vvv, gen_helper_vsadd_bu)
> +TRANS(vsadd_hu, gen_vvv, gen_helper_vsadd_hu)
> +TRANS(vsadd_wu, gen_vvv, gen_helper_vsadd_wu)
> +TRANS(vsadd_du, gen_vvv, gen_helper_vsadd_du)
> +TRANS(vssub_b, gen_vvv, gen_helper_vssub_b)
> +TRANS(vssub_h, gen_vvv, gen_helper_vssub_h)
> +TRANS(vssub_w, gen_vvv, gen_helper_vssub_w)
> +TRANS(vssub_d, gen_vvv, gen_helper_vssub_d)
> +TRANS(vssub_bu, gen_vvv, gen_helper_vssub_bu)
> +TRANS(vssub_hu, gen_vvv, gen_helper_vssub_hu)
> +TRANS(vssub_wu, gen_vvv, gen_helper_vssub_wu)
> +TRANS(vssub_du, gen_vvv, gen_helper_vssub_du)

These can be implemented with tcg_gen_gvec_{ssadd,sssub,usadd,ussub}.


r~

