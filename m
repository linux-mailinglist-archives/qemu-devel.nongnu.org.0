Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6044C183A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 17:10:02 +0100 (CET)
Received: from localhost ([::1]:36198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMuDI-00062j-KX
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 11:10:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org>)
 id 1nMuBj-0005Kt-ND
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:08:23 -0500
Received: from [2604:1380:4641:c500::1] (port=52370 helo=dfw.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org>)
 id 1nMuBh-0004jV-84
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:08:23 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 89A1461926
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 16:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA846C340EB
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 16:08:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="fp8CajXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645632494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KIfU5+oFhsOwMYUUwLOIak3Q1ZR1ObTglPpSCZ1RML0=;
 b=fp8CajXhg/qqnzjg/+OKoKtXE7i8z7f2ykur7nX/GB/hD+f7/dV1RY9KKe4G1DxwKh6DK5
 cqo8wAQC1pRcZmVtHctFFglh0DpHTv+MLl3DOX6VZabKMGwj0jD3qeGhHbhyao9/VfbV8E
 JSbLF/0HVctMQO6V/BCKxqwnWMp9lRQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b1127d47
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 23 Feb 2022 16:08:14 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-2d625082ae2so216389387b3.1
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 08:08:14 -0800 (PST)
X-Gm-Message-State: AOAM5308ofmsqPNudUBuw0qtSv6kVPYBCqnRXKnANK7T9jf+dsPpti4M
 QX6r5SQCtlt9me5tEwRXNEDuE7BkodaQJEU6olw=
X-Google-Smtp-Source: ABdhPJy33A74qQdK52dpScB33s7jynPhLN4qjTE0dJTavDUA51Mn+CllONCLBg2IducogWoxWZTIJEkJ7l0DRx6DAd8=
X-Received: by 2002:a81:7d04:0:b0:2d0:d0e2:126f with SMTP id
 y4-20020a817d04000000b002d0d0e2126fmr288331ywc.485.1645632492376; Wed, 23 Feb
 2022 08:08:12 -0800 (PST)
MIME-Version: 1.0
References: <20220223131231.403386-1-Jason@zx2c4.com>
In-Reply-To: <20220223131231.403386-1-Jason@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 23 Feb 2022 17:08:01 +0100
X-Gmail-Original-Message-ID: <CAHmME9ogH_mx724n_deFfva7-xPCmma1-=2Mv0JdnZ-fC4JCjg@mail.gmail.com>
Message-ID: <CAHmME9ogH_mx724n_deFfva7-xPCmma1-=2Mv0JdnZ-fC4JCjg@mail.gmail.com>
Subject: Re: [PATCH RFC v1 0/2] VM fork detection for RNG
To: LKML <linux-kernel@vger.kernel.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 KVM list <kvm@vger.kernel.org>, linux-s390@vger.kernel.org, adrian@parity.io
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4641:c500::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Theodore Ts'o <tytso@mit.edu>, ehabkost@redhat.com, ben@skyportsystems.com,
 Jann Horn <jannh@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Weiss, Radu" <raduweis@amazon.com>,
 lersek@redhat.com, "Catangiu, Adrian Costin" <acatan@amazon.com>,
 graf@amazon.com, Igor Mammedov <imammedo@redhat.com>,
 Colm MacCarthaigh <colmmacc@amazon.com>, "Singh, Balbir" <sblbir@amazon.com>,
 "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 23, 2022 at 2:12 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> second patch is the reason this is just an RFC: it's a cleanup of the
> ACPI driver from last year, and I don't really have much experience
> writing, testing, debugging, or maintaining these types of drivers.
> Ideally this thread would yield somebody saying, "I see the intent of
> this; I'm happy to take over ownership of this part." That way, I can
> focus on the RNG part, and whoever steps up for the paravirt ACPI part
> can focus on that.

I actually managed to test this in QEMU, and it seems to work quite well. Steps:

$ qemu-system-x86_64 ... -device vmgenid,guid=auto -monitor stdio
(qemu) savevm blah
(qemu) quit
$ qemu-system-x86_64 ... -device vmgenid,guid=auto -monitor stdio
(qemu) loadvm blah

Doing this successfully triggers the function to reinitialize the RNG
with the new GUID. (It appears there's a bug in QEMU which prevents
the GUID from being reinitialized when running `loadvm` without
quitting first; I suppose this should be discussed with QEMU
upstream.)

So that's very positive. But I would appreciate hearing from some
ACPI/Virt/Amazon people about this.

Jason

