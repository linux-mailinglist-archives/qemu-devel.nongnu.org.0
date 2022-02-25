Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F064C47DB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 15:46:27 +0100 (CET)
Received: from localhost ([::1]:60474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNbrT-0004DN-29
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 09:46:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNbfT-0001CT-OS
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 09:34:01 -0500
Received: from [2604:1380:4601:e00::1] (port=46604 helo=ams.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNbfR-0001N8-MK
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 09:33:59 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 120BDB831F7;
 Fri, 25 Feb 2022 14:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251F1C340E7;
 Fri, 25 Feb 2022 14:33:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="GS3fWtqB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645799629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f7l+1znU0C3mGGUO232V1hcf63PeBIQ9HzasOLJsYSs=;
 b=GS3fWtqB1bIfgIGI51lS8j8ppgTmfWTnL/BLepHrXEWwGTqQkEnfaG0h2EEPE85kqfIYBc
 VEyZFu5mJGLEAB/T3OffmgHyhyZjZy5IC048I+OZLJ6gDvbCfB/dSktTa0JfsIgqEOxi7a
 P/XMxf5+izlbzRbSgUBu4cryEdBDZHk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ffcd5017
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Fri, 25 Feb 2022 14:33:49 +0000 (UTC)
Date: Fri, 25 Feb 2022 15:33:44 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Alexander Graf <graf@amazon.com>
Subject: Re: [PATCH v4] virt: vmgenid: introduce driver for reinitializing
 RNG on VM fork
Message-ID: <YhjoyIUv2+18BwiR@zx2c4.com>
References: <CAHmME9pJ3wb=EbUErJrCRC=VYGhFZqj2ar_AkVPsUvAnqGtwwg@mail.gmail.com>
 <20220225124848.909093-1-Jason@zx2c4.com>
 <05c9f2a9-accb-e0de-aac7-b212adac7eb2@amazon.com>
 <YhjjuMOeV7+T7thS@zx2c4.com>
 <88ebdc32-2e94-ef28-37ed-1c927c12af43@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <88ebdc32-2e94-ef28-37ed-1c927c12af43@amazon.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4601:e00::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
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
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, mst@redhat.com,
 raduweis@amazon.com, qemu-devel@nongnu.org, linux@dominikbrodowski.net,
 kys@microsoft.com, ardb@kernel.org, wei.liu@kernel.org, sthemmin@microsoft.com,
 ben@skyportsystems.com, decui@microsoft.com, ebiggers@kernel.org,
 lersek@redhat.com, ehabkost@redhat.com, adrian@parity.io, jannh@google.com,
 haiyangz@microsoft.com, tytso@mit.edu, colmmacc@amazon.com,
 berrange@redhat.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, imammedo@redhat.com, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 03:18:43PM +0100, Alexander Graf wrote:
> > I recall this part of the old thread. From what I understood, using
> > "VMGENID" + "QEMUVGID" worked /well enough/, even if that wasn't
> > technically in-spec. Ard noted that relying on _CID like that is
> > technically an ACPI spec notification. So we're between one spec and
> > another, basically, and doing "VMGENID" + "QEMUVGID" requires fewer
> > changes, as mentioned, appears to work fine in my testing.
> >
> > However, with that said, I think supporting this via "VM_Gen_Counter"
> > would be a better eventual thing to do, but will require acks and
> > changes from the ACPI maintainers. Do you think you could prepare your
> > patch proposal above as something on-top of my tree [1]? And if you can
> > convince the ACPI maintainers that that's okay, then I'll happily take
> > the patch.
> 
> 
> Sure, let me send the ACPI patch stand alone. No need to include the 
> VMGenID change in there.

That's fine. If the ACPI people take it for 5.18, then we can count on
it being there and adjust the vmgenid driver accordingly also for 5.18.

I just booted up a Windows VM, and it looks like Hyper-V uses
"Hyper_V_Gen_Counter_V1", which is also quite long, so we can't really
HID match on that either.

Jason

