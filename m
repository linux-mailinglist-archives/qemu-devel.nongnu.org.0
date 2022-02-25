Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34B74C4941
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 16:38:53 +0100 (CET)
Received: from localhost ([::1]:44152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNcgG-0002et-Vd
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 10:38:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNceT-0000g8-NI
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:37:01 -0500
Received: from [2604:1380:4601:e00::1] (port=43000 helo=ams.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNceR-0007Pp-5Y
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:37:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 455B9B8324A;
 Fri, 25 Feb 2022 15:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674ECC340E7;
 Fri, 25 Feb 2022 15:36:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="GI8DmJn5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645803410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iwp10sT7peKmlW9+/6iPiAzMvnsfb0aFjjMWYlFu/qY=;
 b=GI8DmJn5Hxh7L7PT1bruHnDbI+diCBzWolvVWhiHRhm9kvqyhDSEUyZBWH3DcI7YaqP/Xi
 q5vllj7ypWF2vqNN2CPJcmOw3jJ7ERFKYffFupSgURYWDWHVdyxSbFkJpCCTlMUwXPNz6j
 YfGs236u28Z04UbkO7Hl0QC8Y0EWsN8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a5decf67
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Fri, 25 Feb 2022 15:36:49 +0000 (UTC)
Date: Fri, 25 Feb 2022 16:36:42 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Alexander Graf <graf@amazon.com>
Subject: Re: [PATCH v4] virt: vmgenid: introduce driver for reinitializing
 RNG on VM fork
Message-ID: <Yhj3iqBxxzDeFhyd@zx2c4.com>
References: <CAHmME9pJ3wb=EbUErJrCRC=VYGhFZqj2ar_AkVPsUvAnqGtwwg@mail.gmail.com>
 <20220225124848.909093-1-Jason@zx2c4.com>
 <05c9f2a9-accb-e0de-aac7-b212adac7eb2@amazon.com>
 <YhjphtYyXoYZ9lXY@kroah.com>
 <0b8a2c25-df48-143d-7fac-dc9b4ef68d3c@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0b8a2c25-df48-143d-7fac-dc9b4ef68d3c@amazon.com>
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
 berrange@redhat.com, Greg KH <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 imammedo@redhat.com, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi again,

On Fri, Feb 25, 2022 at 04:31:02PM +0100, Alexander Graf wrote:
> >> Please expose the vmgenid via /sysfs so that user space even remotely has a
> >> chance to check if it's been cloned.
> > Export it how?  And why, who would care?
> You can just

As mentioned in <https://lore.kernel.org/lkml/Yhj1nYHXmimPsqFd@zx2c4.com/>,
propose something later for all of this. It doesn't need to happen all
at once *now*.

Thanks,
Jason

