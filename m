Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EAB2F1D08
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:50:05 +0100 (CET)
Received: from localhost ([::1]:47258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1KO-0001c8-Rt
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0uF-00058J-Lk
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:23:03 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:45778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0uB-0000nv-QV
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:23:02 -0500
Received: by mail-pf1-x433.google.com with SMTP id c13so303902pfi.12
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KcBBYyRIsubFJ5K7YVoag2+OIR54LyMij+S3tqSg3SU=;
 b=Ass7ItIgdyqkDHQpekFD7Pdvu8l5Lc8O3Aj7ZjiXf8uVKZQhMM+311Wx84fd7Mm5rY
 VWSJBdvVkvg9ZpXQIIOSTngKPOwdyFUR17oWDe1hDYEF59L291wQ3sZ4eN6fil+N5V03
 xqMTjozaCEWuKyqTYmJGsL8rl9OnY1oBG4ugG3ku17Sj5XlRL/fRP64xvfrj3myHZ0z3
 cSMnycpq+XOyuYWmFPtsL78SfefCn9Bh6wykm/r3fY8YNsPFFBMoK6RT1D5YFZS/TbrZ
 t5MlNk5zKBvYkfBs+X+ByPuzoq+/FX0bVC2TG5NAFJ2tekOJrSzbYSv3Kh9NrUO8r54+
 PE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KcBBYyRIsubFJ5K7YVoag2+OIR54LyMij+S3tqSg3SU=;
 b=MZCRwUzUO4gC5Z8HSjjZ1zXWC59yFje2pNx5mMxpt8SyG+VHJmeMlV3lWTvZS7LXEW
 f9pi4Vf+AZyVIARH3wcMIKGucKcNYnYkeMK7PpvNmUiMTSXbfsnGVlhpjditdVgD13K7
 WoykRceIt1roLUj2VH+UjwAaEKueCFRah/ZH4AmqShEVuxj+E2eAqnbMSM9fBdKsnxI+
 g4PtJE3vigy6UkAoK/RMtPwoK9IRNVwBY5+yHFLug93k/XXAEKNIk/DtP1wRMlCsFboQ
 OZbd0fP0jMYyXrLGe8lcZG656lARqWpU3G6cO5XMp4Ej1+VnLBuApGH3Sxzrre55D3Rq
 0gZQ==
X-Gm-Message-State: AOAM530mWPjYakyPvLN0L/lXDD1RJErkX5eYbBnCkh+4J1sPHPnB0hIZ
 EOIZ1F59eN050eWGO0+K4ACKmA==
X-Google-Smtp-Source: ABdhPJzwPL60+c4oVmvuxvwyRiOaudTy7LIObvZ0OOlgaXDIJjZL2P1rVdRkmZebGYDh/cPQWh6iQw==
X-Received: by 2002:aa7:95a4:0:b029:19e:abd2:4a88 with SMTP id
 a4-20020aa795a40000b029019eabd24a88mr432060pfk.2.1610385778087; 
 Mon, 11 Jan 2021 09:22:58 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v19sm86080pjg.50.2021.01.11.09.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 09:22:56 -0800 (PST)
Subject: Re: [PATCH 0/5] tcg: Restrict tcg_out_op() to arrays of
 TCG_MAX_OP_ARGS elements
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210111150114.1415930-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <43f360be-af44-27ce-619b-7a2ad169aa2f@linaro.org>
Date: Mon, 11 Jan 2021 07:22:52 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210111150114.1415930-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-riscv@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Huacai Chen <chenhuacai@kernel.org>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 5:01 AM, Philippe Mathieu-Daudé wrote:
> Attempt to fix the warning reported by Miroslav using GCC 10:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg771520.html
> 
> Philippe Mathieu-Daudé (5):
>   tcg/arm: Hoist common argument loads in tcg_out_op()
>   tcg/ppc: Hoist common argument loads in tcg_out_op()
>   tcg/s390: Hoist common argument loads in tcg_out_op()
>   tcg: Restrict tcg_out_op() to arrays of TCG_MAX_OP_ARGS elements
>   tcg: Restrict tcg_out_vec_op() to arrays of TCG_MAX_OP_ARGS elements

I've been trying to figure out a cleaner way to handle these, but this is
certainly ok for now, and avoids the Werror.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Will queue to tcg-next.

r~

