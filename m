Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3716E1D71
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 09:47:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnE85-0001Ql-Sp; Fri, 14 Apr 2023 03:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1pnE84-0001QV-3V
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 03:45:56 -0400
Received: from mail-io1-f52.google.com ([209.85.166.52])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1pnE7m-0000HS-FF
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 03:45:53 -0400
Received: by mail-io1-f52.google.com with SMTP id b12so2525292ioc.7
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 00:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681458331; x=1684050331;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JUlKtnJlZhEpXOsNdM9zJCR7nR3o7pwdtNe/TZQTQD8=;
 b=eHj0fhpK/19u/bXA09gKt3K0GoO+14tH4rAUy8BhXvKoQx/wKmsFRdnYZyPY2K/WCr
 wb+830sQW81ixSwD7zwzR4sSdJ7BO408Ga1y03yJhTqOAU6JziLBA9DdtwMFJ8L9Rlm1
 GHt5WVOcbEmg0J71X/QwEp61tvgjh7DXenNDQl5X3DoR8ECRNHd/9d+vsgo+rhkfb77a
 GoHZbS3+YUNLv3G5+jcY3Y9MEseNENSD74CPbR7o2eV9R2jbb/q2MVaKOK/SCkWvYkC1
 ipmBtZtglEydIEH9W+CV2ozLzNeKsVikkyPXIRY3CKknvptMK21lvJXcr/VSUrs2sXfk
 DRtg==
X-Gm-Message-State: AAQBX9dKkCmVqcMpkLfP+mm15GdpX/lp7s3p1h9407bsHoTZXMKMjUYr
 9nbFTKIyfPV3bEQsP+yIbYs0TKKGJhAGXI4Xmk0v1EfV1xg=
X-Google-Smtp-Source: AKy350YXqWqYY4YuJ2Io794XkUKhyeUARngLcG6w2/qN4b0Yl+Wn1yONIdEnLAISQbi4AdJXImWGMqu4ryjXNWAr1t8=
X-Received: by 2002:a02:2a8b:0:b0:3a7:e46f:2a32 with SMTP id
 w133-20020a022a8b000000b003a7e46f2a32mr2001627jaw.6.1681458331404; Fri, 14
 Apr 2023 00:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230212082812.55101-1-ricky@rzhou.org>
 <CAFoVXjhT-gsyxuRL9VGziBAj17P_1=_brmrNsoZ1Nz7360iaWA@mail.gmail.com>
In-Reply-To: <CAFoVXjhT-gsyxuRL9VGziBAj17P_1=_brmrNsoZ1Nz7360iaWA@mail.gmail.com>
From: Ricky Zhou <ricky@rzhou.org>
Date: Fri, 14 Apr 2023 00:45:20 -0700
Message-ID: <CAFoVXjhK8NJ7o+__05UBf=zJyTHqsuvCamUmGhYRq9a2MV5tmg@mail.gmail.com>
Subject: Re: [PATCH] target/i386: Fix exception classes for SSE/AVX
 instructions.
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.52; envelope-from=ricky.zhou@gmail.com;
 helo=mail-io1-f52.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

Another ping for this patch:

Patchew link: https://patchew.org/QEMU/20230212082812.55101-1-ricky@rzhou.o=
rg/

Thanks,
Ricky

On Mon, Mar 20, 2023 at 6:21=E2=80=AFAM Ricky Zhou <ricky@rzhou.org> wrote:
>
> On Sun, Feb 12, 2023 at 12:28 AM Ricky Zhou <ricky@rzhou.org> wrote:
> > Fix the exception classes for some SSE/AVX instructions to match what i=
s
> > documented in the Intel manual.
> Friendly ping :-) Does this change seem reasonable to folks?
>
> Patchew link: https://patchew.org/QEMU/20230212082812.55101-1-ricky@rzhou=
.org/
>
> Thanks,
> Ricky

