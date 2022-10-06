Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1602D5F6D90
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 20:38:23 +0200 (CEST)
Received: from localhost ([::1]:50600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogVlF-0000xr-Mm
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 14:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogVN2-00018u-RA
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:13:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogVMv-0008Fo-1S
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:13:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665079987;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y34NGuoVI92+mnDLQmEGyoTFefQyTICsHqHTcsz0JJU=;
 b=RdXphcNuHEpjipdUBUzveODtWzMvtIhYxl98WL4zleV3+5oRbqBxyr4NVRABEX0UIAK6L+
 0E5JhK12fIMCk26fJbYv3E5K+Y2tL6P/+sUxtS/qBixACjN3wOuggDg6DNrf+xH1Aa5qi7
 ihEpzO+ajSI8XgQS2tAIp3qbadHWh18=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-k25znisCNVODtvm3F002lw-1; Thu, 06 Oct 2022 14:13:01 -0400
X-MC-Unique: k25znisCNVODtvm3F002lw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 762B2811E67;
 Thu,  6 Oct 2022 18:13:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62EBBC15BA4;
 Thu,  6 Oct 2022 18:12:58 +0000 (UTC)
Date: Thu, 6 Oct 2022 19:12:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, ncopa@alpinelinux.org,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] linux-user,bsd-user: re-exec with G_SLICE=always-malloc
Message-ID: <Yz8aqBq7m0wn0jvS@redhat.com>
References: <20221004120047.857591-1-berrange@redhat.com>
 <5c5849a3-6830-8577-c427-02cb3244ba8c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c5849a3-6830-8577-c427-02cb3244ba8c@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 04, 2022 at 07:59:18AM -0700, Richard Henderson wrote:
> On 10/4/22 05:00, Daniel P. Berrangé wrote:
> > g_slice uses a one-time initializer to check the G_SLICE env variable
> > making it hard for QEMU to set the env before any GLib API call has
> > triggered the initializer. Even attribute((constructor)) is not
> > sufficient as QEMU has many constructors and there is no ordering
> > guarantee between them.
> 
> There are orderings for constructors, see __attribute__((constructor(priority))).

Oh, thanks for pointing that out. I tried it, but glib threw 
a bag of rocks at me ;-P

The priority works for ordering within the scope of the binary
containing the constructor.

libglib.so itself has a constructor function registered, and that
calls APIs that trigger GSlice initialization:

#0  g_slice_init_nomessage () at ../glib/gslice.c:443
#1  0x00007ffff7ecbd6e in thread_memory_from_self () at ../glib/gslice.c:560
#2  thread_memory_from_self () at ../glib/gslice.c:550
#3  g_slice_alloc (mem_size=96) at ../glib/gslice.c:1050
#4  0x00007ffff7e9ca02 in g_hash_table_new_full (hash_func=0x7ffff7e91a00 <g_str_hash>, 
    key_equal_func=0x7ffff7e91a70 <g_str_equal>, key_destroy_func=0x0, value_destroy_func=0x0)
    at ../glib/ghash.c:1071
#5  0x00007ffff7ebf313 in g_quark_init () at ../glib/gquark.c:61
#6  0x00007ffff7e77d79 in glib_init () at ../glib/glib-init.c:339
#7  glib_init () at ../glib/glib-init.c:328
#8  glib_init_ctor () at ../glib/glib-init.c:453
#9  0x00007ffff7fcbf7e in call_init (env=0x7fffffffdb80, argv=0x7fffffffdb68, argc=2, l=<optimized out>)
    at dl-init.c:70
#10 call_init (l=<optimized out>, argc=2, argv=0x7fffffffdb68, env=0x7fffffffdb80) at dl-init.c:26
#11 0x00007ffff7fcc06c in _dl_init (main_map=0x7ffff7ffe2a0, argc=2, argv=0x7fffffffdb68, env=0x7fffffffdb80)
    at dl-init.c:117
#12 0x00007ffff7fe3d4a in _dl_start_user () from /lib64/ld-linux-x86-64.so.2


This all takes place when libglib.so is loaded, which happens prior
to any code in QEMU being loaded / executed. So no constructor in
QEMU code can ever pre-empt this in dynamic builds.


The only possible silver linining is that in static linked builds,
it appears that a QEMU constructor with priority 101, will pre-empt
the constructor from any library. This is kind of crazy, as it means
if any library or app code uses priorities, it'll get totally different
execution ordering depending on whether it is dynamic or statically
built. 

I guess we could rely on this hack if we declare that everyone using
binfmt is probably relying on static linked QEMU, and in non-binfmt
cases people can set the env var themselves.  It still feels pretty
dirty.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


