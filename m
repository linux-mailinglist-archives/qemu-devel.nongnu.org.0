Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B0E314236
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:49:08 +0100 (CET)
Received: from localhost ([::1]:33620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EP5-0003Uz-MJ
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9B3g-0000g6-2t
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:14:49 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:42018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9B3U-00029D-O0
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:14:47 -0500
Received: by mail-ej1-x630.google.com with SMTP id l25so9212598eja.9
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B6b/7y1uZHBNVyD1ZJCLwlaqboO7sfaWoXBfbfZCE3Y=;
 b=ufl0/4FvWM5q3BhGzkMqd19oKMyJhwQm4ym+OBmhPQ6NYprSX6v634+QBiouvw/9eR
 wSPRmp2kTmPBD1ycmshSU4QuHJ4xYuBlCQZZH+7QsQxdumtyIdm1qZUNm933Ic+XsLXv
 dKe6VPNhiWyI46w96haCb+PHF4PUUNwiYHhLJyEfQKbtdatOJzHyQKlFugOmitxkO2Xh
 ZEFCqFwHpupR0LMriCDD/OkHW6WuzviIsC0P6ujQQdougLP8Opbp8H3hhkgdR3cMD16z
 EDXt2ejy89FGJ/vcMDnOPoSXJv0tXveYe03qoq6sbQAe77y27e8DdQhJ9lats503Bs5I
 uB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B6b/7y1uZHBNVyD1ZJCLwlaqboO7sfaWoXBfbfZCE3Y=;
 b=RDPPbVENqKfJqph5O8MyVwF4pQlhSb8XaEUx/EOEUxJdVhVuwvhu11UisukLJ92eRG
 /JVDe4xjkSf5x+rgb9rs9z+mwpXaaw1hAoMiVACgJ0h0KtSZYoovUsA1JJW0MJh7dLwc
 8sOjuHuY21KEUpFqZIBf5dFpcDrSqPDhA6A3MT9aL/iUZYA2R2LT3oj8FSkMm3IgmQm3
 F/KZpgIpwoCrltKll0EapOa9OpSoqK8nKOJTRF0I1mXUtJ8ujw4ic1dk0sU1plc+b+zx
 xAgY66R8286fhEDF0/TS9E4YQ6Xlb3OhSscgC6rd+Dg4CV17+lDM3d1QKljcIN/N1xuH
 Nxjw==
X-Gm-Message-State: AOAM533HA3pthFYyGJt2TY4wuHkuiE1us5nP5kj/wr3SL7mHUm4fNLXe
 bWB2v64OGDiJygU/FkUKiw5iHgJGM63Z5g1gS7w95Q==
X-Google-Smtp-Source: ABdhPJzDcizjqMzbTlZN0qscNh78VG8xqQO/fjlHeLqknmDwcUF9751K4RtG5C4TpzoKZwaHndVxb/ZE5rz7YyQXx+I=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr18780040ejd.250.1612808073954; 
 Mon, 08 Feb 2021 10:14:33 -0800 (PST)
MIME-Version: 1.0
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-6-richard.henderson@linaro.org>
In-Reply-To: <20210208024625.271018-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 18:14:22 +0000
Message-ID: <CAFEAcA9GD-krLRuQ3iCROzRDQ3ngfNQr362i3emY5Zw_-R4b6w@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] tcg/arm: Implement tcg_out_dup*_vec
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 03:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Most of dupi is copied from tcg/aarch64, which has the same
> encoding for AdvSimdExpandImm.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.c.inc | 283 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 275 insertions(+), 8 deletions(-)

There is a fair chunk of duplicate-with-aarch64 code here;
but it's kind of on the borderline of whether it's worth
the effort of trying to share it I guess.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

