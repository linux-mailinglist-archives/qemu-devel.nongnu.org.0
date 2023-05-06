Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A3B6F90CC
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 11:05:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvDpz-0001c4-3L; Sat, 06 May 2023 05:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvDpx-0001bu-HV
 for qemu-devel@nongnu.org; Sat, 06 May 2023 05:04:17 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvDpu-0000RG-Ab
 for qemu-devel@nongnu.org; Sat, 06 May 2023 05:04:17 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f41d087bd3so836345e9.3
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 02:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683363851; x=1685955851;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l+ghsN54+vplZ4bdD4vovdm7Ky7TXtUJirCitEL/3JI=;
 b=BHT50SljfYUMbMw6fe1UCiyqiaaI8AgiwPTv2LxAKC9Vy5GAKFLgtpvDOnaIyXJ2bM
 UPeOl+q6fFUYZw4pFMrd0Xcbs0IOagwU67huZyXuFIrfQeuRl4loEbWr+CSNQ4eE8QcF
 nMNncQHx2m3ZFgvzQ/Qc5rOlH5fIOlvNaoWQmJBP170IEjIRNG0vrCMfyBUToMykEf73
 zdIb9006l6oBNvkQAOVykJ+cNyB8+iWCwkeHT+mBXoniaXMe0r2Ud21hiHl1QTZbBT8q
 9P7b1+ShJER/C6+aZk/lEg9mJ16V+fhUjpl3tve7Wsd2vBLv84LmBezhGoozoHBru5T6
 /uBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683363851; x=1685955851;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l+ghsN54+vplZ4bdD4vovdm7Ky7TXtUJirCitEL/3JI=;
 b=gQqBVl3fbPVPdZkSKt8JNY1MyNgRYGudW46qM5vPSIZUSQJ3b9yeW0Z2s3Kp9etJmh
 R/qNUrkri5dfUUYfk/fP9Zy5zF43Dhq3I688KtNKNOjnnc7kMeLwGI2UVgg/bFElolxU
 lruiGIbFXQzKVj+W0Da/bSsSYrX+rKaA1RMTPooQEx1zy77i4xsBB5/knaOGPRb+8hU5
 aXW8E74aAPkaHX5Yc34H/uiwczAzmCMVWRt04INJzkNfTSNum7j4Ib39mjk9hCQWAPiM
 TbCTUTfqObe1nhAS4lAsdxqcI0xvr85osdcn+3iGAEf6m3+H7aU1/JNFDeJJwiDp2cIW
 KAqQ==
X-Gm-Message-State: AC+VfDxNstNDDwgJ6EGQdQz/4TEAaDtFeB/9tXqlXQtWMb7rmZrJnuxL
 utF3Cfpbs5E5aRILr3HEF1HbeA==
X-Google-Smtp-Source: ACHHUZ5Q8UbnEIUI/KAn4eBjYiv16agM4ymxlNQ9dtnlJ/59N1qNsBBljpKZWCVkWFv7av4I1yoPjA==
X-Received: by 2002:adf:fe47:0:b0:306:434:f8ef with SMTP id
 m7-20020adffe47000000b003060434f8efmr2727006wrs.70.1683363851204; 
 Sat, 06 May 2023 02:04:11 -0700 (PDT)
Received: from [192.168.20.44] ([212.241.182.8])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a056000018800b002f28de9f73bsm4826779wrx.55.2023.05.06.02.04.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 May 2023 02:04:10 -0700 (PDT)
Message-ID: <7d340bb8-d863-8ca2-f334-1d60340f6287@linaro.org>
Date: Sat, 6 May 2023 10:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL v2 00/45] loongarch-to-apply queue
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230506063540.178794-1-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230506063540.178794-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/6/23 07:34, Song Gao wrote:
> The following changes since commit eb5c3932a383ba1ef3a911232c644f2e053ef66c:
> 
>    Merge tag 'pw-pull-request' ofhttps://gitlab.com/marcandre.lureau/qemu  into staging (2023-05-05 19:18:05 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/gaosong/qemu.git  tags/pull-loongarch-20230506
> 
> for you to fetch changes up to 725d7e763a802321e1bb303348afc551d564d31e:
> 
>    hw/intc: don't use target_ulong for LoongArch ipi (2023-05-06 11:19:50 +0800)
> 
> ----------------------------------------------------------------
> Add LoongArch LSX instructions.
> 
> v2: Fixes build error.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


