Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9446650F46
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:52:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7IRB-0004Kl-SQ; Mon, 19 Dec 2022 10:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7IR8-0004Br-98
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:52:18 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7IR6-0000j6-Fp
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:52:17 -0500
Received: by mail-wm1-x32a.google.com with SMTP id bg10so6749271wmb.1
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 07:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UPVkq68GhAwXsd680FVFhpSjan+Td9jG0oUmqmGV2AE=;
 b=whEUDvi6t6rVXVhK77TI5FNvxPBK6E8T/sbm+3iHPE13nTf9j7lWQA3IKyEx3YXb38
 j+SSemNOwvgTSfu0BC4zqIGjoxJcip65Z+MEHqM2AE3CAZissFLDYF1L4xUPn49RF+HB
 MdLsI2Uu6rT7s+/RlcSEJcggom19n7+4wjExDzh2Jy3Ziow8xoN5EjDM98fUFFZLDKjI
 0Am3cvqia098V0fnpNlpvtJbmjoE1wxrL5xybVa3i59Kp9pW8kpDxOdgdieKXEL6C9fY
 0Ah1Qnc+dpZ4jrJH6g4Ygl3GD8SFu1Sp+eIqJkr/4bsKgsbsLeJ/9YhCotIZE9e0ogwh
 JzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UPVkq68GhAwXsd680FVFhpSjan+Td9jG0oUmqmGV2AE=;
 b=6E3jkQIfUFg5+HpadePV6nVqmH3biC/Pm2YfXydEORaeMl0E9rKOLxloDAAkUcLkdW
 eDNCD2ASdnCESLj7wSLOUU4oT+ENv8Oq9GudBmfw1FSfpzul2oWQN9nVPdLjmQp21mrG
 RNWTOe4Vsd65pP8WayEqsrv7/jjV9hG7Hk9G8PaFEI/wK19Z1o0+tJ/GKL+7USf/OOnG
 7OGTYuKCgXKKGjV+Nlo4bly+PXqc3rCIGwD8rZdRuPY5c85Ler3S6ZUhvpJWjnsJ/HDH
 UvWFwcjHZaYsjW+oAEPfSxOM+yYf4p1apyEUxiA12rqqNH0rTarJsxhuFW2DMoEBq3BJ
 nN5g==
X-Gm-Message-State: ANoB5pk12+IVrJq5BnU7CddJblknJGJNedTaY4ZkBVSHQaaCPGifXdxF
 rdeaawaJMAMnIfBnjPR/r/Im6w==
X-Google-Smtp-Source: AA0mqf4zp05Txl3+AQIcrvMJkdsk7M8aVAuU9NzXPo/ZAzxAZdOgKjsIDWr5wRndNRGhSuQhf89mrg==
X-Received: by 2002:a7b:c301:0:b0:3cf:82b9:2fe6 with SMTP id
 k1-20020a7bc301000000b003cf82b92fe6mr44457544wmj.8.1671465135065; 
 Mon, 19 Dec 2022 07:52:15 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a05600c21c800b003b47ff307e1sm12428775wmj.31.2022.12.19.07.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 07:52:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4B89B1FFB7;
 Mon, 19 Dec 2022 15:52:14 +0000 (GMT)
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
 <20221213212541.1820840-2-richard.henderson@linaro.org>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 01/27] tcg: Fix tcg_reg_alloc_dup*
Date: Mon, 19 Dec 2022 15:49:30 +0000
In-reply-to: <20221213212541.1820840-2-richard.henderson@linaro.org>
Message-ID: <87y1r3jsr5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Richard Henderson <richard.henderson@linaro.org> writes:

> The assignment to mem_coherent should be done with any
> modification, not simply with a newly allocated register.

What exactly does mem_coherent mean in this case? Is it that our
register store is potentially out of sync with live values in temp regs
or that we have memory loads and stores in flight?

I think it would be useful to add a doc patch for TCGTemp do specify
what the various fields mean. It would certainly help reviewers that
don't have it committed to memory ;-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

