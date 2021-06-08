Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42EF39F927
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:29:54 +0200 (CEST)
Received: from localhost ([::1]:56010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcjp-00057G-TF
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqciv-0004Cr-8N
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:28:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqcit-0001kV-IK
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:28:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623162534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SvFFzQ5erFHu/4YZncKENyagsGcKE6uQKho12fNedr8=;
 b=BgTxf3OAmqWunpwnSWeaBxUBhN+HOIqw+9qrKxcYwZoWxcx67FwjH90kJXnf0FzBcYLCkS
 yC6fXU1HtM7ziXn4OsTQ2AC2lEztrLhhIsxp9Hfy0xxf7pkUvoWaC8xhhYpYvaEqZ/4gy3
 JU4s/B//AEXCH8hDmT2lX2Esn1pQ/F4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-vahISbrxO_-cNLvIpsnKMA-1; Tue, 08 Jun 2021 10:28:52 -0400
X-MC-Unique: vahISbrxO_-cNLvIpsnKMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 787DAC73A0;
 Tue,  8 Jun 2021 14:28:51 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A478860C04;
 Tue,  8 Jun 2021 14:28:50 +0000 (UTC)
Date: Tue, 8 Jun 2021 09:28:48 -0500
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v16 04/99] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
Message-ID: <20210608142848.szkxewltyc572piv@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-5-alex.bennee@linaro.org>
 <d5162188-bea4-24ed-189b-198f9d3ed55d@redhat.com>
 <92071d16-3ff1-0274-2e45-59ed7624f358@redhat.com>
 <e30516ff-a5f8-6785-3988-daae26dc5151@redhat.com>
 <976d1acf-8536-1baa-b5da-c156b0830724@redhat.com>
MIME-Version: 1.0
In-Reply-To: <976d1acf-8536-1baa-b5da-c156b0830724@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 02:39:03PM +0200, Philippe Mathieu-Daudé wrote:
> > 
> > Not enough coffee earlier. I think this is a documentation problem,
> > query-kvm returns a list of *runtime* accelerators:
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg811144.html
> > 
> > IIUC what Paolo said, if something asks for an accelerator that
> > is not present at build-time, then this is a configuration problem,
> > not relevant for the management interface.
> 
> Argh no... sigh. So we have 4 cases:
> 
> 1- accelerator not built
> 2- accelerator built in as module but not loaded
> 3- accelerator built in & loaded but not usable
> 4- accelerator built in & loaded and usable
> 
> QMP query-accels returns "accelerator built in & loaded"
> without precising it is usable.
> 
> qtest kvm_enabled() checks if the accelerator is enabled
> without checking it is built-in.
> 
> QMP query-kvm returns 'present' as in built-in (so case 1),
> and 'enabled' (a.k.a. 'allowed') updated once init_machine()
> succeeded (so case 4).
> 
> So, again, IIUC Paolo, what he said is for the management layer
> 1 and 2 are the same, the accelerator is not present.

Isn't 3 in the same boat?  Really, the management app cares if it can
use the accelerator, not whether it is present.

> 
> For qtests, we want the 'usable' case (4) right? Whether the
> accelerator is builtin / loaded is irrelevant.
> 
> Could we improve the terminology here? Maybe is_present() and
> is_usable()? Suggestions?
> 
> Do we need to add both query-present-accels query-usable-accels
> commands? Is it actually possible to return an array of 'usable'
> accelerators?
> 
> Maybe simply add query-present-accels() -> [] and
> query-usable-accel(accel) -> bool.

Can you just make query-accels return both pieces of information?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


