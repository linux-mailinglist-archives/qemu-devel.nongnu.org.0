Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E0A3D1185
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 16:37:45 +0200 (CEST)
Received: from localhost ([::1]:50436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6DM0-00032Q-AW
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 10:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6DKj-00028P-AX
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:36:25 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6DKc-0003Hv-TZ
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:36:24 -0400
Received: by mail-ed1-x529.google.com with SMTP id h8so2680377eds.4
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 07:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1XBu2w3PGhHAxK3ydjcGEyZm2k+tCaB7zptj2ep/PSo=;
 b=y48TLF4lhVKCZ6bCOMNmsyTGYzPGe91Vv6OWKa7sFi0WAvYI/YoJ3ANWluq5gyolz7
 ySY+I5Naqn1zPn4igBj1eO+XyfbdlX1PtYfUpQt60DW0xs83YL/nLBocufehApMErqVi
 b/+i3FFDJP53FIspH1UNo3u21Ioqj/YYVGhuEr3y+3Mymc1lY+FxXMn0FLXyck0j2fai
 VYzYjQruvx0/FINT37kth191ohMxN8VpsKcNz+LmU9MZL7hN6BBkDkAtRQibSXQtPkNs
 bA5hSx2mEefEMQBXrP3T/s7wNgK9muyGs8OjEgOAUHVoqwrvXniJ+DztPPpPoDPxpslW
 i/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1XBu2w3PGhHAxK3ydjcGEyZm2k+tCaB7zptj2ep/PSo=;
 b=t74jmHtRLEJYeOCe4xmAiULdSV05ejcLkYaoLBJ6snCLbuOa7q2Fj62a7Ixbb2zIl7
 Z2t4J7Nr3PyURCPvTw3Kcp3I1Q2gujKfQLseB1S15jWNIFyaBzlf3pQWedLYX1sWokKi
 ak77Y4/NrZM2cfi3Eng7BGoKBUg6JTkmDIh78BhqaGfqEElY3fvc/qAHik79cpAbveTo
 JF6Sw09tkNetFVcdNlKH6DzGdZ0caHpGzI5rqvt5aaiwCdjZyKnCE7aTOUSIEMVg3+Oy
 jubrZb7pXQZbcP0Fa1TNU+HXFVjJi0oHX6A/3zumiZ2nBL8mk6jta/rutUDs5u5+f4lF
 Rh8w==
X-Gm-Message-State: AOAM532fSPVIxrprK/p/gKbYrRawU8jOeXP0UIVGRLqK0af+tK9JlmC5
 hBAihT0ZoHHv8kYVyLkMzypXUWfCOUkF/4EePnaLdQ==
X-Google-Smtp-Source: ABdhPJwe//GYCR4kGlV6qgGk89MJVXzU1GNiZDyN7eQUYDbXp+dxjOsuPzoUuxveKAihU4Khs1jFqFI1J/N5WzUFHHQ=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr47739467eds.204.1626878177116; 
 Wed, 21 Jul 2021 07:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210721113912.14483-1-sohu0106@126.com>
In-Reply-To: <20210721113912.14483-1-sohu0106@126.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Jul 2021 15:35:36 +0100
Message-ID: <CAFEAcA9WxkegCtEYgjUW3kHEyv0t5xxKwUJF2mLQhbLhpQxdJA@mail.gmail.com>
Subject: Re: [RFC] Fix rocker device null pointer crash. qemu config
 r->fp_ports with "-device rocker, len-ports=10" when guest config port larget
 then r->fp_ports(10) r->fp_port[port] is null-pointer, qemu will crash
 null-pointer Reported-by: chenzhe <chenzhe@huawei.com>
To: NAME <sohu0106@126.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Jul 2021 at 15:23, NAME <sohu0106@126.com> wrote:
>
> From: sohu0106 <sohu0106@126.com>

Hi; you seem to have a misformatted commit message here --
everything has ended up in the Subject line. The first
line of the commit should be a short summary, usually
preceded by an indication of the area of the code
being fixed, like "hw/net/rocker:". Then there should be
a blank line, followed by the more detailed description
of the change. You can look at the git commit logs for
existing commits to get the idea.

> Signed-off-by: sohu0106 <sohu0106@126.com>

We request that Signed-off-by: lines are your full real
name, not a pseudonym or email address; this is because you
are stating with this line that it's legally OK for this
patch to go into QEMU.

You might like to read
https://wiki.qemu.org/Contribute/SubmitAPatch
if you haven't found it already.

> diff --git a/hw/net/rocker/rocker_fp.c b/hw/net/rocker/rocker_fp.c
> index cbeed65bd5..45b5020106 100644
> --- a/hw/net/rocker/rocker_fp.c
> +++ b/hw/net/rocker/rocker_fp.c
> @@ -108,9 +108,10 @@ int fp_port_set_settings(FpPort *port, uint32_t speed,
>      return ROCKER_OK;
>  }
>
> -bool fp_port_from_pport(uint32_t pport, uint32_t *port)
> +bool fp_port_from_pport(Rocker *r, uint32_t pport, uint32_t *port)
>  {
> -    if (pport < 1 || pport > ROCKER_FP_PORTS_MAX) {
> +    if (pport < 1 || pport > ROCKER_FP_PORTS_MAX ||
> +        pport >= rocker_fp_ports(r)) {
>          return false;

You don't need to keep the check against ROCKER_FP_PORTS_MAX,
because the realize method will ensure that r->fp_ports is
not larger than ROCKER_FP_PORTS_MAX, and so the single check
against "pport >= rocker_fp_ports(r)" covers that case.

thanks
-- PMM

