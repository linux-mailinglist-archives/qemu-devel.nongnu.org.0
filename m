Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55A669DE7E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 12:09:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQWJ-0008MT-Iv; Tue, 21 Feb 2023 06:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUQWB-0008LV-Ja
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:09:07 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUQW9-0007YO-Rb
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:09:07 -0500
Received: by mail-wr1-x432.google.com with SMTP id j2so3804357wrh.9
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 03:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fmYU7CuZ9q8NJDuH8fB4iFZItUFZbVZsPaNkta2lFrg=;
 b=y7X7ZRZu1N47qpFvsSGQqnpq6jojgOIK/VDjyq0knBkpzC30gD/MNnj0N7M3LRo6e/
 nb1mOygzXKy3itHbPXXX3Ub30p1xmk/qcoxhYxHa/XoEDqAVbT7Ym6pPkzJoktb1lY8X
 FMgJpn7g70MjBtXPoIsStjJf9ctsVdkDcWKFmGL4EFd9yJk2D/HJ7EXzjTOvsuTF0Kqk
 04Ho/UjgFRuU2IeaDDEorKEzvMkOfZrpKLZh7ANlJOzTAR1ZULGAnqkieJm/GD8n+RbO
 jCmu2rZ3+8t99KsadkTPHNO0tyrGzomzU6h2eY+xTAbu2yCDi/fMYsIgoH+3+cJBNXiO
 MWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fmYU7CuZ9q8NJDuH8fB4iFZItUFZbVZsPaNkta2lFrg=;
 b=axQ7WCpm2VLYby62grtQ14FpIRAWOucZpaxd96aCZ6zXb4/tFtCy1ufZkdxUmAlaAy
 bgRNbeInyb+5/ZvtoHCowQhmK9xISIpkggeqOq8yNHLF8RmxA03YhFFzIBp432U55nCC
 CCofMAUXZeBLOe4WSfw0UMCH2ch7xWQ9Ach7eG6DmHWngXIn74XdlzF6tmEu+r2vj5jW
 wpcVPWtjlEJ7YGzEqYoYfPLXqy2ql6WNQJXfxIjOXIZp39wBA+EJ8aGnKo3gahEQwJbp
 /vUo0QOWR0Yb+wjEK3LfI9lElFov0yqE5RNye8PFuqG58+RHkbmcUDlQtkUHVFjGSSNj
 hTGQ==
X-Gm-Message-State: AO0yUKXndSYjR06pG78yee9esTcH4PLvDZ91yID5wdE0SaIGqb4OxRpj
 N+fAWN4K96sqBr5vQNmsLMUgQA==
X-Google-Smtp-Source: AK7set8IMc/dMWEmH5av4yB1o7tIwXvV+irgZ2kRJCc5zJ4Hi3C5yKWTlknNPBZ77SFIUywbgDkrXQ==
X-Received: by 2002:a5d:504f:0:b0:2bf:942b:ddc with SMTP id
 h15-20020a5d504f000000b002bf942b0ddcmr2776695wrt.55.1676977743407; 
 Tue, 21 Feb 2023 03:09:03 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a7bc2f0000000b003e215a796fasm1034740wmk.34.2023.02.21.03.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 03:09:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7C3041FFB7;
 Tue, 21 Feb 2023 11:09:02 +0000 (GMT)
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
 <20230221094558.2864616-2-alex.bennee@linaro.org>
 <Y/SjiDQR1/xBlUMr@redhat.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Markus Armbruster <armbru@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Yonggang Luo <luoyonggang@gmail.com>, Li-Wen
 Hsu <lwhsu@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>, Bandan Das
 <bsd@redhat.com>, Cleber Rosa <crosa@redhat.com>, Qiuhao Li
 <Qiuhao.Li@outlook.com>, qemu-block@nongnu.org, Beraldo Leal
 <bleal@redhat.com>, Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, John Snow
 <jsnow@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Anton Johansson <anjo@rev.ng>
Subject: Re: [PATCH v2 01/14] block: Handle curl 7.55.0, 7.85.0 version changes
Date: Tue, 21 Feb 2023 11:08:38 +0000
In-reply-to: <Y/SjiDQR1/xBlUMr@redhat.com>
Message-ID: <87mt57qnqp.fsf@linaro.org>
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


Kevin Wolf <kwolf@redhat.com> writes:

> Am 21.02.2023 um 10:45 hat Alex Benn=C3=A9e geschrieben:
>> From: Anton Johansson <anjo@rev.ng>
>>=20
>> * 7.55.0 deprecates CURLINFO_CONTENT_LENGTH_DOWNLOAD in favour of a *_T
>>   version, which returns curl_off_t instead of a double.
>> * 7.85.0 deprecates CURLOPT_PROTOCOLS and CURLOPT_REDIR_PROTOCOLS in
>>   favour of *_STR variants, specifying the desired protocols via a
>>   string.
>>=20
>> Signed-off-by: Anton Johansson <anjo@rev.ng>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> Message-Id: <20230123201431.23118-1-anjo@rev.ng>
>> [AJB: fixed author]
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> I assume you only CCed me for this patch? It has arrived in git master
> meanwhile, so when you rebase, it should just be dropped.

Well git-publish did but yeah. I've just re-based and it skipped
cleanly.

>
> Kevin


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

