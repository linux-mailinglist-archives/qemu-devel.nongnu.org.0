Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 183185E8FBF
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 22:58:00 +0200 (CEST)
Received: from localhost ([::1]:39670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocCDn-0001WB-6a
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 16:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCCW-00009f-GF
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:56:40 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:46875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCCU-0006gd-Te
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:56:40 -0400
Received: by mail-qt1-x830.google.com with SMTP id b23so2012704qtr.13
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 13:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=uPyKdeBjc0ITYL5+7AB0ssYkjHcrm9V8yVqVaObATPM=;
 b=nsKTK7rbr6uoI4bqA8SFm0B7HPxjLN1iX18hqOdUskmK8fzk77R0VuvIybDEqWuyNE
 lwDwSo9pmgj9/TivB/21qhSMhMcseu4KH9OlowRam/5qiUSx5T3F6QE1wbkoM6Wul9f4
 Xmyc0UCTNujoGWIHyGzEKUeRJxYX7icC+3at/n0l6OYd+I4V5JLjXWZkvtdrfRK/QyDH
 F2zTdwRIY+cZYWtNl+xbf3NnzrnjmVQq8rYQxsQb5lLOjYfxoeIcAqZgeVXKnHLnrysu
 9N/tZbXYZqCVAISGZPjcex44B/E5evpUxDG0biBW9GDDLRjduaZViLobG8uxIAPOUSv0
 33YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=uPyKdeBjc0ITYL5+7AB0ssYkjHcrm9V8yVqVaObATPM=;
 b=r00tSom9F9zCsIl+XkHdk4Bv6NRoy5n6nNEILzgMG9p09Dw0yeNw1zwDWl5SqtjZ0f
 HwDuxpYATIxipLZj9MKq31bgBrcdu3EO7js0YZQ7PaJB5ZUgPlqymwQ4BgK55/RN34Xl
 OlwpCseRSPHT/qkE/2UQsIKdwEZqBJl4RewKSMgnLSeMGRqrgMMnSiYNujugpNSf5Qsb
 8L12A/haoxmQdFJruHycaGGfJz6aGdkueb0MYljVK2fzkMQDw3YLXnnkaRihW/Bghp4i
 bbKxrqfK4UyKeINoLSBqHzrwvm/WJOtdcuNFRvr2siI1Q5MpedLJfr3MjpEq04KBxGk3
 ZLfQ==
X-Gm-Message-State: ACrzQf1vdZsbniH4WmEA9RENPvMRT1O5f8BMNuiASA3QgmvB2XoR6ZU2
 wNR5o3zA44KTiz8q0ymkUac3W1yzfHBlv+uz
X-Google-Smtp-Source: AMsMyM7KbZIO0y39Ow7sm5Ux4cTfZxgqSj4tSU0S9L9fHObWpIkgLZqICIMXkwtJLe+RQ4iQ4BoDFw==
X-Received: by 2002:a05:622a:5812:b0:35c:caea:10e7 with SMTP id
 fg18-20020a05622a581200b0035ccaea10e7mr12291586qtb.642.1664052997846; 
 Sat, 24 Sep 2022 13:56:37 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3?
 ([2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3])
 by smtp.gmail.com with ESMTPSA id
 d18-20020ac851d2000000b00342fa1f4a10sm7875940qtn.61.2022.09.24.13.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 13:56:37 -0700 (PDT)
Message-ID: <447b5045-b437-028f-8813-b229dcff6bf9@linaro.org>
Date: Sat, 24 Sep 2022 20:56:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 24/37] target/i386: reimplement 0x0f 0xd0-0xd7,
 0xe0-0xe7, 0xf0-0xf7, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-25-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-25-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/22 17:24, Paolo Bonzini wrote:
> For LDDQU, using gen_load_sse directly might corrupt the register if
> the second part of the load fails.

Surely LDDQU is not unique in this?  I would think ldo/ldy both need fixing to load to 
temps first.

Anyway, this patch is
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

