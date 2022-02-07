Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA854ABECC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 14:09:33 +0100 (CET)
Received: from localhost ([::1]:53678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH3lr-0003Sd-QA
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 08:09:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nH3T5-0005dR-8g
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 07:50:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nH3T1-0005Xk-1v
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 07:50:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644238202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=useTxVLZecjV3LJXYQ+1SjHR4LrIPrgBOFQ6rT6mCPY=;
 b=f4lfMgmIU4+pehKPEkxDS7hcXvKnK3vfJPB/ASbndMGsmClYtDUjUpvGEqCtl7u4ozPqqj
 jiGE6wN8o2+wCbwZhwhdoiUqD8QhFQi0AfUwGrToEdqNIe5bINHKfTJh0CZOcl30j8bvxs
 Uc3arrjeXTHSXUYreh5lFv9LUQFcxi8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-Sz4bZwRGNB6AXjxniMtpGQ-1; Mon, 07 Feb 2022 07:50:00 -0500
X-MC-Unique: Sz4bZwRGNB6AXjxniMtpGQ-1
Received: by mail-pl1-f197.google.com with SMTP id
 a9-20020a170902710900b0014c8132e8b8so5304171pll.10
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 04:50:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=useTxVLZecjV3LJXYQ+1SjHR4LrIPrgBOFQ6rT6mCPY=;
 b=Abn3x146pOdmeNbebxNwCfSLd3i94k/Y7IhszSnB3OomUr38SYqIq7Mm4JsJDOV8KC
 DiUhVjwjUCcCfLpJWkXcj5mZiQDyXA3XUEB9XLFSVFlD2C+6H/W/A/4IYyFSB8ErKVwb
 E4Umz5ZPPxsUrclaIql5U34gHI2i+PL0R8P32KChBoHi2OZMf2DQzDp112bPV0NRgnj3
 2e25nYcgR5cn7R6dzhmyx1sZnjEmAGQ5C3OKfwzNYTF09E7pu/IaxAJxApwNcGUHwl6m
 eral5v63UJnGZfYpAfjsS5eeTu7EZIdNbN58pnH8PMGQBAQqBQ026eU35KXa+pnoXelu
 rSpg==
X-Gm-Message-State: AOAM5334tq7lH+ijZz2H6erECQnbR6UQtERjuXQiydG5d0soDLcWLi5x
 D+KWhAq7PCkQRKbH7yYQpP9pVduhJhUa5gtX91b5H708PZ7/D7kyyDU37X98ZONkvOmt+4/mu8U
 lgmDxYltMj3wXMgg=
X-Received: by 2002:a17:902:b403:: with SMTP id
 x3mr16468315plr.61.1644238199717; 
 Mon, 07 Feb 2022 04:49:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxm5+FsboGv3U7s0ItCGBPgOhjsCQs41Z9fk9rXJ2ob86JzeH4aypr/u35xkTwqQm/dokOuYw==
X-Received: by 2002:a17:902:b403:: with SMTP id
 x3mr16468280plr.61.1644238199421; 
 Mon, 07 Feb 2022 04:49:59 -0800 (PST)
Received: from xz-m1.local ([94.177.118.121])
 by smtp.gmail.com with ESMTPSA id ip4sm11433004pjb.8.2022.02.07.04.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 04:49:59 -0800 (PST)
Date: Mon, 7 Feb 2022 20:49:51 +0800
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v8 1/5] QIOChannel: Add flags on io_writev and introduce
 io_flush callback
Message-ID: <YgEVbygBVE/FpTtq@xz-m1.local>
References: <20220201062901.428838-1-leobras@redhat.com>
 <20220201062901.428838-2-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220201062901.428838-2-leobras@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 01, 2022 at 03:28:59AM -0300, Leonardo Bras wrote:
> Add flags to io_writev and introduce io_flush as optional callback to
> QIOChannelClass, allowing the implementation of zero copy writes by
> subclasses.
> 
> How to use them:
> - Write data using qio_channel_writev*(...,QIO_CHANNEL_WRITE_FLAG_ZERO_COPY),
> - Wait write completion with qio_channel_flush().
> 
> Notes:
> As some zero copy write implementations work asynchronously, it's
> recommended to keep the write buffer untouched until the return of
> qio_channel_flush(), to avoid the risk of sending an updated buffer
> instead of the buffer state during write.
> 
> As io_flush callback is optional, if a subclass does not implement it, then:
> - io_flush will return 0 without changing anything.
> 
> Also, some functions like qio_channel_writev_full_all() were adapted to
> receive a flag parameter. That allows shared code between zero copy and
> non-zero copy writev, and also an easier implementation on new flags.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

With Dan's comment addressed on removing the redundant assertion:

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


