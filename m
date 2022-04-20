Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90A85086A7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 13:08:36 +0200 (CEST)
Received: from localhost ([::1]:35254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh8CJ-0006dl-Gp
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 07:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh89M-0003eu-EI
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:05:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh89K-0003Zf-6B
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650452729;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=tSak2xc74WiRMfS8SHaiuBcsTW9Kk2tEWnEbPkcGzXc=;
 b=AB5VmO9IVd8knJwpvvFyV07XaojGuRnCm01KYnE81ab/ZofjEKFAksdJ9yxGDvWciINKwk
 1WoIxv8suN6YaewFGJrOMQq4b0vcCYG2quK/i2C54f8WWOEoY/g86R3A6rheR0zpY37WDJ
 HwAGkIdh5YkDUsrfUiTWA1rCNN5XPGk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-ERadymiqPuCBt1WfXHsMJw-1; Wed, 20 Apr 2022 07:05:28 -0400
X-MC-Unique: ERadymiqPuCBt1WfXHsMJw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92A1E899EC1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:05:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD3C3428F0A;
 Wed, 20 Apr 2022 11:05:26 +0000 (UTC)
Date: Wed, 20 Apr 2022 12:05:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 10/19] migration: Postcopy preemption enablement
Message-ID: <Yl/o9HCW54hslTbs@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-11-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220331150857.74406-11-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 11:08:48AM -0400, Peter Xu wrote:
> This patch enables postcopy-preempt feature.
> 
> It contains two major changes to the migration logic:
> 
> (1) Postcopy requests are now sent via a different socket from precopy
>     background migration stream, so as to be isolated from very high page
>     request delays.
> 
> (2) For huge page enabled hosts: when there's postcopy requests, they can now
>     intercept a partial sending of huge host pages on src QEMU.
> 
> After this patch, we'll live migrate a VM with two channels for postcopy: (1)
> PRECOPY channel, which is the default channel that transfers background pages;
> and (2) POSTCOPY channel, which only transfers requested pages.
> 
> There's no strict rule of which channel to use, e.g., if a requested page is
> already being transferred on precopy channel, then we will keep using the same
> precopy channel to transfer the page even if it's explicitly requested.  In 99%
> of the cases we'll prioritize the channels so we send requested page via the
> postcopy channel as long as possible.
> 
> On the source QEMU, when we found a postcopy request, we'll interrupt the
> PRECOPY channel sending process and quickly switch to the POSTCOPY channel.
> After we serviced all the high priority postcopy pages, we'll switch back to
> PRECOPY channel so that we'll continue to send the interrupted huge page again.
> There's no new thread introduced on src QEMU.

Implicit in this approach is that the delay in sending postcopy
OOB pages is from the pending socket buffers the kernel already
has, and not any delay caused by the QEMU sending thread being
busy doing other stuff.

Is there any scenario in which the QEMU sending thread is stalled
in sendmsg() with a 1GB huge page waiting for the kernel to
get space in the socket outgoing buffer ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


