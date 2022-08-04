Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC273589BD7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 14:43:04 +0200 (CEST)
Received: from localhost ([::1]:53200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJaBr-0004et-VE
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 08:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJZhi-0005Ap-9H
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:11:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJZhc-00072P-G4
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659615107;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=myS9hst6VuJLpiFkgxft82/FddB8fppeYsviy0dUtBY=;
 b=Z7DQseXEv8Sj0x1mpnVmwHpElPidjRZ5Utsa++q6sLVEYBByyiLc2QvDDSAjugvPn75h/c
 W0nzVwphUyg0pPl2k6nCAtv0O50gDrfdq/bYRFqWH8neIqipT2YjBDSdRLGhYlxyGYePvt
 nnH6KuVEI5omvOaiYHillWaPGKes/TE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-WK2PZhWBMaaXxBd6AmbAPA-1; Thu, 04 Aug 2022 08:11:44 -0400
X-MC-Unique: WK2PZhWBMaaXxBd6AmbAPA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41CC9811E80;
 Thu,  4 Aug 2022 12:11:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC77E1415116;
 Thu,  4 Aug 2022 12:11:40 +0000 (UTC)
Date: Thu, 4 Aug 2022 13:11:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Laszlo Ersek <lersek@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Xiaoyao Li <xiaoyao.li@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-efi@vger.kernel.org
Subject: Re: [PATCH v2] hw/i386: place setup_data at fixed place in memory
Message-ID: <Yuu3ee1iB3IoLdZS@redhat.com>
References: <YusVVLNbLgsk49PK@zx2c4.com>
 <20220804004411.1343158-1-Jason@zx2c4.com>
 <20220804030012-mutt-send-email-mst@kernel.org>
 <bfa5704d-755c-5a52-e7cc-bd9b34e5bb03@redhat.com>
 <YuuQb3D/YY1SiUqY@redhat.com> <Yuu1kX9CAqSUNNAj@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yuu1kX9CAqSUNNAj@zx2c4.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 04, 2022 at 02:03:29PM +0200, Jason A. Donenfeld wrote:
> Hi Daniel,
> 
> On Thu, Aug 04, 2022 at 10:25:36AM +0100, Daniel P. Berrangé wrote:
> > Yep, and ultimately the inability to distinguish UEFI vs other firmware
> > is arguably correct by design, as the QEMU <-> firmware interface is
> > supposed to be arbitrarily pluggable for any firmware implementation
> > not  limited to merely UEFI + seabios.
> 
> Indeed, I agree with this.
> 
> > 
> > > For now I suggest either reverting the original patch, or at least not
> > > enabling the knob by default for any machine types. In particular, when
> > > using MicroVM, the user must leave the knob disabled when direct booting
> > > a kernel on OVMF, and the user may or may not enable the knob when
> > > direct booting a kernel on SeaBIOS.
> > 
> > Having it opt-in via a knob would defeat Jason's goal of having the seed
> > available automatically.
> 
> Yes, adding a knob is absolutely out of the question.
> 
> It also doesn't actually solve the problem: this triggers when QEMU
> passes a DTB too. It's not just for the new RNG seed thing. This bug
> isn't new.

In the other thread I also mentioned that this RNG Seed addition has
caused a bug with AMD SEV too, making boot measurement attestation
fail because the kernel blob passed to the firmware no longer matches
what the tenant expects, due to the injected seed.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


