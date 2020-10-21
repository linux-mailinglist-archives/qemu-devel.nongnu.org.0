Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2551B29526E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 20:50:17 +0200 (CEST)
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVJBf-0005J8-Ov
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 14:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kVJAn-0004tp-8Z
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 14:49:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kVJAj-0007pN-GS
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 14:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603306154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v9mBWl8fBOtUD1GAlH7+LqHCUcCd2BUaiB4fwY6CoZQ=;
 b=JDbH87qSO3bxtPXifV+iF7rCincYzKf9kk/c3f/tLFw92owbydh/TPFnHommTyERTkWSW1
 jcEFI8MbC0TDMpmU7/K2Ux3jkqwYpHSbp2Wjhu2NiY5/hZtjpnhIC0U0Bf3usWuvkyBOvj
 xiRhjW6g43PXBgX/T2JwDkchYg0dPFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-5b7chJ06PkOGkGkD5MbbdQ-1; Wed, 21 Oct 2020 14:49:12 -0400
X-MC-Unique: 5b7chJ06PkOGkGkD5MbbdQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 480A5876E3A;
 Wed, 21 Oct 2020 18:49:11 +0000 (UTC)
Received: from w520.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58C9D5B4A1;
 Wed, 21 Oct 2020 18:49:10 +0000 (UTC)
Date: Wed, 21 Oct 2020 12:49:08 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/1] Skip flatview_simplify() for cpu vendor zhaoxin
Message-ID: <20201021124908.53c7a98b@w520.home>
In-Reply-To: <783b5ef0-277c-363d-f342-7c0351f9ac16@redhat.com>
References: <20201016112933.14856-1-FelixCui-oc@zhaoxin.com>
 <20201016112933.14856-2-FelixCui-oc@zhaoxin.com>
 <a971c9db-469f-ddc0-1a27-3e21958f6ff7@redhat.com>
 <20201019130206.1d3baffc@w520.home>
 <4d2b96cb-8f7f-2598-39e6-4cf0f61d567b@redhat.com>
 <20201020164437.5e3cb4ce@w520.home>
 <783b5ef0-277c-363d-f342-7c0351f9ac16@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: FelixCuioc <FelixCui-oc@zhaoxin.com>, Eduardo Habkost <ehabkost@redhat.com>,
 CobeChen-oc@zhaoxin.com, qemu-devel@nongnu.org, TonyWWang-oc@zhaoxin.com,
 RockCui-oc@zhaoxin.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Oct 2020 09:37:53 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 21/10/20 00:44, Alex Williamson wrote:
> > Do we necessarily need a memory map ioctl for this or could it be the
> > QEMU code that compares the old and new maps to trigger map and unmap
> > ioctls?  For example (aiui) our race is that if we have contiguous
> > memory regions A and B and flatview_simplify() tries to expand A and
> > delete B we'll see a series of listener notifications deleting A and B
> > and adding A'.  But the vfio QEMU code could parse the memory map to
> > determine that old A + B is functionally equivalent to A' and do
> > nothing.  
> 
> I think the issue is a bit different, and in fact there are two sides of
> the same issue.  Say you have A (large) and it is replaced by A'
> (smaller) + B, then:
> 
> * the first part of A disappears for a moment before A' appears.  This
> is something that QEMU can work around, by not doing anything
> 
> * the second part of A disappears for a moment before B appears.  This
> is the root API issue and not something that QEMU can work around; and
> in fact it is not even fixed by removing flatview_simplify.

Right, our current uAPI does not support a mechanism to atomically
change a mapping, but likewise we're probably not going to have devices
performing DMA to regions that are being remapped.  We know that
removing flatview_simplify() resolves this issue and FelixCui's update
suggests we do have a case where the permission changes of an adjacent
range is triggering a range consolidation, which we see as the range
being removed and added as something else, larger or smaller.

I can understand the general benefit of flatview_simplify(), but I
wonder if the best short term solution is to skip operating on the x86
PAM range, which I understand to be a small number of memory chunks
below 1MB.  I might also wonder why the EHCI controller on this
platform is choosing that range for DMA.  Thanks,

Alex


