Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D75A44556E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:39:04 +0100 (CET)
Received: from localhost ([::1]:57152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midtP-0000xL-K8
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1midbf-00027I-FG
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:20:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1midbZ-0003pj-GY
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636035635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gyw9TwpdW3ob4WTm2/tuTd5vwfmaBXHwhSuZQCiHqH8=;
 b=ZyHILC1xmVFJHAJJyeMcZkuv4CFbKy8h0vXTagu38AnX9Rdm/pbSq22qkPI4V1uK6F6PVq
 7N7kqz61cxc0YZJt2q9s4PcOZhFxMGxNSaLEDax6nYCFQGGl+mJ3ojAi8Vk1k0NJ1YLTWD
 I2p95B+wxO8QLkjAeByEc+X+Kqii/30=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-hQPvkhCSMOuVXgBxfNXblQ-1; Thu, 04 Nov 2021 10:20:34 -0400
X-MC-Unique: hQPvkhCSMOuVXgBxfNXblQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso5800290edj.20
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gyw9TwpdW3ob4WTm2/tuTd5vwfmaBXHwhSuZQCiHqH8=;
 b=M30uxi/yxHpi++Q0KxKYz3sxgWO3vrkN3x/XvTKVEY1yB2JXWVIAIX4+2+cJ1m0NFE
 qnfZsduXr/fEKrqzP5CI3mfm8+A3UkE5C1ylvdqKw4LNTET2qt3p6rDM53dIvvOHvidV
 lo9yTfg59QB/h7+IykecrH3lCIFIWOPkfynkv+SwagqBXpx7jkKdwzE0fw/wzzHo2CJr
 KBLBpwpj82fQNbOTeaRDiAdT5LQkrYgUMfbkDXQxpoYJ5qL8XD5lnlnIQgJQpbLLwwvc
 AiPZeP3xBcNF2sx2QZTn9VGN2rnf7TlKRp4EhDy4vlzwpSF+KAaLIk8vtGXwzaJxkmsg
 VYLA==
X-Gm-Message-State: AOAM532U0TJNe6UdEcp96bwVhReI2dRTOKLMvJ2a7liW2gFJhEwOGYHP
 +rnzBzR7elNf08o0bzLs99Dw3UE0oiAx8fCPn7q0HsWMNwbL83h2EhUYiGNh/f7gUN8XrlCRPm3
 WwXvmNo7tSbzOvmY=
X-Received: by 2002:a05:6402:2753:: with SMTP id
 z19mr39214602edd.143.1636035632884; 
 Thu, 04 Nov 2021 07:20:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2lYqLSSYaTcUz9qdo81HdOJnPHR9GA+bOqs4ydmtBa5Z8G1MMOuY7Fc54y7+oQOHUQw1Q8Q==
X-Received: by 2002:a05:6402:2753:: with SMTP id
 z19mr39214571edd.143.1636035632563; 
 Thu, 04 Nov 2021 07:20:32 -0700 (PDT)
Received: from steredhat (host-87-10-72-39.retail.telecomitalia.it.
 [87.10.72.39])
 by smtp.gmail.com with ESMTPSA id b20sm3206191edd.50.2021.11.04.07.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:20:32 -0700 (PDT)
Date: Thu, 4 Nov 2021 15:20:29 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] file-posix: Fix alignment after reopen changing O_DIRECT
Message-ID: <20211104142029.gcfgwrq4wuvzg5as@steredhat>
References: <20211104113109.56336-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211104113109.56336-1-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: hreitz@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 04, 2021 at 12:31:09PM +0100, Kevin Wolf wrote:
>At the end of a reopen, we already call bdrv_refresh_limits(), which
>should update bs->request_alignment according to the new file
>descriptor. However, raw_probe_alignment() relies on s->needs_alignment
>and just uses 1 if it isn't set. We neglected to update this field, so
>starting with cache=writeback and then reopening with cache=none means
>that we get an incorrect bs->request_alignment == 1 and unaligned
>requests fail instead of being automatically aligned.
>
>Fix this by recalculating s->needs_alignment in raw_refresh_limits()
>before calling raw_probe_alignment().
>
>Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>---
> block/file-posix.c         | 20 ++++++++++++++++----
> tests/qemu-iotests/142     | 22 ++++++++++++++++++++++
> tests/qemu-iotests/142.out | 15 +++++++++++++++
> 3 files changed, 53 insertions(+), 4 deletions(-)
>
>diff --git a/block/file-posix.c b/block/file-posix.c
>index 7a27c83060..3f14e47096 100644
>--- a/block/file-posix.c
>+++ b/block/file-posix.c
>@@ -167,6 +167,7 @@ typedef struct BDRVRawState {
>     int page_cache_inconsistent; /* errno from fdatasync failure */
>     bool has_fallocate;
>     bool needs_alignment;
>+    bool force_alignment;
>     bool drop_cache;
>     bool check_cache_dropped;
>     struct {
>@@ -351,6 +352,17 @@ static bool dio_byte_aligned(int fd)
>     return false;
> }
>
>+static int raw_needs_alignment(BlockDriverState *bs)

If you need to respin, maybe it's better to use `bool` as return type.

In both cases:
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Stefano


