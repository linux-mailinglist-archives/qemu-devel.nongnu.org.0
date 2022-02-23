Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE8C4C1451
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 14:39:08 +0100 (CET)
Received: from localhost ([::1]:36356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMrrG-0003xQ-QE
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 08:39:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org>)
 id 1nMraT-0003gp-HT
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 08:21:45 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:44928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org>)
 id 1nMraR-0007Cy-Ix
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 08:21:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2EE556154E
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 13:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7414C340F6
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 13:21:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="B1edNqIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645622496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jNCqwRVwwnl2Hzkwee6ETCjLUlSGOZ/h+OLPPjOrc0Y=;
 b=B1edNqIi5b5HctHZNPAaowU88lVryawcFNGYjSp85vHovokqADjt+gCUWQtoL8L26HfDe3
 nl8aJAMIZYBIy8qi3ZYXwTdRr82nWHV60r4P2Uyim3JETbtJFhkxCHI+ueWTYKGJ0iBXol
 RuYemuRnCCuF1yTAFE6Dp8d6Oaed8fM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 243735bb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 23 Feb 2022 13:21:35 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id g6so26567128ybe.12
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 05:21:34 -0800 (PST)
X-Gm-Message-State: AOAM531JBxl8MdBFK0mgbtLeg4xwMLAL4fs6nGviU3GukaDb1G7bSlPF
 qQB2ku446n9YSyEN++yUbFdL2ZB9r+jx7ezyymU=
X-Google-Smtp-Source: ABdhPJyPz4I/fVrE2hAwlxEjASOoJgctbxsl4Sw1b3At1gDlRAwGMq/v/jtx+mRgcRGA5d7YgSWANySbbRg9ZZzPO00=
X-Received: by 2002:a05:6902:693:b0:613:7f4f:2e63 with SMTP id
 i19-20020a056902069300b006137f4f2e63mr26519604ybt.271.1645622492226; Wed, 23
 Feb 2022 05:21:32 -0800 (PST)
MIME-Version: 1.0
References: <1614156452-17311-1-git-send-email-acatan@amazon.com>
 <1614156452-17311-3-git-send-email-acatan@amazon.com>
 <CAHmME9o6cjZT1Cj1g5w5WQE83YxJNqB7eUCWn74FA9Pbb3Y6nQ@mail.gmail.com>
 <CAHmME9poYgfoniexZ2dvpEEvnWGLQTOjOvB2bck-Whhy9h+Hjw@mail.gmail.com>
In-Reply-To: <CAHmME9poYgfoniexZ2dvpEEvnWGLQTOjOvB2bck-Whhy9h+Hjw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 23 Feb 2022 14:21:21 +0100
X-Gmail-Original-Message-ID: <CAHmME9pFZKtBP7R8St03544nHc=7ztFsK1q9fKPGKXZgjHckVw@mail.gmail.com>
Message-ID: <CAHmME9pFZKtBP7R8St03544nHc=7ztFsK1q9fKPGKXZgjHckVw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] drivers/virt: vmgenid: add vm generation id driver
To: adrian@parity.io
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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
Cc: areber@redhat.com, KVM list <kvm@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, ghammer@redhat.com,
 vijaysun@ca.ibm.com, 0x7f454c46@gmail.com,
 QEMU Developers <qemu-devel@nongnu.org>, Michal Hocko <mhocko@kernel.org>,
 dgunigun@redhat.com, avagin@gmail.com, Pavel Machek <pavel@ucw.cz>,
 ptikhomirov@virtuozzo.com, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Biggers <ebiggers@kernel.org>,
 borntraeger@de.ibm.com, "Singh, Balbir" <sblbir@amazon.com>, bonzini@gnu.org,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, "Weiss,
 Radu" <raduweis@amazon.com>, asmehra@redhat.com,
 Adrian Catangiu <acatan@amazon.com>, graf@amazon.com,
 Mike Rapoport <rppt@kernel.org>, Andrew Lutomirski <luto@kernel.org>,
 gil@azul.com, oridgar@gmail.com, Colm MacCarthaigh <colmmacc@amazon.com>,
 Theodore Ts'o <tytso@mit.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, ovzxemul@gmail.com,
 "Rafael J. Wysocki" <rafael@kernel.org>, Willy Tarreau <w@1wt.eu>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 22, 2022 at 11:17 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Well I cleaned up this v7 and refactored it into something along the
> lines of what I'm thinking. I don't yet know enough about this general
> problem space to propose the patch and I haven't tested it either

A little further along, there's now this series:
https://lore.kernel.org/lkml/20220223131231.403386-1-Jason@zx2c4.com/T/
We can resume discussion there.

Jason

