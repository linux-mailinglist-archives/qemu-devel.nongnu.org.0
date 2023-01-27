Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA99267E644
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 14:12:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLOW8-0000pQ-0M; Fri, 27 Jan 2023 08:11:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLOW5-0000aQ-5X
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 08:11:41 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLOW3-0002iJ-Ct
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 08:11:40 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 rm7-20020a17090b3ec700b0022c05558d22so4815487pjb.5
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 05:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zm6ETde0LFBijnf14Acl+ycUJ/Kv5C+CBcIIWj9X09E=;
 b=kAkOQFUi9FfYcvE/o1Abj+iw/UVzVTAoinwwrSdJFaNZfkCEDu8eQEHqVPC5TT62S7
 46vHgfq4kNa2TfuYYGs5LHFzaEcvidSR/RjVq3rALwYdaNOaf327lJyVCFfAr/H7D/io
 L+ott5M77QlZZk0RgCg8bDhDglhK0BVTKks62Dx9RNRpbHhQ2ZGtqakxAyFDeSSVctlO
 uCbIlbb7YK7Fxj0SppJRUsJ99tV/BylZd028OzwmrUJjxnOGMw0F6eWtpWI1THEivA+n
 lQlPYRR4FYB4r9cbzkpwqSQJGTXlgFTxZcmCser2+seWty191EASvGwVEIvjcYBqjOLN
 soLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zm6ETde0LFBijnf14Acl+ycUJ/Kv5C+CBcIIWj9X09E=;
 b=gjXa8LjQ6D9tEakV99rtWfD3Iqxf5X8M6HaGDJQtwLUg4enGw/N6ZU1sijhUVjsQZ+
 wZUYA359ty9gd3rjWFYKvuYEVYsUHiLWa6GT+gthE7I6f5fQbdVU9t3vxw66cGSCcDcQ
 CRJxOD3w7MMqALpBLOmwFglC9HWgWC57AXL+EyJ+5RWpqw51lBoMC60GqnSCd1QD2eRQ
 JKWt4ZRsGVlJNBTChpAchjGvKpBOK7tXc5tF9u7BQbr+lvwYvuEbfjwSiNPFlBScA+1I
 RdhZfU7dTWWvH7itwpIk8MWVhyMF1R1mcLNM/emFq097AoZ61eYMA7VbCNk/Ss3OY0MN
 882g==
X-Gm-Message-State: AFqh2koWFd3CGB24wkrILTRJ6cbyLVzX8JeVGTTxabJrawLtev8+CYyA
 8NUm7nlqg9bsp0Bj6Sq8JtfxOsnNDHT8B38p3b0zLQ==
X-Google-Smtp-Source: AMrXdXvf/PGfQtPNF+dkL742p0EawcHiXxites4sMa5Z+q1jBRevDibU3IyoYVjenuwROP4SPCO0V0dEF+u2d/QnlgA=
X-Received: by 2002:a17:90a:d801:b0:22b:bc67:1dec with SMTP id
 a1-20020a17090ad80100b0022bbc671decmr3837605pjv.67.1674825073641; Fri, 27 Jan
 2023 05:11:13 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
 <CAJSP0QXC3z-UyP5HoVTOmAfyz_vV6cpZJvnTYazWq9=52bndpA@mail.gmail.com>
 <CAFEAcA_CJ3VjHx1GhjBJjCY=+twBZM3UnR_g0sZLJhvVLcY=GQ@mail.gmail.com>
 <Y9PF7C29TNSuvz9o@redhat.com>
In-Reply-To: <Y9PF7C29TNSuvz9o@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Jan 2023 13:11:02 +0000
Message-ID: <CAFEAcA-_3FSQGNYXZo0yBdeMDkXj45O82O7s3t+Fbi1Lb3RQtQ@mail.gmail.com>
Subject: Re: no more pullreq processing til February
To: Kevin Wolf <kwolf@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, John Snow <jsnow@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
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

On Fri, 27 Jan 2023 at 12:39, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 26.01.2023 um 15:28 hat Peter Maydell geschrieben:
> > On Thu, 26 Jan 2023 at 14:25, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > >
> > > Are you batching pull requests? I used that approach last release
> > > cycle. CI takes so long to run that I didn't want to run it for every
> > > pull request. Batching worked well overall.
> >
> > No, I just do one test per pullreq. IME the CI is flaky
> > enough that I don't really want to batch it up, and it
> > isn't so slow that I build up a backlog of unprocessed
> > requests.
>
> But obviously so slow that we've run out of minutes. It would be good if
> this didn't happen every month in the future.
>
> If it worked well enough for Stefan, I think it would be worth trying to
> batch some pull requests going forward. What is the downside of it? If
> CI fails and flaky tests seem to be at fault, I assume you just re-run
> the job, no matter whether it tests a single pull request or two or
> three of them?

It means that if something fails it's harder to see whether
it was pullreq A or pullreq B. It also means there's a higher
cost to "abandon processing the merge and try a different one
to see if that one goes through and come back to this one later",
which is also something I sometimes do in an attempt to figure
out whether a problem is the usual flaky CI or not.

-- PMM

