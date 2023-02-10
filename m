Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD2A691D0C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 11:42:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQQqq-0000Sc-Lb; Fri, 10 Feb 2023 05:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQQqX-0000RH-JY
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 05:41:37 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQQqW-00006N-1G
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 05:41:37 -0500
Received: by mail-pl1-x62f.google.com with SMTP id u9so6021330plr.9
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 02:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676025694;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vZs7WaUOHF7l8G5R1+wZSqhhz5Yh8+TVj1k5ZiESzb0=;
 b=GMkO9yDSSEnzaTRM/7Xyb6S53MC0xoyMWDBuQkBucWqUHNvXuP8S2gfVlu+IAag6y7
 Inynd6aOONNEbHNPPgk9j/NSCrxaGyNZWYtVdyrlxjTyK3033uqoFE9MM/Ybke9sOh5C
 6bA+GbG39vYaYpBG3ruiSFHJxhu0nNedCYOFQ7BVGlI4HUWexUWtIndUuL4Jb1YTEf74
 AZvxHu5YwyCbYwku852pfHA0rT/F1nmv6B/K92ZHymJ6iUMb1MrsfkBjUuL2vd7zLfb5
 SAQyKQzma/T6TiyVSU/4rDgXjGppqfD9aMEAZ74Zua0D8LnZEnbAKZZKQqSbXUjukv52
 n2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676025694;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vZs7WaUOHF7l8G5R1+wZSqhhz5Yh8+TVj1k5ZiESzb0=;
 b=tAOG0Mxkx1WjA/PdHvvHeqiITvQIzme4WoHkFvoSlo4o7aDeMLufXTWwUyHwhbubm6
 X/GNH1DsInDfEXx0jA9SUyiPMXCAsbMHIHrEfhqijmuScia2tnX8UYcC/U5E4eNreMqm
 3z4fKn2VCPesqAQM6MX1YVrlCukOztgW5eGbMZ4ymcg0CLsAmf+27wUNOoYKbzzc6/Zv
 3AOl5YvUX+gqV5WyeC4hTwYUyYNnqxU0HtNKkEczVEVXNwjZdc9pbMPk4oQIXZJuu9ff
 mhHaXA1M1m2MScVZxcpPowdVdu9uNns2bKxF9yD3okKFhq9fAGM/o25+hCfpXbbGXSqA
 aYIg==
X-Gm-Message-State: AO0yUKUijzz67bGVWAXTaBJ4FBV8Z1/dd0bzhTJSVJNT3qkvjYs0TQ+C
 ZXQK9iUq3SF2ChNIf4L++hsoJtXajLtzzwyO9wNk6A==
X-Google-Smtp-Source: AK7set/oLpdJb7c63Ht4PGMZCQmIiwVUob5dqtQT2LU7XsjfU9BwYWPML93e7ObYpxCLVWD9hIrTuUGQLX9KvdcE8KY=
X-Received: by 2002:a17:902:ec8b:b0:19a:75da:ab4 with SMTP id
 x11-20020a170902ec8b00b0019a75da0ab4mr223447plg.9.1676025694342; Fri, 10 Feb
 2023 02:41:34 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
In-Reply-To: <20230210003147.1309376-7-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 10:41:23 +0000
Message-ID: <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
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

On Fri, 10 Feb 2023 at 00:31, John Snow <jsnow@redhat.com> wrote:
>
> CentOS 8 does not ship with a sphinx new enough for our purposes (It
> necessarily uses Python 3.6), so drop this from this build. We can
> resume building docs on CentOS 9 if we wish, but we also currently test
> and build docs on Fedora, Ubuntu, Alpine and Debian.

This confuses me. We work fine with Python 3.6 today.
Either:
 * CentOS 8 has fallen off the end of our "supported build platforms"
   list -- if so, we don't need to be CI'ing anything on it.
 * CentOS 8 is still a supported platform -- in this case building
   the docs is something we need to continue to support, and we
   can't drop Python 3.6 until all of our supported build
   platforms have a newer Python available.

thanks
-- PMM

