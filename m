Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7DA5E6B15
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:38:21 +0200 (CEST)
Received: from localhost ([::1]:50180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obR5Y-00088E-1n
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obPX5-0001Bs-5H
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:58:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obPX2-0000p3-8k
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:58:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663865914;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NpHsLpV2SLMmJrdUlaHHLF5pRHVYXzznji+G3qP/4UU=;
 b=iC66UXw3A7O31SVLDls72gxDrAKxNE693LcOH05sRtu8F7w6wPTNIB5nnxfCW/RCRq/guJ
 6LJHr2fGxm/oVlwyDqvO0xbBdyzcGcAToWzBFDk51u905D7bS8N4op+cp5iFk/K7bF0kLa
 ItqajJpsnId8dPwP9cdAv5eE2dbEAYc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-3bJGvvTJPnWZSz9vd6t64A-1; Thu, 22 Sep 2022 12:58:31 -0400
X-MC-Unique: 3bJGvvTJPnWZSz9vd6t64A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69D22862FE2
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 16:58:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24D2540C6EC2;
 Thu, 22 Sep 2022 16:58:29 +0000 (UTC)
Date: Thu, 22 Sep 2022 17:58:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 2/5] migration: Fix race on qemu_file_shutdown()
Message-ID: <YyyUMYfLxs0/QY41@redhat.com>
References: <20220920223800.47467-1-peterx@redhat.com>
 <20220920223800.47467-3-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220920223800.47467-3-peterx@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

On Tue, Sep 20, 2022 at 06:37:57PM -0400, Peter Xu wrote:
> In qemu_file_shutdown(), there's a possible race if with current order of
> operation.  There're two major things to do:
> 
>   (1) Do real shutdown() (e.g. shutdown() syscall on socket)
>   (2) Update qemufile's last_error
> 
> We must do (2) before (1) otherwise there can be a race condition like:
> 
>       page receiver                     other thread
>       -------------                     ------------
>       qemu_get_buffer()
>                                         do shutdown()
>         returns 0 (buffer all zero)
>         (meanwhile we didn't check this retcode)
>       try to detect IO error
>         last_error==NULL, IO okay
>       install ALL-ZERO page
>                                         set last_error
>       --> guest crash!
> 
> To fix this, we can also check retval of qemu_get_buffer(), but not all
> APIs can be properly checked and ultimately we still need to go back to
> qemu_file_get_error().  E.g. qemu_get_byte() doesn't return error.
> 
> Maybe some day a rework of qemufile API is really needed, but for now keep
> using qemu_file_get_error() and fix it by not allowing that race condition
> to happen.  Here shutdown() is indeed special because the last_error was
> emulated.  For real -EIO errors it'll always be set when e.g. sendmsg()
> error triggers so we won't miss those ones, only shutdown() is a bit tricky
> here.

The ultimate answer really is to stop using QEMUFile entirely and just
do migration with the QIOChannel objects directly. The work I did in the
last cycle to remove the QEMUFileOps callbacks was another piece of the
puzzle in moving in that direction, by ensuring that every QEMUFile is
now backed by a QIOChannel. All QEMUFile is doing now is adding the I/O
caching layer and some convenience APIs for I/O operations.

So the next step would be to add a  QIOChannelCached class that can wrap
over another QIOChannel, to add the I/O buffering functionality that
currently exists in QEMUFile. Once that's done, it'd be at the stage
where we could look at how to use QIOChannel APIs for VMstate. It would
likely involve wiring up an Error **errp  parameter into a great many
places so we get synchronous error propagation instead of out-of-band
error checking, so a phased transition would need to be figured out.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


