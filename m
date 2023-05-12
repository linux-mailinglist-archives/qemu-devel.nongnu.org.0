Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16914700D05
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 18:27:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxVaq-0004PO-Ea; Fri, 12 May 2023 12:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxVak-0004G4-9W
 for qemu-devel@nongnu.org; Fri, 12 May 2023 12:26:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxVac-0007uk-QB
 for qemu-devel@nongnu.org; Fri, 12 May 2023 12:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683908753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=paIIbWx7F0DQgsYmLEbMy4l1NjMEGOuJM1TSgiQR41U=;
 b=Ip8WJ0SYfRN6sUkH7j3MaheyeU6rxwOCIzOMu2a4IJw436/TVMN15uXf9yYeeKQzo/vTe0
 5jNHxayTttsHtPLhWSUU6Bt7YwIJPF21Pwljrd6Y3ehWMXdFX9wUX3ifufPuuBFyaZnwVR
 B7MDiY9FtVV0i9QJLd1vZTcuwNsrSIg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-B2sE9YYoPJaRLnenGyKaiQ-1; Fri, 12 May 2023 12:25:50 -0400
X-MC-Unique: B2sE9YYoPJaRLnenGyKaiQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC42480101C;
 Fri, 12 May 2023 16:25:49 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32EFE492C13;
 Fri, 12 May 2023 16:25:48 +0000 (UTC)
Date: Fri, 12 May 2023 11:25:46 -0500
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com, armbru@redhat.com, richard.henderson@linaro.org, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, Peter Lieven <pl@kamp.de>,
 Michael Roth <michael.roth@amd.com>, 
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "open list:GLUSTER" <qemu-block@nongnu.org>, 
 "open list:GLUSTER" <integration@gluster.org>
Subject: Re: [PATCH v2 07/19] cutils: Adjust signature of parse_uint[_full]
Message-ID: <iuxa2bqzonrack5hanzmawypizccjc75izn574c4pxp3asnqe7@6tgeodedjaot>
References: <20230512021033.1378730-1-eblake@redhat.com>
 <20230512021033.1378730-8-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512021033.1378730-8-eblake@redhat.com>
User-Agent: NeoMutt/20230512
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On Thu, May 11, 2023 at 09:10:21PM -0500, Eric Blake wrote:
> 
> It's already confusing that we have two very similar functions for
> wrapping the parse of a 64-bit unsigned value, differing mainly on
> whether they permit leading '-'.  Adjust the signature of parse_uint()
> and parse_uint_full() to be like all of qemu_strto*(): put the result
> parameter last, use the same types (uint64_t is not always the same as
> unsigned long long, and mark endptr const (only latter affects the

I blame my late night editing.  Looks better as:

...use the same types (uint64_t and unsigned long long have the same
width, but are not always the same type), and mark endptr const (this
latter change only affects the...

> rare caller of parse_uint).  Adjust all callers in the tree.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  include/qemu/cutils.h         |   5 +-
>  audio/audio_legacy.c          |   4 +-
>  block/gluster.c               |   4 +-
>  block/nfs.c                   |   4 +-
>  blockdev.c                    |   4 +-
>  contrib/ivshmem-server/main.c |   4 +-
>  qapi/opts-visitor.c           |  10 +--
>  tests/unit/test-cutils.c      | 113 +++++++++++++++-------------------
>  ui/vnc.c                      |   4 +-
>  util/cutils.c                 |  13 ++--
>  util/guest-random.c           |   4 +-
>  util/qemu-sockets.c           |  10 +--
>  12 files changed, 82 insertions(+), 97 deletions(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


