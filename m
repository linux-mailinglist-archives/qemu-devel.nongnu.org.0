Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1150260C709
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:57:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFfv-00043y-41; Tue, 25 Oct 2022 04:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1onFPu-0001Vn-By
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:36:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1onFPr-0005Ax-IR
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666686963;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Xi7S0NmttiPYdWjaTeXnGJbyYb/rStHUQiAyAnoBFco=;
 b=eSDAJ79uXwLThfiLl6IQebMbuECXioMCPa9iOo1SFK5W1nbUuUUj8UTZIsM1Z9IlaGRmLD
 VrtF7NO+naT7a5hg5NOIPj2ccqPeTALGKV0DEa4Yums02oZNrHwmNMhe43sgPw8udo4RRj
 Js7w6tKjiO5Eo642maGuldd8ErYIfNE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-KkKJmiZ9Mw2OUUDX4WkP5w-1; Tue, 25 Oct 2022 04:35:59 -0400
X-MC-Unique: KkKJmiZ9Mw2OUUDX4WkP5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F63A185A7A9
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 08:35:59 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B34A5C15BAB;
 Tue, 25 Oct 2022 08:35:58 +0000 (UTC)
Date: Tue, 25 Oct 2022 09:35:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 4/4] migration/multifd/zero-copy: Flush only the LRU
 half of the header array
Message-ID: <Y1ef6/8gxsCiNjiO@redhat.com>
References: <20221025044730.319941-1-leobras@redhat.com>
 <20221025044730.319941-5-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221025044730.319941-5-leobras@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 25, 2022 at 01:47:31AM -0300, Leonardo Bras wrote:
> Zero-copy multifd migration sends both the header and the memory pages in a
> single syscall. Since it's necessary to flush before reusing the header, a
> header array was implemented, so each write call uses a different
> array, and flushing only take place after all headers have been used,
> meaning 1 flush for each N writes.
> 
> This method has a bottleneck, though: After the last write, a flush will
> have to wait for all writes to finish, which will be a lot, meaning the
> recvmsg() syscall called in qio_channel_socket_flush() will be called a
> lot. On top of that, it will create a time period when the I/O queue is
> empty and nothing is getting send: between the flush and the next write.
> 
> To avoid that, use qio_channel_flush()'s new max_pending parameter to wait
> until at most half of the array is still in use. (i.e. the LRU half of the
> array can be reused)
> 
> Flushing for the LRU half of the array is much faster, since it does not
> have to wait for the most recent writes to finish, making up for having
> to flush twice per array.
> 
> As a main benefit, this approach keeps the I/O queue from being empty while
> there are still data to be sent, making it easier to keep the I/O maximum
> throughput while consuming less cpu time.

Doesn't this defeat the reason for adding the flush in the first
place, which was to ensure that a migration iteration was fully
sent before starting the next iteration over RAM ? If it is OK to
only partially flush on each iteration, then why do we need to
flush at all ?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


