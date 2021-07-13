Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652DD3C71FE
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:20:42 +0200 (CEST)
Received: from localhost ([::1]:41938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JH7-0004AG-D5
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3Is2-0001jt-HH
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:54:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3Is0-00043k-5m
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626184483;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5is6YPuVMf7wMFyyVjJqqdGLAGYZdzE4kdRAIqEh0KI=;
 b=F4SR0mdY893Kx8sUlhR412HqnYxVmF/xhcDqyoCDKC66yQ/zNgRY4Q9YKOEypHKD69vmOB
 WkwbsHbV7xitaZtFrHXXpL4mWI0npo/xwd8BB6HWsTiz4om8TJTSizZHiurOcfj0eoUF2/
 9EYyAY+IGlacegAN1pd9ZMxQRU/oegM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-UsedLM0-NouTNiFhIG2j6A-1; Tue, 13 Jul 2021 09:54:39 -0400
X-MC-Unique: UsedLM0-NouTNiFhIG2j6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C276610C1ADC;
 Tue, 13 Jul 2021 13:54:38 +0000 (UTC)
Received: from redhat.com (ovpn-113-1.ams2.redhat.com [10.36.113.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2D405D6AB;
 Tue, 13 Jul 2021 13:54:37 +0000 (UTC)
Date: Tue, 13 Jul 2021 14:54:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] meson: fix condition for io_uring stubs
Message-ID: <YO2bGlLhH8eY9Ff1@redhat.com>
References: <20210712151810.508249-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210712151810.508249-1-pbonzini@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021 at 05:18:10PM +0200, Paolo Bonzini wrote:
> CONFIG_LINUX_IO_URING is not included in config-host.mak and therefore is
> not usable in "when" clauses.  Check the availability of the library,
> which matches the condition for the non-stubbed version block/io_uring.c.
> 
> At this point, the difference between libraries that have config-host.mak
> entries and those that do not is quite confusing.  The remaining ~dozen
> should be converted in 6.2.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  stubs/meson.build | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/stubs/meson.build b/stubs/meson.build
> index 2e79ff9f4d..d3fa8646b3 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -15,7 +15,9 @@ stub_ss.add(files('fdset.c'))
>  stub_ss.add(files('fw_cfg.c'))
>  stub_ss.add(files('gdbstub.c'))
>  stub_ss.add(files('get-vm-name.c'))
> -stub_ss.add(when: 'CONFIG_LINUX_IO_URING', if_true: files('io_uring.c'))
> +if linux_io_uring.found()
> +  stub_ss.add(files('io_uring.c'))
> +endif
>  stub_ss.add(files('iothread-lock.c'))
>  stub_ss.add(files('isa-bus.c'))
>  stub_ss.add(files('is-daemonized.c'))
> -- 
> 2.31.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


