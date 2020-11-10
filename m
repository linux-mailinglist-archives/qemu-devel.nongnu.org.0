Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB762ADB01
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 16:57:54 +0100 (CET)
Received: from localhost ([::1]:41486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcW1p-0005Xh-ED
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 10:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcW01-0004Ph-CF
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:56:01 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcVzz-0001Rn-CR
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:56:00 -0500
Received: by mail-wm1-x334.google.com with SMTP id d142so3482439wmd.4
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 07:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=eZkncBMER5cLSprJ+YsJVMgDaX8DozP0RMY3Bi4euBw=;
 b=D0PK5t89Z7gY6Z3IZls3jZRHcyhTR+B6OnLIZEYBj47MsR4/4KnZmcbR0gXPVMQFr4
 XsG6UF/xpiRKf8XJUCUiMtUD+uI9/6fLxLoHtXMx6KA85KTO18Payp+hGPQ7fmgkJJXn
 qkPsGRZZI++TgIc66TrxUlYnq/Iz1ltp/56gFSjHbGJXenvTSrhNJwwvAD6xqXmhhRbf
 KbqtFS8TtDaKHfY7IT3WJz1wgGRqy0mQgT2ZrLbJvjo9tKI6a628+DmNQ3Qr7O0kH8xw
 bbR8iDR9YvX0fsE4soNOkfolS6+ZfBmtu4o4A9F5p2s0m8szpJp7FPzX/wF+jVG1yFVO
 H0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=eZkncBMER5cLSprJ+YsJVMgDaX8DozP0RMY3Bi4euBw=;
 b=jOPvKYCVNBbisUvocayHTKzoqXYfK1er0huVzqw570RfUoV+4u4X3G0yVDvgUaZHGR
 W+chX9K7CrY1AkSi2a+dzACV0K/NF3OzqLaowasOn+WFvnU8I/HiAK/Uvn2Qtr5nTl7S
 AZHB7mQChX8Hen9Imkgu0uKhZEbKBQJUJuMuq/sUBiPzYl2I/xFzOEkncnpLpCfiFCq+
 Gp5FUzGQkoU8WKZG2uTVmW5chLZsUDXlMZN6Ii9KmRy7+ad/Ps727QIt/pKzDCFAjpX4
 WvQoObsy8n+exknPe+nb273OGMFUUiBnLZkYDxyuMKOH4r/0xltFGyPwmDehVzepTJjM
 vKBA==
X-Gm-Message-State: AOAM530x+HdIhX8rC8cNNCBO72fM6FBn7i5edYGZ+odXmfWvoegkld/B
 Doq2oE31ZsdEZAJKzLlZWyIWvA==
X-Google-Smtp-Source: ABdhPJyamxh5POZw7sdlsshx3wgx4bRl7+9j3LiiPPqo40a5cWaQpU1zn8N+F66ka/wCYBwz+p8wXA==
X-Received: by 2002:a05:600c:22c5:: with SMTP id 5mr350967wmg.25.1605023757113; 
 Tue, 10 Nov 2020 07:55:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a12sm17202895wrr.31.2020.11.10.07.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 07:55:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 741CA1FF7E;
 Tue, 10 Nov 2020 15:55:54 +0000 (GMT)
References: <20201108204535.2319870-1-philmd@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2 v4 00/17] ci: Move various jobs from Travis to
 GitLab CI
In-reply-to: <20201108204535.2319870-1-philmd@redhat.com>
Date: Tue, 10 Nov 2020 15:55:54 +0000
Message-ID: <878sb98aut.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> We have various job covered on Travis-CI, but recommend the
> community to use GitLab, so build failures are missed.
>
> We need help to move the jobs to GitLab (we will keep the s390x
> and ppc64 containerized jobs on Travis as there is no similar
> offer on GitLab). Start moving jobs.
>
> Resulting pipelines (96 jobs in 71 minutes and 4 seconds)
>   https://gitlab.com/philmd/qemu/-/pipelines/213351318
>   https://gitlab.com/philmd/qemu/-/pipelines/213378500
>
> Patches 1-3 are included because without them some jobs are
> failing; but they will be merged via different trees.

Which trees? I'm currently holding 2/3 in my tree as I kick the tyres
although I dropped 1 following breakage and discussion on IRC.

--=20
Alex Benn=C3=A9e

