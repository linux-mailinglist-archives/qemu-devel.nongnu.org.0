Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FDB4E9C1A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 18:20:05 +0200 (CEST)
Received: from localhost ([::1]:60702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYs68-00072B-8x
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 12:20:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nYs5F-0006NL-RU
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 12:19:09 -0400
Received: from [2a00:1450:4864:20::632] (port=37792
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nYs53-0001S4-3i
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 12:18:58 -0400
Received: by mail-ej1-x632.google.com with SMTP id bg10so29759397ejb.4
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 09:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=glJOWuFpFX3C0yWKaOfAABiDtjFFYjnBveZ7b1BPIp4=;
 b=y4ZnMwb2EZAYaGJzbt8h5lz3/xSeFMJzKrrnJgXpvu0zZejuRWUDmgstQIwRjclrIN
 Y+5taMoEopCwkwWgcYSUmNpEoxLEMXA4r3JRvBhEzyOs597DCHbDqWsAzWee0Gmr/xUI
 UKl3VqL1SmFeBzobJl0RjrHfmesS1HXcNpqMa6IEpwXUupHYDUaDZ86/0/tv8qw7M1wl
 OrEyanHjcLZVyTwrnsHIlQXSUX2frvVTg77rulhYgqreYwpcDSFHHqC2hJTWkXNcSexR
 Oa8jMNUILq3YZbUV0QkXJQ7gCueBqOGlJrY3nV9uEYZziotCzchMhZP0SsZ/vLVdPpRd
 kXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=glJOWuFpFX3C0yWKaOfAABiDtjFFYjnBveZ7b1BPIp4=;
 b=0fbO/Ox4s/wVBNXCc7XvudmyzeJejwqt+6CLF+VI6qf2dI81et/RzcpOiw9K1OlD2/
 e9wnbzWFHxYcNxJqRvTTP0hOphvw1KQqtQlJWxpWZHbuSdHPggkSYBlRZ5gkqlgTaTqi
 vBNe4soRvkY1cl/iBuHooTG2UEo67BJv8YhBen9gTdIlMvzp/w52G8qdGO+Pkla3whXl
 k5SSIUAEcW1FyRQKkSch825f8a955YtcYPxJQwtro8B/jv2fZEUoMbfuOOC846KDd4T7
 3tw2s1g0xM8Za9MfokiB8Vhe9bbLrCB3La7pFKCOM4TxRoixujEHQgmHR/9HtYZEfGBc
 2rqA==
X-Gm-Message-State: AOAM530EwMbmaL8pR9a06CXJcpfixjYerx/f5z8HpeNsjaB5qRbC16aN
 6FTCgcmXG/S36FO0CwRw7DvK79woap4Ndg==
X-Google-Smtp-Source: ABdhPJwqKmHalwmeSaeLiixLkSipY9myRel7jhO/Fiskoe7s1viwzHbaZ1UUsnxmdv23a5DQkdYYaw==
X-Received: by 2002:a17:907:60d1:b0:6e0:22a8:e2e5 with SMTP id
 hv17-20020a17090760d100b006e022a8e2e5mr28023079ejc.612.1648484334908; 
 Mon, 28 Mar 2022 09:18:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a170906521000b006d58773e992sm6097233ejm.188.2022.03.28.09.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 09:18:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D99C11FFB7;
 Mon, 28 Mar 2022 17:18:52 +0100 (BST)
References: <20220328140240.40798-1-pbonzini@redhat.com>
 <20220328140240.40798-2-pbonzini@redhat.com>
User-agent: mu4e 1.7.11; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 01/15] tests/docker: remove dead code
Date: Mon, 28 Mar 2022 17:18:10 +0100
In-reply-to: <20220328140240.40798-2-pbonzini@redhat.com>
Message-ID: <87h77ixd77.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> debian-powerpc-user-cross was the only linux-user powered cross builder
> and it was removed in commit 80394ccf21 ("tests/docker: remove
> debian-powerpc-user-cross", 2019-09-26). Remove all the infrastructure
> around it since it is now unused.

It doesn't remove it all - we still have the
docker-binfmt-image-debian-% rule (which I'd like to keep). Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

