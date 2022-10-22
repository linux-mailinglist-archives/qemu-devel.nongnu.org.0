Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1578609ADF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 09:01:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omj7h-00052W-2r
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 18:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1omJX4-0006bp-0C
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 14:47:42 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1omJX2-0005hF-FD
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 14:47:41 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 e20-20020a05600c449400b003cce0107a6fso332452wmo.0
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 11:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PdlBk28oLlVkFTL63OkALSZnW6hUHvNPbIGPAPBNTOc=;
 b=aLhOek04x8mGW0Y2mJmNpfqommL2dDLYZ1OP6LggGeF5I7ky2aHKhrRajzHQiSKytg
 V+Gy/WJIZlKWUvHbKfOgVnXyvxfoekw9PxJQ4B07ypBccNzcgZTPgt1yAAIXwuiU7xMe
 Lw3abAjPDxId+UgkuqHik6KlCZQFICI9tfnb9KogvLX66JFEnDMQHbriKe14/xKiI8W2
 WgPZSarM2l00zO7LyY55wyCZQHwa+K/KqVQ901TUxp7nVPVG/5szgWUwDWQGWqYK/a1A
 xhntZ2GCQKMx5N3rhcB4N7OpgzDkRNyPvpx+7X5YXLaDSlFrk2dzvTFdua+on5zKLMCO
 t3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PdlBk28oLlVkFTL63OkALSZnW6hUHvNPbIGPAPBNTOc=;
 b=s7eP1U638VyPRQ44jsblyaOUgX8VuzFG0Pd7I/uDBl2JXhPZRlG+3mBep87cIdGUHz
 IeBdqkgOhEu/1z477PivxT+fp3NMjNVwMLGqSqmKWs87bshpZEg4ZaXgzeeBPLpocogU
 brNNd5yzgIiKCGQeRVJy1AXYFo/8pnP8ihcUoWAzbXlCfBw+vQDqdvuy+zjnX3HnsQpj
 jP5wUdCbDqBkScYkFwsabsJX6+0eCyPewYYwaUBnsWi2hWBjzSsCl0GhdH3AmMp2WGrL
 QsjK5UAm4J2KON7NPmpvYBm3g2VE7cazCthXLuE4wVRirgpkwx5j6l6dhb6j0dFeFVC1
 Oz9g==
X-Gm-Message-State: ACrzQf3ZU/GLAxXu+zoBLX50qxIHCSk/DsfxDNUFJbdEkN20CtV1fJCi
 1yedVOW85ysMFRRFLCp3kM75rQ==
X-Google-Smtp-Source: AMsMyM6VFmmJmEIKd6VeuBc08QdfZ4SAeA1zHDAaJ/coDsw/mYppFj6X5lAELzItg/1m9vOXTmizow==
X-Received: by 2002:a05:600c:3781:b0:3b4:63c8:554b with SMTP id
 o1-20020a05600c378100b003b463c8554bmr37943692wmr.25.1666464458365; 
 Sat, 22 Oct 2022 11:47:38 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t189-20020a1c46c6000000b003c701c12a17sm3316354wma.12.2022.10.22.11.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 11:47:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 37AC81FFB7;
 Sat, 22 Oct 2022 19:47:37 +0100 (BST)
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
 <20221020223548.2310496-2-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v5 01/14] target/arm: Introduce regime_is_stage2
Date: Sat, 22 Oct 2022 19:47:31 +0100
In-reply-to: <20221020223548.2310496-2-richard.henderson@linaro.org>
Message-ID: <875ygbae5z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Reduce the amount of typing required for this check.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

