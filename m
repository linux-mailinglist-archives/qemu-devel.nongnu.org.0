Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFBC5E74D7
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 09:28:07 +0200 (CEST)
Received: from localhost ([::1]:33882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obd6U-000565-D8
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 03:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obctP-0007Hb-G9
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 03:14:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obctN-0006nG-Fj
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 03:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663917272;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w9Utm4p3cueEbo2W+RKuLlmPdH2ChoRW9/3f9Y/fqng=;
 b=IufMurxHr/EkcU7j+/aRm/TTW0GsmGz5Nc/uTLXCaNUn8NfgsFkzT28pEe5K9XN9092G+G
 zYRAiId4hvMg/XnOrtMjs/PkKQ6I/Msrpuqfxm/1z5hwBq94Sm/05mZ8UfJtgPgZy3EAup
 JnOCOkYHzcEYdrZKXo+V/ZiEWLpLwxI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-MMcBEX0AMJWX25CFbnHxvA-1; Fri, 23 Sep 2022 03:14:29 -0400
X-MC-Unique: MMcBEX0AMJWX25CFbnHxvA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E2F13802B8E
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 07:14:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 370D2C15BA8;
 Fri, 23 Sep 2022 07:14:27 +0000 (UTC)
Date: Fri, 23 Sep 2022 08:14:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 2/5] migration: Fix race on qemu_file_shutdown()
Message-ID: <Yy1c0Xed15lzcAtl@redhat.com>
References: <20220920223800.47467-1-peterx@redhat.com>
 <20220920223800.47467-3-peterx@redhat.com>
 <YyyUMYfLxs0/QY41@redhat.com> <Yyy5Z0lZ6oTnBp8g@xz-m1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yyy5Z0lZ6oTnBp8g@xz-m1.local>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Thu, Sep 22, 2022 at 03:37:11PM -0400, Peter Xu wrote:
> On Thu, Sep 22, 2022 at 05:58:25PM +0100, Daniel P. Berrangé wrote:
> > On Tue, Sep 20, 2022 at 06:37:57PM -0400, Peter Xu wrote:
> > > In qemu_file_shutdown(), there's a possible race if with current order of
> > > operation.  There're two major things to do:
> > > 
> > >   (1) Do real shutdown() (e.g. shutdown() syscall on socket)
> > >   (2) Update qemufile's last_error
> > > 
> > > We must do (2) before (1) otherwise there can be a race condition like:
> > > 
> > >       page receiver                     other thread
> > >       -------------                     ------------
> > >       qemu_get_buffer()
> > >                                         do shutdown()
> > >         returns 0 (buffer all zero)
> > >         (meanwhile we didn't check this retcode)
> > >       try to detect IO error
> > >         last_error==NULL, IO okay
> > >       install ALL-ZERO page
> > >                                         set last_error
> > >       --> guest crash!
> > > 
> > > To fix this, we can also check retval of qemu_get_buffer(), but not all
> > > APIs can be properly checked and ultimately we still need to go back to
> > > qemu_file_get_error().  E.g. qemu_get_byte() doesn't return error.
> > > 
> > > Maybe some day a rework of qemufile API is really needed, but for now keep
> > > using qemu_file_get_error() and fix it by not allowing that race condition
> > > to happen.  Here shutdown() is indeed special because the last_error was
> > > emulated.  For real -EIO errors it'll always be set when e.g. sendmsg()
> > > error triggers so we won't miss those ones, only shutdown() is a bit tricky
> > > here.
> > 
> > The ultimate answer really is to stop using QEMUFile entirely and just
> > do migration with the QIOChannel objects directly. The work I did in the
> > last cycle to remove the QEMUFileOps callbacks was another piece of the
> > puzzle in moving in that direction, by ensuring that every QEMUFile is
> > now backed by a QIOChannel. All QEMUFile is doing now is adding the I/O
> > caching layer and some convenience APIs for I/O operations.
> > 
> > So the next step would be to add a  QIOChannelCached class that can wrap
> > over another QIOChannel, to add the I/O buffering functionality that
> > currently exists in QEMUFile. Once that's done, it'd be at the stage
> > where we could look at how to use QIOChannel APIs for VMstate. It would
> > likely involve wiring up an Error **errp  parameter into a great many
> > places so we get synchronous error propagation instead of out-of-band
> > error checking, so a phased transition would need to be figured out.
> 
> Yes, Error** sounds very good to have.
> 
> So far I'm not satisfied with qemufile api majorly because of that error
> handling, especially on *get() interfaces.
> 
> Besides that, do you have anything else in mind that would make
> QIOChannelCached better than qemufile (e.g. on how we do caching)?

Depends what you mean by better ? I think the caching code would be
a bit easier to understand, because QEMUFile gets a bit confusing
about which logic is used for read side and which is used for the
write side.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


