Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73FF37A5A4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 13:22:12 +0200 (CEST)
Received: from localhost ([::1]:56554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQSp-0004CW-Ok
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 07:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgPgb-000734-1u
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:32:22 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgPgS-00059o-7n
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:32:20 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 4-20020a05600c26c4b0290146e1feccd8so951047wmv.1
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 03:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=YyIaGtPEBgOwd01GHdADaAMEoNRnsJSAN/05VEo45Gc=;
 b=t0A9MvIwwSvS3aVHnJoPGXTuQO5c9xNkRfFCoB13LQt24rnzZMLV81IcZfIYCaW9UN
 dtM0cKw/6uia/o38qMUsM+0iMABYX4igfVlRejA35vlFNYKuwb6+ofmBxNJHdYTQ8IMq
 IWP8AhrWAd1QxuPgn1hXq9PrlDieqC+iaaYYhDn78GJTtnLGBlG3d5Lm+fYykBnltWVN
 W7iuAWCUlDKno0EbOv69Xp/UDgfKLjsvZ00YWGiLtVSju+KYG/S9oxWULjM3FYGVM3XS
 yu8EF2nJ+e5mMMoq07OaWyUc2vYegfkjZnSrPvJWe131m8Zssb79wRzk+ieMJCFqOKmy
 U0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=YyIaGtPEBgOwd01GHdADaAMEoNRnsJSAN/05VEo45Gc=;
 b=Y4p91hpkoph2IZ285pCSLa/eXbUB8j7lVUUmloJwXCI02CVkPO7hfxPWFOozzD0lL5
 6fWVDg7fnLeMWAro6D5SQQZTQm9B3HBk6UupLXnxK0CnphqymIRxYfKXS10wk4ofVFH1
 iO6sxaR/4BOoRq9nQHqSY73zGMVAH+zXEipxHlx85DhcZZmgMKlV0JoWxcF4i6bgFxeE
 GZ/EIWSSmsUPYt0u/wd46JoV5cfPlZmt20nxACGCelemKlnokH12UN+mnj9+TS047M6t
 VG5N103QuXKBsYRYjNKrNKkdjmjKQPwGSdA7edYK2/P6mC7RAqPGq0QGpTWdSFahw0vg
 sCuQ==
X-Gm-Message-State: AOAM532vmFZIDEbyB3JzYBEUg+twiRsDYN2OhtEBKItPJ10xY8wC53DG
 nNftYgogIA7J615jNkgqhAc98w==
X-Google-Smtp-Source: ABdhPJzHiaGHBOfP8U0EUVTExFd2Zk1DhZcz8edgojQYpCJRssYI+xMeRTjMon8Y86urAFr8FxHS6w==
X-Received: by 2002:a1c:bb05:: with SMTP id l5mr2072695wmf.27.1620729127674;
 Tue, 11 May 2021 03:32:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p187sm20069338wmp.8.2021.05.11.03.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 03:32:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3A49E1FF7E;
 Tue, 11 May 2021 11:32:06 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-15-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 14/72] softfloat: Do not produce a default_nan from
 parts_silence_nan
Date: Tue, 11 May 2021 11:32:01 +0100
In-reply-to: <20210508014802.892561-15-richard.henderson@linaro.org>
Message-ID: <87pmxxk1cp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Require default_nan_mode to be set instead.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e

