Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E152A2B8366
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 18:54:00 +0100 (CET)
Received: from localhost ([::1]:49502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfReZ-0006va-OO
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 12:53:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfRcX-0005bu-DV
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:51:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfRcT-0006dl-CR
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:51:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605721906;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BP7NwhKIZgKnhn5++mmFpz44kFmRv2peXMYx1/8TJc4=;
 b=fIq9T6B0Ylc/1L3n3dFazoeDWK/c6gbzQkp1sFnt5TF8CUH+JEp2tSY96/P8ac1M+OkfAf
 c11LRC2vDSkfGD8uOBLhBPLitKDBEwdJDpyC0+Xz1/lov1T/9nMm3RYQMAjBH8EMmly9ug
 C/NuhgFY9W57F5tvMe2IJi6sdW0D4JI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-BrgmlWAeP3uw4b4RS2r1dg-1; Wed, 18 Nov 2020 12:51:42 -0500
X-MC-Unique: BrgmlWAeP3uw4b4RS2r1dg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DB91879A08;
 Wed, 18 Nov 2020 17:51:41 +0000 (UTC)
Received: from redhat.com (ovpn-115-41.ams2.redhat.com [10.36.115.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 685A760C05;
 Wed, 18 Nov 2020 17:51:31 +0000 (UTC)
Date: Wed, 18 Nov 2020 17:51:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] trace: use STAP_SDT_V2 to work around symbol visibility
Message-ID: <20201118175128.GH229461@redhat.com>
References: <20201118174809.686094-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201118174809.686094-1-stefanha@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 rjones@redhat.com, fche@redhat.com, kraxel@redhat.com, wcohen@redhat.com,
 mrezanin@redhat.com, ddepaula@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 05:48:09PM +0000, Stefan Hajnoczi wrote:
> QEMU binaries no longer launch successfully with recent SystemTap
> releases. This is because modular QEMU builds link the sdt semaphores
> into the main binary instead of into the shared objects where they are
> used. The symbol visibility of semaphores is 'hidden' and the dynamic
> linker prints an error during module loading:
> 
>   $ ./configure --enable-trace-backends=dtrace --enable-modules ...
>   ...
>   Failed to open module: /builddir/build/BUILD/qemu-4.2.0/s390x-softmmu/../block-curl.so: undefined symbol: qemu_curl_close_semaphore
> 
> The long-term solution is to generate per-module dtrace .o files and
> link them into the module instead of the main binary.
> 
> In the short term we can define STAP_SDT_V2 so /usr/bin/dtrace produces
> an .o file with 'default' symbol visibility instead of 'hidden'. This
> workaround is small and easier to merge for QEMU 5.2.
> 
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: wcohen@redhat.com
> Cc: fche@redhat.com
> Cc: kraxel@redhat.com
> Cc: rjones@redhat.com
> Cc: mrezanin@redhat.com
> Cc: ddepaula@redhat.com
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  trace/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/trace/meson.build b/trace/meson.build
> index d5fc45c628..52be7c5b2c 100644
> --- a/trace/meson.build
> +++ b/trace/meson.build
> @@ -44,7 +44,7 @@ foreach dir : [ '.' ] + trace_events_subdirs
>        trace_dtrace_o = custom_target(fmt.format('trace-dtrace', 'o'),
>                                       output: fmt.format('trace-dtrace', 'o'),
>                                       input: trace_dtrace,
> -                                     command: [ 'dtrace', '-o', '@OUTPUT@', '-G', '-s', '@INPUT@' ])
> +                                     command: [ 'dtrace', '-DSTAP_SDT_V2', '-o', '@OUTPUT@', '-G', '-s', '@INPUT@' ])

I'm a little concerned that we're not also setting this macro before
including the generated trace.h headers, because those headers do
check this STAP_SDT_V1 symbol.

Currently the generated headers have same code for V2 and V3 (the default),
so we won't break, but I'm concerned we could break if they introduce a
future V4 and that impacts the generated headers.

So I think the safe thing todo is set -DSTAP_SDT_V2 as a global compile
arg for QEMU too, so all trace.h files see the symbol that matches the
trace.o files


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


