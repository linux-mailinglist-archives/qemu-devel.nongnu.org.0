Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1B8310FC8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:22:37 +0100 (CET)
Received: from localhost ([::1]:42930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85kZ-0004Su-Bz
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l84WG-0001NT-JZ
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:03:46 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:50550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l84WA-0005Ff-0C
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:03:44 -0500
Received: by mail-wm1-x32a.google.com with SMTP id 190so6592305wmz.0
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=bywmX30v2KomBpMFZHzjLqxIL+GbEDDOX7UlF97oxEQ=;
 b=Hn7sXrNcspzD4FMkNwIzyrkrOlgvIJ0kSn/aeBPMJSaZ40yBYgJlTPnQrkNEHi4D1B
 NTrH1RfMWNhrQgPRhEyhGXLA4rRtA1b6EazYzV5l8cJVzPmOYeuD+AhhHxk+retlPuV6
 jrp38/zcVwRyRg8JJI4G1vfuYrnYbfNPSTxEDMw2CYnXVILFdQBXO/sjHqupD43+ItVi
 PqzIipPq4Vw5Amg44dCnJu98Dwqln5x+BdzogZ5NI0yIU4dtNjK+a4MZQG9fQcs3DNFm
 rXvNxxNLA3bws6N7S/WDMqVXJ+lGfZsaK/7DVJ7l9Sr18PVCOJrK9XYcbVrjwN+I3DOa
 e7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=bywmX30v2KomBpMFZHzjLqxIL+GbEDDOX7UlF97oxEQ=;
 b=rtbsKkMxDdbXIWXuUEpLrO788oWMsICOCAiFfPkiMolSNDhYYpI2hk8cdCao36sB2L
 NHUxmDUG/2fjCyD95sn/6F8ccbSMaSC+QsN+C0jr2obvJEcfItwrukfB5GvQo/gwSpf/
 me9XWHVsoCQMF5JjAzKwQRhG+803SGvnP8Phl2RwWqM8Hvx9DGNVyNLMapmpXu+/Ui9a
 kkfP/jKbdokbjYsfALVywf7ATRCeXGfbuAzEru0vijpNe7xJ8kybGp47TxIJXhTNtDk7
 ccRR3dN6bhBuy0G+Prno3igsXggGtuORBrQinT8Pk8iTscZ9okUjqn3XLZHpr1xrwIH2
 hr8g==
X-Gm-Message-State: AOAM532PvIn6USBMUknzx96ydH9kP6ia88wR/Moe99TnlQ4D3BnRJxcp
 lWvaZPqdH19Vs/swqoj+vF/yrdRbRJQRE9/H
X-Google-Smtp-Source: ABdhPJx6jMY30GgfACCEI5NDmvNhDqt0vO59pOw9Ubc7Ya2tawEvYkIUCkjLo8Eu5XOu3RDabVundQ==
X-Received: by 2002:a05:600c:4ec6:: with SMTP id
 g6mr4494669wmq.2.1612544615757; 
 Fri, 05 Feb 2021 09:03:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t15sm9180713wmi.48.2021.02.05.09.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:03:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A61411FF7E;
 Fri,  5 Feb 2021 17:03:33 +0000 (GMT)
References: <20210205091857.845389-1-thuth@redhat.com>
 <20210205091857.845389-5-thuth@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 4/5] travis.yml: (Re-)move the --enable-debug jobs
Date: Fri, 05 Feb 2021 17:03:28 +0000
In-reply-to: <20210205091857.845389-5-thuth@redhat.com>
Message-ID: <87eehuo3a2.fsf@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

> We already have similar jobs in the gitlab-CI ("build-some-softmmu" and
> "build-user-plugins"), so let's switch one of them to use --enable-debug
> instead of --enable-debug-tcg, then we can simply drop these jobs from
> the Travis-CI.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

