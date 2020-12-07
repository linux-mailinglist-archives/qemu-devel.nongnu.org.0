Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE58F2D1104
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 13:51:47 +0100 (CET)
Received: from localhost ([::1]:52592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmFzW-0007iB-Ta
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 07:51:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmF2S-0004lj-VU
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:50:48 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:46795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmF2Q-0002tz-Rx
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:50:44 -0500
Received: by mail-ed1-x536.google.com with SMTP id b73so13352636edf.13
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 03:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EDx7gPBD7v10+rS7TVIf/H9ANGcE0e5lWLsmE9dCDnQ=;
 b=yeLIA7qiIZ1fm+pSfJAWMUyNTWmy7YuY9WY+XiH3sUUy3Ibmqhoo64vUuxbKbDWUwy
 aW1cgHJHxgQ7R1P6a1qDZrMbKP/NdBtMQotSK6Qh5c2Avk2yYo1WZgHUC/SUHp0nn6H9
 lXZgL1bhlKgpMpY8djo69hTEWl/h/EIdIOZ4QWVon3/8ERjlL/3yzDgICETkIe4UqfS6
 YUUf2hY7KgR7ZdAwDfk4GBo5zLyuGNCGancd1O03aEyjiWIf/uZBtiJFJqYUR/Gh97pG
 9i8Svjn+o/boAPajhL2/fnpgP0KMppDVY5DMDvVnOwQ7Pz37wTZ7MtljJqD4jI/HIxPR
 mGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EDx7gPBD7v10+rS7TVIf/H9ANGcE0e5lWLsmE9dCDnQ=;
 b=PcLgkbkcJrEzh6ZmidM2hxF1NQAwaaMLE1owuSLUIdhsciSfaC1VV1w2ZlsNoryV1L
 rP90/k8EAg1NrSGQeFkPdfXZidKd3U/KSpR197EMabOs4RnhYAWXtDEskdFFFPAgE8A1
 85o4OhRnNltzJrLze7uSNavOkVNqUTqO50uYeJ6m/YNiJhosYrxwIHTR+UbUwJUMA6XU
 kffao2fpfCbB4JGXX3+YykpY+M4QxPThc2O3GoqNCctDiTg/yAY2vfhzLVnSB0BXXeVk
 uL5uQKCrVAuRmi4E9rTPQSi3i39WQNEeU0aeVlRvJLGKvpNRf6g+VwT+3Fspou7co0Fq
 3fWQ==
X-Gm-Message-State: AOAM531EtdoWj/PgVizEEgtOMGKw9R9IumGdvbnlB+hhWJ45+K1rzGOf
 2ateD+LHP0hZ9KYsbCTcD6WD7NK2zx05aSG3HGWzFQ==
X-Google-Smtp-Source: ABdhPJxyDtPfAL7Nd8MD/IDUg6GEDRQ4Vb2xMHw/R57OS9pSGciSZW+OL8RHgLTCaR7YJvnydJpwWF+8eSfBnor0K1A=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr12551274edv.100.1607341835382; 
 Mon, 07 Dec 2020 03:50:35 -0800 (PST)
MIME-Version: 1.0
References: <5176c935-2df0-e300-b1cf-67c7014e5d73@suse.de>
In-Reply-To: <5176c935-2df0-e300-b1cf-67c7014e5d73@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Dec 2020 11:50:24 +0000
Message-ID: <CAFEAcA9xLZCmjmBnPUN52wSDYdk2qd14RFXPyU0vWeW53Vg5aA@mail.gmail.com>
Subject: Re: Why do we have both CONFIG_SOFTMMU and CONFIG_USER_ONLY?
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Dec 2020 at 11:39, Claudio Fontana <cfontana@suse.de> wrote:
>
> As in Subject,
>
> am I understanding correctly that the one or the other is redundant?
>
> Should we keep only one of them?

I think that perhaps the idea at one point was that we
might have a version of linux-user which used a softmmu
(this would allow better control of the guest's view of
its address space, so guest mmap() to fixed addresses
would work better, for instance). But nobody's ever actually
tried to implement that, so I imagine that if we ever did
we'd find that some CONFIG_SOFTMMU and some CONFIG_USER_ONLY
defines were the wrong way around...

thanks
-- PMM

