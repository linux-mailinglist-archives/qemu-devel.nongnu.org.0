Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCBB5EEA0A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 01:16:07 +0200 (CEST)
Received: from localhost ([::1]:37414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odgHe-0005Zz-5F
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 19:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=E/AC=Z7=zx2c4.com=Jason@kernel.org>)
 id 1odgFp-00044V-8e
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 19:14:13 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:46616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=E/AC=Z7=zx2c4.com=Jason@kernel.org>)
 id 1odgFn-00083I-3r
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 19:14:13 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DF571B820F5;
 Wed, 28 Sep 2022 23:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0D6C433C1;
 Wed, 28 Sep 2022 23:13:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="JBtQtJkA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664406835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/cyttnX7IBB13ofxELqP1H+N0vDWsSp9Fd54rR0iDQ=;
 b=JBtQtJkAnTPelRTf2vqyjQIGYw4O/COcB2HFL6p/nNLwm/nKbmW3EnW04YzAzqjd2miXZ5
 0DZzRJw5Q904zG5uvy+8TywwekQuw451uieYGkJgckp3EQOsZxS2bYhVDXj7uUAmbdk/dA
 ffaq+oYVB0Xt9wDZi4Mf/oYw+mkKXCg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ce47030d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 28 Sep 2022 23:13:54 +0000 (UTC)
Date: Thu, 29 Sep 2022 01:13:52 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: linux-m68k@lists.linux-m68k.org, qemu-devel@nongnu.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH qemu v2 2/2] m68k: align bootinfo strings and data to 4
 bytes
Message-ID: <YzTVMCTGV9IvcJ0O@zx2c4.com>
References: <20220926113900.1256630-1-Jason@zx2c4.com>
 <20220926113900.1256630-2-Jason@zx2c4.com>
 <ad4c5a70-6226-6be3-0049-65880170d8af@vivier.eu>
 <CAHmME9r7sjUVOiQDp7WuzFe7Xss1riZBLg=wQeZ5uvWjONoO6Q@mail.gmail.com>
 <5ebf4a4a-031b-0706-d199-d116cd518226@vivier.eu>
 <CAHmME9qFuKwUKvqOZZMuy8v+SLBh1Dt5+5xRM=+v6ynGktbj8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9qFuKwUKvqOZZMuy8v+SLBh1Dt5+5xRM=+v6ynGktbj8g@mail.gmail.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=E/AC=Z7=zx2c4.com=Jason@kernel.org;
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

On Mon, Sep 26, 2022 at 11:42:37PM +0200, Jason A. Donenfeld wrote:
> On Mon, Sep 26, 2022 at 11:42 PM Laurent Vivier <laurent@vivier.eu> wrote:
> >
> > Le 26/09/2022 à 23:40, Jason A. Donenfeld a écrit :
> > > On Mon, Sep 26, 2022 at 11:37 PM Laurent Vivier <laurent@vivier.eu> wrote:
> > >>
> > >> Le 26/09/2022 à 13:39, Jason A. Donenfeld a écrit :
> > >>> Various tools, such as kexec-tools and m68k-bootinfo, expect each
> > >>> bootinfo entry to be aligned to 4 bytes, not 2 bytes. So adjust the
> > >>> padding to fill this out as such.
> > >>>
> > >>> Also, break apart the padding additions from the other field length
> > >>> additions, so that it's more clear why these magic numbers are being
> > >>> added, and comment them too.
> > >>>
> > >>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > >>> Cc: Laurent Vivier <laurent@vivier.eu>
> > >>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > >>> ---
> > >>>    hw/m68k/bootinfo.h | 10 ++++++----
> > >>>    1 file changed, 6 insertions(+), 4 deletions(-)
> > >>>
> > >>
> > >> Applied to my m68k-for-7.2 branch
> > >
> > > What about 1/2?
> > >
> >
> > I'd like to wait a little to see what happens on the linux side.
> 
> Alright, makes sense. Just please don't forget about it.

Okay, all set. Uneventful.
https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/commit/?id=f1bb20c8be1929743fdb313b4770601afc39c1b7

Jason


