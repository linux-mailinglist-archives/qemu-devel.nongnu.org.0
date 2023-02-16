Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39543699B11
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:16:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShrO-0000ON-DI; Thu, 16 Feb 2023 12:15:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pShrL-00009e-Ty
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:15:51 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pShrK-0000NY-6H
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:15:51 -0500
Received: by mail-wr1-x431.google.com with SMTP id r28so2080806wra.5
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9uODikHYHKZgHTkZVIU3PY4gwwsVfwMlxitzQ4Sad44=;
 b=JdZwaBdwBbcINfXmGaETGH7vCeMXWKx8ND9Ky6oUH05rBtBmyqMo+UT6sKGkcJ9hNf
 9R8OKK4Nt2c8ixbE1UnH22VqkyNqHQy7GBLhFtP8dr0doN363gn9NoiIIKLQSVtpFIzA
 MHB/Y9PONm/fFpw1SU+i0hDfslUmF3vWcfphExUCXvuDRZ9MB8PCsd5E2nhCIyCalL5C
 Nbpei87g0VVj41/q7/Pg5088ZYlqnVAx+G9nqGWSdh83K5BiGnQjJKi9ylTGOB3hIoae
 Jd4Gbyksj9TNpEryVdTnSD1S4w+YlWjuS5DqWHoMlX1FQeqzd4ij5OHgHJUYxzcVY7Ua
 FpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9uODikHYHKZgHTkZVIU3PY4gwwsVfwMlxitzQ4Sad44=;
 b=MWPJIhKooGgb6aZzEgI0qkzsiNqGyBS03QcgBMfjvQK6qe+xBO4FmXrOyma8ubdnbl
 2hvv2yA92T2avisnlifBILAKjq6GFjkq2mYEgUeH6oOnXhEhx+2jyIiMXnVO4e24InJQ
 dw1OBGghuycyIdeVAtapj1AQZRCc/CkEPVarsjfuNUD7ZkO+UzWGGQpyYvoR7njPq0+9
 6sOl7QQGFfGaV85xIBMGy3Je0Fngo17NC5/CwZWC2USp59kChNE0uHjCFkawvzzoDbfN
 37xT5OOddYIdgH1vubtKJIuod2mXUSZDjKSznPdc0g8io+WXbpDZ+CPf4+/gm01pZV/6
 Js9g==
X-Gm-Message-State: AO0yUKWZ5nK3w8fg9lAOmnIlzaEZplix4cABJ02p6flFYV1UDJ2JH5XA
 RZowJjC60CFANFFRFZwZ/lU5UQ==
X-Google-Smtp-Source: AK7set8/+UB206McDx4MmUHgKevpqelknn6K1LLLiD6xtpfUkGU1jt8rVSDuXZhuA2C9xwKzCdSJIA==
X-Received: by 2002:a5d:4a8e:0:b0:2c5:8d4a:3695 with SMTP id
 o14-20020a5d4a8e000000b002c58d4a3695mr1938465wrq.59.1676567748760; 
 Thu, 16 Feb 2023 09:15:48 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r12-20020adff10c000000b002c54c92e125sm2006877wro.46.2023.02.16.09.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:15:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C5A3C1FFB7;
 Thu, 16 Feb 2023 17:15:47 +0000 (GMT)
References: <20230215142503.90660-1-thuth@redhat.com>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH] gitlab-ci: Use artifacts instead of dumping logs in the
 Cirrus-CI jobs
Date: Thu, 16 Feb 2023 17:15:35 +0000
In-reply-to: <20230215142503.90660-1-thuth@redhat.com>
Message-ID: <87y1ox7cqk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Thomas Huth <thuth@redhat.com> writes:

> The meson log files can get very big, especially if running the tests in
> verbose mode. So dumping those logs to the console was a bad idea, since
> gitlab truncates the output if it is getting too big. Let's publish the
> logs as artifacts instead. This has the disadvantage that you have to
> look up the logs on cirrus-ci.com now instead, but that's still better
> than not having the important part of the log at all since it got
> truncated.
>
> Fixes: 998f334722 ("gitlab: show testlog.txt contents ...")
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

