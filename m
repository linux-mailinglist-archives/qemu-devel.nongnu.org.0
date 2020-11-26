Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BC82C5362
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 12:56:39 +0100 (CET)
Received: from localhost ([::1]:50676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFt7-0000Te-Aj
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 06:56:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiFmR-00052U-2z
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:49:43 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:38677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiFmP-0004Nr-K9
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:49:42 -0500
Received: by mail-ed1-x541.google.com with SMTP id y4so1974522edy.5
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 03:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9pQsl+bRdDUd4HwO77Mmq+j2d/8BPDjmX1/DlUhVhqE=;
 b=RprW9eTIk4K2qYqb5/xefWr3L9oDHBzwuAXmmVwutBZQ/5IfQ61bryc6c4Eupgxm0r
 gSHIJWcgtnXhEcsNMbLuVT/zLazpIpBe9zJe7G5iigSZnBrMHcaC9xphsRaEj01cuWU1
 W7j+xFA3B/aloA+bsJM4biNefSxxewxpQ4JVYHkkgWfcSlUTpCeKX4RZ19zzjCaauWc6
 OETBS1x/tLGLjJwoAXuh4VQEyReFHOUe3fur7gkxLah7mU8UomtLALTsl3HOxTYSqiBK
 4g2DuNbrF/VmYJ9gxidM+gSRYOyZVex9hZZp/SJ0JjcfaVvoPRDZVngIIhCHDZ4KaiAs
 3Gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9pQsl+bRdDUd4HwO77Mmq+j2d/8BPDjmX1/DlUhVhqE=;
 b=OdTckz/p7+/L6atRjo9+for9dXq34tAw69+Ig8QQoK9mLlvuCb2SXnns5pQhaCItIu
 jBMFSzrUQEXac0uGxES9vORg3qhiyhxLrfd1pKPdeWTZAxxO5ahog3vL2TlCyF15x9Cu
 ohXxTQt2yzvc1dkAwihO7ASY915m2qzSJ+Hu2XBmJv88ac37a13ndBb+8J7CJ7whtDC4
 s7p/SsPg8GbzT99ak1rXEW3a8xp7ALenR0R89kp/mgbuA8eoIoYxbvz4Y/WdqTFu70kS
 e70Sn9jN1Jei4AOXNvvWlk5jQPan9MpE/fQkxDSW9zFa/a6s9P99YvsYJhwTWBlN0tuG
 5QRQ==
X-Gm-Message-State: AOAM533NasHIU4lBtloBSjWSauK1jzQbPOr1sK7fr9tBCvCbyoVIpQ/h
 0tMkS6iy3Al0BysezVTcB8ujdYb6zNPFlYFGkdYXvA==
X-Google-Smtp-Source: ABdhPJxtGKcyL489HdPe6LtRSY/mBVDr+J1d9bXb0HOaTeXflXP7Hdc81f7ntKVZS/CvAr7QF4G1ErGION/wmjI8P08=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr2143091edb.100.1606391379827; 
 Thu, 26 Nov 2020 03:49:39 -0800 (PST)
MIME-Version: 1.0
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-3-marcandre.lureau@redhat.com>
In-Reply-To: <20201126112915.525285-3-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 11:49:28 +0000
Message-ID: <CAFEAcA8QY_rt_JXy+O-3nOJUvbeAz7QMfXU3uDm78JigNvogiA@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] qemu/atomic: Drop special case for unsupported
 compiler
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 11:29, <marcandre.lureau@redhat.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> Since commit efc6c070aca ("configure: Add a test for the
> minimum compiler version") the minimum compiler version
> required for GCC is 4.8, which has the GCC BZ#36793 bug fixed.
>
> We can safely remove the special case introduced in commit
> a281ebc11a6 ("virtio: add missing mb() on notification").
>
> With clang 3.8 (xenial amd64) __ATOMIC_RELAXED is defined, so the chunk
> to remove (which is x86-specific), isn't reached.

The minimum clang version enforced by configure is 3.4, not 3.8.
(Or Apple XCode clang 5.1 -- they use a different versioning scheme!)

thanks
-- PMM

