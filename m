Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEF1589BC4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 14:40:08 +0200 (CEST)
Received: from localhost ([::1]:44852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJa91-0006xi-C3
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 08:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJZhE-0004fY-5P
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:11:24 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:60700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJZhC-00071N-6a
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:11:23 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 296D5B82521;
 Thu,  4 Aug 2022 12:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8B4C433C1;
 Thu,  4 Aug 2022 12:11:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="REjCpMC4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659615076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YiSEeWRQb6joG6MZeiuccFEoGsTnn1HIxi6dV4Mq9J8=;
 b=REjCpMC4X1jxFq2qBATBn3v49cMIE0+FeaCCCylhQgmAU2LuzNvRLNz5LyGnxC/ziZs7ba
 Jtar7MESK1ocuMggiJ8rgcUt6BrQcyoJrRKN3o77S1awYnnLxojNseIAfGM3A7CsSCM6nM
 lvLPucQtgeRzD+gkpqxHm1Jt3eGQRzA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f5eacb56
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 4 Aug 2022 12:11:15 +0000 (UTC)
Date: Thu, 4 Aug 2022 14:11:13 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-efi <linux-efi@vger.kernel.org>
Subject: Re: [PATCH v2] hw/i386: place setup_data at fixed place in memory
Message-ID: <Yuu3YeTRLE/gx6YC@zx2c4.com>
References: <YusVVLNbLgsk49PK@zx2c4.com>
 <20220804004411.1343158-1-Jason@zx2c4.com>
 <20220804030012-mutt-send-email-mst@kernel.org>
 <bfa5704d-755c-5a52-e7cc-bd9b34e5bb03@redhat.com>
 <YuuQb3D/YY1SiUqY@redhat.com>
 <CAMj1kXFr6Bv4_G0-wCTu4fp_iCrG060NHJx_j2dbnyiFJKYYeQ@mail.gmail.com>
 <eadc852a-63f9-a017-aef7-f046eb56e28f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eadc852a-63f9-a017-aef7-f046eb56e28f@redhat.com>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laszlo,

On Thu, Aug 04, 2022 at 01:31:36PM +0200, Laszlo Ersek wrote:
> None of the existing info passing methods seem early enough, generic
> enough, and secure enough (at the same time)...

Can you look at the v2 patch? It seems to work on every configuration I
throw at it. Keep in mind that setup_data is only used very, very early.
I can think of a few other places to put it too, looking at the x86
memory map, that will survive long enough.

I think this might actually be a straightforwardly solvable problem if
you think about it more basically.

Jason

