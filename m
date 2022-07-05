Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D39567406
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 18:16:33 +0200 (CEST)
Received: from localhost ([::1]:34764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8lE0-0002fH-1H
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 12:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8lBH-0001GG-3m
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:13:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8lBD-0005K7-Od
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:13:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037619;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=rNx3iGy0iBrCXt+Jto13vtggVgwxyXKAFNCwJnP7rtE=;
 b=YW7TRzbDo6NsZ2vmSRzuD1EC6/ejobyL66t6nxCR4n0D5GUxO8tfkQML1+6muNW6ohutQk
 sQGZd9DXDhUHYqaLcT4ixbvf/x8awsl5G/m83qwrrtUiS1vdacbeutJCuAcq+jBdWy11yR
 PmZ6Glw0dzL9V/X1blNfJv4OFGWIF1g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-Jl22DG0QMb61ziuXubG2vw-1; Tue, 05 Jul 2022 12:13:36 -0400
X-MC-Unique: Jl22DG0QMb61ziuXubG2vw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF23D2A59547;
 Tue,  5 Jul 2022 16:13:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D1FE2166B26;
 Tue,  5 Jul 2022 16:13:33 +0000 (UTC)
Date: Tue, 5 Jul 2022 17:13:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alberto Garcia <berto@igalia.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>
Subject: Re: [RFC 0/8] Introduce an extensible static analyzer
Message-ID: <YsRjK0S+EywKWgp8@redhat.com>
References: <20220702113331.2003820-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220702113331.2003820-1-afaria@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 02, 2022 at 12:33:23PM +0100, Alberto Faria wrote:
> This series introduces a static analyzer for QEMU. It consists of a
> single static-analyzer.py script that relies on libclang's Python
> bindings, and provides a common framework on which arbitrary static
> analysis checks can be developed and run against QEMU's code base.
> 
> Summary of the series:
> 
>   - Patch 1 adds the base static analyzer, along with a simple check
>     that finds static functions whose return value is never used, and
>     patch 2 fixes some occurrences of this.
> 
>   - Patch 3 adds a check to ensure that non-coroutine_fn functions don't
>     perform direct calls to coroutine_fn functions, and patch 4 fixes
>     some violations of this rule.
> 
>   - Patch 5 adds a check to enforce coroutine_fn restrictions on
>     function pointers, namely around assignment and indirect calls, and
>     patch 6 fixes some problems it detects. (Implementing this check
>     properly is complicated, since AFAICT annotation attributes cannot
>     be applied directly to types. This part still needs a lot of work.)
> 
>   - Patch 7 introduces a no_coroutine_fn marker for functions that
>     should not be called from coroutines, makes generated_co_wrapper
>     evaluate to no_coroutine_fn, and adds a check enforcing this rule.
>     Patch 8 fixes some violations that it finds.


FWIW, after applying this series 'make check' throws lots of failures
and hangs for me in the block I/O tests, so something appears not quite
correct here. I didn't bother to investigate/debug since you marked this
as just an RFC

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


