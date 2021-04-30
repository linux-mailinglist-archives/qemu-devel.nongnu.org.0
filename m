Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E9337000F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:58:35 +0200 (CEST)
Received: from localhost ([::1]:38360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXPO-0003dG-5I
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcWyh-0003j4-Lu
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:30:59 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:33679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcWyf-0004xT-LT
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:30:59 -0400
Received: by mail-ej1-x636.google.com with SMTP id t4so23123824ejo.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5fupHc2tSbzHyymkDCVmeMz7OMr2RE0VOb+O41HkQJI=;
 b=ZK6CqJAasl8KjXALbnEqTHM42s0nwrGBqz/HMRPl86iJOKpC2mZUfv7fDns+U+rkNN
 5kf6b4namCATqPz4erF04yTt2MPVkFKtbP/hkHhcAuZv4avdFjUUo8YfWrIuy9W1xXMs
 AwFfHTG+SskMWza6MgT/K1q1ZG7cLzd/ZtC7+jw/LzSe1UKdd5ljl49mknKNIKbMxWpg
 Grw3QQYfwDXHO00ui83cjbQxMnEeK2SCoIOkrwwadRNn1uUtj+y2Pirga5H5ZfPQPW0U
 2ui0kEaFAmFhrmh1H1MyC8pkC/4AhR6hO61HGLn0l3IwV80EHz+V23LLWtuqcZhwj79X
 iEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5fupHc2tSbzHyymkDCVmeMz7OMr2RE0VOb+O41HkQJI=;
 b=oyPbcLdPXAhk5ljDjZbp9xg8VSsn0NZm/vR5263pGB9d/+x4PNlaG2fV2lTERNlkFV
 I4Ou0FJqPlyW1v4xesGG3Mv6UPkdbohHuzbIVBjj/KIKIIk/O8wGiWBwquCOSkoUPDlO
 ufFab1nDRysJvnBQHgTLSWGAAQG7mgrLPAluDJamyWEHParCtMBhc4eeVLyQ6Eh3WZEo
 aaT2GBCTvT7Jsqu9hlTrZ6POTAVg02pSOX1OqaUdyLoJTAdIwfLcE8QI9NFwBT4QIPL9
 2Z/I5CJMfEdfH/cTJg9aniSAG3nGDDl5Z6bS4MKA212K2ddM3oS5kZPZPrTJlm0yTS8W
 an5Q==
X-Gm-Message-State: AOAM530htLoEv/XceCrQJ8JwWg1S+OkoeekgUAbKtXRPCYG+OKh6CMoI
 Qaym68ZY8G09hrF28DZmsjoAVoIjVf2UEOUdUVgfXQ==
X-Google-Smtp-Source: ABdhPJwv5fBSMfPnPDgE4R/ofCbjwKgdIw2QSA/ciidjjnR7mAMrZq5VvpeCprokCvxsynosQtVP3NeyMT65W9PpQZo=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr5519693ejh.4.1619803855989; 
 Fri, 30 Apr 2021 10:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <c2b98872-4649-c291-bfb2-0fd5b3d40ac4@nh2.me>
In-Reply-To: <c2b98872-4649-c291-bfb2-0fd5b3d40ac4@nh2.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 18:29:53 +0100
Message-ID: <CAFEAcA-TxOys5d=SAqwqU749j3-UoBf+WsWpMYZW_35w1r2ypQ@mail.gmail.com>
Subject: Re: [PATCH] net/slirp: Fix incorrect permissions on samba >= 2.0.5
To: =?UTF-8?Q?Niklas_Hamb=C3=BCchen?= <mail@nh2.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Feb 2021 at 05:06, Niklas Hamb=C3=BCchen <mail@nh2.me> wrote:
>
> As the added commend and `man smb.conf` explain, starting
> with that samba version, `force user` must be configured
> in `[global]` in order to access the configured `smb_dir`.
>
> This broke `-net user,smb=3D/path/to/folder`:
>
> The `chdir` into e.g. `/run/user/0/qemu-smb.DCZ8Y0` failed.
> In verbose logs, this manifested as:
>
>     [..., effective(65534, 65534), real(65534, 0)] /source3/smbd/service.=
c:159(chdir_current_service)
>       chdir (/run/user/0) failed, reason: Permission denied
>
>     [..., effective(65534, 65534), real(65534, 0)] /source3/smbd/service.=
c:167(chdir_current_service)
>       chdir (/run/user/0) failed, reason: Permission denied
>
>     [..., effective(65534, 65534), real(65534, 0)] /source3/smbd/uid.c:44=
8(change_to_user_internal)
>       change_to_user_internal: chdir_current_service() failed!
>
> This commit fixes it by setting the `[global]` force user to
> the user that owns the directories `smbd` needs to access.
>
> Signed-off-by: Niklas Hamb=C3=BCchen <mail@nh2.me>
> ---
>  net/slirp.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/net/slirp.c b/net/slirp.c
> index be914c0be0..82387bdb19 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -850,6 +850,11 @@ static int slirp_smb(SlirpState* s, const char *expo=
rted_dir,
>      }
>      fprintf(f,
>              "[global]\n"
> +            "# In Samba 2.0.5 and above the 'force user' parameter\n"
> +            "# also causes the primary group of the forced user to be us=
ed\n"
> +            "# as the primary group for all file activity.\n"
> +            "# This includes the various directories set below.\n"
> +            "force user=3D%s\n"
>              "private dir=3D%s\n"
>              "interfaces=3D127.0.0.1\n"
>              "bind interfaces only=3Dyes\n"
> @@ -871,6 +876,7 @@ static int slirp_smb(SlirpState* s, const char *expor=
ted_dir,
>              "read only=3Dno\n"
>              "guest ok=3Dyes\n"
>              "force user=3D%s\n",
> +            passwd->pw_name,
>              s->smb_dir,
>              s->smb_dir,
>              s->smb_dir,
> --
> 2.25.4

If we add 'force user=3Dwhoever' to the [global] section, is it then
unnecessary to also specify it in the [qemu] section ?

thanks
-- PMM

