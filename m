Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B60581D58
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 03:52:02 +0200 (CEST)
Received: from localhost ([::1]:36978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGWDR-0002bw-7L
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 21:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Hqxn=YA=zx2c4.com=Jason@kernel.org>)
 id 1oGWBC-0000kd-5o
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 21:49:42 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:40140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Hqxn=YA=zx2c4.com=Jason@kernel.org>)
 id 1oGWBA-0003rq-Fz
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 21:49:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 280A661743
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 01:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89946C433C1
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 01:49:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="p0JQoKpk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658886575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3rNOEa8epWjMKNh7hCU8Ta+MBc7t8Xz726GbacEMXy8=;
 b=p0JQoKpkFRSPk2PTfXxX/V9LoDDA9o7aWaHcLuY7/8sfLxVU2kKphz/dhQyjJ21WK57RPM
 lPEDjuwiLeBotn9/bxezX+3LoFEr/DTSChAsoZbLnW++9d/HS7w8SHk3KwzDIt/WuwjBU0
 ddegL9evOJAqNhqc19EsVniNefrQTgI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 28dc3641
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 27 Jul 2022 01:49:34 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-31f56c42ab5so24430037b3.10
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 18:49:34 -0700 (PDT)
X-Gm-Message-State: AJIora9uMLNKPLr+0kqFdPoNzkg6bX9GFk6dTF1ew+qWnJoLwO0RBS4G
 ZpGpMHlnI3qh7kaDlWQHApj1EHS3sHjqsdYW20M=
X-Google-Smtp-Source: AGRyM1vK7vB9nOHO47E9eus3t9qu/mHnTJZsayLa9L02/urlVKQdZCnoT4mlt7RqCXP6EmJKikrnCA8MixbHCFSvnLY=
X-Received: by 2002:a0d:d597:0:b0:31f:5858:9050 with SMTP id
 x145-20020a0dd597000000b0031f58589050mr3184968ywd.341.1658886573873; Tue, 26
 Jul 2022 18:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220719122334.136290-1-Jason@zx2c4.com>
 <CAJy5ezq7_F6uDrY6RuXe5ru0mAbmx-pBTQoFCtZj4DhEM7EZpw@mail.gmail.com>
 <CAHmME9opYzwtK4oJo1bZo+9FDbXt6TfgybtFTfQpxqx6pOoGWA@mail.gmail.com>
 <CAJy5ezp-x2R=4yg=S6Tq2U67N8J2mkXNJ=wkv1oqB3r37hiunQ@mail.gmail.com>
In-Reply-To: <CAJy5ezp-x2R=4yg=S6Tq2U67N8J2mkXNJ=wkv1oqB3r37hiunQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 27 Jul 2022 03:49:23 +0200
X-Gmail-Original-Message-ID: <CAHmME9r1L5PV8GB4HL+7QW7LRmy1fEh54A57M3aQ+0K_OwLPdQ@mail.gmail.com>
Message-ID: <CAHmME9r1L5PV8GB4HL+7QW7LRmy1fEh54A57M3aQ+0K_OwLPdQ@mail.gmail.com>
Subject: Re: [PATCH] hw/microblaze: pass random seed to fdt
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=Hqxn=YA=zx2c4.com=Jason@kernel.org;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Edgar,

On Thu, Jul 21, 2022 at 8:43 PM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> Ah OK, Paolo, it would be great if you would take this via your tree!

It looks like Paolo never did this. So you might want to queue this
somewhere, or bug him to take it, or something. I don't know how this
works with 7.1-rc0 just being tagged, but I assume this means this has
to wait until 7.2

Jason

