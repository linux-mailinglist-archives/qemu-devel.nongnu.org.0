Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650F96FDA0D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 10:53:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwfZP-0000jy-3W; Wed, 10 May 2023 04:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfZN-0000ix-32
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:53:09 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfZK-00049S-Ob
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:53:08 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f450815d02so4916845e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 01:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683708785; x=1686300785;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9SOIkiXkIyM4o7q0Y7vJZZZ40jzNxRUDcb201kohD/k=;
 b=uLt4QKTGmzQb1LAGuCCYQSUJMbH7tyStonlphWgOlZhomK/BjLsJvBBvlsjWpMh4JX
 6Jxjnao4Yt0oPkOfPBJw/0aGh3Ke5fI73tG7ch94h4mMmDYb0jhmzJReNQLyPa9TwbTi
 KoF9gWkMo66Oza9jFTem9CLxJ9nRtm8qAvmo4wtoImnt0VsAr7WghQFGXaKLPwPSMpzq
 sreJCpqYovAOQeM5jejjG5qPb4YOA2/jQAXAZn1Vr/T74quWgyrI6z8KY2KAFm9IrkVa
 AWJlHlbL39cttVnbmciBkM5UIiSG6h3LMEtb2DmN/R5L3QRMitXZ6vn3x+jkVqxD7867
 +75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683708785; x=1686300785;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9SOIkiXkIyM4o7q0Y7vJZZZ40jzNxRUDcb201kohD/k=;
 b=edSQtMH3CRzSF2UrRPwSRn5O5in4o+F01PxDxpe/Y1jq1UgrQ/AU3ea4eWb3N5CQbj
 4yuw6uyMdkzFJg3MJCjh5NefiP9TKQDFrU4HqGg8Sf/6A0pFfb0NBu3G8nopr7YA1Kgi
 ORADaiqkiQIQQla9LRODJfr5Kn/evERYr8R+oyNLFmffhFQRPb0sbXmY9w+/gUMTB8Qg
 uK7WhI4femh2WulXdF40EyAPZBGLPbPXI3+AnSvHE4xWdh9nDUltlCHzf0j90Q8S3fhg
 RedBPZVYdBlMsusCNj4C0Hdn3PIJJP0MhQKnMuF+7a1YSjxQUbEduWtkD4as8C4Yl2yY
 ZEwg==
X-Gm-Message-State: AC+VfDxdjPzGIGYr2D5baKgbEe2KS7lmcgFsF+YydabjObD/krC2CbME
 uAEEoiNd4jEphIHkKpoFATOJ8fkLB+DOWPYBmbGb3A==
X-Google-Smtp-Source: ACHHUZ60qoTtI7SJ4nHyoeYOR2vRUCedeall9C5uVD8NKqUGApgLqcPe1MCP5xLFxi/nZ0VUkT84VA==
X-Received: by 2002:a1c:f211:0:b0:3ef:8b0:dbb1 with SMTP id
 s17-20020a1cf211000000b003ef08b0dbb1mr11594581wmc.7.1683708784906; 
 Wed, 10 May 2023 01:53:04 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j10-20020adff54a000000b00304b5b2f5ffsm16718349wrp.53.2023.05.10.01.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 01:53:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 16D2B1FFBB;
 Wed, 10 May 2023 09:53:04 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-4-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 03/30] tcg/aarch64: Introduce prepare_host_addr
Date: Wed, 10 May 2023 09:52:54 +0100
In-reply-to: <20230506072235.597467-4-richard.henderson@linaro.org>
Message-ID: <87mt2ca7pr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

