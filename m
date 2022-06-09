Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413AB544C47
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:37:58 +0200 (CEST)
Received: from localhost ([::1]:46654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHQD-00074I-9C
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzFGK-0005Te-Rd
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:19:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzFGH-00007h-Dz
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654769972;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6n8czDWK3CfDXiJhydFblRqiDal/vNJ9JFA2b7hUHOo=;
 b=UF3mthG/UKFRP7Hm6XJyrOSgp5vTo56YiReITXuugaTWjU/Iuz03dxZ/Ckvpf0JqzRLMxI
 wKAvjnYnOOPN01IhLr1YjhSrNufKMmtctsXbckWB+fx3HC9u4Xe6Uil7dMXOMUhwtksm3k
 MaqKOYrYcHueF6wCpNfpNvVD6vTak6c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-CuxxU69NPcSqlsov7Ufpsw-1; Thu, 09 Jun 2022 06:19:29 -0400
X-MC-Unique: CuxxU69NPcSqlsov7Ufpsw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 513C5101AA46;
 Thu,  9 Jun 2022 10:19:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FF09492C3B;
 Thu,  9 Jun 2022 10:19:25 +0000 (UTC)
Date: Thu, 9 Jun 2022 11:19:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 David Hildenbrand <david@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PULL 15/18] qapi: introduce x-query-ramblock QMP command
Message-ID: <YqHJKgA5OG80dljx@redhat.com>
References: <20211102175700.1175996-1-berrange@redhat.com>
 <20211102175700.1175996-16-berrange@redhat.com>
 <073c1687-d30f-8f41-b87e-83372137708a@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <073c1687-d30f-8f41-b87e-83372137708a@suse.de>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jun 09, 2022 at 12:07:31PM +0200, Claudio Fontana wrote:
> Hello all,
> 
> it would be really good to be able to rely on this command or something similar,
> to be able to know the approximate size of a migration before starting it.
> 
> in QEMU ram_bytes_total() returns what I would like to have,
> but there is currently no QMP way to get it without starting a migration,
> which when trying to optimize it/size it is just about too late.

Aside from the main VM RAM, what other RAM blocks are likely to have
a size large enough to be of consequence to the live migration
data copy, and whose size is not already known to the mgmt app from
the guest config choices it made ? VGA RAM could be a few 100MB I
guess, but the mgmt app knows about that. I've always assumed everything
else is just noise in comparison to the main RAM region.

Still I wonder how useful this is as its just a static figure, and the
problems with migration transfer are the bulking up of data when the
VM is repeatedly dirtying stuff at a high rate.

> Do you think x-query-ramblock could be promoted to non-experimental?

It would have to be re-written, as this current impl is just emitting
a huge printf formatted string. To be considered supportable, the data
would have to be formally modelled in QAPI instead.

IOW, it would be a case of introducing a new command that emits formal
data, convertintg 'info ramblock' to use that, and then deprecating this 
x-query-ramblock.

> Should another one be made available instead, like :
> query-ram-bytes-total ?

That would be simpler if you're just wanting it to give a single
figure.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


