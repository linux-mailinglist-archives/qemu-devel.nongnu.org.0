Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B05402AB6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:23:59 +0200 (CEST)
Received: from localhost ([::1]:55746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNc10-0000NL-3e
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNbzq-0007q1-6j
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:22:46 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNbzo-0005CB-Qd
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:22:45 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q26so13794743wrc.7
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 07:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=He+09qJONqc1cnUJiBJ3b/dKCXckIUSdmhvP3jiodOQ=;
 b=QvGbQxTUBZFt7k7vn7oPNX87mhrynHWSNZIPLUDFeG861Rkhb1FWxt/6BSpqCVNiDv
 B+c1Apc9D3EmJZZpefB30foel278A3/18bjyToy2PPOq7ew3T4DLcexq7ByW52fuRujJ
 BJQR+erDSe+IJUwCHocuBsGDEfYxfZ4YKa1uMO12CNEP4F8kpyxVINupGlz7Y/xQu4ra
 2TV4H+vnC4i3aXqE44b8Pi61UfdEhQAw8pxT3WaU0fnzUf2WbK5RjGLpoVV80FIUHyIg
 lSeMy4O9qLCSiA3FbHbSxAftHjlzCqEXzv0aARjdKKWVAdANwHVr3iQfF8INpD4BkQLc
 EUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=He+09qJONqc1cnUJiBJ3b/dKCXckIUSdmhvP3jiodOQ=;
 b=hwh+8bXCjOO/7dQvqWTRHSoZnlBCwALEyayGrBZUrNk2IF/bwtYAgA81nnY+IcbfsJ
 7/5/qfy5jcZ9mNmuDJwJ8T2O8jvnB6hJ+8iDTBBellMB4ZXsDF7VUuY9Y0AeX6+RAO2c
 eOr1OLxgpsQIkM956NN1FbmglYI623mdJHW+52vxYcZVVSc3U4vPg+/0xr8zBibkgecl
 Z60Kft8q6V3DHwP0BKBn6SlZuQhuXYDJellAEcsVJtL9LRtym+CxvFTv3EJP75g40lUy
 v8FsWqSAejnQfXvmJ/Wj32CcppAlfA+i6L6Mk3AF1QPCs/A8ebVJpHWUocHpuNGgSy8y
 DPUA==
X-Gm-Message-State: AOAM5319OOSBHMGVGk9DkXc2x5DaKT651KCk5MlzO8pG48fzivlhOx09
 pRokw7iSn3+r1GvEz1+hDG7iAAk7a/doxsOU
X-Google-Smtp-Source: ABdhPJzvArMdzPYu8NzcZu9Z52EAUPeqQv+BUc+YHLxIqltjO/tszTOcNhqtNKIWrtmXklZuHFuRBA==
X-Received: by 2002:adf:d191:: with SMTP id v17mr19330928wrc.345.1631024563126; 
 Tue, 07 Sep 2021 07:22:43 -0700 (PDT)
Received: from [192.168.1.165] ([139.47.33.227])
 by smtp.gmail.com with ESMTPSA id d5sm11333464wra.38.2021.09.07.07.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 07:22:42 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
 <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
 <CAFEAcA8EoyaCSzA1vL_SHY50T6Fxjm420_pYgXx1_+E-nV-MBA@mail.gmail.com>
 <906c738e-904c-99ba-b6ab-2556e9262c87@linaro.org>
 <CAFEAcA8-wj4TEQ+VKhVk8JuUW3xKA2NuJ2AnU=2ZTDdMfieuGA@mail.gmail.com>
 <dc5b66b4-4d34-6da9-ceb6-00eb524a070f@linaro.org>
Message-ID: <7cfafc41-5aa0-fc3c-18f6-4ac7581806e2@linaro.org>
Date: Tue, 7 Sep 2021 16:22:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <dc5b66b4-4d34-6da9-ceb6-00eb524a070f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/7/21 4:11 PM, Richard Henderson wrote:
> Well, we could let gen_goto_tb see that is_jmp is already UPDATE_NOCHAIN...

Perhaps anything besides DISAS_NEXT?


r~

