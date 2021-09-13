Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E601408B63
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:56:17 +0200 (CEST)
Received: from localhost ([::1]:55364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlVQ-000869-8q
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPlAM-0001Gg-5Z
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:34:30 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPlAJ-0005V6-Bw
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:34:29 -0400
Received: by mail-wm1-x335.google.com with SMTP id y132so6539877wmc.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 05:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pJUGDr7bJwFpS93fM4XejumPUYBHpFreC40zj0W3Eh0=;
 b=eVoZBQ1nV5vQECddVb77qUNFWOWeRMnOJJw/P7+qYT/JT7N8i9tTxcNc1rE1XLUaKH
 lZHQ7phhmSsQGHkH6BKf/377l48tn7ieWFwsBvGx2gTCjeJYy7kBfxV+uWxMQ6wu5NG6
 eahOoRM3ztMxJP1iDPjY7DxvImFT1d65aTFR/tjuNq77LPeM9SK6zea6P1YQUsvidT7r
 5i1Tp3coxZnSgyDSob1vqQJJsb0FamOfTTQAs8rFuCAB0cay+A4vprRA5E+Zu3OqROQj
 nnwWvREJJteNkW271h3UsQ79hjUdUPZKbW4L7y4PKL3GNu3LHzBGHHdR7V2w49pqhBph
 B5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pJUGDr7bJwFpS93fM4XejumPUYBHpFreC40zj0W3Eh0=;
 b=YYY3XneY+PJOeZpz75ijLdwxmTOmEkZ0Dktr4UmCkB6W1TxmuOSdR9aZ9aLPe99xRA
 BWNrMTdAIwi6NuCM3B2ppbcN2r7lfg+Ou99SgaVdA3e1Yjx+y91yQmOqUzFAvsLAJZyX
 lrEnT6lI0NJlnvXPLish0Kuc7qH71xPjdflb/ZbDURbc6Hk4EXkk6yklvgDkCkTCXLS4
 ff2J16HHqYNMDaah1wKuW727Ee4ZiTLRKkq47Si1zbN2QhLlv3WwtTjbsl3bapLzHkcy
 ASKi+Vakg63kvul5nXxXsGE92nS/HNZNnD8PQIvJPHHeLnozWJtzF+KJrbdoyGPG0C9f
 xGIA==
X-Gm-Message-State: AOAM533soxF8ZvYdbyhtro5/1UvKX0DyvdEje5F9R4C5BW9uE3e0Z3Ak
 EGOyxf6T8E8lApK+GVwu87OK/5WaYXP2w1zQYSGih06IL8Q=
X-Google-Smtp-Source: ABdhPJxfMi6CtVbMPy5gGxBfo53z1DinQP7QEjCQR4+NPpYOcFlEec3olFretxWT8ADC7OpoOicX4jS/mNKoMbrZhGc=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr10983735wmj.37.1631536465552; 
 Mon, 13 Sep 2021 05:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210820165650.2839-1-peter.maydell@linaro.org>
In-Reply-To: <20210820165650.2839-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 13:33:35 +0100
Message-ID: <CAFEAcA_p-AXGbP9UWwGVX5gKQv2jL8Fkt8M-Vr65MX-eHRnKjw@mail.gmail.com>
Subject: Re: [PATCH] target/i386: Fix memory leak in sev_read_file_base64()
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping?

thanks
-- PMM

On Fri, 20 Aug 2021 at 17:56, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In sev_read_file_base64() we call g_file_get_contents(), which
> allocates memory for the file contents.  We then base64-decode the
> contents (which allocates another buffer for the decoded data), but
> forgot to free the memory for the original file data.
>
> Use g_autofree to ensure that the file data is freed.
>
> Fixes: Coverity CID 1459997
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Tested with 'make/make check' only...
>
>  target/i386/sev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 83df8c09f6a..1e7833da1ab 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -565,7 +565,7 @@ static int
>  sev_read_file_base64(const char *filename, guchar **data, gsize *len)
>  {
>      gsize sz;
> -    gchar *base64;
> +    g_autofree gchar *base64 = NULL;
>      GError *error = NULL;
>
>      if (!g_file_get_contents(filename, &base64, &sz, &error)) {
> --
> 2.20.1
>

