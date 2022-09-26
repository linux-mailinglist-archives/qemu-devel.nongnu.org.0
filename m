Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CD95EA7BD
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:57:45 +0200 (CEST)
Received: from localhost ([::1]:53488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ococC-0001Ko-LR
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org>)
 id 1ocoKs-0003EM-Kw
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:39:50 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:56680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org>)
 id 1ocoKq-0005lW-PE
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:39:50 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 23494B8098E
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 13:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D117C433D7
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 13:39:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="KzHO/+GY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664199582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eo3SovfVfC5/AA32mhyaEkPhjX5tN2g5LIv7Sx4MKoc=;
 b=KzHO/+GYIUNSGGqIoJLEqtNDbbZzS93yohfqoRpF6uxETPXhvSronVIY9Q9Mx/hIPoWcTi
 x/fKkBfbwezWJVXYX1BakcJNWvEfToMT/4o0LNEViO2RMHTHS9LKe3HCPDCXpgjWJ05OLZ
 /PvMfr3l7ZtJW4bucQFBf4y5U8Ls0RA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fcbe0bd2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 13:39:42 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id q26so6560548vsr.7
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:39:41 -0700 (PDT)
X-Gm-Message-State: ACrzQf2EmPSLlm8OUFotpCAXzWs+cTdFEBsZXJ9iWxl9iGu3LEZ9jcbK
 lEkfKXgL8YscRXH7sLDSJypBrHetEnHUVPVHx6w=
X-Google-Smtp-Source: AMsMyM6R3XmB7xzmiYJP25WJpDI6o2akH1JKj+vC7udtiDtsW4U9TJXAiFF0PswE+fAkzubOvjdvK+1ekHbhUYLi9P8=
X-Received: by 2002:a67:d81e:0:b0:398:2c98:229b with SMTP id
 e30-20020a67d81e000000b003982c98229bmr8296605vsj.73.1664199581339; Mon, 26
 Sep 2022 06:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220922152847.3670513-1-Jason@zx2c4.com>
In-Reply-To: <20220922152847.3670513-1-Jason@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 26 Sep 2022 15:39:30 +0200
X-Gmail-Original-Message-ID: <CAHmME9oOSwx5hJBap-rbgxJrXZ7vfpPnzCymKfDt69RsNrBJyw@mail.gmail.com>
Message-ID: <CAHmME9oOSwx5hJBap-rbgxJrXZ7vfpPnzCymKfDt69RsNrBJyw@mail.gmail.com>
Subject: Re: [PATCH] x86: re-initialize RNG seed when selecting kernel
To: qemu-devel@nongnu.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org;
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

On Thu, Sep 22, 2022 at 5:28 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> We don't want it to be possible to re-read the RNG seed after ingesting
> it, because this ruins forward secrecy. Currently, however, the setup
> data section can just be re-read. Since the kernel is always read after
> the setup data, use the selection of the kernel as a trigger to
> re-initialize the RNG seed, just like we do on reboot, to preserve
> forward secrecy.
>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
> Paolo- this applies on top of the 4 you merged this morning. -Jason

Just bumping this, in hopes that this can go out with the same PULL
for the other 4 you merged last week.

Jason

