Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982A06EB07F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 19:22:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppuSf-0003TF-GL; Fri, 21 Apr 2023 13:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppuSd-0003Sz-Tb
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:22:15 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppuSc-00017a-5a
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:22:15 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f086770a50so14028055e9.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 10:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682097731; x=1684689731;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qYc2MnajnD23gCEOxF7gDUpzVQ9zp1bnA035FX24Hnw=;
 b=Vd+uuN9tJ5TQCNLv4yL/2SoiqO/4bnyf4VVlfcNVXSM1Q1gV/ujBWW5lVXPDbCu66S
 5GfnXpDgIQPBAjcWob3HtrobYCfWZbnZ8MB0LnYJKYY6BXJoopdO42woFLKyEy/gEShH
 DtN8Cx7w/60RrUdOXNLG3kTG70yvO6k4ZWCQ2AHC6Tw1W8N3qzOpUAVfvFrPSLdrCdY/
 gPRVmnMHkNVVvrOJqRSVsUoREtkASezqHRiBNlkk38iHMjWYAI+9cbo4L9Q8J2ftuGY4
 zERh6Lk5zf4d5AL6rYANOhRnFV+a05JVKmgf7s2uLtSaca2qZEIHcyo1wffy3DxgGgB9
 8e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682097731; x=1684689731;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qYc2MnajnD23gCEOxF7gDUpzVQ9zp1bnA035FX24Hnw=;
 b=h+vu2Pm6i33M2v/7ZR6pLcZArwtrOQn1WAS2xsiOnFmSf7HUlxiBZhNKKIYnVO6G6u
 x9VBZpFjdn+wtKvrYmp3353Dhv52idFlF9yiIgZOyDhwnRTElNMNnaJkgWV7dWXuFnS3
 RiDN2UH/s2zQN1PFMv+KVwgq9VONENNx0NXaeZR5Ftf5t5e2Oi13ZEeAjVaedBTdjSsQ
 /zxpmxNxBwOheRY7XtzqAK644rOGYLnUdg9vye/xnHur7sIEafCf6o6akaaWo3Rwvupt
 Z45opUlx9EkxeLRMlynimhqnpshPa7Rj0AjbMi+vzgj9TTaKx4h9SVWgCRa7iSXdVxc4
 t7Hg==
X-Gm-Message-State: AAQBX9fVo4AQaRIb+QzGNn4h8QPRwMaZUUfMPdb3ZVWIHpEIypc7f/zj
 fT+K823p6tN266DfhtGYYHeCOA==
X-Google-Smtp-Source: AKy350Y+rCO82sBcE7q0hHihKm+R42rRG5b0qK5ZHyX1gAhouYNUj0YfbKTtDPx5pxQyquqjrsfIrg==
X-Received: by 2002:a05:600c:2059:b0:3f1:73c5:66db with SMTP id
 p25-20020a05600c205900b003f173c566dbmr2352131wmg.20.1682097730824; 
 Fri, 21 Apr 2023 10:22:10 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a7bce90000000b003f09d7b6e20sm5452649wmj.2.2023.04.21.10.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 10:22:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DE1961FFB7;
 Fri, 21 Apr 2023 18:22:09 +0100 (BST)
References: <20230421052255.5603-1-krm.taha@outlook.com>
 <20230421052255.5603-2-krm.taha@outlook.com> <ZEI4jQvHfU+JGFH9@redhat.com>
 <CAHNti2dQnbmAO5hTyb6krd8tSMCqXDp80BEcd0ZUHXmk0LZS-w@mail.gmail.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Karim Taha <kariem.taha2.7@gmail.com>
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Warner Losh
 <imp@bsdimp.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 01/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:21:03 +0100
In-reply-to: <CAHNti2dQnbmAO5hTyb6krd8tSMCqXDp80BEcd0ZUHXmk0LZS-w@mail.gmail.com>
Message-ID: <87sfct9mm6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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


Karim Taha <kariem.taha2.7@gmail.com> writes:

> On Fri, Apr 21, 2023 at 9:17=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange=
@redhat.com> wrote:
>
>  On Fri, Apr 21, 2023 at 07:22:45AM +0200, Karim Taha wrote:
>  > From: Warner Losh <imp@bsdimp.com>
>  >=20
>  > Allow guest_base to be initialized on 64-bit hosts, the initial value =
is used by g2h_untagged function
>  defined in include/exec/cpu_ldst.h
>
>  This commit message is all incorrectly structured I'm afraid.
>
>  There needs to a short 1 line summary, then a blank line,
>  then the full commit description text, then a blank line,
>  then the Signed-off-by tag(s).
>
>  Also if you're sending work done by Warner (as the From
>  tag suggests), then we would expect to see Warner's own
>  Signed-off-by tag, in addition to your own Signed-off-by.
<snip>
>
> Alright, thanks for the commit formatting tips, I resent the patch series=
, with my signed off by tag and the
> author signed off by tags as well.

Hmm something has gone wrong. Was this sent with a plain git-send-email
or using a tool like git-publish?

Can you point to a branch?

>
> Best regards,
> Karim


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

