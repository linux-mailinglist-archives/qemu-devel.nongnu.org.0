Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95813341A35
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:39:16 +0100 (CET)
Received: from localhost ([::1]:45218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCXD-00007m-NT
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNCVx-0007v2-O9
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:37:57 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:35399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNCVw-0006kb-2w
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:37:57 -0400
Received: by mail-ej1-x62f.google.com with SMTP id jy13so8856572ejc.2
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 03:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4jvf5bcFfvGXKLM+TnNxYOZnE/uos+encql9wi4A1F0=;
 b=DaLwt/UBUGgTCaBmKtgaIHfXKicPF4o+StHQJCGOuPky5Za3/bn1ZAbBuC04JfcFUg
 Dl+F+g7vzmHCyg/QyVMTVDAu/YWdC5yfOqH4r4qXk/LQ2V+8zVXGQIA0kaFzmPs2QbwR
 KZQY56enhs/815p7cjo5YhMbAZhhVZF+cup+p+FOIf4vx13pzH5dJwrMuLxBInL1ZNo9
 W1fq+nF2/7Gt2lwJKJZMSMxBfcTaYbjzghPyQqTXeatPTPEFp2blrJCjNVZ52pgUuJIx
 g5U6PjTTSL6J1tWa6osqYL2xf5PQhbYiyicFCseCSgmIXQzaqKIhU4/f56ajSjFYmN7U
 3NyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4jvf5bcFfvGXKLM+TnNxYOZnE/uos+encql9wi4A1F0=;
 b=E9rIViZF0mrHAKRlh0EEKjgKqCAL7jJWwSd1tXMBXD+8F32CdoA1cFDHj2UBX5G8fr
 ZyAGGF3eCHoQQCbBGV+g2Zbuwri6Ks0/ZAzozDPRbRSVDA1bwGfWM/K0qx6ViSvlbeQs
 BEW8kIwTOepmHpSewRkOOWQE8ihw/s4LYdavVpYC9IYpknOsiGK09Xzvnr+fK777iew4
 NicqI5dMCkVnUTEG0oQiCe3U+o/JSRaxRKN8S8jguK7iW7Bimb8tK4xtTw5xqtIlzSHL
 1oBO00kxPC6jDBs35mmQbQQ/KCNHWteKFEBz2tsKUFi5CH+hQuwUvME3wtzNb5pBZMh7
 sf3A==
X-Gm-Message-State: AOAM5334T81qMqj80MOPBd97BZubGN/6vj3UTu6aOLzODtnf5o3gHTcL
 EuB+Ogs8e2FGzAW4/aJoy90cgrDOcOI0bTbQMnGMhQ==
X-Google-Smtp-Source: ABdhPJxtRQpzt2MHZShjp/YlQFKbkZ2ZXcVbZiNNjjPvqMyswwYEUJFqLNGt4yUTsZnIlmKlY0TNY4zAjSsxDkY5/0k=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr3620072ejc.250.1616150274563; 
 Fri, 19 Mar 2021 03:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210318023801.18287-1-gshan@redhat.com>
In-Reply-To: <20210318023801.18287-1-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Mar 2021 10:37:29 +0000
Message-ID: <CAFEAcA_WGfC9RvGjTuNMm_mnykfFKAKdvNhLWQ8873JuGt9nJA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Disable pl011 clock migration if needed
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Shan Gavin <shan.gavin@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 at 02:38, Gavin Shan <gshan@redhat.com> wrote:
>
> A clock is added by commit aac63e0e6ea3 ("hw/char/pl011: add a clock
> input") since v5.2.0 which corresponds to virt-5.2 machine type. It
> causes backwards migration failure from upstream to downstream (v5.1.0)
> when the machine type is specified with virt-5.1.
>
> This fixes the issue by following instructions from section "Connecting
> subsections to properties" in docs/devel/migration.rst. With this applied,
> the PL011 clock is migrated based on the machine type.
>
>    virt-5.2 or newer:  migration
>    virt-5.1 or older:  non-migration
>
> Cc: qemu-stable@nongnu.org # v5.2.0+
> Fixes: aac63e0e6ea3 ("hw/char/pl011: add a clock input")
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>



Applied to target-arm.next, thanks.

-- PMM

