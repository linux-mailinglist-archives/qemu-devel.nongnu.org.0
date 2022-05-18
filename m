Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF3252BB42
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 14:58:50 +0200 (CEST)
Received: from localhost ([::1]:57882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrJGL-0002PT-62
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 08:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrJ6N-0000Bt-9e
 for qemu-devel@nongnu.org; Wed, 18 May 2022 08:48:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrJ6L-0003EF-Li
 for qemu-devel@nongnu.org; Wed, 18 May 2022 08:48:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652878108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tJ9xLc1aj1OvlaaL8IlbXIoG1En70o4QGF7uSJBXs0E=;
 b=Gpc8NwOuA/zqTAbv8dK2g5XSyLvgR/DePbOQSaULcJ12NtOUhnCvDhTZogA0TUkxZW+spC
 KomptqgIn5duDvSvsBTMJCBegRoTMVUT+v7gCBKAQkQORMJozitKXI4duPkUN6lqzW62D+
 3JwKb0V+GsYK0laJxWEiavkg0Syn5mg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-9nolqWLdPtOzcNZeypTpzw-1; Wed, 18 May 2022 08:48:24 -0400
X-MC-Unique: 9nolqWLdPtOzcNZeypTpzw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E8DC18E5340;
 Wed, 18 May 2022 12:48:24 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B037400E114;
 Wed, 18 May 2022 12:48:24 +0000 (UTC)
Date: Wed, 18 May 2022 07:48:22 -0500
From: Eric Blake <eblake@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 06/10] block: Make 'bytes' param of bdrv_co_{pread,
 pwrite, preadv, pwritev}() an int64_t
Message-ID: <20220518124822.vn6d4bgbh3gbcnri@redhat.com>
References: <20220513155418.2486450-1-afaria@redhat.com>
 <20220513155749.2488070-4-afaria@redhat.com>
 <20220517143221.3vzwjierhnl4wx4x@redhat.com>
 <CAELaAXzG6z1fBs-B3PqoO=HZkb+Z-Umdj5+KKRnhHmdt3nV9WA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAELaAXzG6z1fBs-B3PqoO=HZkb+Z-Umdj5+KKRnhHmdt3nV9WA@mail.gmail.com>
User-Agent: NeoMutt/20220429-71-6f7d3e
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 17, 2022 at 03:48:59PM +0100, Alberto Faria wrote:
> On Tue, May 17, 2022 at 3:33 PM Eric Blake <eblake@redhat.com> wrote:
> > ...now end up calling QEMU_IOVEC_INIT_BUF() which tries to do
> > .local_iov.iov_len = bytes, which can silently overflow on 32-bit
> > platforms where iov_len is size_t.  We need to add a code guard that
> > callers do not pass in too large of a buffer.
> 
> I see. blk_co_pread() and blk_co_pwrite() use assert(bytes <=
> SIZE_MAX). Would that be an appropriate safeguard here? Or should we
> return an error?

I'd be okay with the assert.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


