Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F416FDA66
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:06:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwflu-0000Te-C0; Wed, 10 May 2023 05:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwfli-0000G6-F9
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:05:55 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwflf-0007qJ-A1
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:05:53 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3062db220a3so4502184f8f.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 02:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683709548; x=1686301548;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pemjz5gsxQvJFr3OHBPAfO76RVrjdn9gMWic7ZgGXfY=;
 b=TftCW/F/1UAMuLirzYhT1XNA5rgsGhV9F2nrfO/rnFzX0ipMOo4bZ5o1Vwgd7X7L74
 wyY77rrzcoBpYjFezvwVQ1l3T+pmbqP9IKLGUew9Z4oNtmDsrG++bOFnlhmcO+yOpl7t
 woIt1GC1MMhcdayt8+w4dF1xOCkWJbcHkwi/FB7UoN43zHXZQ3dAYr6lxUU9w7URK9vr
 UGqrtrejR8cvtpzvT7vz3qezmKWAPrffnaNrXfUifTTYu68pQDtG4fp0DC6Cr7J8xCR1
 yMfYydjwI6STZUvDREqOJbs+ErGeQgzySYQRdb8PcnL6S7qZi0aYCsTyaCBv0fpQwHn/
 yScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683709548; x=1686301548;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Pemjz5gsxQvJFr3OHBPAfO76RVrjdn9gMWic7ZgGXfY=;
 b=Tp9p8duM0NW0Rqw4lNUEe0nyas8aLDSRJv2P8CSc8o1OTZxzuBTitl9Cc/NrFyh3Gm
 6gUi2nUTKQnOEvk12RyNYDWb5hKfc94zpjSpgrDapIPCHHwH22QCCWyjxZRLzxFVllex
 Mup9eQVO5ga+UOeZI7I+kEFWyrTk1+9YySKF+BK9eS9JZTQhhwB0cjcvXLIvRDNXKT6d
 8dmyH699SIH1Sc6gTz6ICnBeDB26d52BvmVKMiwsNB2vv2UfiOhByp61R/FYtdpOHmZ/
 I6StVZVcbSLJOi/TET7cxOynYMqTSMdr34WZ0O2JgkWDS9cKYfUoTQ7Cnh7hOZJaMfkZ
 tbTg==
X-Gm-Message-State: AC+VfDx6P29HCcF91+bJyGD1LXmlcVnvRuw/MB53X1VE6qE6DYiklErm
 vKvTiiXpJCPf/JHScAVe2aPxbQ==
X-Google-Smtp-Source: ACHHUZ7XAyxFZmWNpZSc2KIfqyMKCpPl+vSe9EBuqjYf7ulHy9QWxlaytx85oB+odFzaxr9aTxhymQ==
X-Received: by 2002:a5d:6990:0:b0:306:2d15:fc35 with SMTP id
 g16-20020a5d6990000000b003062d15fc35mr11284074wru.37.1683709548317; 
 Wed, 10 May 2023 02:05:48 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k9-20020adfe8c9000000b0030642f5da27sm16678398wrn.37.2023.05.10.02.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 02:05:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 86BE31FFBB;
 Wed, 10 May 2023 10:05:47 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-6-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 05/30] tcg/loongarch64: Introduce prepare_host_addr
Date: Wed, 10 May 2023 10:05:35 +0100
In-reply-to: <20230506072235.597467-6-richard.henderson@linaro.org>
Message-ID: <87ednoa74k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
> tcg_out_zext_addr_if_32_bit, and some code that lived in both
> tcg_out_qemu_ld and tcg_out_qemu_st into one function that returns
> HostAddress and TCGLabelQemuLdst structures.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

