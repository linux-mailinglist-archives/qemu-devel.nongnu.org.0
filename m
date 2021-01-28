Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B746307AAC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:26:09 +0100 (CET)
Received: from localhost ([::1]:47498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5A7U-0008U7-3U
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:26:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5A1k-0002wM-C7
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:20:12 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5A1i-0003OW-Qa
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:20:12 -0500
Received: by mail-wr1-x42e.google.com with SMTP id 6so6000661wri.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 08:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=cA8ieksFLo8uigWASEAXhS+Y1fP4qVCbIYmzMj3pMuM=;
 b=Vj3YMG87V87Eyv3L6l9eQNT1geugQjmuXTH4vj6zHPE1IxIgSjdUdDW1EK/uB28eSa
 DydDk732IPVl7XmuxQFRv/Twb+Q18sR2c9DxGqX+HLsnIzilN3ZxAvBmqr45uSwVov+K
 dqGCqF2VYYqNe30gr1yNqk+D2f5uzNfdaiwxY4QlE33snnEDsUQJ6KSLuVBAPYm8AjKI
 BZ65rmcUeCw7n5v0C7kwvE7BJSn9jtGdKX5epgdZNei4CTfbVce/hGDt+XR6WavkjKCW
 O/wW++4z6aitB33DzaLmbpLYl3/r6UyHkM0siZT4mByZJp8Ke4TZg0S87tuTdk8lOfCT
 x/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=cA8ieksFLo8uigWASEAXhS+Y1fP4qVCbIYmzMj3pMuM=;
 b=UspXeZK66ksPS/BOpikTJUHhTJzvgZRZhF2mdPHt1667c8U1Pi8dexNY3de+EnL1Mr
 uJxDOzYhWCdqZO7ZEFDk89YJCZ18px1RblimIJeA1Hpk49uQW8QdWLldYthejHUJpvLh
 +Q0M0HV+uCNkt8ZEYzdVNXnprEsPnWAnwUh0D6upnL5CnRclGzLGeue+0lfUKlKMZLEC
 MoCqKy+BaKCz/4rm50U21GGv7HT1+/zpBLCEQSzMs1eI8zo85jINPSpGFuiE9t74suab
 1XEQSPu2Vvv+0Nwu/KrfxDeGwXBR5Ldn706anfNke6Wz+BYP8nohA1inH9JXg17HTkMa
 jgdQ==
X-Gm-Message-State: AOAM5332k5zGAc6knbhS9oI1cwgeznTdDEq6IWJD6a0oA6lSeEL1YMC4
 UwdBGHxyzWSN7h4Ez7m9+rQsFw==
X-Google-Smtp-Source: ABdhPJwKmqJ8J40iVHj2/EJYm08yXJygQ5UaqSFK3ySydVQsZEIM5aMaQ5OqS3RMsi6A1M09aYcxGQ==
X-Received: by 2002:adf:dc88:: with SMTP id r8mr1244123wrj.401.1611850808539; 
 Thu, 28 Jan 2021 08:20:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w14sm7667338wro.86.2021.01.28.08.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 08:20:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D50DE1FF7E;
 Thu, 28 Jan 2021 16:20:06 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-15-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 14/23] tcg/tci: Merge INDEX_op_ld16s_{i32,i64}
Date: Thu, 28 Jan 2021 16:20:02 +0000
In-reply-to: <20210128082331.196801-15-richard.henderson@linaro.org>
Message-ID: <87wnvxt4nd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Eliminating a TODO for ld16s_i64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

