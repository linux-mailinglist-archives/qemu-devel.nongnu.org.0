Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9292F69AE
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:37:05 +0100 (CET)
Received: from localhost ([::1]:59052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07UW-0005Yi-L2
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:37:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l06iy-0001y4-QQ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:47:58 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:56181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l06ir-0006WV-3n
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:47:56 -0500
Received: by mail-wm1-x336.google.com with SMTP id c124so5249104wma.5
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 09:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CZ6GlSbucWGPDtTlieBXkpUacxE1MhDq4W3ASDrcufk=;
 b=wQDptkrCMxs9CwztK+Eb24p0vYN8iduB0xQIb1sQ+FO4SCewmWpQmemRatJYNX9agD
 YINJZa3MtGaKa+UmPVGfzOt7igrwUSjyMuPMeMZJoGq5JJTtDXPdt+KjHfRfTVaSH1Z5
 k/FfGxQNweZx1qZDyEd0XLhkg79fNkCe4cnzEwinunBeXGZST8x6z5PJDY3H8boL75m2
 qYZwCVkwU/xGZAU5GdVxfTzFyTviDtdwMUxgv5WvkYoFMtlDIKIT0ykC2z/0b51bUBC+
 TB+DKylK+vqufDS0ziiYqA450EvvCViaHTp0Ys6iFOHYN73W8wKQ8MmNLgNA2HjB8/Zi
 1uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CZ6GlSbucWGPDtTlieBXkpUacxE1MhDq4W3ASDrcufk=;
 b=QqTJIiZLIR26NL/dwKovB+3gszf6G+1/hk1MAEHWAnnfxxVfQrlHKEeif2Rb9nrC+Z
 VcaJV8aE7miItjIuDsvzTVaoP0fOWSk0FHGHiFOPW0ui+fx0aKU2ZADmuPA6PFwMhks+
 mDN5ZTdYQweKhuMk9WHm97CW/OfiPSmapiB3SKNf13OzyY3pVe3DrapM3Mdf1JwORHqQ
 IkrtzVt9ficsYrc5OBsDnX36MnaCG7u1VCareaaMIbDVIv7pSL+bdEXws3EOlaG9rz+3
 m3+abgS5azuNJgT/WA4M/p0tefTzTUG2sGYVZ4aCQJI5FbO4KJ1KiAWiY/axFNVHyVYD
 JGww==
X-Gm-Message-State: AOAM5326zl9hTd8ntMIEG+RjGTg+P7AcNaMi8kQ5KvjeuHa+AReksyPg
 Nq5HE+I2Kco95uPArydjzlQkZg==
X-Google-Smtp-Source: ABdhPJzG8iY7+r/OUxLgO7TQb3CnQ5rSG7simP8GnCKzEaZ+F+8oxtGmicADhWb0f601lnHaiL5Glg==
X-Received: by 2002:a1c:2e88:: with SMTP id u130mr4994817wmu.83.1610646467022; 
 Thu, 14 Jan 2021 09:47:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c190sm9408989wme.19.2021.01.14.09.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 09:47:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E880C1FF7E;
 Thu, 14 Jan 2021 17:47:44 +0000 (GMT)
References: <CAAQ-SiP8G28ade0jHbhTcv0jtGQb4OSgL5p3mAr0MU_FH8vZ3w@mail.gmail.com>
 <87a6tm2sxb.fsf@linaro.org>
 <CAAQ-SiOW8OnWEb0sHUEeS139-Tw0RO2YD1Tx-1s9iuy3ZVQFgw@mail.gmail.com>
 <878s941x85.fsf@linaro.org>
 <20210108083433.pfzhxrd4rezk6yxe@sirius.home.kraxel.org>
 <CAAQ-SiO4VvVTo77J2ga1FmUZ9yrwopeASweO6-AFaakrAUZ80w@mail.gmail.com>
 <CAAQ-SiPiq5NQN=2mvP3isZ9PtYO2Bu64kVEvE6T+3OJd5B-U5A@mail.gmail.com>
 <CAAQ-SiMkJGBnxWSnybJqMD0LSASMtvA_wbrPDQcg-S+Y1ddjJA@mail.gmail.com>
 <878s8zptrf.fsf@linaro.org>
 <CAAQ-SiNKXhJcT1XEodQT6kojqppq37Kg8F8igipQ-HVYOU0=zA@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
Date: Thu, 14 Jan 2021 17:41:54 +0000
In-reply-to: <CAAQ-SiNKXhJcT1XEodQT6kojqppq37Kg8F8igipQ-HVYOU0=zA@mail.gmail.com>
Message-ID: <87ft33l8an.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com> writes:

> Just an update:
>
> I've studied the virtio specification along with the source code and I now
> understand what the device implementation is
> going to look like. Also I understand the source code a lot better. I am
> now reading about the qemu vhost-user protocol.
>
> Although I haven't read about the vhost-user daemon in detail, from what
> little I have read, I would say that the daemon
> would get the virtqueues from the virtio device and forward it to the sou=
nd
> device of the host. (This is the hard part
> I think, since an in QEMU device would use code already written for
> processing these queues.)

I can't comment on the difficulty there but this does point more towards
using the in-QEMU approach given we have a bunch of utility functions alrea=
dy.

> I think only the tx and rx
> queues would be shared, and although I do not know exactly how the sharing
> will be implemented, I think the memory
> will be shared to the vhost-user daemon too? So now the virtqueue memory =
is
> shared between the virtio driver in guest
> OS, the virtio device in QEMU, and the vhost-user daemon running in the
> host userspace.

QEMU uses a memfd file descriptor to share the guests entire memory map
with the daemon.

> As for the configuration part, the driver will negotiate features with the
> virtio device in QEMU, which in turn will communicate
> with the vhost-user daemon (via sockets) to get the features supported I
> think.
>
> This is what I think it will roughly look like. (Of course modulo the
> implementation details.) I do not yet understand how
> much more difficult will implementing the vhost-user daemon be, and since=
 I
> was already
> warned about the difficulty, I will not risk making any hasty decisions
> that later hinder the project. I will read up
> about the vhost-user daemon and how it's implemented to get a better idea,
> and then make the final call.

If you want to see an example of a branch new vhost-user daemon being
built up from scratch see my recent virtio-rpmb series. The first few
patches of in-QEMU code will be the same boilerplate either way I think:

  https://patchew.org/QEMU/20200925125147.26943-1-alex.bennee@linaro.org/

> Anyways I am super excited about the project. I got to learn about some
> really cool things in the past couple of days,
> and I can not wait to implement it. :)


--=20
Alex Benn=C3=A9e

