Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B90664FF3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 00:28:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFO1d-0004tI-WF; Tue, 10 Jan 2023 18:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFO1Y-0004r5-N5
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 18:27:21 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFO1S-0000pl-Gd
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 18:27:16 -0500
Received: by mail-wr1-x432.google.com with SMTP id bn26so13399233wrb.0
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 15:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kvrsJvfbUsBCxqa2uMY/F1Ahi9mgZXKLdGclMUIO8og=;
 b=Eshk1hJHbWV7L+d3dcVJz6imBnhLV3nGkcMACO7Ww1q0deM14n+uJN5Tc64YFwdRXx
 39Q5fMlCKxraRjMJhMTnCj5bDc2gYoDfDQpXl+LMkJnwh+2ExlUhivPUb1BGzX8BswxB
 +oyUsGkdDKeVuNZJCruUzmzFFxT758pJGVfdkZrQgqIwtvDzZgArvCh1V6Kp1ivEO73q
 hPmHrQzpSqTb4vbmxssNGAH2+yAf29/xAyM6DvaDEvCsHcVFIEzO6bPbB+BWAcfyvPWz
 1I+9IJ4HQeRaHQp2vKrWTafmn786CkKN+r8hOMAdOHD+VestWJIfyNiRnx3rlsdS62+G
 SaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kvrsJvfbUsBCxqa2uMY/F1Ahi9mgZXKLdGclMUIO8og=;
 b=vbx2KOsGFP5TWP93uNgqWGht9k+GAzOhrHao/rP7FiC+VqZCgiXRNbSbhPV93Wdgdk
 SOONJqGhSj5cdXuv+kBuPnfXK3DF8sl/T3yBxrzX6c/LGwrp/YtSfbVux/IkrskDmC/J
 oTWvFfhNXPDdbDhndqZ2l+mPLjoOkCB39a4dg79L65JmNSCBKCfOWgRmy3oIi+BYS4Gq
 Qh8Bqpz+Dp9wj+H3kX2Jn2j8OljmG0XUqrIslhUg4ONDjIyrzXkmyry/g1/Luaim0Zy/
 JJAbQrz2jxjOk5mOSJOpox1FZoIz/bRNmIbN1/tONYqNrVg1gH1feqFGlzaTaV51rKgg
 4ddQ==
X-Gm-Message-State: AFqh2kpy2ydnU6jP5mV/Gdi+db2yE3avVnIuFa0fTyp1mop75xIvyzvO
 EVJGcnGCwTCuSnQwkx98f3ckcQ==
X-Google-Smtp-Source: AMrXdXuKvtADrUD+fH9EgS/XnoMZ32xcyTYjZ6y4y1/762H7T6IpJEeDngsc/zjgYQ2yxXty/JQkZQ==
X-Received: by 2002:a5d:5c0d:0:b0:242:1809:7e13 with SMTP id
 cc13-20020a5d5c0d000000b0024218097e13mr54419945wrb.11.1673393231887; 
 Tue, 10 Jan 2023 15:27:11 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i2-20020adfdec2000000b002b9b9445149sm14528493wrn.54.2023.01.10.15.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 15:27:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E441B1FFB7;
 Tue, 10 Jan 2023 23:27:10 +0000 (GMT)
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-2-richard.henderson@linaro.org>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 01/36] tcg: Define TCG_TYPE_I128 and related helper
 macros
Date: Tue, 10 Jan 2023 23:27:05 +0000
In-reply-to: <20230108023719.2466341-2-richard.henderson@linaro.org>
Message-ID: <878riam0mp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

> Begin staging in support for TCGv_i128 with Int128.
> Define the type enumerator, the typedef, and the
> helper-head.h macros.
>
> This cannot yet be used, because you can't allocate
> temporaries of this new type.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

