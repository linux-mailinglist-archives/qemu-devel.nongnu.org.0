Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260944C29E9
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 11:54:52 +0100 (CET)
Received: from localhost ([::1]:53000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNBlq-00041W-Ox
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 05:54:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7c/N=TH=zx2c4.com=Jason@kernel.org>)
 id 1nNBkO-0002ok-6s
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:53:20 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:37116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7c/N=TH=zx2c4.com=Jason@kernel.org>)
 id 1nNBkG-0006BL-Sf
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:53:19 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8A04EB82195;
 Thu, 24 Feb 2022 10:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9397C340E9;
 Thu, 24 Feb 2022 10:53:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="g1QXx2ES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645699986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJQbqpgTaOg8/vz4RU4R/Zyt33JoVSORCtRKA9BH80s=;
 b=g1QXx2ESzo2gs168k0660qWPcFbrYqN8feVSqkQM+KGMitKZDZZbiDmC+8lfNSWovzr9Rm
 a87Zi6YUrByAEeQUxMFRQj724QStsPZey8EwtZJaHYmWqO/8sbtywUWykhRwLrtfAFdt5a
 ksWR20+MaJYUa7bnYhHZoFIeZE1+AvA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1ff307f2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 24 Feb 2022 10:53:05 +0000 (UTC)
Date: Thu, 24 Feb 2022 11:53:02 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Alexander Graf <graf@amazon.com>
Subject: Re: [PATCH RFC v1 0/2] VM fork detection for RNG
Message-ID: <YhdjjgGgS7SBhSvu@zx2c4.com>
References: <20220223131231.403386-1-Jason@zx2c4.com>
 <234d7952-0379-e3d9-5e02-5eba171024a0@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <234d7952-0379-e3d9-5e02-5eba171024a0@amazon.com>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=7c/N=TH=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
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
Cc: linux-s390@vger.kernel.org, tytso@mit.edu, kvm@vger.kernel.org,
 adrian@parity.io, jannh@google.com, gregkh@linuxfoundation.org,
 raduweis@amazon.com, qemu-devel@nongnu.org, linux-kernel@vger.kernel.org,
 acatan@amazon.com, linux-crypto@vger.kernel.org, colmmacc@amazon.com,
 sblbir@amazon.com, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

Strangely your message never made it to me, and I had to pull this out
of Lore after seeing Daniel's reply to it. I wonder what's up.

On Thu, Feb 24, 2022 at 09:53:59AM +0100, Alexander Graf wrote:
> The main problem with VMGenID is that it is inherently racy. There will 
> always be a (short) amount of time where the ACPI notification is not 
> processed, but the VM could use its RNG to for example establish TLS 
> connections.
> 
> Hence we as the next step proposed a multi-stage quiesce/resume 
> mechanism where the system is aware that it is going into suspend - can 
> block network connections for example - and only returns to a fully 
> functional state after an unquiesce phase:
> 
>    https://github.com/systemd/systemd/issues/20222
> 
> Looking at the issue again, it seems like we completely missed to follow 
> up with a PR to implement that functionality :(.
> 
> What exact use case do you have in mind for the RNG/VMGenID update? Can 
> you think of situations where the race is not an actual concern?

No, I think the race is something that remains a problem for the
situations I care about. There are simpler ways of fixing that -- just
expose a single incrementing integer so that it can be checked every
time the RNG does something, without being expensive, via the same
mechanism -- and then you don't need any complexity. But anyway, that
doesn't exist right now, so this series tries to implement something for
what does exist and is already supported by multiple hypervisors. I'd
suggest sending a proposal for an improved mechanism as part of a
different thread, and pull the various parties into that, and we can
make something good for the future. I'm happy to implement whatever the
virtual hardware exposes.

Jason

