Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFC855BCC5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 02:58:12 +0200 (CEST)
Received: from localhost ([::1]:49812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5z4V-00052m-TS
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 20:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5z3P-0004IX-Dx
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 20:26:07 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:42695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5z3K-0005KG-5k
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 20:26:07 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 73-20020a17090a0fcf00b001eaee69f600so11008874pjz.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 17:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0MdP0ekNas0ei9bo/u8dDUsCHHsv1gUvoGf/1+NGd8A=;
 b=Fu97fjJLMe5UfwGT031PkV6iEClnavM6VufuZD0SfH5nYSfDYu4kW5K57FrXCWHwFb
 Zs7OW2Qk9T3S2hUlMalBfJJxafWLaC0UEf2EbDXT3Bk5JgGg6k8pP16IruwRNNBu9X5e
 V3XBxe1/Lc81PasD1zKjW1Yv0fS1cIRhm5aQXae3+Q53/CTwnZlUQD5/KsLxbF/NS9YJ
 0MZZIYmNM1Q6z3pebQ80Evb9VOVICdX1zp++lyqRlvsjKG3FTY6cy+n6aFzHED6Nil6R
 wgPKbF1Zl4nBtlab7zR61iJbqFJdFStmIyB7BvYI7jSUG+4dFZrvP0wxmmBQkSfVQsoU
 lz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0MdP0ekNas0ei9bo/u8dDUsCHHsv1gUvoGf/1+NGd8A=;
 b=AhyLs99RVK+8wFIvvc4UoAbgwG7uroNCVXpbcgFs2+9a4KZLS3uO+N90RId9k1cVEi
 zpTjDhfSAJEX4LyjixzDaHBEKVDRYSHcBm0G6XR9UAQzxopUNMagfhgHAO3ib8lyxpG/
 zNhRghqW+4O80YictyCXwptkbHbaag9wx9SNJWHs/wna1axF4FBj5VcLPIGvqmABGd3a
 TTo40LtXofbsHFj/xAFG3AHQ8hqV5PmA+Qkmbn54YINBRuskOpot+1jCQWIu4YgO369O
 wahIblUDkjPoGGqiuzCWcjdQbpXGTVAm4h+g2eAf9aldwWfju6rMoD9oo33KeHdtCV1B
 YlOw==
X-Gm-Message-State: AJIora82wStl9XF7+wdu9ImLR8K3x20biCIhtyNvnYDdgX5WIKIBwL1X
 YLm8Vt/QWDbrkQBq6eXqUULedA==
X-Google-Smtp-Source: AGRyM1vf3mnNVjujBAoVAbj64oHwmvgvASyoWPhuf0KUubEIt15E8gOOuAtm51JRwgeMyW/R851i9A==
X-Received: by 2002:a17:90b:3596:b0:1ec:f563:d64c with SMTP id
 mm22-20020a17090b359600b001ecf563d64cmr23506655pjb.88.1656375960455; 
 Mon, 27 Jun 2022 17:26:00 -0700 (PDT)
Received: from [192.168.123.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 h6-20020aa796c6000000b00522c8fb04adsm8279138pfq.176.2022.06.27.17.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 17:26:00 -0700 (PDT)
Message-ID: <c3190d64-447f-cf46-5dd8-f5e305c04b1e@linaro.org>
Date: Tue, 28 Jun 2022 05:55:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/4] libvduse: Replace strcpy() with strncpy()
Content-Language: en-US
To: Xie Yongji <xieyongji@bytedance.com>, kwolf@redhat.com,
 stefanha@redhat.com, armbru@redhat.com
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20220627090203.87-1-xieyongji@bytedance.com>
 <20220627090203.87-3-xieyongji@bytedance.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220627090203.87-3-xieyongji@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/27/22 14:32, Xie Yongji wrote:
> -    strcpy(dev_config->name, name);
> +    strncpy(dev_config->name, name, VDUSE_NAME_MAX);
> +    dev_config->name[VDUSE_NAME_MAX - 1] = '\0';

g_strlcpy

r~

