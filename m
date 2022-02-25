Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22F14C49BA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 16:54:48 +0100 (CET)
Received: from localhost ([::1]:40360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNcvg-0002jm-3R
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 10:54:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNcnB-0001zK-Kf
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:46:01 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:46788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNcn9-0006aW-Pt
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:46:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D56661977;
 Fri, 25 Feb 2022 15:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815F5C340E7;
 Fri, 25 Feb 2022 15:45:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="DbUu57ez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645803954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aXuTEAnaE0aPUjDR2q7+fL3WYM8X+IEQPCKcmMJb3HY=;
 b=DbUu57ezzxPejz+zfBx1TQmqkahBb9aDLTCQTad2Lww+7tJ0meOvgVrM21yxrInKocw3wZ
 +5YznIsBNOd+8/9KWpwTpoOt+Jd8q5buE2GzqjEicIF52FB0TmtxdmuWqJVmEIwrjB/acl
 zAALZjfU+gvOO4jXeIuJ1BAFSjLODjA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c5031fcd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Fri, 25 Feb 2022 15:45:54 +0000 (UTC)
Date: Fri, 25 Feb 2022 16:45:50 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Alexander Graf <graf@amazon.com>
Subject: Re: [PATCH v4] virt: vmgenid: introduce driver for reinitializing
 RNG on VM fork
Message-ID: <Yhj5rg2Cgv+qRcjc@zx2c4.com>
References: <CAHmME9pJ3wb=EbUErJrCRC=VYGhFZqj2ar_AkVPsUvAnqGtwwg@mail.gmail.com>
 <20220225124848.909093-1-Jason@zx2c4.com>
 <05c9f2a9-accb-e0de-aac7-b212adac7eb2@amazon.com>
 <YhjjuMOeV7+T7thS@zx2c4.com>
 <88ebdc32-2e94-ef28-37ed-1c927c12af43@amazon.com>
 <YhjoyIUv2+18BwiR@zx2c4.com>
 <9ac68552-c1fc-22c8-13e6-4f344f85a4fb@amazon.com>
 <CAMj1kXEue6cDCSG0N7WGTVF=JYZx3jwE7EK4tCdhO-HzMtWwVw@mail.gmail.com>
 <Yhj288aE5rW15Qpj@zx2c4.com>
 <b6c5c4d4-88a5-1ac5-a4d4-2f6895065834@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b6c5c4d4-88a5-1ac5-a4d4-2f6895065834@amazon.com>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org;
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
Cc: linux-hyperv@vger.kernel.org, KVM list <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Weiss, Radu" <raduweis@amazon.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 KY Srinivasan <kys@microsoft.com>, Ard Biesheuvel <ardb@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 ben@skyportsystems.com, Dexuan Cui <decui@microsoft.com>,
 Eric Biggers <ebiggers@kernel.org>, Laszlo Ersek <lersek@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, adrian@parity.io,
 Jann Horn <jannh@google.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Colm MacCarthaigh <colmmacc@amazon.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On Fri, Feb 25, 2022 at 04:37:43PM +0100, Alexander Graf wrote:
> I believe "VMGENID" was for the firecracker prototype that Adrian built 
> back then, yeah. Matching on _HID for this is a rat hole unfortunately, 
> so let's see what the ACPI patch gets us :).

Thanks. I'll add a comment to the code about Firecracker. And indeed
hopefully that'll all go away anyway.

Jason

