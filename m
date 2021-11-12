Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00D144E4CE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 11:44:39 +0100 (CET)
Received: from localhost ([::1]:36038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlU2w-0000Wf-BV
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 05:44:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mlU1l-0008Fh-Mq
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:43:25 -0500
Received: from [2a00:1450:4864:20::335] (port=35798
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mlU1j-0003It-Mf
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:43:25 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so9506074wme.0
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 02:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Ewm7twV1/jir3e1yW5R/ljDtx3nTCW5dLPTNQDXC7sw=;
 b=SaRyRMWUNED3aQArB7cz6Dobjea+Eoabbh+QRxBJ0jUwHzExzRcqYI9lNYuUbQMhSk
 pL4zFWXU7KKwS2zThO2upGGJJHWr462eFXtl96EIe4RKUMawogItYLkAm2HWmdm5samz
 pqKpUbVNx7+wnyWv5v3yZsrao4g35rdgtt8CIUg8hOGf8gr5f4yMFX66RkGojCQejNve
 6DLjGnnBX+3hKNGUoKCNTCpE937DFvIjxksaujLJQ9cqqXPmXEPGfClYm9hXZA9Uctt/
 Z8tcUG3DxvtmoVZ9RQKobJHYOFQ8SnRNCMHQty6dOvqQGK8tQ3X7C+H/VY6X+yCwQ8bE
 DQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Ewm7twV1/jir3e1yW5R/ljDtx3nTCW5dLPTNQDXC7sw=;
 b=LzdmCm139ADXfv9bhQq/N1/1owyK6LaXLKy4Dn4/xx/5uOfU5tkDhAuUD8zJTS6UsH
 q/DwG0BzoVzLHQA4HopFKXVUK+M2PfV+c9alh8UZ4fn6eYVPZVhPGnFHwFmZcNB+ggpv
 M5+d78U3BfBbJLccY6ZzEsRlYzIhi39g3bb8vVRg3cHT7YRclB87d6H4FyMa57DiX9Nq
 FEL9y6eo/UcaPx9SQ/0X1d8A8r74CR6ItAOZ9PW7SeWiCesK7hTcX/ddPJ5J1GiuqdJ2
 1vDhj+oE1fSuqb2YyKSctsAuwPA6acEfnPpNCz2I0OYIcamuF4aHwGCEQP0/vQkVdvet
 wa+w==
X-Gm-Message-State: AOAM531/4yRlY/DzdL9c8KsRtEMYn8urpkdM/8fF1irbjf8FDj02s9vO
 QvP3xSYOlT2ZEslNoSlcMA1zcA==
X-Google-Smtp-Source: ABdhPJyYKgEutVDBUMkbAQjWD4Lx1nM8ZgF73iW/8vgjvncvALWsJ4xy8FWGnhhcUaGr8mltlgjs/w==
X-Received: by 2002:a7b:cc8f:: with SMTP id p15mr34211734wma.158.1636713802191; 
 Fri, 12 Nov 2021 02:43:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s13sm11732507wmc.47.2021.11.12.02.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 02:43:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ABE8A1FF96;
 Fri, 12 Nov 2021 09:24:13 +0000 (GMT)
References: <20211111160501.862396-1-crosa@redhat.com>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v2 0/1] Jobs based on custom runners: add CentOS Stream 8
Date: Fri, 12 Nov 2021 09:23:04 +0000
In-reply-to: <20211111160501.862396-1-crosa@redhat.com>
Message-ID: <87v90xhgle.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> This adds a new custom runner, showing an example of how other
> entities can add their own custom jobs to the GitLab CI pipeline.
>
<snip>
>
> One example of a job introduced here, running on the host reserved for
> this purpose can be seen at:
>
>  - https://gitlab.com/cleber.gnu/qemu/-/jobs/1773761640

As I'm not going to be able to test myself I'll just queue this and we
can see it spring into live once merged ;-)

Queued to for-6.2/misc-fixes, thanks.

--=20
Alex Benn=C3=A9e

