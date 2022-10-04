Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E119B5F3E58
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 10:29:28 +0200 (CEST)
Received: from localhost ([::1]:55048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofdIt-0007R2-TG
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 04:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofcw1-0007d5-9M
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 04:05:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofcvw-0005rs-UD
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 04:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664870743;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uMu76vQvIVy0lO6nNZVWjFAp1YNB5+RujDkPLYpaS9Q=;
 b=X0iVCiwaj+hR/kPqHGQBWgWAI83KxkjAfdEp7QxdoXKno/VQg7IiBTLivoWuH+ww/21AeZ
 zJZauc/Afb3V/IuabX9RUtovjABjNRZGR+MTDsaprvtFOdkQupfXho5r1kj9JOSlu4MBRn
 tOSVzQj9QXzlXWsetzYiPp/fXtjBNN8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-AZlv-s8jO5uDnuupALKBBw-1; Tue, 04 Oct 2022 04:05:39 -0400
X-MC-Unique: AZlv-s8jO5uDnuupALKBBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 540FB299E751;
 Tue,  4 Oct 2022 08:05:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0A2A17583;
 Tue,  4 Oct 2022 08:05:37 +0000 (UTC)
Date: Tue, 4 Oct 2022 09:05:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, kvm-devel <kvm@vger.kernel.org>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2] mips/malta: pass RNG seed to to kernel via env var
Message-ID: <YzvpT67iJMMR9n25@redhat.com>
References: <YziPyCqwl5KIE2cf@zx2c4.com>
 <20221003103627.947985-1-Jason@zx2c4.com>
 <b529059a-7819-e49d-e4dc-7ae79ee21ec5@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b529059a-7819-e49d-e4dc-7ae79ee21ec5@amsat.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 04, 2022 at 12:36:03AM +0200, Philippe Mathieu-Daudé wrote:
> Hi Jason,
> 
> Per https://www.qemu.org/docs/master/devel/submitting-a-patch.html#when-resending-patches-add-a-version-tag:
> 
> Send each new revision as a new top-level thread, rather than burying it
> in-reply-to an earlier revision, as many reviewers are not looking inside
> deep threads for new patches.
> 
> On 3/10/22 12:36, Jason A. Donenfeld wrote:
> > As of the kernel commit linked below, Linux ingests an RNG seed
> > passed from the hypervisor. So, pass this for the Malta platform, and
> > reinitialize it on reboot too, so that it's always fresh.
> >
> > Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Cc: Aurelien Jarno <aurelien@aurel32.net>
> > Link: https://git.kernel.org/mips/c/056a68cea01
> 
> You seem to justify this commit by the kernel commit, which justifies
> itself mentioning hypervisor use... So the egg comes first before the
> chicken.

The kernel justification is that the guest OS needs a good RNG
seed. The kernel patch is just saying that the firmware / hypervisor
side is where this seed generally expected to come from. This is
fine, and not notably different from what Jason's already got
wired up for the various other targets in QEMU.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


