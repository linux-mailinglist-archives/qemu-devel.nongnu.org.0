Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094CC5BFA46
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 11:10:49 +0200 (CEST)
Received: from localhost ([::1]:60772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oavkm-0005Eq-1z
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 05:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org>)
 id 1oaveo-0000vx-3i
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 05:04:45 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:39494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org>)
 id 1oavem-0004jS-2n
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 05:04:37 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 68C50624A6
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 09:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1400DC433C1
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 09:04:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="GK+ifsDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663751070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/g6EIdEkiEtEr4r5jQ7SpZXwBE9ISBIl78okd9VrLxQ=;
 b=GK+ifsDhHDkWGGYGF9RwESFKN5yr1xUH3x1qLSGwKPc7kQiG4T5WJrtQIIdNXiChSaNHjy
 Sq+biowgM/3G0dsfeR3d7GuId43oi60a51EA+6RE/IW7LI7bfkJIRLRZWWDFbzrNp5zugn
 G1E8/ummG8OpOc4Bu79kp9KaAceyiG8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bd73f6c8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 21 Sep 2022 09:04:30 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id m65so5984946vsc.1
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 02:04:29 -0700 (PDT)
X-Gm-Message-State: ACrzQf1pTob9cqI+Ee+1S8KTDlj4OPSo7eSd7IVPmowYyvTQKXlRvrdf
 tX+DQg3mmT0muIDpTPLpi96QNqRqzmS5ODM/d7k=
X-Google-Smtp-Source: AMsMyM7mHLm77AaK5qFS4GoX2QpQmBbL4MpXDOFOfXrl9C7rt4oVPNH6Dz0AxaZV8CzsuZpayDRLrLPh8HUpmQSX3tg=
X-Received: by 2002:a05:6102:2908:b0:398:ac40:d352 with SMTP id
 cz8-20020a056102290800b00398ac40d352mr8578807vsb.55.1663751068356; Wed, 21
 Sep 2022 02:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220913234135.255426-1-Jason@zx2c4.com>
 <CABgObfbUEPGshiy4_658E2_sNNGFJYnJq34Qvx9G60OAvHm0Bg@mail.gmail.com>
In-Reply-To: <CABgObfbUEPGshiy4_658E2_sNNGFJYnJq34Qvx9G60OAvHm0Bg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 21 Sep 2022 11:04:17 +0200
X-Gmail-Original-Message-ID: <CAHmME9qv=fXCu81fLhnRN4V07hSeuMP2L-9mLPHuNkGWjqD6jw@mail.gmail.com>
Message-ID: <CAHmME9qv=fXCu81fLhnRN4V07hSeuMP2L-9mLPHuNkGWjqD6jw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] x86: return modified setup_data only if read as
 memory, not as file
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Paolo,

On Wed, Sep 21, 2022 at 10:59 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Just a small comment, addr should be little-endian (see
> fw_cfg_add_i32).  It's not used outside x86_load_linux, so it is
> possible to just use cpu_to_le32 there.

Oh, shucks: I thought about this and then forgot to do it. Thanks for
catching it.

> Also I think it's cleaner if a reset callback puts the value back to
> zero. fw_cfg already has fw_cfg_machine_reset, so perhaps the easiest
> way is to add a FWCfgCallback reset_cb argument to just
> fw_cfg_add_bytes_callback. If I am missing something and it's not
> necessary I can do the cpu_to_le32 change myself or wait for you; in
> any case I'll wait for either your ack or a v5.

Actually, the idea is for the change to be permanent, since that
represents how the system has actually been booted. Are there
substantial changes possible to the firmware configuration on
fw_cfg_machine_reset() that setting this back how it was would make a
difference? Or do we benefit from having some consistency?

> By the way, does this supersede v1..v3 that use the new protocol (I'd
> guess so from the presence of the same 2/2 patch), or are the two
> patches doing belts-and-suspenders?

This v4 supersedes everything else.

Jason

