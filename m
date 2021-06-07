Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8893039DB7F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:39:12 +0200 (CEST)
Received: from localhost ([::1]:56876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqDb5-00049R-KN
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqDZ8-0003SW-0P
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:37:10 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqDZ6-0007Yx-7b
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:37:09 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so4959549wmq.5
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 04:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=KbNTIH6cO8CZEe2Hm8WIxoVjtD8T0wwPp4NdAhCRrD4=;
 b=MJghMJic05aTBx4L4ebC5sJJqL+wCv260esnmie1Udus8QI5uOyjWu6r442B9L7ivz
 Ozeg6SzF7CFaZW2g81ohMqv1oseoXi1R2TBxQK7tSvj5YwwalarGYozhN+JuvN2b4g9m
 gm7oeL45fqKJ986GydmkZ4dOBscd0jUv5fJ51jNKfxNr4kQjIqetBYNhkaRIcWSroj+x
 RyE7C0Rwl5en1tki1yHnMegSSnHoVZmPeJTE7rNB9PSoxC1qWIkpEhlZn3Jkxb6c8scw
 61gYGW+auRUTO7X+5Dy1OCN/EDP0K1+UjHkQP4Vr1TTbrCA/Q7LHSGRjQ6fRVl/5MU3V
 4Jyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=KbNTIH6cO8CZEe2Hm8WIxoVjtD8T0wwPp4NdAhCRrD4=;
 b=slqXNkRS8PfHZakbYGJXgeasXVqGF09ppzi4tMZdrjdNwn2m2uOI6RP2I6gWlhpFnH
 cvq8Ex7Jrl05Q/YAPzVqd+pqNSfMaSz499k6deumNPzAijwXW3iuLpNx7AQeYZtAwNOz
 akx3ieCnaC9bSmx7vukdgiMeY4p6BlqagFO58a+ImndKJ5hHTiDaxDTMvnJlLfRt6/DQ
 VZarURWYEP78/glxGca4tpjDT4cdZhO371WAH4jyJvRTCUhXMyuvhndRuX8V5jNbvxJq
 9E5P0TbisftkvwZORunQLGkrOD58a6gVxfeiPgu3NjTKxjJORXd0t6tWYIiPmKHaUbgm
 NA5Q==
X-Gm-Message-State: AOAM530bukQayNc7R88Tp2zbJpAoLcxzhykBK5HyrkFQ/h055RZsQIS8
 E0/3Zr2JqQL/tCNs0kkeLYNd4g==
X-Google-Smtp-Source: ABdhPJxdC4AobOiGe+5PdGms7AA1deWsY85CJIw76OslfRp5ZXrRqXNd7YwxlTB9lJEwY+CR8VjG4Q==
X-Received: by 2002:a1c:b603:: with SMTP id g3mr16202495wmf.58.1623065826376; 
 Mon, 07 Jun 2021 04:37:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u16sm16939502wru.56.2021.06.07.04.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 04:37:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 093441FF7E;
 Mon,  7 Jun 2021 12:37:05 +0100 (BST)
References: <20210525082556.4011380-1-f4bug@amsat.org>
 <20210525082556.4011380-7-f4bug@amsat.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 6/9] gitlab-ci: Split gprof-gcov job
Date: Mon, 07 Jun 2021 12:36:50 +0100
In-reply-to: <20210525082556.4011380-7-f4bug@amsat.org>
Message-ID: <87im2poqhr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> This job is hitting the 70min limit, so split it in 2 tasks.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/buildtest.yml | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)

I've grabbed this for the PR I'm rolling now...

--=20
Alex Benn=C3=A9e

