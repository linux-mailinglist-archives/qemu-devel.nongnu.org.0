Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4533EBC16
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 20:32:02 +0200 (CEST)
Received: from localhost ([::1]:59942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEbyJ-0005nM-KQ
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 14:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mEbwp-00051e-UW
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 14:30:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mEbwm-00012M-67
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 14:30:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628879422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ho+809Z1ClvdOMfsddXMlmCtsWbMOC6QB7oQQ3TRWcE=;
 b=N5SPQpqkpB688WOJxnb+tk7cUurbp8X3dGsvrb2g0PdXiGtU0HkYhfFmdJXQb12Ylu1xck
 dL6/Mou1uZoHFkD2lO2bGOIM4O/VNpOn/jUWJLxuPgYLzLqVffo+hN3sR2+46RhyWXdYVV
 TouT44kPpHsGV01kq4/ORUCPBsLf5tU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-__KXVWmKOjW7oUMdCFLaUg-1; Fri, 13 Aug 2021 14:30:19 -0400
X-MC-Unique: __KXVWmKOjW7oUMdCFLaUg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B74842E77;
 Fri, 13 Aug 2021 18:30:18 +0000 (UTC)
Received: from redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E9705D9D5;
 Fri, 13 Aug 2021 18:30:18 +0000 (UTC)
Date: Fri, 13 Aug 2021 13:30:15 -0500
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 0/4] Zero sockaddr_in when initializing it
Message-ID: <20210813183015.qlfqrshmplxseued@redhat.com>
References: <20210813150506.7768-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210813150506.7768-1-peter.maydell@linaro.org>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 13, 2021 at 04:05:02PM +0100, Peter Maydell wrote:
> The POSIX spec for sockaddr_in says that implementations are allowed
> to have implementation-dependent extensions controlled by extra
> fields in the struct, and that the way to ensure these are not
> accidentally activated is to zero out the whole data structure.
> We have several places in our codebase where we don't zero-init
> sockaddr_in structs and so (at least in theory) might run into this.
> Coverity spotted the ones in the net code (CID 1005338); the
> others in this series I found by looking at all uses of sockaddr_in.
> (The gdbstub patch changes also a sockaddr_un use, for symmetry.)
> 
> Thanks to Eric for the analysis of what the spec says and why
> Coverity is correct here.

FWIW, the POSIX wording is interesting - it requires portable
applications to zero out sockaddr_in6 (and even states that memset()
is not yet a portable way to do that on exotic hardware, although a
future version of POSIX may add a zero-bit constraint on
implementations; in practice we only use qemu on hardware where
memset() to zero properly sets pointers to NULL and floating points to
0.0).  But for sockaddr_in, it merely recommends it, with an
acknowledgment that much existing code fails to do so.  Or put another
way, POSIX gives carte blanche to implementations to add IPv6
extensions, but advises that IPv4 implementations should be wary of
extensions that trigger off of uninitialized fields.

Since you are fixing IPv4 usage, and not IPv6, I agree with your
designation that this is 6.2 material, and not a regression fix to
rush into 6.1 (should other patches warrant rc4) - we are unlikely to
be running on an implementation where the uninitialized fields cause
noticeable behavior changes to IPv4 behavior.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


