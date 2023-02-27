Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E170A6A4BBD
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 20:54:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWjYY-0007bf-FF; Mon, 27 Feb 2023 14:53:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWjYW-0007bW-Mf
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:53:04 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWjYU-0007v9-TK
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:53:04 -0500
Received: by mail-pj1-x1043.google.com with SMTP id c23so7370112pjo.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 11:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fj8fiVE4ZIyozLRHhgNmpc1+i3E5U9ERDyFkGh24Xq4=;
 b=knNaeUDGHhy1vxEOMmpn8o2apZ8vcnWOIGSD3mITeO8eOt1gTOAq1ikpgJVBsLvPSl
 m3ebCQu1YXNrhCs4s6oBZkDd+NJhza2nPczOqFiKRjGgLD9Xq6tLaonV6SnX91rXHeWF
 i/QW3BS6Fv0ZPX0QMDvfa4LL0bT1sIaQmMZGXP5YAXwTi6qxTragJ1atdw2U79K1CfAJ
 7iO5mbsxcJeY+m5ZUrTNw76RAMbIvMWtRdFwS8cBFqKE4xxl/uMZRl53Zbz1LAI4pxau
 BspoEYkcuqngirgCCWLoEo1waOzIhK/CDip9TeX2PBtvWyMASqmITWGqw21WzlsQTKPg
 +K4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fj8fiVE4ZIyozLRHhgNmpc1+i3E5U9ERDyFkGh24Xq4=;
 b=uGBfZ0W5UFBtuCXyeH3aTPKKJ2NB3L51OI+ntsm68I5VbFJO2BaMuWa5rcQxAch3TA
 th6kzbrTPSzCb5sp3tAENtTYJyE7TcOSeiUX0AhMPHlbBNhGvIOgyeRmew1OrONH5Id3
 ywD1HKrOi/l2zIOpYybFMrp8aWXxvh0td2Tk1jM64VGpp0Q6ekpb+sqnxqbcQVhGfBod
 K4rhpnCV1WXygB6ZpGE/+AB3g58531bbIs7EhftfyUGzopwXNYo6sJxh95b0MtBuoMGw
 y3RdtupmrcAQvPFNsfZdQMO38v38yIhvALTpi5ehc+SfMdX/6U23qno9avsV4wDUvYV4
 5jWQ==
X-Gm-Message-State: AO0yUKWGWgaUXHh5pGw93dg8jurvwdy3bwlk0U1bcgdXH7yha4Ee1br4
 nDN7yD3Y6PSfcmscpEeD9IlDQQ==
X-Google-Smtp-Source: AK7set+M+DimjYea9d/OVpjs60658ZZpS+tCsXYFNlYBNW8mtrB5vq25TDmo4APQEW2L4ZXNcOYBuA==
X-Received: by 2002:a17:902:db04:b0:19d:f7e:9864 with SMTP id
 m4-20020a170902db0400b0019d0f7e9864mr12838plx.57.1677527581142; 
 Mon, 27 Feb 2023 11:53:01 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 ju1-20020a170903428100b0019c92f56983sm5006196plb.120.2023.02.27.11.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 11:53:00 -0800 (PST)
Message-ID: <1d4deb58-bf36-3cfe-3d01-562bfc62fc30@linaro.org>
Date: Mon, 27 Feb 2023 09:52:55 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 00/27] Replace TARGET_TB_PCREL with CF_PCREL
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net,
 peter.maydell@linaro.org, mrolnik@gmail.com, tsimpson@quicinc.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, edgar.iglesias@gmail.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de
References: <20230227135202.9710-1-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230227135202.9710-1-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 2/27/23 03:51, Anton Johansson wrote:
> This patchset entirely replaces the macro TARGET_TB_PCREL with
> a field in TranslationBlock.cflags called CF_PCREL, and is a
> first step towards removing target-specific assumptions from
> non-target/ directories.
> 
> The grand goal is to allow for heterogeneous QEMU binaries
> consisting of multiple frontends.
> 
> RFC: https://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg04518.html
> 
> Changes in v2:
>    * Setting of CF_PCREL (previously patch 3) was split in two and moved
>      up front (to patch 2 and 3);
> 
>    * Replacing of TARGET_TB_PCREL (previously patch 2) was split into
>      four patches (patches [4,7]), one for each affected submodule;
> 
>    * Removal of TARGET_TB_PCREL (previously patch 3) was moved into
>      separate patches, one for each submodule (patches [8,10]);
> 
>    * Patch 11 was introduced in response to feedback, and removes
>      CF_PCREL checks in functions in tb-jmp-cache.h, these functions were
>      always called in a context where CF_PCREL was already being checked.
>      These tb-jmp-cache.h functions were then removed in favour of manual
>      inlining;
> 
>    * Patches [12,26] replaces calls to tb_pc() with a member access
>      tb->pc, the motivation being that tb_pc() was (almost) always called
>      in a context where CF_PCREL was already being checked;
> 
>    * Finally patch 27 removes tb_pc() which is no longer used.
> 
> Changes in v3:
>    * Added reviewed-bys on remaining patches.

Queuing to tcg-next.  Thanks,

r~

