Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096C558AA6F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 13:59:40 +0200 (CEST)
Received: from localhost ([::1]:44742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJvzO-0008Ja-Ua
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 07:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJvwi-0003fe-9z
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:56:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJvwd-0000ts-FT
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659700606;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ySyX//dru8a8etD4WroNYpO5oE64A4HWlCADYzm86s0=;
 b=E2KzKcPGG1v9qsSR2UfYW6jOoQOQcf401EHUNgdH3c/XatAyuTWv+QvkGKtbKrhwmAujT2
 HANNiMLGnFmTQy36FYWq1N3oxzoMdYaDeMTa5TmMZgFLLLRzRbAQ6gGBrUDkPyueX/u/oX
 ov4KfIKfiWSjTMpLYnyqXcrxiTpBDkc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-CrYMKDntPdGPRHE6-nh35w-1; Fri, 05 Aug 2022 07:56:45 -0400
X-MC-Unique: CrYMKDntPdGPRHE6-nh35w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4BEE10AF7C4
 for <qemu-devel@nongnu.org>; Fri,  5 Aug 2022 11:56:44 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10A65909FE;
 Fri,  5 Aug 2022 11:56:43 +0000 (UTC)
Date: Fri, 5 Aug 2022 12:56:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH for-7.1] vl: fix [memory] section with -readconfig
Message-ID: <Yu0FeURQKIfdrFAu@redhat.com>
References: <20220805100635.493961-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220805100635.493961-1-pbonzini@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 05, 2022 at 12:06:35PM +0200, Paolo Bonzini wrote:
> The -M memory.* options do not have magic applied to them than the -m
> option, namely no "M" (for mebibytes) is tacked at the end of a
> suffixless value for "-M memory.size".
> 
> This magic is performed by parse_memory_options, and we have to
> do it for both "-m" and the [memory] section of a config file.
> Storing [memory] sections directly to machine_opts_dict changed
> the meaning of
> 
>     [memory]
>       size = "1024"
> 
> in a -readconfig file from 1024MiB to 8KiB (1024 Bytes rounded up to
> 8KiB silently).  To avoid this, the [memory] section has to be
> changed back to QemuOpts (combining [memory] and "-m" will work fine
> thanks to .merge_lists being true).
> 
> Change parse_memory_options() so that, similar to the older function
> set_memory_options(), it operates after command line parsing is done;
> and also call it where set_memory_options() used to be.
> 
> Note, the parsing code uses exit(1) instead of exit(EXIT_FAILURE) to
> match neighboring code.
> 
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Fixes: ce9d03fb3f ("machine: add mem compound property", 2022-05-12)
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  softmmu/vl.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)

I wrote a qtest (see cc'd separate mail) to validate -readconfig
handling of '[memory]' and this change makes the test pass, so
on that basis

Tested-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


