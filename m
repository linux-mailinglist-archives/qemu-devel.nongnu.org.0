Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5044C6E5CB9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 11:00:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pohCW-00054x-Nh; Tue, 18 Apr 2023 05:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pohCS-00054a-0W
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 05:00:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pohCN-0004zx-Vs
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 05:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681808424;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=tI3j5zuCzWg8t7Vz2OYPYgyTbSj70DwkHauJjS5ClD4=;
 b=ikotkHCTsFtdepw1A2oPHnU0P299BtyUJ0B+eFsKjGBbnjU2Z1+5Oy5r2CYib0pAJcxPNY
 3zDdubecOp4Qc3stwhluy1B7RnWVTSxzfKtUBVM3Zri0CDKcBnmO4OQ8xC2fVnb+uPRFG6
 YJ+gLOcXuYD9iOjkkrpujIlZDOcsLw4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-KvsCWbdlPrWkiFKYzZZ0Hg-1; Tue, 18 Apr 2023 05:00:23 -0400
X-MC-Unique: KvsCWbdlPrWkiFKYzZZ0Hg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAF7D1C05EBB
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 09:00:22 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29E3A453908;
 Tue, 18 Apr 2023 09:00:22 +0000 (UTC)
Date: Tue, 18 Apr 2023 10:00:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: casantos@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH V4] tracing: install trace events file only if necessary
Message-ID: <ZD5cJGFrFkpuQHx5@redhat.com>
References: <20230408010410.281263-1-casantos@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230408010410.281263-1-casantos@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Copying Stefan as the trace subsystem maintainer

On Fri, Apr 07, 2023 at 10:04:10PM -0300, casantos@redhat.com wrote:
> From: Carlos Santos <casantos@redhat.com>
> 
> It is not useful when configuring with --enable-trace-backends=nop.
> 
> Signed-off-by: Carlos Santos <casantos@redhat.com>
> ---
> Changes v1->v2:
>   Install based on chosen trace backend, not on chosen emulators.
> Changes v2->v3:
>   Add missing comma
> Changes v3->v4:
>   Fix array comparison:
>     get_option('trace_backends') != [ 'nop' ]
>   not
>     get_option('trace_backends') != 'nop'
> ---
>  trace/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/trace/meson.build b/trace/meson.build
> index 8e80be895c..30b1d942eb 100644
> --- a/trace/meson.build
> +++ b/trace/meson.build
> @@ -64,7 +64,7 @@ trace_events_all = custom_target('trace-events-all',
>                                   input: trace_events_files,
>                                   command: [ 'cat', '@INPUT@' ],
>                                   capture: true,
> -                                 install: true,
> +                                 install: get_option('trace_backends') != [ 'nop' ],
>                                   install_dir: qemu_datadir)
>  
>  if 'ust' in get_option('trace_backends')
> -- 
> 2.31.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


