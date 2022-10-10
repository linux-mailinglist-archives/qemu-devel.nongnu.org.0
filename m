Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FA15FA14B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:41:48 +0200 (CEST)
Received: from localhost ([::1]:49046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohuuZ-0000nN-4t
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YJjh=2L=zx2c4.com=Jason@kernel.org>)
 id 1ohuap-0008KQ-0V
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:21:24 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:53228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YJjh=2L=zx2c4.com=Jason@kernel.org>)
 id 1ohual-0005TE-VQ
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:21:22 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3DA5AB80EBC;
 Mon, 10 Oct 2022 15:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B9FC433D6;
 Mon, 10 Oct 2022 15:20:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="jt2mtkzt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665415256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kua4opZrku/1xRIUbmYfxIQEm9HVfi+Ijw/Lx5Cq9X0=;
 b=jt2mtkzt6A/sig7bU3QjKsuA+H1grP1czXJl/wveCpVUO4tolrvc55sphV66tyIRsKD8++
 Wf5H+Qbl+wdpLI5M4HFRFkppSTqNCX+EwjJhpLrqc6T3D/flzWVF4d4EaxQbpckH9hkIpp
 kZcAnb71gw42rlBD2GtMWT9zy6fVvB4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1bf1dfb5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 10 Oct 2022 15:20:56 +0000 (UTC)
Date: Mon, 10 Oct 2022 09:20:54 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 1/6] device-tree: add re-randomization helper function
Message-ID: <Y0Q4Vugq+d0vaF97@zx2c4.com>
References: <20220929232339.372813-1-Jason@zx2c4.com>
 <CAFEAcA-Ac-=i_DK5MUtKtTqH7OpyzHAi6u=tHFAFZyvdr1KP8A@mail.gmail.com>
 <CAFEAcA-fOdNeDz9_Hbm7R3_3o2T4Zw8wPrgOtVLK9tUNMciZow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-fOdNeDz9_Hbm7R3_3o2T4Zw8wPrgOtVLK9tUNMciZow@mail.gmail.com>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=YJjh=2L=zx2c4.com=Jason@kernel.org;
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

On Mon, Oct 10, 2022 at 11:54:50AM +0100, Peter Maydell wrote:
> The error is essentially the record-and-replay subsystem saying "the
> replay just asked for a random number at point when the recording
> did not ask for one, and so there's no 'this is what the number was'
> info in the record".
> 
> I have had a quick look, and I think the reason for this is that
> load_snapshot() ("reset the VM state to the snapshot state stored in the
> disk image or migration stream") does a system reset. The replay
> process involves a lot of "load state from a snapshot and play
> forwards from there" operations. It doesn't expect that load_snapshot()
> would result in something reading random data, but now that we are
> calling qemu_guest_getrandom() in a reset hook, that happens.

Hmm... so this seems like a bug in the replay code then? Shouldn't that
reset handler get hit during both passes, so the entry should be in
each?

Jason

