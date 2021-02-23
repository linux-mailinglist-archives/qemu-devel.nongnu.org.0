Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5666032295F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:17:51 +0100 (CET)
Received: from localhost ([::1]:50026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVhO-0003ND-Bk
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEVfQ-0002rI-77
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:15:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEVfO-0008H8-IV
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614078942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aS0ljbCSGC7OKj6OBrVj31dMy0/WaCl3QzmgghReXeo=;
 b=XSVplgK+NI54XwymjbR2fKofwwPag230Kr7JNCT8MKcBusrNhKb6fX40Ao+5VG0HYF+OiG
 k92/F53n6pTgRzFHNPTYWf36+gbKA+Gs+HWwaeV7jLi0wq/OC7W6hoa89c6cOPQMijMz7t
 1U06B8wIy/ZyqaFJywlRtmCr6UWbKyA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-0i0NJ1eAM_aZNDDropCg9Q-1; Tue, 23 Feb 2021 06:15:40 -0500
X-MC-Unique: 0i0NJ1eAM_aZNDDropCg9Q-1
Received: by mail-wm1-f72.google.com with SMTP id m6so575486wml.1
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 03:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aS0ljbCSGC7OKj6OBrVj31dMy0/WaCl3QzmgghReXeo=;
 b=EG7oY/lUK/s5N1UY4E4zm5CTfI8NjBkmxrgsHV90ABdzIglsCVTAJcaB087AZ2EjT4
 qg9KJFIPj0TqaPstPxZWZnq7zDpZFsXpu8a6jA91nicnQFQVsTPqIJXjEwPqXHhqSR7S
 pNC93uHoBDoSqKJ6etavOIMAqU1RcB2RnPDPtKWELraEhOE+VsAWuKIU28q4ZD6VtX/6
 5vrS2NNZSs/TTnSSJ76mobYA0GNs7D0hK4F8B1f2qHvSgYBRv77DL/s60uaeWejrDgx3
 edX4yw5RVYxlEuwTc3fyB6oMvOaZOrjqUo+l4PyNjvPEEgTZQHl30sYe84rksmdLAte3
 y/sw==
X-Gm-Message-State: AOAM5300kc/9V58ZQjxuWnbBy8HoWh2JMRbieDp9bsyC+y0WcEerlJLi
 ostYuZQd0drO9Jd6TQL+wnEtkoxITf97eh9Hp33LfG/rKEm6ePN0SnAsszD5bPChyImpzEwX2JM
 bY+pllQvcCzKUVo4=
X-Received: by 2002:a05:600c:24b:: with SMTP id
 11mr13207770wmj.129.1614078938949; 
 Tue, 23 Feb 2021 03:15:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS/1+Z3q7xXfceLql+8wnq88QufNFpi7CwCwqxabcP12HYYaVzpKiMJG842s7se+5dBzLiMQ==
X-Received: by 2002:a05:600c:24b:: with SMTP id
 11mr13207763wmj.129.1614078938846; 
 Tue, 23 Feb 2021 03:15:38 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o15sm2282681wmh.39.2021.02.23.03.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 03:15:38 -0800 (PST)
Subject: Re: [PATCH] vhost: simplify vhost_dev_init() fail_busyloop label
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210222114931.272308-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fe62c294-c3e1-089e-2fd7-2e872ac33340@redhat.com>
Date: Tue, 23 Feb 2021 12:15:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222114931.272308-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 12:49 PM, Stefan Hajnoczi wrote:
> Requiring a conditional for every goto is tedious:
> 
>   if (busyloop_timeout) {
>       goto fail_busyloop;
>   } else {
>       goto fail;
>   }
> 
> Move the conditional to into the fail_busyloop label so that it's safe
> to jump to this label unconditionally.
> 
> This change makes the migrate_add_blocker() error case more consistent.
> It jumped to fail_busyloop unconditionally whereas the memslots limits
> error case was conditional.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/virtio/vhost.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


