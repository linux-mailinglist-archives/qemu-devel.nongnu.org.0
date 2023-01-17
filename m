Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 552BF66DFE2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 15:04:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHmZQ-0000N5-BN; Tue, 17 Jan 2023 09:04:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHmZH-0000Lk-98
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:04:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHmZF-0007eB-4c
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:04:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673964240;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=m+DyYDBKzK4XX2k/G8ksyzHEfV0I7PXyMSCjLhYoy1Q=;
 b=JcCDYxQ+qHHRGjplCUNFY6epozUlsXVamSgxZE/SUU2yXellZ0uQdLkUQBqXbZQxa8WhQt
 aZOtbt+knHIknjsVYuVxK5UPDS6zjbzg1Q6KDy+3TaOPpn5iPSSTtvSnf23kvd7JnwzsoN
 gdZJvJAPiSmqMjX+lFKTN9x69P2MMFM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-MIeSioA4NLmF52tKynDp8A-1; Tue, 17 Jan 2023 09:03:31 -0500
X-MC-Unique: MIeSioA4NLmF52tKynDp8A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3A668030CC;
 Tue, 17 Jan 2023 14:02:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C6CB2026D4B;
 Tue, 17 Jan 2023 14:02:52 +0000 (UTC)
Date: Tue, 17 Jan 2023 14:02:50 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 3/3] configure: Enable -Wthread-safety if present
Message-ID: <Y8aqii6iBsdd5rl6@redhat.com>
References: <20230117135203.3049709-1-eesposit@redhat.com>
 <20230117135203.3049709-4-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230117135203.3049709-4-eesposit@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 17, 2023 at 08:52:03AM -0500, Emanuele Giuseppe Esposito wrote:
> From: Kevin Wolf <kwolf@redhat.com>
> 
> This enables clang's thread safety analysis (TSA), which we'll use to
> statically check the block graph locking.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Message-Id: <20221207131838.239125-9-kwolf@redhat.com>
> Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  configure | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configure b/configure
> index 2281892657..14668e6269 100755
> --- a/configure
> +++ b/configure
> @@ -1183,6 +1183,7 @@ add_to warn_flags -Wnested-externs
>  add_to warn_flags -Wendif-labels
>  add_to warn_flags -Wexpansion-to-defined
>  add_to warn_flags -Wimplicit-fallthrough=2
> +add_to warn_flags -Wthread-safety

Does this thread safety analysis have any kind of measurable
impact on compilation speed ?

Our CI jobs are quite sensitive to any increase in build
time.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


