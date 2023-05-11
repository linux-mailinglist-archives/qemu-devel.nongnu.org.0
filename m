Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEFF6FF60D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:33:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8II-0000fb-8S; Thu, 11 May 2023 11:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8IA-0000Mm-By
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:33:20 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8I8-00085Y-Rs
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:33:18 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f42c865534so32695635e9.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683819195; x=1686411195;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S70hy7hnAxt29XEEJxeHBbBUW/HBjwefMHzH1X/OuoM=;
 b=uh2wuUUo1ugmSlmG+8ey7HOc9yLl5uo8SHEN/J5dxFNl4Up/zbEjDoMNYPIwZyJh++
 Q9+Dm9gZwHhHaGJVteOGm9iZuVPGZIopy9NJIeomfN8apfFGBZTeG8HiV28xy9Ld15OZ
 kxvyZKyP+20+l+C+U1ESatu1bL2ku+RGc8MSAbNNr2JgjvluVqELelh5O+doD39eMi2e
 jM82izeYdcSNLcz2Zhg1A20kpEE8gHWiRSznjXhy5vN3c4NT/GaOqxH1yoMMS6Khmgq+
 WfUAbQwsXdQncIDKnYh6huvHE2Xgcl6tj5ecv/YE8rcMvL+UieSIbGDgtjIXbQCzke8I
 Nwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683819195; x=1686411195;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=S70hy7hnAxt29XEEJxeHBbBUW/HBjwefMHzH1X/OuoM=;
 b=Ojmpm96v0brwuFqAg4KMdKCjmMU/vxVoKkmmY1/n4tBHOg+a5KqT8OKotzJxEx/+6g
 +3fGoZc/ozZAodAG8kLYORDKWNxRwrYvEKkLpdguHrzKBqpgHAfhx8zv+66jr+IwquBp
 ke9dfHZNoteAHQsPaCv34YbYkqUacoStOtqslzvh2nBoOTpSPv/GWRFxUsEmOR/7QHgQ
 cTt5K9mHtd2BOaJrmZcV/6ZmWmJ0Bdsy9eWgqUCwj1n7EZEPnBrjfuiumY2dlrUxzzIs
 SahVGWojW8CO6IIF5kiAnhyT8I+Ke8pIH5XRumdM4AGTyaSj3xVPf6Y6Fnagrln8aCfC
 /rWw==
X-Gm-Message-State: AC+VfDxHLq8KOJbueJvAwdQnX1ccUQnNKRSiEMAnFf3O5+tbOON7inoH
 g5W51nngvDb4OTAJP/PX3jKAvMf2z5VgZUIkPAi4LQ==
X-Google-Smtp-Source: ACHHUZ5kC/HDILlmUcZa0btU8HH52dIqMHnef2NvQIKb2MPl71jPceAzhUYy+IzOrrmzlYJmsvQ6Hw==
X-Received: by 2002:a05:600c:210f:b0:3f1:6458:99ba with SMTP id
 u15-20020a05600c210f00b003f1645899bamr15834261wml.29.1683819194729; 
 Thu, 11 May 2023 08:33:14 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a1cf207000000b003e91b9a92c9sm25983818wmc.24.2023.05.11.08.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 08:33:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F89E1FFBB;
 Thu, 11 May 2023 16:33:14 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-7-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 06/84] tcg: Widen tcg_gen_code pc_start argument to
 uint64_t
Date: Thu, 11 May 2023 16:33:09 +0100
In-reply-to: <20230503072331.1747057-7-richard.henderson@linaro.org>
Message-ID: <878rdu3mth.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

