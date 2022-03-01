Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1264C928C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 19:06:01 +0100 (CET)
Received: from localhost ([::1]:43962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP6sp-0006ee-PQ
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 13:05:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1nP6oR-0003lH-Vr
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:01:28 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:35456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1nP6oN-0008Cc-JN
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:01:26 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5ECFA61384;
 Tue,  1 Mar 2022 18:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548CEC340EE;
 Tue,  1 Mar 2022 18:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646157679;
 bh=BlXx4FNNlsIl9zw8EoTTYqALDbRkuyGZS0mdHI4RoMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iEFkSTkWwXpMp7vsR4QZ/EJ3Oib4ZpUNZYzzsAzhylm2ksEYMVzN2682Dqakg9wuh
 5oD7D1L1KC35go81Ztkp8huNYQkMEDQlk348/XbQ5/vNFcVbnbq0T6c5zi6A5K0B/i
 F5W/Q68bc/YoS97YzoNhuopdow5scGqyEfK7IKq0=
Date: Tue, 1 Mar 2022 19:01:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <Yh5fbe71BTT6xc8h@kroah.com>
References: <Yh4+9+UpanJWAIyZ@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yh4+9+UpanJWAIyZ@zx2c4.com>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=gregkh@linuxfoundation.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: len.brown@intel.com, linux-hyperv@vger.kernel.org, colmmacc@amazon.com,
 berrange@redhat.com, adrian@parity.io, kvm@vger.kernel.org, jannh@google.com,
 linux-pm@vger.kernel.org, mst@redhat.com, linux-kernel@vger.kernel.org,
 linux@dominikbrodowski.net, qemu-devel@nongnu.org, graf@amazon.com,
 linux-crypto@vger.kernel.org, pavel@ucw.cz, rafael@kernel.org, tytso@mit.edu,
 mikelley@microsoft.com, lersek@redhat.com, arnd@arndb.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 04:42:47PM +0100, Jason A. Donenfeld wrote:
> The easy way, and the way that I think I prefer, would be to just have a
> sync notifier_block for this, just like we have with
> register_pm_notifier(). From my perspective, it'd be simplest to just
> piggy back on the already existing PM notifier with an extra event,
> PM_POST_VMFORK, which would join the existing set of 7, following
> PM_POST_RESTORE. I think that'd be coherent. However, if the PM people
> don't want to play ball, we could always come up with our own
> notifier_block. But I don't see the need. Plus, WireGuard *already*
> uses the PM notifier for clearing keys, so code-wise for my use case,
> that'd amount adding another case for PM_POST_VMFORK, in addition to the
> currently existing PM_HIBERNATION_PREPARE and PM_SUSPEND_PREPARE cases,
> which all would be treated the same way. Ezpz. So if that sounds like an
> interesting thing to the PM people, I think I'd like to propose a patch
> for that, possibly even for 5.18, given that it'd be very straight-
> forward.

A notifier block like this makes sense, but why tie onto the PM_ stuff?
This isn't power management issues, it's a system-wide change that I am
sure others will want to know about that doesn't reflect any power
changes.

As much as I hate adding new notifiers in the kernel, that might be all
you need here.

thanks,

greg k-h

