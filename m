Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C5B4C4907
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 16:33:09 +0100 (CET)
Received: from localhost ([::1]:34132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNcae-0003oK-07
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 10:33:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNcWR-0001ij-AD
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:28:43 -0500
Received: from [2604:1380:4601:e00::1] (port=39368 helo=ams.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNcWO-0005wJ-W5
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:28:42 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 41779B83251;
 Fri, 25 Feb 2022 15:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77BC2C340F0;
 Fri, 25 Feb 2022 15:28:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="WRm6cOGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645802913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AGc3HtA6A4VpWTuoF56TukEqyXDHbzPy+Zb56qBmVE4=;
 b=WRm6cOGFOImn/aW/r2uMGAAnP99kIhA6KQkGrSddTUVxAkWVY9oezzK7F6YN6oeSPEX00v
 XVn/gXm/ZD0Khupal1wI4/zPDplhrs4umww7//LN2a9PB1DjWjGzF4rwRukBQLnbj5EMHE
 FRzEd8Ep4ZckCmimiThiqkYgmQENeqQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8a164ef4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Fri, 25 Feb 2022 15:28:32 +0000 (UTC)
Date: Fri, 25 Feb 2022 16:28:29 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Alexander Graf <graf@amazon.com>
Subject: Re: [PATCH v4] virt: vmgenid: introduce driver for reinitializing
 RNG on VM fork
Message-ID: <Yhj1nYHXmimPsqFd@zx2c4.com>
References: <CAHmME9pJ3wb=EbUErJrCRC=VYGhFZqj2ar_AkVPsUvAnqGtwwg@mail.gmail.com>
 <20220225124848.909093-1-Jason@zx2c4.com>
 <05c9f2a9-accb-e0de-aac7-b212adac7eb2@amazon.com>
 <YhjttNadaaJzVa5X@zx2c4.com>
 <b3b9dd9b-c42c-f057-f546-3e390b50479f@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b3b9dd9b-c42c-f057-f546-3e390b50479f@amazon.com>
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

Hi Alex,

On Fri, Feb 25, 2022 at 04:15:59PM +0100, Alexander Graf wrote:
> I'm not talking about a notification interface - we've gone through 
> great length on that one in the previous submission. What I'm more 
> interested in is *any* way for user space to read the current VM Gen ID. 
> The same way I'm interested to see other device attributes of my system 
> through sysfs.

Again, no. Same basic objection: we can do this later and design it
coherently with the rest. For example, maybe it's better to expose a
generation counter rather than 16 byte blob, and expect userspace to
call getrandom() subsequently to get something fresh. Or not! But maybe
it should be hashed with a fixed prefix string before being exposed to
userspace. Or not! I don't know, but that's not going to happen on this
patchset. There is no reason at all why that needs to be done here and
now. Trying to do too much at the same time is likely why the previous
efforts from your team stalled out last year. Propose something later,
in a new thread, and we can discuss then. One step at a time...

Jason

