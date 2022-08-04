Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F78589D3B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 16:07:50 +0200 (CEST)
Received: from localhost ([::1]:36408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJbVt-0001zd-Tj
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 10:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oJbTg-0006iL-Eb
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:05:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oJbTe-0002kM-JX
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659621929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2zbQhcmAzxyZ0PgHpvzIXM3iG2Nt8OHf6ArKAhlRdQ4=;
 b=BotUYg4EuZ+gF44yoyiPE80kSHtK9D5kxRkiXwtcXBuFarz4UJNY8nV81g7C9TIdQzlrXr
 Eisr/D0ThGPBsaWziDUDdNSj/7uFuOrP7HJZab/t9wEcgL7zA9vPEJ6lpDQYG9ZT4Rsu/Y
 xXdeXTY9G0LnL2BKWyrKByRR5LXWlsM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-IMlHyWSbN5CEhJvwQOhOtQ-1; Thu, 04 Aug 2022 10:05:26 -0400
X-MC-Unique: IMlHyWSbN5CEhJvwQOhOtQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 fz9-20020a05622a5a8900b0031eef501518so13035251qtb.9
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 07:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2zbQhcmAzxyZ0PgHpvzIXM3iG2Nt8OHf6ArKAhlRdQ4=;
 b=tjHxnXu6dq3XTvL1+WKg+C9PGAFHKqtkbiOutBxrv3ePFoi/5HYsB8+XQVVe10fzl5
 1wvf8e+omSRibimBKV0eBDUkM/LOUpnFUBscA8R9fjC2UtO91qqZ770yZNIaZUp6Y+CE
 C1vEj6wzBPuZtpdjuBilOrqcO2af8hfvxVFkYcEPc1OiLWbPJyPqLkUmq4J80clZT12i
 45MOOOIGEEGXnqS7ItS5Ml/mtmTQPe7+zcu2MIUE6u9AyNpn2sw/6Y0sYMKjNGOzs/9a
 JTrHv+TZ5z7CEE8SWU0eRYo0ISkyBOTDwPcRwiJppg4OtdRq3f1n/1mJ/dFB+e7VyC99
 PkOQ==
X-Gm-Message-State: ACgBeo1ZKgDIvL8dNZpoFSGwdz7shMxtcQ4zDl/GnM1cWm1gQCWRbX14
 4Gddx0FmU01ZZChftZeDvYlwijdJM1G4ZxARtQM3utqeFudbTDpqueObSjTBoRvDI6Im4e3DKvw
 u8anHv3sDC7O97lg=
X-Received: by 2002:a05:622a:2c3:b0:340:5d42:d754 with SMTP id
 a3-20020a05622a02c300b003405d42d754mr1594816qtx.641.1659621924319; 
 Thu, 04 Aug 2022 07:05:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR56feyG3cnRgS/fTrmqd4aXDiU1emYCig0SER5BzbeCHJkUxt7QPkA2hVgJH3IsqVvXGqaqTw==
X-Received: by 2002:a05:622a:2c3:b0:340:5d42:d754 with SMTP id
 a3-20020a05622a02c300b003405d42d754mr1594749qtx.641.1659621923722; 
 Thu, 04 Aug 2022 07:05:23 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a05620a25d100b006b627d42616sm749819qko.35.2022.08.04.07.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 07:05:22 -0700 (PDT)
Date: Thu, 4 Aug 2022 10:05:21 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/1] QIOChannelSocket: Add support for MSG_ZEROCOPY +
 IPV6
Message-ID: <YuvSIUMp0TTto23l@xz-m1.local>
References: <20220804071041.540073-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220804071041.540073-1-leobras@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 04, 2022 at 04:10:43AM -0300, Leonardo Bras wrote:
> For using MSG_ZEROCOPY, there are two steps:
> 1 - io_writev() the packet, which enqueues the packet for sending, and
> 2 - io_flush(), which gets confirmation that all packets got correctly sent
> 
> Currently, if MSG_ZEROCOPY is used to send packets over IPV6, no error will
> be reported in (1), but it will fail in the first time (2) happens.
> 
> This happens because (2) currently checks for cmsg_level & cmsg_type
> associated with IPV4 only, before reporting any error.
> 
> Add checks for cmsg_level & cmsg_type associated with IPV6, and thus enable
> support for MSG_ZEROCOPY + IPV6
> 
> Fixes: 2bc58ffc29 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


