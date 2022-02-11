Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CDC4B22CA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 11:09:11 +0100 (CET)
Received: from localhost ([::1]:40534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nISrW-0006Y8-CO
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 05:09:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nISpb-0005n0-8K
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 05:07:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nISpX-0004h7-VG
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 05:07:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644574027;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BOzr4KQp0OY4ksAld1eKLc0C9OZl3YpePIu89qBOMFU=;
 b=E28dyxXlOCc0T5KA5Rsa1kCxnWRNlGtZYHzkESTjUXXxMRR0v5vhY+cnSV7UiCJniJWMht
 nntzb48gSlUvL5kKCuX460s55TKlITbuYa6OXPJqmWYVjZ33aN78W0stvXLBGfJ14pUj/l
 qvPReF2y9MP4IT5hXJDiWCzesFXoZlQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-EeTcEn7bNrKHJy4DEwKlKA-1; Fri, 11 Feb 2022 05:07:04 -0500
X-MC-Unique: EeTcEn7bNrKHJy4DEwKlKA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFA791091DB8;
 Fri, 11 Feb 2022 10:07:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D7ED66E14;
 Fri, 11 Feb 2022 10:07:00 +0000 (UTC)
Date: Fri, 11 Feb 2022 10:06:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] qapi, i386/sev: Add debug-launch-digest to
 launch-measure response
Message-ID: <YgY1QU/9JfwvFT+5@redhat.com>
References: <20220131111539.3091765-1-dovmurik@linux.ibm.com>
 <YffLgx48+mM2SiIX@redhat.com>
 <5f08d6d3-0279-50ed-5223-a9f3217e555d@linux.ibm.com>
 <YffxpK99EibxdXG4@redhat.com> <YgVp1UN8t/nKq2+x@work-vm>
MIME-Version: 1.0
In-Reply-To: <YgVp1UN8t/nKq2+x@work-vm>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 10, 2022 at 07:39:01PM +0000, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > I wonder if we're thinking of this at the wrong level though. Does
> > it actually need to be QEMU providing this info to the guest owner ?
> > 
> > Guest owners aren't going to be interacting with QEMU / QMP directly,
> > nor are they likely to be interacting with libvirt directly. Their
> > way into the public cloud will be via some high level API. eg the
> > OpenStack Nova REST API, or the IBM Cloud API (whatever that may
> > be). This high level mgmt infra is likely what is deciding which
> > of the 'N' possible OVMF builds to pick for a given VM launch. It
> > could easily just expose the full OVMF data to the user via its
> > own API regardless of what query-sev does.
> > 
> > Similarly if the cloud is choosing which kernel, out of N possible
> > kernels to boot with, they could expose the raw kernel data somewhere
> > in their API - we don't neccessarily need to expose that from QEMU.
> 
> It gets more interesting where it's the guest which picks the
> kernel/initrd; imagine the setup where the cloud reads the kernel/initrd
> from the guest disk and passes that to qemu; one of the update ideas
> would be just to let the guest update from a repo at it's own pace;
> so the attestor doesn't know whether to expect a new or old kernel
> from the guest; but it does know it should be one of the approved
> set of kernels.

So that scenario would effectively be the old Xen style pygrub where
you have some script on the host to pull the kernel/initrd out of
the guest /boot.

On the plus side that would enable you to use a "normal" guest disk
image with unencrypted /boot, instead of encrypting everything.

The risk though is that you need a strong guarantee that the *only* data
from /boot that is used is the kernel+initrd+cmdline that get included
in the measurement. If the guest boot process reads anything else from
/boot then your confidentiality is potentially doomed. This feels like
quite a risky setup, as I don't know how you'd achieve the high level of
confidence that stuff in /boot isn't going to cause danger to the guest
during boot, or after boot.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


