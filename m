Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 016D2310EAD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:29:11 +0100 (CET)
Received: from localhost ([::1]:39922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84us-0001tY-0H
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:29:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l84RJ-0004dr-9M
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:58:38 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:38562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l84RH-00038E-Oi
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:58:37 -0500
Received: by mail-wm1-x32e.google.com with SMTP id y187so6443023wmd.3
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 08:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=sUvTVNdgxpBRu4cyBi05Bdw70Hf5sj7vSCMRh6MOm4M=;
 b=Ik9SYpoCrkiAZlNDBj31DXkGYcjlykLyarbzlXK2vgFAjxiwCqCmNMSHScVD9OSbF5
 Q30+MZbVXOmWAJwUwCXB6LbHUrs0f4mhMCJg8jfEbGxfJUOHS0tsZoiSSQZleKXhh71a
 dDMd5rFOMQuSXP4X7lkd92IRyztnA7GDHP7fssAOuiNN1nHv/wTKfZCBtaFZaPsQe/jM
 w2b9HaROPON2WpEg7u7q6Ro3dG2eWSx70apAnC+kx//CZfEBEjigU5SdGTOv/bTLne7C
 Ypi7AWeklCxYpjpFn9+oOe3ipeblXbgdiYW1CX0dSetfFWKs+39rV3q00OLWvxzj7ayO
 wq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=sUvTVNdgxpBRu4cyBi05Bdw70Hf5sj7vSCMRh6MOm4M=;
 b=iR/k3BsLoV64+wrEnLadkizof199FoGG/n11GNQwnOUNSQgf1+aSewIItlvsAd4Rew
 DTU188fcAcutWJdZoQ2YGg+1C7jU86SQmtqX9vsWpyEH7tAGl5YFIWyK0ulqvZCnlEUR
 slYMxxGTPWFcVeQ5SsgsRPdGzJqU+KuCLTpWCNVMncmioGA7ixZez1dNpAy4YJwftssH
 50WDHYEfjsqgd0Y53JtrpWvCdwh24M7exw79Ks8ddyNp4SZMMYGL7A1SLl9ziaZ/LRCz
 SCb64A5eILpc9XxywhRlrKx4tOfObDnqH35eMX2x0VB+YKq4fDLEVecfSHOqort12ge2
 vdVw==
X-Gm-Message-State: AOAM533/lFHLMa+ubUBEscJBvvwAVICVi+X0Okrg25wwV5XeIYFrVhCX
 qyqgshugBqWrJkFDTKZ9yn7eKRt4Vkd89OX0
X-Google-Smtp-Source: ABdhPJzrk3T6zr9oKvgrPI0xXCAJ3dXLfUqP9T7BgksQFw6YZy9qqFhAVFVXGlUQnkH3Si7yoJk6DQ==
X-Received: by 2002:a05:600c:3589:: with SMTP id
 p9mr4360024wmq.18.1612544313218; 
 Fri, 05 Feb 2021 08:58:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n15sm12661352wrx.2.2021.02.05.08.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 08:58:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 199B21FF7E;
 Fri,  5 Feb 2021 16:58:31 +0000 (GMT)
References: <20210205091857.845389-1-thuth@redhat.com>
 <20210205091857.845389-2-thuth@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 1/5] travis.yml: Move gprof/gcov test across to gitlab
Date: Fri, 05 Feb 2021 16:58:05 +0000
In-reply-to: <20210205091857.845389-2-thuth@redhat.com>
Message-ID: <87mtwio3ig.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> Similarly to commit 8cdb2cef3f1, move the gprof/gcov test to GitLab.
>
> The coverage-summary.sh script is not Travis-CI specific, make it
> generic.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Message-Id: <20201108204535.2319870-10-philmd@redhat.com>
> [thuth: Add gcovr and bsdmainutils which are required for the
>         coverage-summary.sh script to the ubuntu docker file,
>         and use 'check' as test target]
> Signed-off-by: Thomas Huth <thuth@redhat.com>

It looks like coverage-html needs fixing but lets not hold things up for
that:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

