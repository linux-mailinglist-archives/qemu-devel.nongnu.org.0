Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DAC5674E9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 18:59:42 +0200 (CEST)
Received: from localhost ([::1]:35240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ltk-0004ve-2E
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 12:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8ljv-0007wo-Kl
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8ljt-0002xv-Pw
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657039768;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=cj37YC06ir2Er2oJ9FNy4BHhI7imDkeUxmNAbf5UqsI=;
 b=OUUmWgcnOqtbF2OrHkpUBg9YElQpqBuHBx0/PpzI5A+ysaYIU9f4F2atJ52btJ6Aj3tNB3
 rKjXMYnP7KdewHL+zePyPQ+nCELGnch7SJsPIHusoo+EDGKSjfuBx5NUC8j7c2zfk9tY0U
 pY0SLz0RQQ6FMvcuq7Ezlg7HHoPEGLw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-_ECgNLcVNDu3owzkx1hRpQ-1; Tue, 05 Jul 2022 12:49:26 -0400
X-MC-Unique: _ECgNLcVNDu3owzkx1hRpQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 409B91019C88
 for <qemu-devel@nongnu.org>; Tue,  5 Jul 2022 16:49:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36C521415108;
 Tue,  5 Jul 2022 16:49:25 +0000 (UTC)
Date: Tue, 5 Jul 2022 17:49:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Victor Toso <victortoso@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [RFC PATCH v2 7/8] qapi: golang: Add CommandResult type to Go
Message-ID: <YsRrko9mtESnWISa@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-8-victortoso@redhat.com>
 <CABJz62P5-Dxy5fcb9wh-xo9_EX4K89F+2Pnydayg+T6eAt3pkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABJz62P5-Dxy5fcb9wh-xo9_EX4K89F+2Pnydayg+T6eAt3pkw@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 05, 2022 at 08:46:21AM -0700, Andrea Bolognani wrote:
> On Fri, Jun 17, 2022 at 02:19:31PM +0200, Victor Toso wrote:
> > +type EmptyCommandReturn struct {
> > +    CommandId string          `json:"id,omitempty"`
> > +    Error     *QapiError      `json:"error,omitempty"`
> > +    Name      string          `json:"-"`
> > +}
> 
> Do we need a specific type for this? Can't we just generate an
> appropriately-named type for each of the commands that don't return
> any data? It's not like we would have to write that code manually :)

Yes, I think having an explicit named return struct even for commands
not /currently/ returning data is good, and anticipates future changes
that might add extra return data fields to the QAPI schema.

> 
> > +func (r *EmptyCommandReturn) GetCommandName() string {
> > +    return r.Name
> > +}
> 
> Just like Event.GetName() and Command.GetName(), I'm not convinced we
> should have this.
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


