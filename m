Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F71589BF2
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 14:53:48 +0200 (CEST)
Received: from localhost ([::1]:41182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJaMF-0007a0-Kk
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 08:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJaGE-0001kd-Fj
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:47:36 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:40056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJaGC-0005LJ-FN
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:47:34 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E675FB82520
 for <qemu-devel@nongnu.org>; Thu,  4 Aug 2022 12:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7103CC433B5
 for <qemu-devel@nongnu.org>; Thu,  4 Aug 2022 12:47:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="i6ZNWnpE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659617240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hAXGyIxUn4hcMqb27DFCWyb6XuANRmBrMYgNdrS7MhY=;
 b=i6ZNWnpEG+WZ3kZOqbnXfmD8SsY0Ag/fAaQR+Am6Dry7Wc4f8duu70YDngPTWC5h7eRFRZ
 JiZBTK186sYw+mdZv0VKwj+6XOeFEk62Nb25FopsLK+mGPcnxs3ZL4J1K1RGBoIxEj7tB/
 /JJAdGhAMfs4E/tqdrhyqV8kqirmZA0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9e5eaa9e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Thu, 4 Aug 2022 12:47:20 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-32194238c77so199477887b3.4
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 05:47:19 -0700 (PDT)
X-Gm-Message-State: ACgBeo2N4HAIgr97H7yuQa8/o110Ua/yyJyvlMHoAE7B6CZdYjHLt0EB
 4ChOTvl+CdJ/3PzWai48HaVE89Aq2N1FCLaBX9g=
X-Google-Smtp-Source: AA6agR7KRBephODycnpxsH5pnFL9H2EiQgK1FhjFDV/LGhi4J60cmLVby1E61gmT3x955E8jyVPK/adfiBB8MJQQ3u0=
X-Received: by 2002:a0d:f082:0:b0:31f:1d1d:118d with SMTP id
 z124-20020a0df082000000b0031f1d1d118dmr1551196ywe.124.1659617238797; Thu, 04
 Aug 2022 05:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <YusVVLNbLgsk49PK@zx2c4.com>
 <20220804004411.1343158-1-Jason@zx2c4.com>
 <20220804030012-mutt-send-email-mst@kernel.org>
 <bfa5704d-755c-5a52-e7cc-bd9b34e5bb03@redhat.com>
 <YuuQb3D/YY1SiUqY@redhat.com>
 <CAMj1kXFr6Bv4_G0-wCTu4fp_iCrG060NHJx_j2dbnyiFJKYYeQ@mail.gmail.com>
 <eadc852a-63f9-a017-aef7-f046eb56e28f@redhat.com> <Yuu3YeTRLE/gx6YC@zx2c4.com>
In-Reply-To: <Yuu3YeTRLE/gx6YC@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 4 Aug 2022 14:47:07 +0200
X-Gmail-Original-Message-ID: <CAHmME9qQQZH1+Dy4zY5L-MdxN4kXtujW9XaH1x+RyCn-SjsTOA@mail.gmail.com>
Message-ID: <CAHmME9qQQZH1+Dy4zY5L-MdxN4kXtujW9XaH1x+RyCn-SjsTOA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/i386: place setup_data at fixed place in memory
To: Laszlo Ersek <lersek@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, linux-efi <linux-efi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 4, 2022 at 2:11 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Laszlo,
>
> On Thu, Aug 04, 2022 at 01:31:36PM +0200, Laszlo Ersek wrote:
> > None of the existing info passing methods seem early enough, generic
> > enough, and secure enough (at the same time)...
>
> Can you look at the v2 patch? It seems to work on every configuration I
> throw at it. Keep in mind that setup_data is only used very, very early.
> I can think of a few other places to put it too, looking at the x86
> memory map, that will survive long enough.
>
> I think this might actually be a straightforwardly solvable problem if
> you think about it more basically.

And just to put things in perspective here... We only need like 48
bytes or something at some easy fixed address. That's not much. That's
*got* to be a fairly tractable problem. If v2 has issues, I can't see
why there wouldn't be a different easy place to put a meger 48 bytes
of stuff that then is allowed to be wiped out after early boot.

Jason

