Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F0C68F261
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 16:52:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPmjp-0004OJ-SO; Wed, 08 Feb 2023 10:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org>)
 id 1pPmjn-0004Nu-ES
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:51:59 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org>)
 id 1pPmjl-0008E7-TG
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:51:59 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7FCC3615D4
 for <qemu-devel@nongnu.org>; Wed,  8 Feb 2023 15:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9107C433EF
 for <qemu-devel@nongnu.org>; Wed,  8 Feb 2023 15:51:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FWOm93dn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675871512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xpJkAlGTWwU7vg3MrdW2uEBFGxLlNnedSzvqWjAYqO8=;
 b=FWOm93dnLr+eppuHC3rP0cU944wNPamDwaCfRZ3mb/tLKjIAqHtaV08463y0pqlKMLgyIw
 wUaonuhAZhrmSL9idceXf9pKL449S92n538TeaBYPtfYA7PcUI0DpR/eb3YXpVDJYgdo8U
 QkcXVdfe9WIX7DHuhWxVRrozKUEhY0o=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id aefa004f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 8 Feb 2023 15:51:52 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id u7so345420ybk.0
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 07:51:51 -0800 (PST)
X-Gm-Message-State: AO0yUKUkEsuoexfz55lVWsfc3tONpqcYgqOuEpAAdxxUyiLDg1TDIsXG
 sp+z08Ds4QSLakOphBW2ayGYvyB/XiuAwq1oG/4=
X-Google-Smtp-Source: AK7set/Wc/HaffiGfpfT5oBbOnPU6YFQ0AFpUztFLyZGtLRU/wHGqbu829g63+64gaG4ONAwOj1XTecpI4ayarhakYU=
X-Received: by 2002:a25:9f90:0:b0:87b:121:93d8 with SMTP id
 u16-20020a259f90000000b0087b012193d8mr698764ybq.231.1675871511129; Wed, 08
 Feb 2023 07:51:51 -0800 (PST)
MIME-Version: 1.0
References: <20230207084116.285787-1-dovmurik@linux.ibm.com>
 <20230207164117-mutt-send-email-mst@kernel.org>
 <23f28bd4-7adb-3bb1-7148-7dfbb57871d5@amd.com>
 <CAHmME9rrqRY0gOVBav4LjMypmu6uicx3vD9kozApyFoytNg84Q@mail.gmail.com>
 <5ac2a4bc-a7a3-49ca-67c7-96df7e152dd7@amd.com>
 <7c4e3018-2f0f-1fd8-45b2-6d72221e9452@linux.ibm.com>
In-Reply-To: <7c4e3018-2f0f-1fd8-45b2-6d72221e9452@linux.ibm.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 8 Feb 2023 12:51:40 -0300
X-Gmail-Original-Message-ID: <CAHmME9pB4+W3j0www8NgdHUnJK0D8GeOufc-hbMHC26vrguO9Q@mail.gmail.com>
Message-ID: <CAHmME9pB4+W3j0www8NgdHUnJK0D8GeOufc-hbMHC26vrguO9Q@mail.gmail.com>
Subject: Re: [PATCH] x86: Don't add RNG seed to Linux cmdline for SEV guests
To: Dov Murik <dovmurik@linux.ibm.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 James Bottomley <jejb@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 8, 2023 at 12:49 PM Dov Murik <dovmurik@linux.ibm.com> wrote:
> Even if the DTB itself doesn't change and the Guest Owner could somehow add
> it to the expected cmdline to calculate the hash, the current implementation
> adds both the SetupData entry and the dtb itself to the cmdline.  The SetupData
> entry contains pointers which may be harder to predict (even though currently
> I assume that .next=0 and the rest are known, so it should be possible (but ugly)).

No, setup_data isn't even hooked up under SEV. That part is skipped already.

