Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9283141A919
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 08:52:56 +0200 (CEST)
Received: from localhost ([::1]:57758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV6z1-0000Sc-61
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 02:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mV6wz-0007yO-MP
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 02:50:49 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:37451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mV6wv-00034a-Sh
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 02:50:47 -0400
Received: by mail-oi1-f182.google.com with SMTP id w206so28861152oiw.4
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 23:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nVbuCyZjB3lEJilOmYdKdtzYomOpq0YRyHHgjNaxfFA=;
 b=KWIngkQPGBKD7eH5d0PzVY+q6xN5uP2vEKjCM4nL+I+TpqZ1xR6Qj266WTijAM4O1r
 kBeV2ZOAjpBcYMf7/qbm9ftrvIcfmHS0RehycxmypAOIiIu8ZiO07+zQYlKjQncHxn/M
 7bpcKJje0r2RdIXP0vfv02lOow+MTEQomSZO5POqhn2q88NKUE3xEoiyUweV0nlS8qyR
 xwBtSfOrHy2BpjWo0FKNXfu4MNrerNHIhBANZo1FxrNccckL4yINaNAnqHyIlQEHo6Gc
 ELC0iqcfpW33OJSVBnaWbXuoXF8eVaC/Ci1SMGq2IL7ELDGws16hvOiJSv7Llj5GxFcK
 dLTw==
X-Gm-Message-State: AOAM533UC+5dDeAS89pcqsRw+JJ9Auo6+Y5rQPmAOJWR/1YvYOr4RMuZ
 0plNgnTewgOEdirE9gcsezs+YsPvKsqXZNnvKKA=
X-Google-Smtp-Source: ABdhPJyBueODEsoxWZczsjO0hhiYBILTRAmwWBXUCgMRHnXukdyEqr8x/JJGkqJW3ucewSeXWqb3AkTMc/+Gt9yn1d0=
X-Received: by 2002:a05:6808:2204:: with SMTP id
 bd4mr2396407oib.175.1632811844715; 
 Mon, 27 Sep 2021 23:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210924165926.752809-1-richard.henderson@linaro.org>
 <20210924165926.752809-11-richard.henderson@linaro.org>
 <9f360405-3897-fd03-4da2-e943defb2d86@amsat.org>
 <c01b0ba8-ea47-eb5d-1d3f-4ba746fb7ad2@linaro.org>
In-Reply-To: <c01b0ba8-ea47-eb5d-1d3f-4ba746fb7ad2@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 28 Sep 2021 08:50:33 +0200
Message-ID: <CAAdtpL7gOORWK=q0z5hkP7_Paiyb0+XEZBdOv7iQp8LDKnczRw@mail.gmail.com>
Subject: Re: [PATCH v3 10/27] linux-user/i386: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.182;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f182.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 28, 2021 at 3:42 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 9/24/21 2:01 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >> +static void install_sigtramp(void *tramp)
> >> +{
> >> +    /* This is popl %eax ; movl $syscall,%eax ; int $0x80 */
> >> +    __put_user(0xb858, (uint16_t *)(tramp + 0));
> >> +    __put_user(TARGET_NR_sigreturn, (int *)(tramp + 2));
> >
> > I know this is mostly code movement, but using uint32_t would
> > make it easier to read.
>
> I'll give you int32_t here, since the value is signed.

Better, thanks.

>
> >> +    __put_user(TARGET_NR_rt_sigreturn, (int *)(tramp + 1));
> >
> > and uint32_t.
>
> Likewise.
>
> >> +    uint16_t *tramp =3D lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8,=
 0);
> >
> > Shouldn't this be 8 + 7?
>
> Does it really matter if we write 15 or 16 bytes of this page?

Certainly not :)

