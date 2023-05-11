Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095AD6FF798
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 18:40:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px9K7-0003bs-3w; Thu, 11 May 2023 12:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9K5-0003Vi-7t
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:39:21 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9K3-0006zB-L7
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:39:20 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f4ad71b00eso14524815e9.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 09:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683823158; x=1686415158;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gCBRemt/gKNKyMYhO3KptqAYhdah28HsBv9WYrX2vHI=;
 b=F5w/k4iBa2zSnXXZPv6GgQFjx8L9seXZgiv4xqpjhZFT307OrYz/OVSg8M5RuBkrsl
 PnooYN+WhuVQc2SwJYJvRZvtubCBGcCwSZolOthK26GPWCKuNb1unjW4Tvzz9Gt9XK17
 Hv2AvN7s/ve4hGych6LCTogVMtGtfMFvXmRW7GeW42BpTDZY2+Wv9GjJ4dCdznfoK88A
 rB2nDJmXf4mZeBRPEoo9Ue3ri9Uc3/1mnyGpHhQIO9GMT9guPIiyfRCGSPyLvvmdbGDY
 Gg9zFBZ1XdjyOVQN3ee1av6joAqx7nwEgXez6edBfp+tAi7C/jAvL1Q+P/qb7ylD1mfp
 OpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683823158; x=1686415158;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gCBRemt/gKNKyMYhO3KptqAYhdah28HsBv9WYrX2vHI=;
 b=Y1ToVDitrnvyS+yq+UVIq1E3WzJExwoA7MMHJEdw6cp/wYWAnwG5IeAUdv5KBVj3QP
 Zv9vP19pbZ6daDJt/ZWGi7xq4SOd1z7Bzbmp193hio0WHUTtsOcqvrynj1+2/5O2drfL
 i8WV2eIdumL7DGRilOATmA7QTscMqE4IHHB2mS/l83Deej0CuMV1jwJ98rlC6Dw4BlH+
 4ieRAoSmoNCa/rWaPqJHODdJdrzrw+WQX5xzcavjD78iVRo5pOqCbC1X1s2G4QXbiWL4
 SMSzMelUCiFL9PW2/U45uiiSN33h0zCZYO4oNxpA7fYfyv6vi9QxiK37uYrxnZw+xhpN
 hiPw==
X-Gm-Message-State: AC+VfDxka0FqpzaZAppNNQZs0eXl9/3BQGwj1CWdC4XjIM2LFVoTeHai
 iHWjOOm+xhzv20h326+HxPSYrm0gUH0r9DX7C2wSIg==
X-Google-Smtp-Source: ACHHUZ5bwE/uqMfs53WIU2xBuwVCLIauGmBuoiNA4HdtcovoB+eUYjAnxGVbInq803aLrpPAImngIQ==
X-Received: by 2002:a7b:c7d4:0:b0:3f4:2d22:536a with SMTP id
 z20-20020a7bc7d4000000b003f42d22536amr6040344wmk.19.1683823157928; 
 Thu, 11 May 2023 09:39:17 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 6-20020a05600c230600b003f427db0015sm11022773wmo.38.2023.05.11.09.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 09:39:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2115C1FFBB;
 Thu, 11 May 2023 17:39:17 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-19-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 18/84] tcg/i386: Adjust type of tlb_mask
Date: Thu, 11 May 2023 17:39:12 +0100
In-reply-to: <20230503072331.1747057-19-richard.henderson@linaro.org>
Message-ID: <87sfc2zutm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Because of its use on tgen_arithi, this value must be a signed
> 32-bit quantity, as that is what may be encoded in the insn.
> The truncation of the value to unsigned for 32-bit guests is
> done via the REX bit via 'trexw'.
>
> Removes the only uses of target_ulong from this tcg backend.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

