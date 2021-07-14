Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634C73C8729
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:14:28 +0200 (CEST)
Received: from localhost ([::1]:34232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gah-00045G-Bm
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m3gT7-0002Y7-3e
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:06:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m3gT5-0002se-FF
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626275194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WtMJFHz7kQ7D4K47MK0JzAS7K2kJgHpax5z7zx96LFQ=;
 b=exXoWa/VIClEltO9/wWmLzTuEhsOOmroPCEPUKcDEYiKqNeYyBuVg6CzhkbgcQ+kNPmmJv
 BbEyif+IxUX7faKXZdfyFHBitlrOu8eocOFUiof0HbET//Ok0PlZGj8krLd3ACnpvA7qr2
 Jeyp4GUr4mO9aoQ3X2Uyr4Y/1Q50GwQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-Ci7l0gohPSedyKH2rf6e_A-1; Wed, 14 Jul 2021 11:06:27 -0400
X-MC-Unique: Ci7l0gohPSedyKH2rf6e_A-1
Received: by mail-wm1-f72.google.com with SMTP id
 z4-20020a7bc1440000b0290228d7e174f1so547577wmi.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WtMJFHz7kQ7D4K47MK0JzAS7K2kJgHpax5z7zx96LFQ=;
 b=SgleHAWhJPFfeQLHD+LprftN9XNK3rfUszFJ67sJvyrCw3RIuID7Mo9tw5s6up+ChY
 ebeuT2L5V7NoD4JGMxtmpmrNCwc4hhaPwmrY3sHmnC9vHW3B5GsZV3eun0mdgOYxKFv4
 Wmv3pvgOSqTTreehegmQrmEvZn7PtxEUDUz2wMh5R+gW1sMFZ2HeiD+EKDjkLFCkduTq
 uYnbk0qNPQZO1KpxCs9GpqNQfkqj3oYJHZxabJx36oH1P+YrDNqWozfnYoUsYSE2ECIF
 FGvvC92dRuPRB4IzPesvCRGgSuJYjYW4HH/0YgEZl6ADQ49eKAyTuKeR/8MnWN2ykN/A
 BmGg==
X-Gm-Message-State: AOAM532g3W6ZKPD41uOWVqgCf4I3YmmNlJOG8s02+pzDaTHDbwbbznOQ
 7UvQY5h3DeP0EAIFChSACKVDWwOqFTCo5w4kC0WKT7Gleluc901YyM8SzI+1bLhZG3f1tMJXHsg
 osr/VLlVhGBLGhL4=
X-Received: by 2002:adf:cd86:: with SMTP id q6mr13347708wrj.422.1626275186186; 
 Wed, 14 Jul 2021 08:06:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQINEg0R6YEEBKB2e8fQypHrMyB1Y0d+y8ioRgwEky8iWGqO2xAhZ6gpT8+6iFOjEivhzjBg==
X-Received: by 2002:adf:cd86:: with SMTP id q6mr13347681wrj.422.1626275186050; 
 Wed, 14 Jul 2021 08:06:26 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id c2sm2923363wrn.28.2021.07.14.08.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 08:06:25 -0700 (PDT)
Subject: Re: [PATCH 0/4] Fixes for the --without-default-features configure
 switch
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210713093155.677589-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <68bb3679-34de-76fa-2cb4-86a8d6de2aff@redhat.com>
Date: Wed, 14 Jul 2021 17:06:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713093155.677589-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/07/21 11:31, Thomas Huth wrote:
> Many features do not get properly disabled when the user runs the
> configure script with --without-default-features. Let's fix that now.
> 
> Thomas Huth (4):
>    configure: Fix --without-default-features propagation to meson
>    configure: Allow vnc to get disabled with --without-default-features
>    configure: Fix the default setting of the "xen" feature
>    configure: Let --without-default-features disable vhost-kernel and
>      vhost-vdpa
> 
>   configure   | 8 +++++---
>   meson.build | 2 +-
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 

Queued, thanks.

Paolo


