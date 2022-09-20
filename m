Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1423C5BF26F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:48:36 +0200 (CEST)
Received: from localhost ([::1]:54108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oanuk-0005gK-VD
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KZsR=ZX=zx2c4.com=Jason@kernel.org>)
 id 1oalew-0006Mr-Ko
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:24:06 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:34794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KZsR=ZX=zx2c4.com=Jason@kernel.org>)
 id 1oalet-0005ck-GL
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:24:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 39AF9B82D42
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 22:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D76C433C1
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 22:23:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ALMHhcQF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663712635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fKAMq0kWxsO9DW8nqSjsPb4mVKJF+DmLhqn/G9ZDKUg=;
 b=ALMHhcQFwmzsSIhi6+2Mw7Zc37FmnkJMg0QxWnHxarRcp1yVpZTkDKudd8hhPaqDXlzWcJ
 abjKxu/9TTwQLvCRz/yGXcL7VkziblzSWX0vYli9Z/TZtqK4SbTomY8UrmyTxDsMT1bkN+
 mdi32liae7tV3x66HTdEAgYC1/Dn1IY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9357d32e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 20 Sep 2022 22:23:55 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id h5so2217283vkc.5
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 15:23:54 -0700 (PDT)
X-Gm-Message-State: ACrzQf33LEaAOhaLI3TqOqD7Mh+n03RsN8aXsw5Uj+NfMDTZN2Sd7kC7
 aWCJ3b6MGMDQ6NOsSJOcCxvojZCur9HMuwfC7ZY=
X-Google-Smtp-Source: AMsMyM4X8xbRYkuqkyiDOVcpXwvkl04qvMny6kknpiQrjZRE/OBu5uF0f5ZegH6S/9wjxpvA6t0EX/IqU8Tpdx2iSV8=
X-Received: by 2002:a05:6122:91e:b0:3a2:e497:2484 with SMTP id
 j30-20020a056122091e00b003a2e4972484mr8739993vka.41.1663712634296; Tue, 20
 Sep 2022 15:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220919134126.75656-1-pbonzini@redhat.com>
 <CAHmME9rkethn5PHDkB8CupEBOYWFnzfA9c_YkmB_YMt64ci3pQ@mail.gmail.com>
 <Yyooji0KGTpZxzL1@zx2c4.com>
 <CABgObfZyb6t5iTMvXu+VfKx27dXDt1_RnPuL2tvK74evL0138Q@mail.gmail.com>
 <Yyo6l8hq7TzRDSBv@zx2c4.com>
 <CABgObfbgQyF14tvv7zr+N8VHJf7rgWvwZomcK0ed_D-aj0SCBg@mail.gmail.com>
In-Reply-To: <CABgObfbgQyF14tvv7zr+N8VHJf7rgWvwZomcK0ed_D-aj0SCBg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 21 Sep 2022 00:23:43 +0200
X-Gmail-Original-Message-ID: <CAHmME9oD8V4KWyqbXrQek+VBqfZHqtWPBEw7GRwEODq_w7w8rQ@mail.gmail.com>
Message-ID: <CAHmME9oD8V4KWyqbXrQek+VBqfZHqtWPBEw7GRwEODq_w7w8rQ@mail.gmail.com>
Subject: Re: [PATCH] qboot: update to latest submodule
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Hajnoczi, Stefan" <stefanha@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=KZsR=ZX=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
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

On Wed, Sep 21, 2022 at 12:22 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Yeah the mirroring from GitHub to (my personal fork on) Gitlab was failing because git:// is not supported anymore. Changed to https:// and everybody is happy.

Ahh, bingo.

> Btw I saw your other patches, will get to it tomorrow.

Super. Thanks, looking forward.

Jason

