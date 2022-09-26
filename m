Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63125E9BB8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 10:13:45 +0200 (CEST)
Received: from localhost ([::1]:54568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocjFI-0001xK-Se
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 04:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ocjA2-0005QM-PK
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 04:08:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ocj9u-0003qO-UP
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 04:08:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664179688;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vkbt7Z1pi2n7ZjJkQ1uj+VoJgme4DlixzPMjkHs48vQ=;
 b=idDsf3iClgXK6D2A3RW61p3MxJfK9l94Zq1FPOEWbqvtznIFPj5FtjZu/l0vTvshsAPxhJ
 nGth6FBSp1TMhzTTw/VQBw3R0QDPIbzf99KGv8F6aob7zNzx+8GML5tc0vnVWURdcx/g17
 8E9rtUAyjRj+Mn0eYmosDhBPhEKVABA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-QctuRKFGPemi0vgaDSIwAQ-1; Mon, 26 Sep 2022 04:08:07 -0400
X-MC-Unique: QctuRKFGPemi0vgaDSIwAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CED88185A794;
 Mon, 26 Sep 2022 08:08:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E74CC40C6EC2;
 Mon, 26 Sep 2022 08:08:05 +0000 (UTC)
Date: Mon, 26 Sep 2022 09:08:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Maximum QMP reply size
Message-ID: <YzFd44GS6Ad0DNis@redhat.com>
References: <CAFn=p-ZkKLQtYAwzkQb7srFf_fF8ij+g5wkZiRofx4U+kSZ7Rw@mail.gmail.com>
 <87v8pzwgbm.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87v8pzwgbm.fsf@pond.sub.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, Sep 07, 2022 at 01:54:05PM +0200, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
> > Hi, I suspect I have asked this before, but I didn't write it down in
> > a comment, so I forget my justification...
> >
> > In the QMP lib, we need to set a buffering limit for how big a QMP
> > message can be -- In practice, I found that the largest possible
> > response was the QAPI schema reply, and I set the code to this:
> >
> >     # Maximum allowable size of read buffer
> >     _limit = (64 * 1024)
> >
> > However, I didn't document if this was a reasonable limit or just a
> > "worksforme" one. I assume that there's no hard limit for the protocol
> > or the implementation thereof in QEMU. Is there any kind of value here
> > that would be more sensible than another?
> >
> > I'm worried that if replies get bigger in the future (possibly in some
> > degenerate case I am presently unaware of) that the library default
> > will become nonsensical.
> >
> > Any pointers/tips?
> 
> Peter and Daniel already provided some.  I can add a bit of insight into
> how QMP output works in QEMU, which may or may not help you.
> 
> QEMU executes one command after the other.  A command's response
> (success or failure) is a QDict.  Which is then formatted as JSON and
> appended to the monitor's output buffer.
> 
> Events work similarly.
> 
> The conversion to JSON does not limit the resulting string's size.  If
> it runs out of memory, QEMU dies.
> 
> The output buffer is also unbounded.  It drains into the monitor's
> character device.
> 
> If the QMP client sends enough commands without reading their responses,
> QEMU can run out of memory and die.
> 
> Now I'm ready to go back to your question, which is about a *single*
> message (QMP command response or event): nothing in QEMU limits the size
> of the QMP output message text.
> 
> Weak consolation: I guess QEMU is somewhat likely to run out of memory
> and die before your client software does.  That's because QDict is a
> pig: an empty one eats 4120 Bytes on my system.  Compares unfavourable
> to its text representation "{}".

A malicious QEMU that's trying to attack the mgmt software client
wouldn't need to use QDict, so that's only consolation against
accidents. An evil QEMU would just write JSON directly onto the
monitor chardev. It wouldn't even have to be well formed JSON,
as it could just start a string and never end it.

 {"blah..repeated for 1 TB for data...."

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


