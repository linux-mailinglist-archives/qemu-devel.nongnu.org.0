Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010056FF662
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:46:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8UC-0001ng-3H; Thu, 11 May 2023 11:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8U4-0001nD-F5
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:45:41 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8Tz-0002xt-TC
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:45:35 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-307a8386946so2462653f8f.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683819930; x=1686411930;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0JYg0rOZyFJU6BdRcEA++EJo4IzKZpg8r5QqI1TJhM0=;
 b=qTBgCHLS+5yeSi6KXqQ6uBXANCWZLyt9JB8wD7nCHajoxYbB+Hl66a6zAOr72M6tPB
 +MwHXtUKDPFrI8OgfYsPQnnSh7Fz2M+CSkcmaAKiZIUFX2WQXRWvzh8svUlpQguWW+JS
 ETJR6EqkOSPDZzl+p7cF5c3zWTLYdHRRGaE0wbTQ/jl40rzAl+AQNE8Id8TmZWBDDz1r
 vmpyNOFOyD9Pt1gKsWI6AWG1VE9em+7T0UEEL/Tsuqbsph2yBs1LlteECdWBP0RN5MHA
 1hn3uqkG6nPiH+v21inh4uYVBq6AzOboi9tHgY40WWPGdBQmtOy6KwnXD/PIoW42B6n/
 7CeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683819930; x=1686411930;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0JYg0rOZyFJU6BdRcEA++EJo4IzKZpg8r5QqI1TJhM0=;
 b=lq+WvjYa3JR19RraI17BvTWsNZ141Y3xyUdPlj9NfMiPYG3Tr4WTIAR9XBkGeFff76
 x43ld3GTpyelo1/Q9zDxnyupsOPBNnSN1sqyi+hWyL2YC3t1QKgZnkYhTYrwBZElSENI
 sqb271PMTG/Ro6aOBcaNHY/yQzDftuG855ZTNPusPsNO/b79n4CHSs6n2mLEo5NZ74Qv
 SqHUjhZP5FW4vA/Zs7sVbuxzNxKq+tXdvgpDwW6H09XyEqRv5C2j8AeGJl2M72DigVZ5
 zz5VKMUHcusUXTQ/ImUwMDx2VKGw6gH1gC5177RqeSMXHuepBd62r4KftDNf0mcRYseI
 hE/A==
X-Gm-Message-State: AC+VfDwQcoQMXchtWQX3A2cwn7Z7njgx6IMjMLEeu6sgUzKx4CJwaTS4
 Duu+rH98xCAXW61HlYY6K9YNFQ==
X-Google-Smtp-Source: ACHHUZ5/dqdy0htyfAcXAhBna/1lgeKKF8QmdYIDhfQvpX3Xg1ACJNcJ9viHrQ38jVRx7obazoRbeQ==
X-Received: by 2002:adf:e48b:0:b0:2f5:9800:8d3e with SMTP id
 i11-20020adfe48b000000b002f598008d3emr16157521wrm.47.1683819929966; 
 Thu, 11 May 2023 08:45:29 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a5d4e81000000b003062765bf1dsm20820734wru.33.2023.05.11.08.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 08:45:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3D6191FFBB;
 Thu, 11 May 2023 16:45:29 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-10-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 09/84] tcg: Reduce copies for plugin_gen_mem_callbacks
Date: Thu, 11 May 2023 16:44:13 +0100
In-reply-to: <20230503072331.1747057-10-richard.henderson@linaro.org>
Message-ID: <87v8gy27om.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

> We only need to make copies for loads, when the destination
> overlaps the address.  For now, only eliminate the copy for
> stores and 128-bit loads.
>
> Rename plugin_prep_mem_callbacks to plugin_maybe_preserve_addr,
> returning NULL if no copy is made.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg-op-ldst.c | 38 ++++++++++++++++++++------------------
>  1 file changed, 20 insertions(+), 18 deletions(-)
>
> diff --git a/tcg/tcg-op-ldst.c b/tcg/tcg-op-ldst.c
> index 17fe35b93c..cbd85f793c 100644
> --- a/tcg/tcg-op-ldst.c
> +++ b/tcg/tcg-op-ldst.c
> @@ -114,7 +114,8 @@ static void tcg_gen_req_mo(TCGBar type)
>      }
>  }
>=20=20
> -static inline TCGv plugin_prep_mem_callbacks(TCGv vaddr)
> +/* Only required for loads, where value might overlap addr. */

maybe mention we don't bother checking if the temps actually overlap
because we will need to futz around with the copy of addr for plugins.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

