Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF3C2EF743
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 19:23:35 +0100 (CET)
Received: from localhost ([::1]:42502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxwQA-0005jZ-Nz
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 13:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxwPE-0005HO-3U
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:22:36 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxwPC-00078z-Cb
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:22:35 -0500
Received: by mail-wr1-x42c.google.com with SMTP id q18so9933254wrn.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 10:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=NI2zdzCh9rWrYMr0ZP7emF6ME8NPAIofP7g4fbqqodE=;
 b=ynID7F5LpKLtfAGqOmrhVRpEe1X1ilu6WlBG+oOGJRhs61acZN+tkfEyMMr41n+KXH
 VyukggyHvV+JeMYI+9PrDJmc+Sc7VooqVwv0OouuO9AqRqaevsBeDkZND57vGyXBL0Oj
 e54YZHDl+VEhTRLUXGThEgprsVGSLnorR8tqcdrCLd1nEU/PhSvsWDMMwFb2HaIY5ISC
 4Xl+H1K4yXv2cfHKRnkskMvDyrOW+mVFmxwyqHZ0rWCzjHo6Oi5LNRGQMG+eKpv7thxP
 X3nZLsW0bfNMDxVrSs/GaN42iJ+zJ+M33h4friyOnwnIa54M9lJ7grvbGmrMeW5MVstc
 3fiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=NI2zdzCh9rWrYMr0ZP7emF6ME8NPAIofP7g4fbqqodE=;
 b=dOaiaHE5LQAIYMVEo3tJzkNczqyCdJi1w8TdZ/HARbFUVo9JNOG/92f691xP0HGpCi
 hfc+1EYvLH0M8QXepRFnstlEEpe9qAJzlWZ9JHUVkvy9ONedHP1ig/Bxc3kcIWvyAujl
 4duPDYMC4TZjvOisDyRTHriPDqHqZ2STTst+vh9PnpIiUN/769Nf0LinlSPy+eifQhbz
 1xQm9hp554iVqlDS2OvkWNktbkiw+MbsgfDTOiWjDB+yJqnFoDwDlT1NAKzeXUZdnjPx
 2mHRnh7QWJmKQB5DGrR/U+SMw1WjqRK2ZeEEgXuHCRTZJ+eF5ZgBTpdzGu9sFFdyUCcu
 AqTg==
X-Gm-Message-State: AOAM530bFb9KoxEdrF0ooqce45k/QmJ8wWTYdR7HPMrtfvfVAdoHjrBI
 1KN/txsK0zkaUaUbyshDOiniww==
X-Google-Smtp-Source: ABdhPJwtf6sydOobHP7Ct1ZKPm+TsWaCE9O+uzLXSY3raCEDqS09wsuugr6D4HLga5hLm1MziBh4xw==
X-Received: by 2002:a05:6000:1811:: with SMTP id
 m17mr4783218wrh.67.1610130152657; 
 Fri, 08 Jan 2021 10:22:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z15sm14619390wrv.67.2021.01.08.10.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:22:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE3491FF7E;
 Fri,  8 Jan 2021 18:22:30 +0000 (GMT)
References: <20210108161416.21129-1-peter.maydell@linaro.org>
 <20210108161416.21129-2-peter.maydell@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 1/2] docs: Add qemu-storage-daemon(1) manpage to
 meson.build
Date: Fri, 08 Jan 2021 18:22:25 +0000
In-reply-to: <20210108161416.21129-2-peter.maydell@linaro.org>
Message-ID: <87zh1jz3tl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> In commit 1982e1602d15 we added a new qemu-storage-daemon(1) manpage.
> At the moment new manpages have to be listed both in the conf.py for
> Sphinx and also in docs/meson.build for Meson. We forgot the second
> of those -- correct the omission.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  docs/meson.build | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/docs/meson.build b/docs/meson.build
> index 71641b4fe07..fae9849b79b 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -62,6 +62,7 @@ if build_docs
>          'qemu-img.1': (have_tools ? 'man1' : ''),
>          'qemu-nbd.8': (have_tools ? 'man8' : ''),
>          'qemu-pr-helper.8': (have_tools ? 'man8' : ''),
> +        'qemu-storage-daemon.1': (have_tools ? 'man1' : ''),
>          'qemu-trace-stap.1': (config_host.has_key('CONFIG_TRACE_SYSTEMTA=
P') ? 'man1' : ''),
>          'virtfs-proxy-helper.1': (have_virtfs_proxy_helper ? 'man1' : ''=
),
>          'virtiofsd.1': (have_virtiofsd ? 'man1' : ''),


--=20
Alex Benn=C3=A9e

