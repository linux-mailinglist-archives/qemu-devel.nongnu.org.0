Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B32A3A141E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:18:33 +0200 (CEST)
Received: from localhost ([::1]:59574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxAG-00081b-Er
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqx7W-0003dr-8z
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:15:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqx7U-0007Zu-Fa
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623240939;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LjO85brlpUev010UzJupaF9U/FIUCycH3hZRv8oCWYw=;
 b=I36wcevAxy5JGr28zrBKap8RwtjwYpqNAxkAz3vG3az0DcDlU/F8NmIqNsxyOlyiurJNEC
 OlQiolK2molCLHsMkySgcwI1ljJUl9pN2vtxP3bD5sn+Vxw5tSIlJLRVcpdQleLXMoX88z
 19A1mWAsGXRFVT9ReoQD7RL3osjsVDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-dOxgtoS7M5a9pSbmGRgvVw-1; Wed, 09 Jun 2021 08:15:37 -0400
X-MC-Unique: dOxgtoS7M5a9pSbmGRgvVw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BF9C101F001;
 Wed,  9 Jun 2021 12:15:36 +0000 (UTC)
Received: from redhat.com (ovpn-115-127.ams2.redhat.com [10.36.115.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9B5D60877;
 Wed,  9 Jun 2021 12:15:34 +0000 (UTC)
Date: Wed, 9 Jun 2021 13:15:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] vl: Fix an assert failure in error path
Message-ID: <YMCw5E2havaaC+UI@redhat.com>
References: <20210610084741.456260-1-zhenzhong.duan@intel.com>
 <048a18be-0d1c-7fd0-7031-51e64c5432f3@redhat.com>
 <87fsxrnss4.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87fsxrnss4.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 02:09:47PM +0200, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
> > On 10/06/21 10:47, Zhenzhong Duan wrote:
> >> Based on the description of error_setg(), the local variable err in
> >> qemu_maybe_daemonize() should be initialized to NULL.
> >> Without fix, the uninitialized *errp triggers assert failure which
> >> doesn't show much valuable information.
> >> Before the fix:
> >> qemu-system-x86_64: ../util/error.c:59: error_setv: Assertion `*errp == NULL' failed.
> >> After fix:
> >> qemu-system-x86_64: cannot create PID file: Cannot open pid file: Permission denied
> >> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> >> ---
> >>   softmmu/vl.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >> diff --git a/softmmu/vl.c b/softmmu/vl.c
> >> index 326c1e9080..feb4d201f3 100644
> >> --- a/softmmu/vl.c
> >> +++ b/softmmu/vl.c
> >> @@ -2522,7 +2522,7 @@ static void qemu_process_help_options(void)
> >>     static void qemu_maybe_daemonize(const char *pid_file)
> >>   {
> >> -    Error *err;
> >> +    Error *err = NULL;
> 
> Common mistake, I'm afraid.

Initializing isn't likely to be a performance impact, so I'd think
we should make 'checkpatch.pl' complain about any 'Error *' variable
that is not initialized to NULL, as a safety net, even if not technically
required in some cases.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


