Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B65F365EB5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 19:37:23 +0200 (CEST)
Received: from localhost ([::1]:47588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYuJO-0008RP-JC
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 13:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lYuI0-0007uD-S6
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 13:35:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lYuHy-0003wU-H7
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 13:35:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618940153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yMO+NtGLl2GYCJQByVvTGyfvxQlBhjABSJeTi9+Pd5c=;
 b=JjSHSGzQ/ZFboo8x74zfmcR/F0CwHrUOw4XpCtY/eC4ZBnbXGYYRksuVuCu21Mc7gGnfjb
 bruaOHn7NEm3NrfACpJCeqeZef/vU4Fz41YK/NqHlK8J32YkyN7EqKywWwsAD8H8UrrJis
 A8zsp098UyXrmnRJlRGQTSkyOCwmi54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-fLs30hu7MFqzwKHYtx2pjQ-1; Tue, 20 Apr 2021 13:35:49 -0400
X-MC-Unique: fLs30hu7MFqzwKHYtx2pjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2E861020C31;
 Tue, 20 Apr 2021 17:35:48 +0000 (UTC)
Received: from localhost (ovpn-118-208.rdu2.redhat.com [10.10.118.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61C495D9DC;
 Tue, 20 Apr 2021 17:35:42 +0000 (UTC)
Date: Tue, 20 Apr 2021 13:35:41 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 0/2] i386: Fix interrupt based Async PF enablement
Message-ID: <20210420173541.24kxarhw75h2rqxa@habkost.net>
References: <20210401151957.408028-1-vkuznets@redhat.com>
 <ea3fc380-332f-b9e5-aa31-3540916cfc33@redhat.com>
 <87sg43d4gk.fsf@vitty.brq.redhat.com>
 <091dec53-cc0c-04ca-154a-3cfab6475705@redhat.com>
 <YHiQlkIOHDClFfXS@work-vm>
MIME-Version: 1.0
In-Reply-To: <YHiQlkIOHDClFfXS@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 15, 2021 at 08:14:30PM +0100, Dr. David Alan Gilbert wrote:
> * Paolo Bonzini (pbonzini@redhat.com) wrote:
> > On 06/04/21 13:42, Vitaly Kuznetsov wrote:
> > > older machine types are still available (I disable it for <= 5.1 but we
> > > can consider disabling it for 5.2 too). The feature is upstream since
> > > Linux 5.8, I know that QEMU supports much older kernels but this doesn't
> > > probably mean that we can't enable new KVM PV features unless all
> > > supported kernels have it, we'd have to wait many years otherwise.
> > 
> > Yes, this is a known problem in fact. :(  In 6.0 we even support RHEL 7,
> > though that will go away in 6.1.
> > 
> > We should take the occasion of dropping RHEL7 to be clearer about which
> > kernels are supported.
> 
> It would be nice to be able to define sets of KVM functonality that we
> can either start given machine types with, or provide a separate switch
> to limit kvm functionality back to some defined point.  We do trip over
> the same things pretty regularly when accidentally turning on new
> features.

The same idea can apply to the hyperv=on stuff Vitaly is working
on.  Maybe we should consider making a generic version of the
s390x FeatGroup code, use it to define convenient sets of KVM and
hyperv features.

-- 
Eduardo


