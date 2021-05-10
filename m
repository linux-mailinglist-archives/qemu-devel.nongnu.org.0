Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFF0379355
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 18:04:53 +0200 (CEST)
Received: from localhost ([::1]:59504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg8Oq-0005Pm-C4
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 12:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lg8I7-0006kh-TI
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:57:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lg8I0-0000w2-K8
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620662266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RZw1jFC2P7vzQaRG/Q4BNw61NHhwKmc/W8+5LPn5+EI=;
 b=eVxK0ZxRuvXxLOPwOMFqHMlq9pcONg04WtJzQJl3MgriTfzFeDYdCSjOJzl84ElWN9JN07
 7tC60EbaRbpIa6bPV5wDLo6YJ+B3VA8xv8LgA1cB7MMX5CaYGm5PpkjBibAjZiklHi9TKz
 HUBG4jKF4Rp/5ZmcL7/YOVPG5iV0DMA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-NNTMZd9zPkSETxudLskBog-1; Mon, 10 May 2021 11:57:42 -0400
X-MC-Unique: NNTMZd9zPkSETxudLskBog-1
Received: by mail-ej1-f70.google.com with SMTP id
 gt39-20020a1709072da7b02903a8f7736a08so3833659ejc.1
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RZw1jFC2P7vzQaRG/Q4BNw61NHhwKmc/W8+5LPn5+EI=;
 b=WrUU5x00u1+kg333UxIQRRHAzbiPa9XdddM1elWNbpF6e52/P7PBBQUVTi/+FnXRhu
 WJ9tBZRLJ9UOUtpoIVhASoo/gmLisdo9n9xXPQ6E6wAxqixyFCeGYnAqAaA+C9ikZTpQ
 EkbWJOngo72h7Zm9gPQstk80IY2308/aBDSzzzc9LbnvJDFmfDCT7f5HNptx95L26xd8
 nxIm4FvNPCOweddTznnHbyYdqjx/zB//2nGPMnOSu+PJ5Dr/uqX9HEjTT8trCaGHz1K+
 qc5S3r7lFcryriYPXM03/TVfR3tKQW5ruvEyn0hJG6xQp07rg+35+D4mThBmO9bOQ6vP
 Dzeg==
X-Gm-Message-State: AOAM5322fei1SilM14u9AhigFYvKgE0inX2dVj/GDVIPq1CKWcQAI1k1
 KYX2qgzq7SYbqWNpBblulfGKgtKBaQS28SjRfg5GW5FBvrbnUtkvK9PUcCOfky365apzHR54vDn
 kBTzONl90YdqmGC8=
X-Received: by 2002:a17:906:3d7:: with SMTP id
 c23mr27088494eja.188.1620662261202; 
 Mon, 10 May 2021 08:57:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzrc7tLHdQQDt8tobng7lXZ5HE7+JdDl6QummKpL3mLXVzffvc8iaqWQijpyJXx7VKiJJQWg==
X-Received: by 2002:a17:906:3d7:: with SMTP id
 c23mr27088479eja.188.1620662261021; 
 Mon, 10 May 2021 08:57:41 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id x7sm9406487ejc.116.2021.05.10.08.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 08:57:40 -0700 (PDT)
Date: Mon, 10 May 2021 17:57:38 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] cutils: fix memory leak in get_relocated_path()
Message-ID: <20210510155738.a4jk42yb2vqubblj@steredhat>
References: <20210412170255.231406-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210412170255.231406-1-sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping :-)

Should I resend for 6.1?

Thanks
Stefano

On Mon, Apr 12, 2021 at 07:02:55PM +0200, Stefano Garzarella wrote:
>get_relocated_path() allocates a GString object and returns the
>character data (C string) to the caller without freeing the memory
>allocated for that object as reported by valgrind:
>
>  24 bytes in 1 blocks are definitely lost in loss record 2,805 of 6,532
>     at 0x4839809: malloc (vg_replace_malloc.c:307)
>     by 0x55AABB8: g_malloc (in /usr/lib64/libglib-2.0.so.0.6600.8)
>     by 0x55C2481: g_slice_alloc (in /usr/lib64/libglib-2.0.so.0.6600.8)
>     by 0x55C4827: g_string_sized_new (in /usr/lib64/libglib-2.0.so.0.6600.8)
>     by 0x55C4CEA: g_string_new (in /usr/lib64/libglib-2.0.so.0.6600.8)
>     by 0x906314: get_relocated_path (cutils.c:1036)
>     by 0x6E1F77: qemu_read_default_config_file (vl.c:2122)
>     by 0x6E1F77: qemu_init (vl.c:2687)
>     by 0x3E3AF8: main (main.c:49)
>
>Let's use g_string_free(gstring, false) to free only the GString object
>and transfer the ownership of the character data to the caller.
>
>Fixes: f4f5ed2cbd ("cutils: introduce get_relocated_path")
>Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>---
> util/cutils.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/util/cutils.c b/util/cutils.c
>index ee908486da..c9b91e7535 100644
>--- a/util/cutils.c
>+++ b/util/cutils.c
>@@ -1055,5 +1055,5 @@ char *get_relocated_path(const char *dir)
>         assert(G_IS_DIR_SEPARATOR(dir[-1]));
>         g_string_append(result, dir - 1);
>     }
>-    return result->str;
>+    return g_string_free(result, false);
> }
>-- 
>2.30.2
>
>


