Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C41332422
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:33:28 +0100 (CET)
Received: from localhost ([::1]:51052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJacB-0005Rj-8N
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJaaV-0004nx-4R
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:31:43 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:36017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJaaS-0007n0-Bh
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:31:42 -0500
Received: by mail-ej1-x62f.google.com with SMTP id e19so26742718ejt.3
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 03:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w4q6igLyhpztxOKThSb8mVPy8c4IoqSAJFc2dUHMagQ=;
 b=UTcWiTz9c/rhBwq0Sv6Yq0Vgs2Bw1XImZpka+HPh9jOoT6DlileiNoQiNRviNt1rY+
 ddcOaJkjZ1UxeljK9vC09xTguqjGNPjig25Uv1D+QQCuEqMX8Zkv3s/7Rgxok6zQ54r/
 N1sAD6+mh5Z0obEidkEyLx1zXMaxRf7wa7edTNWBw0kMHx09q+QQZiqTCZIu1wKSD2+1
 1CqLlOSe2uoqBRIaM1sLlt7SZtKduZEgmfWJHCn+z1iJW7VH8dXI21IGhZhRU1oYsWgE
 +F4TpnUekvdmzoQTO2JD6d9AejcgPfjCCktjIDB/aMNLzjeSJpE+QUml55PiM9kEu46k
 S9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w4q6igLyhpztxOKThSb8mVPy8c4IoqSAJFc2dUHMagQ=;
 b=mFqFmcmoyDlaq8dwi3BvSn/1rryGf57VgnxR9CNVY7+rFbYO+OOKuCLZM4XNaUyl8K
 8tONUVrp1JkST1tZI+lLv8K/WGpKHMNr4juApdrGbyxqiQtbfBLPnrFJoGPJvvYFE+2j
 3uBwAgcrv70G6sLq6f0Rg3d6PRvhlnYpoTWxAMatdGcwwxp8pKhKWsktyqfi3GHl5uTi
 Xn0ft97xfZFg+7JlL99+z4vLy4TYWyo0sKhdgLWdZR6EGwbau4LOcw/ZdprjrKarA9gJ
 TnYtBVQPJCz58+twQvaNgLDRHzxV/3Wa37KBxJmHbUhn3dXt6pkVhV0DzyAWMiipUeCT
 zezg==
X-Gm-Message-State: AOAM531A/tNNMexLWTTEJCqJjM9cdHuZOvwHJ+r6EVOXF7k2756mLzFu
 eVdw6PGILE3BCAOCOVsRtC6vSD8ju0U6DymXebBZ5g==
X-Google-Smtp-Source: ABdhPJxzquEpSRAhDm6NNBw2OrXCzCRctswgn6jd06mgptvrfG7m/IvjCt7HtIqvyCfNYYMHiuBUNmrM5pQscZ55BLM=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr20012556ejd.85.1615289497418; 
 Tue, 09 Mar 2021 03:31:37 -0800 (PST)
MIME-Version: 1.0
References: <20210309002741.85057-1-j@getutm.app>
 <20210309002741.85057-4-j@getutm.app>
In-Reply-To: <20210309002741.85057-4-j@getutm.app>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Mar 2021 11:31:20 +0000
Message-ID: <CAFEAcA8c9=CYM2FfGf51-8keC8Gp2ySKMnXQ+YUz+Lw6g+Ek-g@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] block: detect DKIOCGETBLOCKCOUNT/SIZE before use
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Warner Losh <imp@bsdimp.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:raw" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 00:30, Joelle van Dyne <j@getutm.app> wrote:
>
> iOS hosts do not have these defined so we fallback to the
> default behaviour.
>
> Co-authored-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  block/file-posix.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)

raw_getlength() is a bit of a mess; this certainly seems like
an improvement...

> diff --git a/block/file-posix.c b/block/file-posix.c
> index d1ab3180ff..9b6d7ddda3 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -2326,8 +2326,10 @@ static int64_t raw_getlength(BlockDriverState *bs)
>  again:
>  #endif
>      if (!fstat(fd, &sb) && (S_IFCHR & sb.st_mode)) {
> +        size = 0;
>  #ifdef DIOCGMEDIASIZE
>          if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size))
> +            size = 0;

this if() should have braces {}.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

