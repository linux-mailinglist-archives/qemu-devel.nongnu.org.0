Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7896FDF37
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 15:52:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwkF4-000791-DW; Wed, 10 May 2023 09:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkEp-00076J-8o
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:52:15 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkEm-0002l8-SY
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:52:15 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2f27a9c7970so6879037f8f.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 06:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683726731; x=1686318731;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/g+xGOc8ChYbBYW3clG+lZ1yqlk52hAxIJC2vcLTe/E=;
 b=xK9Ut7mwzC5jay/ik1mbIDVRx2vsmGTxcTKxPR7Hletz3R3j7mIVg0DHr9yxLNaEg2
 0fiakzyuM60g8chbV4oB8xkk6ytOP9BPe9AWTJuPnJY3bb6nLvIYL1Qhh7OC4/vcjeuh
 vKb3shGsKee11Eiw4f8x+EGdk49Yc2hLT9NFkEUnXxlyS9ZA5zNg98R9GKOSlPj1tVDB
 sVVmKtfeZevpnCRVgqgsgvkUuNUq82CkoPxxm+l2tQpDbBt08eZUw77x8jJf6sZL5b3M
 8/4KLEmCPJLYL52PfwUyTIMANv6aB+FNq3DlCccCjvTD0ZFf2p1obkC9Io81oXzuAigW
 V2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683726731; x=1686318731;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/g+xGOc8ChYbBYW3clG+lZ1yqlk52hAxIJC2vcLTe/E=;
 b=MkFfk6/wfgStzTkaaDyWDxfERmH3HTltlT4fpXcBkCUaLXeQez37JoLSkn7oU5s/2g
 /CJrfYGZaH0hOkTtkBt0WadWglfU3eMSO3BSX4u5/Qi6xvp6ppsq2LqvlZbbvLQCbINa
 1sgPWckVHxxNLzkv+hZv2kEz7LNkW3TyvW8Kei99VPcVYcEuh18kEPqigVGT01rojybZ
 IX6rUJ1GLYtihG+f9gAuWXQ72x0GWePKyejF61Hwmu0EsQgZ7ZWdQKST0uKV8oqlPkAM
 i9ayrTU3K9PKqHVffJ3qWD6GieGe0kQn+6osylstXiu+LwbI5hfCjl7eqg5OZD50EEUK
 Zb1w==
X-Gm-Message-State: AC+VfDySVyEIOfQcdmBtk/sm+xIOPCrls2ibbsC2eT3u91rx+83wetSm
 FJehPb0w0pfUMjtjZi2MA1+8dw==
X-Google-Smtp-Source: ACHHUZ5MRgBs92zrwE7ffdH8FMiVNWqeXd6AmP0Oh/MlcEd4WijxIVlIVauG8IyHZQWOmCx77rdtrg==
X-Received: by 2002:a5d:5746:0:b0:306:46c0:1739 with SMTP id
 q6-20020a5d5746000000b0030646c01739mr12383521wrw.15.1683726731095; 
 Wed, 10 May 2023 06:52:11 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a05600010cd00b00306299be5a2sm17682967wrx.72.2023.05.10.06.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:52:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7D7381FFBB;
 Wed, 10 May 2023 14:52:10 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-26-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, Daniel
 Henrique Barboza <danielhb413@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v5 25/30] tcg/ppc: Adjust constraints on qemu_ld/st
Date: Wed, 10 May 2023 14:51:59 +0100
In-reply-to: <20230506072235.597467-26-richard.henderson@linaro.org>
Message-ID: <87r0ro5m5x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

> The softmmu tlb uses TCG_REG_{TMP1,TMP2,R0}, not any of the normally
> available registers.  Now that we handle overlap betwen inputs and
> helper arguments, we can allow any allocatable reg.
>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

