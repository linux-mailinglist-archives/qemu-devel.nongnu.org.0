Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FC84BAF40
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 02:49:47 +0100 (CET)
Received: from localhost ([::1]:46928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKsP4-0004ca-L9
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 20:49:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKsNo-0003FN-Lg
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 20:48:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKsNk-0004lj-Dn
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 20:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645148887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/FDdTeByvEGdAuKOwgsh5RaDyqHPkfOqgfXxzhEqk5Q=;
 b=ZWTaIkoIT9VyDkCthfs+ZKWTvHzu6Ty4XPvjSiKx79Z3hEQ82ZiWbg+5LQvmF86bKNsKuJ
 GlBxhdRr7uAqlVEd6AxdpjD68n0a4TfC+3DlTMzrB8cijmwg4mc/vXLBqH0KmdZTiAbZOi
 o/FkiySmKekqaBjUG3gFpNZLrRLeh+w=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-9cWYOZ3OOfCmcogTUZW6Sw-1; Thu, 17 Feb 2022 20:48:06 -0500
X-MC-Unique: 9cWYOZ3OOfCmcogTUZW6Sw-1
Received: by mail-pj1-f69.google.com with SMTP id
 s10-20020a17090a948a00b001b96be201f6so4464606pjo.4
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 17:48:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/FDdTeByvEGdAuKOwgsh5RaDyqHPkfOqgfXxzhEqk5Q=;
 b=ZLuFgBxH/1WXapP1tozhr0WGys7tRXK+dbZztP8f5m85qmJ2IYUkOXbWD+rwx0R45Q
 gBSNblUiym92REJiOzCXaYNPRGHfZG9kbBsulcAFHzyQUD4HLbSrfQxIWmyf3ANRqEU4
 Dj59Si8orw8TRVN15HIcsLMoMJ8ouecvhRo4ZUlAQQre0HoUYNL1EbjQg4olykbZ8gd3
 XBc89ocVMh7wosqkeoce0H1rmANChsjM6L2tirqmEE8mf5VVL7HYuxdGTNzjfLz8PF0o
 wRnqoKV7z0vop/LJLVYIFc+KVNAo0lBCy9Nl72ydtskCfwfLO8SA15yl4V1+H2DYE6N/
 a6OA==
X-Gm-Message-State: AOAM532YECNO6LInFDgGnrMTePiKDtlYM4Z2uPV6fM4w5nog/OSB/ovT
 4cvP9l30lPbQqxAWaQvoU8FLFyhZKYS2ycla6VThsVsXTk58yjVshpc3GZJZbj5n36BwS+uOi5M
 LY2kdvvVxgzdK2Qw=
X-Received: by 2002:a17:90a:de85:b0:1b9:c9af:1335 with SMTP id
 n5-20020a17090ade8500b001b9c9af1335mr5963125pjv.11.1645148884974; 
 Thu, 17 Feb 2022 17:48:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGu1BL0DVk6cyrKJBkQcIKTQjFqypjGnUeqRVpteuz7I9dUr+ClpjqaKghVXaXR2cBujGgMA==
X-Received: by 2002:a17:90a:de85:b0:1b9:c9af:1335 with SMTP id
 n5-20020a17090ade8500b001b9c9af1335mr5963101pjv.11.1645148884679; 
 Thu, 17 Feb 2022 17:48:04 -0800 (PST)
Received: from xz-m1.local ([94.177.118.47])
 by smtp.gmail.com with ESMTPSA id l16sm910173pjy.14.2022.02.17.17.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 17:48:04 -0800 (PST)
Date: Fri, 18 Feb 2022 09:47:59 +0800
From: Peter Xu <peterx@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] migration: NULL transport_data after freeing
Message-ID: <Yg76z1DYyu8DuJEM@xz-m1.local>
References: <20220217170407.24906-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220217170407.24906-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 06:04:07PM +0100, Hanna Reitz wrote:
> migration_incoming_state_destroy() NULLs all objects it frees after they
> are freed, presumably so that a subsequent call to the same function
> will not free them again, unless new objects have been created in the
> meantime.
> 
> transport_data is the exception, and it shows exactly this problem: When
> an incoming migration uses transport_cleanup() and transport_data, and a
> subsequent incoming migration (e.g. loadvm) occurs that does not, then
> when this second one is done, it will call transport_cleanup() on the
> old transport_data again -- which has already been freed.  This is
> sometimes visible in the iotest 201, though for some reason I can only
> reproduce it with -m32.
> 
> To fix this, call transport_cleanup() only when transport_data is not
> NULL (otherwise there is nothing to clean up), and set transport_data to
> NULL when it has been cleaned up (i.e. freed).
> 
> (transport_cleanup() is used only by migration/socket.c, where
> socket_start_incoming_migration_internal() sets both it and
> transport_data to non-NULL values.)
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

I had a similar fix here:

https://lore.kernel.org/qemu-devel/20220216062809.57179-15-peterx@redhat.com/

Though there it was because I need migration_incoming_transport_cleanup()
for other purposes, so the fix came along.

My guess is this small fix will land earlier, if so I'll rebase. :)

Thanks,

-- 
Peter Xu


