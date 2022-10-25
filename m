Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E9D60C8D2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:51:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onGZO-0006fV-1s; Tue, 25 Oct 2022 05:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onGZK-0006UZ-Ps
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:49:59 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onGZ7-0001ja-0U
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:49:58 -0400
Received: by mail-wr1-x429.google.com with SMTP id bs21so3986443wrb.4
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 02:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jTiLV99rqBGUOY7igiA7Ab0Ztrq1JzYPkU/8tK3ID+0=;
 b=xsBA8W07eQ2Pidig7q/zvfBOgG0NS0VvbgwcJTFdidEqmfjVjyt6EZan1a3ABW+9dN
 JyfXrye7QYj98ZX1jqJTZ/5buO13ZdCreUL0FgHaxw9+OA+py5VPImLp+2o6Y7DxqY3U
 rWSazn6aBRR6vngEfK2pc5sfLrGMSXOg4/77K+ptfrD4JZ/Z4Wm5kfCRxQ3AFxaEHdJt
 0Eib2CtHC8IDKrVVwdzkzMePh+9YYl9n4008z9lUVTiibBHQT4tCWA6BYJaSnh0dNzy0
 p+P/MVWi+e61vfaM0zF6/B7Zgmz9EMungpJkTkc2Xk8Qf67/VszfN6+w+ieVCTKvL6Y9
 qkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jTiLV99rqBGUOY7igiA7Ab0Ztrq1JzYPkU/8tK3ID+0=;
 b=r/K43QqRIco5lAj4YetPLzZktxYOpDLtj0678p0x5idJdhv+eAz5fLA98VIuTv/N5A
 aeYODzOGw10b9DhkrKxL+hfGqFxU1Hta7+gwVCyAOyjdH59PgYsI9cBv4yy8C5PxBmob
 3FoJWqwgJ8759IGV/u2qwH5LCAwRg2F6HiPDPuln0pZp/nBsxR72jNLFQBYDEPBfMCih
 6ebiZY9a7eL23DfjRLjIu1k+nUrAhhDuxuijAopQAl8Fmxpo4QC2YQCqbo1bT4IAeDQk
 SQOM/IAryrRfCwQBSx+cixen/6l77INzQfzr9nk3m1dvCk7yTGlbenYmufc+YiR2ppQT
 wmLQ==
X-Gm-Message-State: ACrzQf1ulOA1vFaEKa0O4YiOpX/NGqcHLXZXMhSQtve6ifVNUKNvc7sQ
 naI2hL1I0XcPeCWOhlrfHIl5FA==
X-Google-Smtp-Source: AMsMyM7SXcdf7V5oNRGfjQ42OAo+Ksud44eckZXHK2fvyDBkk7mIpOsyzf+RhY0j3bKzQDB9QdgSHA==
X-Received: by 2002:a5d:5b1b:0:b0:236:39af:f2a6 with SMTP id
 bx27-20020a5d5b1b000000b0023639aff2a6mr17673745wrb.549.1666691382327; 
 Tue, 25 Oct 2022 02:49:42 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ba22-20020a0560001c1600b002356c051b9csm2076137wrb.66.2022.10.25.02.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 02:49:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6BBDD1FFB7;
 Tue, 25 Oct 2022 10:49:41 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-11-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 10/24] accel/tcg: Rename tb_invalidate_phys_page
Date: Tue, 25 Oct 2022 10:49:34 +0100
In-reply-to: <20221006031113.1139454-11-richard.henderson@linaro.org>
Message-ID: <87r0yw6xmy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Rename to tb_invalidate_phys_page_unwind to emphasize that
> we also detect invalidating the current TB, and also to free
> up that name for other usage.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

