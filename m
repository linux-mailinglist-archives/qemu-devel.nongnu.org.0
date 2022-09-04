Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E95A5AC585
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 18:56:31 +0200 (CEST)
Received: from localhost ([::1]:45546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUsv8-0008JZ-Qf
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 12:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=xLks=ZH=zx2c4.com=Jason@kernel.org>)
 id 1oUstR-0006vj-3e
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 12:54:45 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:47252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=xLks=ZH=zx2c4.com=Jason@kernel.org>)
 id 1oUstI-0007zz-Tc
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 12:54:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D5DD60F77
 for <qemu-devel@nongnu.org>; Sun,  4 Sep 2022 16:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD30C433C1
 for <qemu-devel@nongnu.org>; Sun,  4 Sep 2022 16:54:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="I9y4uK+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1662310471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ws8Z1VmXbHunulUHSaFqloSOA+nUsYFXRGCqsfZJKyQ=;
 b=I9y4uK+RU6y3MrDyiMeNCohPD7TN+maWUgLKPKIUITX3KzJqW/Qn7lYrGIdF91/Xo126+e
 A/uhyez7C6mnHkX3647zVhaOe94XMPGREdARJNCAwToPsPNI0cPW8tM8SfBj8srdA2vqNO
 PjUD5T+aVsUKiivmNU+Psf3qMyvNATc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a9635c0b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Sun, 4 Sep 2022 16:54:31 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-344fc86d87cso39031257b3.3
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 09:54:30 -0700 (PDT)
X-Gm-Message-State: ACgBeo2B61gqg1bZ0UdMBcAlFlxN7hHgEB86O2D7Vqkebqzd4CBCihsO
 kRL0qtN09ptpZi4v9+PVD5SCMr+i8flRNAlTCVk=
X-Google-Smtp-Source: AA6agR6VAw7/dMFSmcjmup8ALjkyVWK6zPMghaud3cJARPQZEsu6wLaURVbYdaP1QfOqACB5+sqa9cYRS0BBiLDE++w=
X-Received: by 2002:a81:6ccc:0:b0:345:40da:7e06 with SMTP id
 h195-20020a816ccc000000b0034540da7e06mr933158ywc.414.1662310470119; Sun, 04
 Sep 2022 09:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220904165058.1140503-1-Jason@zx2c4.com>
In-Reply-To: <20220904165058.1140503-1-Jason@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 4 Sep 2022 18:54:18 +0200
X-Gmail-Original-Message-ID: <CAHmME9r8BWahnEXd3J0evEs3NkGAOpSBbK+GB3MFzR_3tz9ZKQ@mail.gmail.com>
Message-ID: <CAHmME9r8BWahnEXd3J0evEs3NkGAOpSBbK+GB3MFzR_3tz9ZKQ@mail.gmail.com>
Subject: Re: [PATCH] x86: only modify setup_data if the boot protocol
 indicates safety
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=xLks=ZH=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SCC_BODY_URI_ONLY=1.93, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

FYI, this patch depends on this one in the kernel:
https://lore.kernel.org/linux-efi/20220904165321.1140894-1-Jason@zx2c4.com/

