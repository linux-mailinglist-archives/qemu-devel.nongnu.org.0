Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6929865EA38
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 12:52:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDOmt-0003kC-64; Thu, 05 Jan 2023 06:51:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOmr-0003jX-OJ
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:51:57 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOmp-0001dk-28
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:51:57 -0500
Received: by mail-pf1-x42d.google.com with SMTP id a30so9515658pfr.6
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 03:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kENL7zooPtJIi9NIEvIqTLkqmG0cHOnsRINd6CTofig=;
 b=RkHXpkT6M1X8ZY9qVZ4JVhOms43+E/7dypmYxBJS0t6QHfWazeN26s/Tvt3kUjpGiH
 sQcTo33DvK93dSZZEiQZzax7qKdx1vLzS0eGuAxHHhK0hoiROasdjQ7o69W+A5f7jI6O
 TWZoVLn4hI87hyJzCyUOjagNha7ZFfuLke7zMl7JMuz65HHlNxAmiYw+JdgltBdIxzid
 A2JLcksMfRXcouZAjg0cImovl2dFGL/Q9yN89N5AlxfnEXmzSi9am/b0yEiGxKb6gEnJ
 6jmYvsDOlW57+9Iqs906TEXEekOM6dN5+aEVFQ//jCO8uF+dpTsP5WC/00DGtqTEByE3
 4oPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kENL7zooPtJIi9NIEvIqTLkqmG0cHOnsRINd6CTofig=;
 b=vrrPxTVPYjY5fJD8TxwEcumB31VeCry47/JoxyFiN7HbrtIn9mfsCQAMmIVJWSvEPt
 u3E5hxOteTLlSJ1x346V4YpUdTuu7qrQg+IOxhOWnOeFRtxt9V9kAVI6DqdL/0EINipL
 nAaD7mZ0zZQMufe+Bfo8lhzEcdtpoZUUwB+UIepX25LI670Kc8TDrYT5/P+x/faSWnQz
 u3bKyyf7fQv7WeZYc7IHCfggTDnUPe5rbqX516RABGgKZgzuOsytJOjzPY+tZa3AZGE8
 ubDFep7Q77en+Vonk9umUhtKQCUMd/7DqoOH4/O4DyWUqaUgqWcb3ojkrbrTnXDbC6ME
 KqtA==
X-Gm-Message-State: AFqh2kq9/A+4m5EM3lASJ841lzhYAmBJe/pyyg8u9kZpKKx4pj9BRi3m
 4H8kXL0VSHz0K7X1mjIWF7Yz6wcpBWx/9FJAwaKD2w==
X-Google-Smtp-Source: AMrXdXsbw16T7OID38zisWL29wwgq0gX7Z7LBa+Y4mGOna3DVTDUdetGwhZAGVA9iUdx8GkNI85kxJ745MOS6pBq7SM=
X-Received: by 2002:a63:3d4:0:b0:492:50dc:da4d with SMTP id
 203-20020a6303d4000000b0049250dcda4dmr2310726pgd.192.1672919513208; Thu, 05
 Jan 2023 03:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20230105114304.2017493-1-alex.bennee@linaro.org>
In-Reply-To: <20230105114304.2017493-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 11:51:41 +0000
Message-ID: <CAFEAcA-iBM9qnkJ4hm3vmboyZY=+9ErWENwbi=zHZ1YJ9DNDFw@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: fix handling of HLT semihosting in system
 mode
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
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

On Thu, 5 Jan 2023 at 11:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The check semihosting_enabled() wants to know if the guest is
> currently in user mode. Unlike the other cases the test was inverted
> causing us to block semihosting calls in non-EL0 modes.
>
> Fixes: 19b26317e9 (target/arm: Honour -semihosting-config userspace=3Don)
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Whoops. I guess I must have only tested SVC AA32 semihosting
or something. We should

Cc: qemu-stable@nongnu.org

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

and applied to target-arm.next.

-- PMM

