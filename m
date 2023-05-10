Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507C66FDA6F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:10:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwfpK-0001zP-JM; Wed, 10 May 2023 05:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfpE-0001wK-D0
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:09:32 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfpC-0000AH-KX
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:09:32 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3063891d61aso6568193f8f.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 02:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683709769; x=1686301769;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9SOIkiXkIyM4o7q0Y7vJZZZ40jzNxRUDcb201kohD/k=;
 b=rPXmwnKqsRJiEQ2emr8gASXuXRVHXMt3/uhEA5VtoYHmoSNIiOrhctpcSSGfDYxRdD
 Eh41CbCH7y0f3eC5ynFuoWzYZiO6A0ub41TKEBbyAmV1nx0ZePP/SuGWWehk8GkbnKFS
 elRaE1ZG0tNQmMXTIDCuT66A3EKlzwu5HeG2M9Lis2gWK+noqUMLEPl/10RZkPCMCgtT
 xKbHIJdhlKQbqINOx9jNWAsCgbYWlU3ntbzwhp1a5peKO7dMIuZ1p1lIigyFfYFfclJc
 B857mD8ht0WgNYI6yHGY8lMMQ4h7qK2/T3/hHi9BZNO8joQGMVpeweAowIIagKUrlyQ0
 WdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683709769; x=1686301769;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9SOIkiXkIyM4o7q0Y7vJZZZ40jzNxRUDcb201kohD/k=;
 b=OG+ZkYwt4VN6gZixLhrrJW51m+jdU/Oq0TqITm5NwC41fmUnVrvbZZAwVjAj3SDTqa
 1XyJ/KsWaXOvxDaf7gIOVkfhCrOvMVVzNYZIMjH8XvzLcqgFemdEY8Cqc4dCChrUH1hC
 q345MfXu6njto6NfM1OvBg9USwyMv5HpaItCu1xg+9s8IkRVpCpCApaHCalP4+/+vM6o
 Bt7s/TW1zi8BD4EMwlak2Pvtb6B5wZcAGfxjHbXCDUwEocRGOUKWFZDsVs0W1LG2Fw4i
 5p8vVC3UNG2o4L3uEAS61sqL+PfsIZnBhuIaSEo923VTsMB4yKJI4/dynPGHr0FbF8J8
 iZxg==
X-Gm-Message-State: AC+VfDzAsowm0+ssdAeqBPAIyJ+M2JsN8xBDqLqdTu9ghtVe/xQLVAxh
 WOKrhM32i6PmhA82FHyZ3Hyqxg==
X-Google-Smtp-Source: ACHHUZ4Z7Y23gI1risy1Zvs33eXbu6zEtjglCdqXQkpkH5soxorm0B2MiRNDs47VFn+6VYHeWDq0gg==
X-Received: by 2002:a5d:658c:0:b0:306:4442:4c7a with SMTP id
 q12-20020a5d658c000000b0030644424c7amr10975296wru.33.1683709768882; 
 Wed, 10 May 2023 02:09:28 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a5d4e8f000000b0030629536e64sm16776452wru.30.2023.05.10.02.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 02:09:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 075EC1FFBB;
 Wed, 10 May 2023 10:09:28 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-7-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 06/30] tcg/mips: Introduce prepare_host_addr
Date: Wed, 10 May 2023 10:09:19 +0100
In-reply-to: <20230506072235.597467-7-richard.henderson@linaro.org>
Message-ID: <87a5yca6yg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Merge tcg_out_tlb_load, add_qemu_ldst_label, tcg_out_test_alignment,
> and some code that lived in both tcg_out_qemu_ld and tcg_out_qemu_st
> into one function that returns HostAddress and TCGLabelQemuLdst structure=
s.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

