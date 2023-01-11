Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA79B665B12
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 13:11:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFZwc-0001Gt-U4; Wed, 11 Jan 2023 07:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFZwa-0001EV-Jz
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 07:11:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFZwY-0005yJ-RT
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 07:11:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673439057;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=3IEeE2SI/VvR5TjHhjpxE9Uifws8p8zg+4BJ9WEjtp4=;
 b=FQ3yIFM2r5m/AjKlPMFUatzdjd1b+Yk11AOJaSX3sAntMZGbeAkSm552TkHxXT8d3ZGJdb
 ozp+MqajtW1eQF0LssOnaOtDvnhVJFTx6IghK+lm6rlZaO2IWnmgQI85aBX4hUtyLtNygu
 W8Jj1+M84VY8kLZ78uZ8SzePDeR9ucY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-dxicMeLLMgWUFYDPncPQ7g-1; Wed, 11 Jan 2023 07:10:56 -0500
X-MC-Unique: dxicMeLLMgWUFYDPncPQ7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5649C3C0F223;
 Wed, 11 Jan 2023 12:10:56 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0F4C40C2064;
 Wed, 11 Jan 2023 12:10:55 +0000 (UTC)
Date: Wed, 11 Jan 2023 12:10:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Emilio Cota <cota@braap.org>
Cc: qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 2/2] tcg: use QTree instead of GTree
Message-ID: <Y76nTaoek2kVtLqJ@redhat.com>
References: <20230111035536.309885-1-cota@braap.org>
 <20230111035536.309885-3-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230111035536.309885-3-cota@braap.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 10, 2023 at 10:55:36PM -0500, Emilio Cota wrote:
> qemu-user can hang in a multi-threaded fork. One common
> reason is that when creating a TB, between fork and exec
> we manipulate a GTree whose memory allocator (GSlice) is
> not fork-safe.
> 
> Although POSIX does not mandate it, the system's allocator
> (e.g. tcmalloc, libc malloc) is probably fork-safe.
> 
> Fix some of these hangs by using QTree, which uses
> the system's allocator.
> 
> For more details, see:
>   https://gitlab.com/qemu-project/qemu/-/issues/285
> 
> Performance impact on linux-user:
> - ~2% slowdown in spec06
> - 1.05% slowdown in Nbench-int
> - 4.51% slowdown in Nbench-fp

What do you get *before* applying this patch, if you just run
linux-user with G_SLICE=always-malloc set ?

Also what libc impl were you testing with ? glibc or musl or something
else ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


