Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6266C1B16
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 17:17:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peIBa-0004RO-Fa; Mon, 20 Mar 2023 12:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peIBY-0004RG-OM
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:16:36 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peIBX-0005FH-8q
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:16:36 -0400
Received: by mail-pj1-x1033.google.com with SMTP id y2so12655724pjg.3
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 09:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679328994;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SHVxiY2iKUY+lyuU/nrBC0yJf7F+WCsVRNMftoAKSVM=;
 b=Mz4hJkv5qm7DS01kdfjPP6U1RrCnIv9nvwyQnqXUpI+QwQVKVG17Vn1VyGtRKXP0BH
 TTIH4+1IJ3aza90+sjKYmEzPlwqYUdreCHsAQETWw1AX88DBx8apbtuS+GTVhYUrTyP3
 kU+T5s4pgtf3K7ArEMurhb3WdhXV0H5sgdPRSV0deLP3MGBPaLh2ASfv+FP99l1NMCXZ
 Ty7D6yx+m1ii0h2ZBCAkLJvalX3KlyYnNuhi45iALbF7+ChK8FTeQ/WZSMRsLGgtcsXP
 1i58CDmohVUIk2pylgm7t0SG210YW+ieeFdDUHJmzZJWL86I0dRupoq4zDoY8GftFA2u
 1Yzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679328994;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SHVxiY2iKUY+lyuU/nrBC0yJf7F+WCsVRNMftoAKSVM=;
 b=YMEvbSMlAVQcz5pKMvSHPtRsAkM0LdlNj5t56JLFBkX+GtcvF9tiCyg1Xil45X/N2u
 2GW1uudtBaf5jkRq+MpkaKOm/FoqLbTAYKTDdvZ8pEaPtS+BSRoYfaVIkVu1/MtpmFSg
 70/WQuKOVxL9Se5JqaUnyEa6A8wJql2ZvOxDORVEX66fLkabFuzO7iBXma3SBcvV81gs
 euY1TE7+Ny8rBPTitxAE5z+z3P8hkAx5hnaH1Caw4gNEBXyCSrR1uafyW/QZ+rj9VpHf
 /xQzeJT6ROgR5t02gWWZ7cfUAXp8eEOdK4fgZlrMf4vEgAx77Zw1p/o6oaRLCQdrMPxk
 QQ0Q==
X-Gm-Message-State: AO0yUKVMkjfPICOz4UI/Q/RLxf6WTp9rJDW0zbMowrjwGF/N4MsZUWl3
 6lSKr0gcAbiG4Npj2428/uEVxg==
X-Google-Smtp-Source: AK7set8NeRIcFAIMQAe3T577+RG2jG2jZEE7Zhc3dbUiYSg+PscgsSMZ7UuqB0bAAlClnMTDFa5log==
X-Received: by 2002:a17:902:e849:b0:1a0:616d:7618 with SMTP id
 t9-20020a170902e84900b001a0616d7618mr19686763plg.51.1679328993733; 
 Mon, 20 Mar 2023 09:16:33 -0700 (PDT)
Received: from [192.168.4.112] (096-041-163-098.res.spectrum.com.
 [96.41.163.98]) by smtp.gmail.com with ESMTPSA id
 y17-20020a170902b49100b0019f114570b0sm6038973plr.152.2023.03.20.09.16.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 09:16:33 -0700 (PDT)
Message-ID: <67238683-b36c-93af-a83d-65b1b9e0c35f@linaro.org>
Date: Mon, 20 Mar 2023 09:16:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 04/10] accel/tcg: don't bother with ifdef for CPU_DUMP_CCOP
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230320101035.2214196-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 3/20/23 03:10, Alex Bennée wrote:
> +                int flags = CPU_DUMP_CCOP;;

two ;

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

