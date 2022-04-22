Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9D550BC44
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 17:57:29 +0200 (CEST)
Received: from localhost ([::1]:45032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhvey-0008WC-2e
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 11:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhvdl-0007ew-Tw
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:56:14 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:39880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhvdk-0007tJ-Au
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:56:13 -0400
Received: by mail-ed1-x534.google.com with SMTP id g20so10957137edw.6
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=cR54X0LKwjqd0FNluiHNkLi3yQ1OrzeKFpOBTi1ADC4=;
 b=awbFJjM3N/+F/ulDOJh6kA6Ty4rEwIpfnU2JqYQdkB66+ercF2iWf8rYYO1pDtP4a2
 TDM15YJq+DSI50SnV2iasT6Ut8HqXq8YLZjRRumjdAkt8KUNjfbxqGKRliz38x1c7k8n
 MIh/UHCWu8N2YwcUN8OBycakyK/rbYRROV5dRhWs64xi6exyLHLA+TBkMmQmmymldV7V
 VdLr7gcN/hd431pmSBj2x2+4bt4/UDudRGYQL9MiwDAAIKt7hSdQaUqViMRUsci2Oirv
 GkbN2qVmXqqpJI2vHqtD8BduMXPb5SdEzLbipxPZ7cyXJ88FqL4JyuUlBFs9arRJwKeN
 HNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=cR54X0LKwjqd0FNluiHNkLi3yQ1OrzeKFpOBTi1ADC4=;
 b=p/7zpXr11IBX3bE1AQePyWaWU9j/cYYQO1eqp/e5kRsF0xR8CqSlU9Q6hWF7d0ud8T
 jANwhCRqZMlosYpq0l21ljZiYXzapFYIl+RZ/AuLYuMLi6/zntgzO2teobPRYO3ICTFp
 FFdw4txlHCRl8+mE0ueXk3xntD8jbGIuSXkBaTOBkU7wRpaTIZY0GTOFZBbY/dl4wfoR
 e6mG3it+pE+9dp602FFs89DbZxYEgjHMI+g98aH9O5x3z1O4b/SpZSN0YrFA9ACDnGQk
 FYuACykE4xTthCaE/MYc3gqzUzr/lXvP+rwIzMWccJIK9+KMragI1+yAcvwznGtIOEmi
 TPqA==
X-Gm-Message-State: AOAM530kw05oFfua5VDp9liK1O4xz5TLSjhP7vyEO/bdUy1EbQ/bKdw9
 5YRinxbbayKJxc5/s05Fzro3/A==
X-Google-Smtp-Source: ABdhPJyYTskCdNyIYlQ+bavb2yJ/oVKWPfHGKmGZx8iGuG0YV8i1MwrvWTNmgWg1YWZCGs9FMpnMWg==
X-Received: by 2002:a05:6402:3713:b0:41d:96f6:8a09 with SMTP id
 ek19-20020a056402371300b0041d96f68a09mr5642731edb.136.1650642970783; 
 Fri, 22 Apr 2022 08:56:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a056402105300b004162d0b4cbbsm1011638edu.93.2022.04.22.08.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 08:56:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 36E5B1FFB7;
 Fri, 22 Apr 2022 16:56:09 +0100 (BST)
References: <20220401170813.318609-1-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] accel/tcg: Assert mmu_idx in range before use in cputlb
Date: Fri, 22 Apr 2022 16:55:53 +0100
In-reply-to: <20220401170813.318609-1-richard.henderson@linaro.org>
Message-ID: <877d7ht8me.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Coverity reports out-of-bound accesses within cputlb.c.
> This should be a false positive due to how the index is
> decoded from MemOpIdx.  To be fair, nothing is checking
> the correct bounds during encoding either.
>
> Assert index in range before use, both to catch user errors
> and to pacify static analysis.
>
> Fixes: Coverity CID 1487120, 1487127, 1487170, 1487196, 1487215, 1487238
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

