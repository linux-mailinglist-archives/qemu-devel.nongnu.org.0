Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D379D3FDF7D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:13:00 +0200 (CEST)
Received: from localhost ([::1]:45374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSrD-0006EN-V2
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mLSCI-00080A-MS
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:30:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mLSCG-00066l-Qk
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630510236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bZE+0tIwllPyqp6hGi2pY21eXyWD8vDCvWZd05nW1jw=;
 b=GLpWV8vYjz54yVPbfYR1jkpuql8DmP4xmBqzw6cz1ogNa+a2IgrKyXq0+o2j64pqY0mmy8
 NLpod8LGbG+tlBNGNq/7+ouVgK6uFu7ZA5JTOXG6X3i+yCK/gIR+J9eHJSvssdepovSb9E
 zIqNoBGe2zOeglZZI5DWzNpUp7vbSDA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-q_ZhWlIiPXqzTmximHIkiA-1; Wed, 01 Sep 2021 11:30:33 -0400
X-MC-Unique: q_ZhWlIiPXqzTmximHIkiA-1
Received: by mail-ed1-f69.google.com with SMTP id
 x4-20020a50d9c4000000b003bed5199871so1465121edj.14
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 08:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bZE+0tIwllPyqp6hGi2pY21eXyWD8vDCvWZd05nW1jw=;
 b=q4EkqvpVxDpHxr0fGi/lgKBsIQlij1YfH+I6f0VvFyJHAcMM9KxQzn3WXImY6HNhdv
 1lAQirhcA5cnYxsr/eCXUFEaFE5mACYnUd8ZsSYF9chikXX+fyXSltkrDJWjNwnjfo60
 bpwOhdsez+BL99YvVWELLDbHnyAt85NvO3m5IVj0xn6LfIMjI2ReMPw7lxmAHB7ACKMA
 FSRuzAFfjh/YJpaF+nPbMkCaVqiHFVTqWojvrpcdjdWdfzEoO3UnibRsGifAWuWEGuSV
 14XSnRCxr/fdYVPUZ+vl9QeG+m0rey/znHEYlAyYEu6ELjOwSuLyFL3wsolz4/G3Brjz
 GUyg==
X-Gm-Message-State: AOAM532zfRBW4Xz6SGbkqQ5hcB12l/6E8fuv/4AHQ/C28bs2q0L+L7f6
 ahv/CSUVaHDJbDA4LsmZqHJqIyMLZZS+O3RM32O3JVfwEPITqkrvHMnlNjWsI2B8FvlRyTKGu3V
 XU2JAYmXzXJZRi10=
X-Received: by 2002:a17:906:abc3:: with SMTP id
 kq3mr11651ejb.382.1630510232224; 
 Wed, 01 Sep 2021 08:30:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsXhBZKHj8FabMd0szGhOehctaNdjTzZUBHoVzvc0R30YDUdIA6j92E8+ohLJFOYmr0zWJyg==
X-Received: by 2002:a17:906:abc3:: with SMTP id
 kq3mr11624ejb.382.1630510231963; 
 Wed, 01 Sep 2021 08:30:31 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it.
 [79.51.2.59])
 by smtp.gmail.com with ESMTPSA id bx14sm102885edb.93.2021.09.01.08.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 08:30:31 -0700 (PDT)
Date: Wed, 1 Sep 2021 17:30:29 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Helge Konetzka <hk@zapateado.de>
Subject: Re: [qemu-web PATCH] Fix link to Windows page in Wiki
Message-ID: <20210901153029.ilbyiqvev7j5vjb3@steredhat>
References: <6755edb6-f953-4ca2-a4b6-31e4566e9842@zapateado.de>
MIME-Version: 1.0
In-Reply-To: <6755edb6-f953-4ca2-a4b6-31e4566e9842@zapateado.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CCing Paolo and Thomas

On Wed, Aug 25, 2021 at 06:43:56PM +0200, Helge Konetzka wrote:
>The appended patch fixes the link to Wiki Windows page on Website 
>Download Sources page.
>
>Furthermore I would like to propose to change the instructions for 
>Native builds with MSYS2 on Wiki Windows page.
>
>Please remove the section which copies system binaries to match the 
>expected file names!
>
>Instead define variables for configure (gcc-ar and gcc-ranlib are 
>existing copies of x86_64-w64-mingw32-gcc-ar and 
>x86_64-w64-mingw32-gcc-ranlib) and add strip to enable make install:
>
>AR=gcc-ar NM=nm OBJCOPY=objcopy RANLIB=gcc-ranlib WINDRES=windres 
>STRIP=strip \
>./configure --cross-prefix=x86_64-w64-mingw32- --enable-gtk --enable-sdl
>
>Signed-off-by: Helge Konetzka <hk@zapateado.de>
>---
> _download/source.html | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/_download/source.html b/_download/source.html
>index 35fd156..8671f4e 100644
>--- a/_download/source.html
>+++ b/_download/source.html
>@@ -2,7 +2,7 @@
>        <p>Grab the source code for the latest releases and compile it 
>yourself!
>        Detailed compilation instructions can be found in the wiki for
>                <a href="https://wiki.qemu.org/Hosts/Linux">Linux</a>,
>-               <a href="https://wiki.qemu.org/Hosts/Windows">Win32</a> and
>+               <a href="https://wiki.qemu.org/Hosts/W32">Win32</a> and
>                <a href="https://wiki.qemu.org/Hosts/Mac">macOS</a>.</p>
>
>        <div id="releases">
>-- 
>2.20.1
>


