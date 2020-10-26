Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B140E2994C3
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 19:02:21 +0100 (CET)
Received: from localhost ([::1]:40338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX6p2-0002Vf-O4
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 14:02:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kX6Kk-0008Nj-D6
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:31:10 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kX6Kh-0001rp-Jp
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:31:01 -0400
Received: by mail-wm1-x344.google.com with SMTP id c194so12500157wme.2
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 10:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=JusQa2iXGNazCoC8KCbnYTRS3jVKEKSNL+tpuep9nwQ=;
 b=YT/IsFOl8G90vdB8g8Ix9S9m9aggAbLpHg9bxRptND1j4SncbTt2q1KNYTJXgsPSMu
 D7rrmV6CCZ7NiMazDsmbg3W9xd52BRRwd5zIcUgGdn7a6PaaYkx/r8NIJJCPj5RUWl8Z
 Ix0txYWN4NlfgzgRzkKKodLLX6Lo+Wgn/voxnIOWqvi58Y+hIM4gn2o1wB1wmXZN8KeC
 nNIY3IG+pVugQU3xgQUAkg5NiTaeTdW9uff612nQN/bFM114nSDlhZioZm5SWrctMqpK
 8EfyLJG6axaACuhGZWGwoUBoLuLWszEzOGkiwPybECcvXa0JiguIV47W/DhWET2Q5bpY
 MDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=JusQa2iXGNazCoC8KCbnYTRS3jVKEKSNL+tpuep9nwQ=;
 b=prd434fM4T8YMoIQQI5X9+iscOYSVH0v88kX/qqw1ZsU11VhO3Ra4rbHUW0fXxMvqi
 M4cAau4xi8xwY0NkVmBNILoWqj5LAaaZRjHhVtVkl2bfO1F3r3XP0+LmnvXisGHc8b/k
 Qmzgi+jA4hT9JC/o69+cBe6EN1FvurZ0t9/gt6eGpvUw0Q4hXZOY04MVzOC2ygVsjTW5
 2+TP/pHzAFlSs+DwlfmizaoEh13E/2pOTP1uwPY2pm7Ui8q4GPX8DN+wTt8HBJteIHHV
 9Kd3ZzbjAHL0r+BkXJGAx4YW9yFaQieGn18EPMWNM1WEd4uSDzPvK9+02SmiM+s16TED
 avTw==
X-Gm-Message-State: AOAM5322B+GyWz9PJVnOSw+PwHhr5pKI+4NP8/n2FS8FimWpGb1qrFS9
 KUtJZXazC40pi0lqxsm4enDgIoynZc2J+w==
X-Google-Smtp-Source: ABdhPJzp02jU7jYdT0rR/mj9tJkzQ7Sf17YebjvRMuCukFrYcvPxjhEb+6BkZ+k9P+08iIBCj/ZHdw==
X-Received: by 2002:a05:600c:2888:: with SMTP id
 g8mr17088135wmd.130.1603733457104; 
 Mon, 26 Oct 2020 10:30:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e25sm24418838wra.71.2020.10.26.10.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 10:30:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ED5891FF7E;
 Mon, 26 Oct 2020 17:30:54 +0000 (GMT)
References: <20201026143028.3034018-1-pbonzini@redhat.com>
 <20201026143028.3034018-16-pbonzini@redhat.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 15/15] vl: remove bios_name
In-reply-to: <20201026143028.3034018-16-pbonzini@redhat.com>
Date: Mon, 26 Oct 2020 17:30:54 +0000
Message-ID: <87a6w8gai9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x344.google.com
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> bios_name was a legacy variable used by machine code, but it is
> no more.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

well it all built which is as far as I've tested it:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

