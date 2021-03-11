Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5D4337A81
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 18:11:08 +0100 (CET)
Received: from localhost ([::1]:46166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKOq3-00051D-Bs
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 12:11:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lKOld-0000qr-KG
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:06:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lKOla-0003Yn-Rd
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:06:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615482387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FsfeoL4qj1QxF2wA0FQMk7Ho9hGG9voKhUVuHyNyS5k=;
 b=amM9RXb79JIVkYGnFb8pmHhDvseBqeo1TrYXkyT80H79T1/rbNzzP6QbBP61vZIjMvsZMJ
 r9riG0sfFYcJ/yVZuO+foEoAXKR8r+EFiMuPKU44s0hU/FEVzgKelsbDLT8a2CDkjn3RHf
 2kx44ObikdF00Q0vD+wVz7ix8NOUFdo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-Cq5pdItzNdizGXzc51Kqjw-1; Thu, 11 Mar 2021 12:06:25 -0500
X-MC-Unique: Cq5pdItzNdizGXzc51Kqjw-1
Received: by mail-ej1-f69.google.com with SMTP id 11so8928110ejz.20
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 09:06:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FsfeoL4qj1QxF2wA0FQMk7Ho9hGG9voKhUVuHyNyS5k=;
 b=qGte4kG9wx7lM0LtvvcBEBlLH1xQeqKWOi12WJXbTL/Il0gcUmOeuEkJH+Atvj6yjX
 hu5yMwnPvSARrjNqTdoyPpNTTPrumYIHgFoTtTWyaLbh5q5y3dd6Yxco/ggp+5LM8jNS
 DVkrF4InOfJlModYt5CNVwcPAa/1Gzn7ZmTdJD2LKnvvpXNkgeX/IXCPRbtLrWPsc9zr
 5tc2oQmCyiCoUK9Nn5D2ziq8K/F1cwgtaO4rnmeIpjuL+qbmUgYtfTvRz9Xxf9p6Vkel
 NuPhdg2X4lqffsMcKDEffrvib8In+dxXbJ0QK6fyfX43EWwxhIyxx6b/zH4nNfoRGOnl
 UdCw==
X-Gm-Message-State: AOAM532PryjV+sxCv8R4LPXYGrCWrUs2nBKVZye9dK9EPDvj6OzRPmpG
 eMHRSC7Zee+6EZHQSZJRzzUB+hVFrLnY16MV0yNGbufn5MhcoSlQ6kNUTu194lS4bp5p9IR01PP
 GqZY+TAHYYddlP48=
X-Received: by 2002:a17:906:311a:: with SMTP id
 26mr4028182ejx.395.1615482384310; 
 Thu, 11 Mar 2021 09:06:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8YTcdzWcVlC4L1FXuOIu3AGBipzysij0gUfap79Y1mIB97oNttEfBG6cr54uGQJemni/qug==
X-Received: by 2002:a17:906:311a:: with SMTP id
 26mr4028164ejx.395.1615482384137; 
 Thu, 11 Mar 2021 09:06:24 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id pg2sm1634890ejb.49.2021.03.11.09.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:06:23 -0800 (PST)
Date: Thu, 11 Mar 2021 18:06:21 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qemu-timer: allow freeing a NULL timer
Message-ID: <20210311170621.ahcelcm6gdueri42@steredhat>
References: <20210310154526.463850-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210310154526.463850-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 10:45:26AM -0500, Paolo Bonzini wrote:
>Since 5f8e93c3e2 ("util/qemu-timer: Make timer_free() imply timer_del()", 2021-01-08)
>it is not possible anymore to pass a NULL pointer to timer_free().  Previously
>it would do nothing as it would simply pass NULL down to g_free().
>
>Rectify this, which also fixes "-chardev braille" when there is no device.
>
>Reported-by: Markus Armbruster <armbru@redhat.com>
>Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>---
> include/qemu/timer.h | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


