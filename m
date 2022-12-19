Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B2B651022
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 17:18:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Ipw-0005EC-J6; Mon, 19 Dec 2022 11:17:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7Ips-0005Ds-Ih
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 11:17:52 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7Iph-0005q3-Ob
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 11:17:47 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 i187-20020a1c3bc4000000b003d1e906ca23so6305289wma.3
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 08:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AJLbmLkw0FHT/PHcVQyltkRapDmQUXQBhLhcdQG7cug=;
 b=x42eYAFxwfJYLKwVAKcR27Qb4c0Dgo2FBM00HruA7gAaKzj5qeb3WeIf6SfkW9lHJT
 8y5+qR6R5dWc//9qX08V36ZmR5K52l1T7sUudDPw8vtdeJSlpKbFZUDDX2GKUroy9r1R
 Y69pHXdttpXASUU7gmIwnz3GHa4IDcUltmgGmjizvXZ9hM4fxvQmJMCngeKVGWgbP8W7
 +Pn/bNlW1mqFTLQUbEMGGdzuU/ILrmuXF8A2ubrRR1KLr82yeVwP5jSoJvOMaH5LZMNH
 MYy5pc1inHrJGVOFE7LwThqZDeI2nPLkj6Hne/t61xC8iyesHKHRXmqqyqPIevnu6zNr
 XvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AJLbmLkw0FHT/PHcVQyltkRapDmQUXQBhLhcdQG7cug=;
 b=tQVpTZAiW7/e8wcqffb9eOzw8cZs56rK424bul50tgCJAdzJb7i+eYZqZASUhaEQpd
 zlIRSCHx7DSEf/RuDKZ4G4S+6YeLmsV1cA8PDIWQi+8ERSmAltaeLrHFS5GZvG5kUsL+
 eS4Fbaj05G3TzdKmqeO3445rEozaD1IltG3qZyijoJOp7ySm7zsem6hszCNKHz3a+6hV
 AXKwrhXLWRpJ3EosB5fvhNsKXKVpaTVFaQQqks8B8UNj9N4Q6HuyYW+dGfyVKqPJaBIR
 1YHApngqkqRNsYlHf/Cw406Fq0kOCyz1JBZD+Ltprg8TJpU1fTWdiJr0bxEYUys8IgBo
 EVwA==
X-Gm-Message-State: ANoB5pmI9GLI6ux8j+n9saCsnVOE7e8wlJqFNJ+nvudskSbeHhZFI+yi
 CkZtcWjnT+qFhqy+GQckNrrsWA==
X-Google-Smtp-Source: AA0mqf6sUBI+lYmxo8tqHn05A/K0Gm7Ll9k49n7eqPK2INnVkpNJBJHeL3PEahpO6FJbCxKcOd3Z/w==
X-Received: by 2002:a05:600c:3d8f:b0:3cf:a18d:399c with SMTP id
 bi15-20020a05600c3d8f00b003cfa18d399cmr33250628wmb.1.1671466651532; 
 Mon, 19 Dec 2022 08:17:31 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t189-20020a1c46c6000000b003cf87623c16sm19973815wma.4.2022.12.19.08.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 08:17:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C41DD1FFB7;
 Mon, 19 Dec 2022 16:17:30 +0000 (GMT)
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
 <20221213212541.1820840-3-richard.henderson@linaro.org>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 02/27] tcg: Centralize updates to reg_to_temp
Date: Mon, 19 Dec 2022 16:17:25 +0000
In-reply-to: <20221213212541.1820840-3-richard.henderson@linaro.org>
Message-ID: <87tu1rjrl1.fsf@linaro.org>
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

> Create two new functions, set_temp_val_{reg,nonreg}.
> Assert that the reg_to_temp mapping is correct before
> any changes are made.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

