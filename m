Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7377E5284C3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:56:11 +0200 (CEST)
Received: from localhost ([::1]:57118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqaGg-0005Tz-8X
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nqYfH-0004Qy-2b
 for qemu-devel@nongnu.org; Mon, 16 May 2022 07:13:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nqYfD-00031m-08
 for qemu-devel@nongnu.org; Mon, 16 May 2022 07:13:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652699601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bNqZZa7/3sZz0F5CNMXBBEAmvZvF1pxK2MX9hTNoxTA=;
 b=ZLGqGRdVKft02Le2r8HtogVS4qNauPGCbhzKRi8VbA54dfZdRJbQEs37g/d0UPIefNIyJO
 oTIHbFhjrXlkTt/3rxlyaG7wXtf+jlQz1JP57hWXE6AY9ru+ohGBWHPdIUB3aI9+QcNEIa
 1mbOSVmpLyjt+sHzF6SuoZBeJMLrw4U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-8Oi4k856PhOltrU_XvwgPQ-1; Mon, 16 May 2022 07:13:20 -0400
X-MC-Unique: 8Oi4k856PhOltrU_XvwgPQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 v9-20020a05600c214900b00393fedddf26so3969098wml.1
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 04:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bNqZZa7/3sZz0F5CNMXBBEAmvZvF1pxK2MX9hTNoxTA=;
 b=RldXGPAnpo3Pjq/YrQmcknP+0bhYsRa/jYDAOEfQQylWMpYIJbRtw4LAARIwJvyuYR
 IM3diE8aN5Eg/XTufzWQ6N8xCd6K3JD2aRa1PBbN5gNzdxBfEXo9LKIGOMBfGFYavXqd
 l+9FBZx7/bluHCGJk/fNmwgRccWh9ZqZczbL1vQ4wpt1miaTRkbdLHwR10pG5CZA1VvS
 9ZR23T6SX35FnaFf5wKIFWDmSq3W2gUQ71H4JPakDSqrdcEswAukpDSfHScX2nHJZcbY
 nT49UG7WD4sA3FvZ6gcX4MAF2k9979jI51h8+z34VDsFfN8bBrCh0xAtff3CiW5lkzV0
 0LmQ==
X-Gm-Message-State: AOAM531LxUVgtop3hhLPHQylgsXqqv1HebgN7MVOjdkhkdNzlYjA2L8i
 lHvjynGTZU5dcsmGvZnKC0SouAiDyt5jHeElCLo8IeMHtlX0fFVVF9nI6PTF8AadI5JdGJPglFo
 RW6Vn+OTesaqiJQY=
X-Received: by 2002:a5d:6351:0:b0:20d:1028:3c32 with SMTP id
 b17-20020a5d6351000000b0020d10283c32mr1055126wrw.331.1652699599275; 
 Mon, 16 May 2022 04:13:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxE6V9KPcbib1TbSG/qeyRzjruBUaxfpnsYwoKfolYxT3EhNwmsr7hZ/plF8dS31boNHzN0w==
X-Received: by 2002:a5d:6351:0:b0:20d:1028:3c32 with SMTP id
 b17-20020a5d6351000000b0020d10283c32mr1055089wrw.331.1652699598988; 
 Mon, 16 May 2022 04:13:18 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 i6-20020adfa506000000b0020d0931b48asm2644918wrb.37.2022.05.16.04.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 04:13:18 -0700 (PDT)
Date: Mon, 16 May 2022 12:13:16 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH v13 1/8] meson.build: Fix docker-test-build@alpine when
 including linux/errqueue.h
Message-ID: <YoIxzC88w+jQlqoG@work-vm>
References: <20220513062836.965425-1-leobras@redhat.com>
 <20220513062836.965425-2-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513062836.965425-2-leobras@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Leonardo Bras (leobras@redhat.com) wrote:
> A build error happens in alpine CI when linux/errqueue.h is included
> in io/channel-socket.c, due to redefining of 'struct __kernel_timespec':

OK, looks to be same mechanism as other meson tests.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ===
> ninja: job failed: [...]
> In file included from /usr/include/linux/errqueue.h:6,
>                  from ../io/channel-socket.c:29:
> /usr/include/linux/time_types.h:7:8: error: redefinition of 'struct __kernel_timespec'
>     7 | struct __kernel_timespec {
>       |        ^~~~~~~~~~~~~~~~~
> In file included from /usr/include/liburing.h:19,
>                  from /builds/user/qemu/include/block/aio.h:18,
>                  from /builds/user/qemu/include/io/channel.h:26,
>                  from /builds/user/qemu/include/io/channel-socket.h:24,
>                  from ../io/channel-socket.c:24:
> /usr/include/liburing/compat.h:9:8: note: originally defined here
>     9 | struct __kernel_timespec {
>       |        ^~~~~~~~~~~~~~~~~
> ninja: subcommand failed
> ===
> 
> As above error message suggests, 'struct __kernel_timespec' was already
> defined by liburing/compat.h.
> 
> Fix alpine CI by adding test to disable liburing in configure step if a
> redefinition happens between linux/errqueue.h and liburing/compat.h.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  meson.build | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index 9b20dcd143..a996690c9b 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -515,12 +515,23 @@ if not get_option('linux_aio').auto() or have_block
>                             required: get_option('linux_aio'),
>                             kwargs: static_kwargs)
>  endif
> +
> +linux_io_uring_test = '''
> +  #include <liburing.h>
> +  #include <linux/errqueue.h>
> +
> +  int main(void) { return 0; }'''
> +
>  linux_io_uring = not_found
>  if not get_option('linux_io_uring').auto() or have_block
>    linux_io_uring = dependency('liburing', version: '>=0.3',
>                                required: get_option('linux_io_uring'),
>                                method: 'pkg-config', kwargs: static_kwargs)
> +  if not cc.links(linux_io_uring_test)
> +    linux_io_uring = not_found
> +  endif
>  endif
> +
>  libnfs = not_found
>  if not get_option('libnfs').auto() or have_block
>    libnfs = dependency('libnfs', version: '>=1.9.3',
> -- 
> 2.36.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


