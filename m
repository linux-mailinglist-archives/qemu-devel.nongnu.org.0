Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C60700B6A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:23:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUaj-0007yX-Dd; Fri, 12 May 2023 11:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUag-0007yH-1T
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:21:55 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUae-00040m-EE
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:21:53 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50b9ef67f35so17829489a12.2
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 08:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683904911; x=1686496911;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8s47/74NoETuaGqehTgSUxpdjuJDZnRfAxD0mCvzReU=;
 b=arlLQUwlVmROX6P3LVOUQY5+DW3eRomuhUDbxwnH6vDEkQhh7wzuYcCxDNsxhvwHFR
 09E3PfNAbbUWk+qp2AGpSlyszbygQ9KGOarO1xOINtuNsnQQMcNW65lN9JoWDaIlvTSl
 /3vVAc5sL1kwKqpRFd3ZeTtcKL4isrIVWq+VIoWBXTLXUEnlKRh7VMYFPBQ7Fbr6qA1j
 J67YyUrBAJadINxCUWwlSWHuoGzXmkeeA3jphfJRh5Oc7OT0g+EBu99ER09VNJ7WHmvc
 VEeBrkDIEOYUhDTHV6+sOoYc6A8lAbPPj0M8IA5EBifNMnk/6fAQ93wn+MU2WGqj1+bi
 E0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683904911; x=1686496911;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8s47/74NoETuaGqehTgSUxpdjuJDZnRfAxD0mCvzReU=;
 b=gEtCjDDJdpUnfY3Ozl9J1r2PxkuXNn2chXAsEjCNLpTpRWHkbeI1hGKWs3A3rzBok/
 NTyf/Wk1KRRoa4xFpm2HQhsP0eCi0niGopTvFiTARqTnpOzeFqt5u29k+T2LalydIOcm
 TLXEcUeQAThQn3yipZ9TFE+BtJ3NbjAlwT45UD/w+KTCqDN/HXCqTndYwpV8VCH6NENq
 MMYGo9FKoWNyLfJiE5IIb65hALz5E4it1pYvbUNtcPjQcKk9e2rBJ93/alYPRwRpwhtq
 QE69MG1mb26zd2fJ01ytZediz5jKf4MxeMDIiRA1zxqpFdSJ1nj46ml3kC4VgYnmoxH1
 ph+A==
X-Gm-Message-State: AC+VfDx+HIisuFO8OHZG40ZeyKRw/e9rRPlYUnGb1Qy/MVMUcNQCDSOt
 nOCIAESe59k/UMK8PDL8cTmg1JI/ON1iscl3NXK9lMDbjxDy4fNf
X-Google-Smtp-Source: ACHHUZ7wkBVbhip7XuLWvBJfpGWI3TQIvpPqcNIDx4Po15fGsnDWK6O5ePHoedshn0gZgiyJhFjqZ1qIaQOmxjl83DE=
X-Received: by 2002:aa7:c147:0:b0:50d:1e11:eb9 with SMTP id
 r7-20020aa7c147000000b0050d1e110eb9mr20327906edp.1.1683904910776; Fri, 12 May
 2023 08:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8rZDtUFTM7Ya6aTTZw0bHYL0y-6Akjoru1SS=qeh+KWA@mail.gmail.com>
In-Reply-To: <CAFEAcA8rZDtUFTM7Ya6aTTZw0bHYL0y-6Akjoru1SS=qeh+KWA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 May 2023 16:21:40 +0100
Message-ID: <CAFEAcA_jbxsKrG0T_3Wi1Q-LZePqNqgVsdS8okQP1ADzqrL0hw@mail.gmail.com>
Subject: Re: command line, guest console output missing from avocado log
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Tue, 9 May 2023 at 19:58, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> I just noticed that the guest console output seems to no longer
> be in the avocado log file. Can it be reinstated, please?
> The console logs are typically the most useful clue to "why did this
> test fail" and without it you're just guessing in the dark...
> The details of what QEMU command line avocado is running
> also seem to have vanished : that also is among the most
> useful items of information to have in the log.

Ping? Where can I find these bits of the log for avocado
test runs now? I tried looking in the individual per-test
directories but they're not there either...

thanks
-- PMM

