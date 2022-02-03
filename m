Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58854A8C98
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 20:39:48 +0100 (CET)
Received: from localhost ([::1]:34336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFhxL-0002To-PL
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 14:39:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nFhEX-0004pg-9T
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:53:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nFhET-00043V-Um
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:53:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643914403;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=au3dgQrrFka8/8BraLtZquNsKQXKy2WzOPfIhauBV30=;
 b=PnnlUBg06s2Lw0zVJp4vGgAPG/f15tGj+STDsRzhUbgSsf29688Hav5OTG2CmwiT52gjc/
 Q9C8XqIg8zRGt9jFM9TXQAQ4IBoN9D/hEIN6MDvXAS6LzjE9Ym24pOzJPu/3/g0QEJKuM3
 Ujn1l/BySC2ZhNwzPZdF/3Ro6cs5jlU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-BUD7NoC3OJKetOEhagKvyg-1; Thu, 03 Feb 2022 13:53:17 -0500
X-MC-Unique: BUD7NoC3OJKetOEhagKvyg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18BFA1B18BC2;
 Thu,  3 Feb 2022 18:53:16 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EDB27C0FD;
 Thu,  3 Feb 2022 18:53:04 +0000 (UTC)
Date: Thu, 3 Feb 2022 18:53:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 1/3] qmp: Support for querying stats
Message-ID: <YfwkjuF/OwjJ7oL1@redhat.com>
References: <20220131194312.1192626-1-mark.kanda@oracle.com>
 <20220131194312.1192626-2-mark.kanda@oracle.com>
 <YfkiyiK+jfrdbVcY@redhat.com>
 <c8b8434f-17c2-5a50-bc7f-49bb7fa9f7b9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c8b8434f-17c2-5a50-bc7f-49bb7fa9f7b9@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 03, 2022 at 07:38:08PM +0100, Paolo Bonzini wrote:
> On 2/1/22 13:08, Daniel P. Berrangé wrote:
> > I still feel like this is rather verbose, and should be simplified
> > down to.
> > 
> >   { "return": {
> >       "vm": {
> >         "kvm": [ ... ]
> >         "provider-XYZ": [ ... ],
> >         ...
> >       }
> >   }
> 
> My main qualm with this is that not just QEMU, but every layer above then
> needs to either treat stats as a "dynamic" type unless they want to only
> handle providers that they know.
> 
> The main reason why I asked Mark to do all this work, was so that new stats
> and stats providers could be added transparently, and only new *targets*
> would need work all over the stack (but those are fewer, for example
> blockdev/netdev/iothread).

Hmm, yes, i see what you mean.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


