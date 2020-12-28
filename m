Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BF52E69AD
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 18:22:51 +0100 (CET)
Received: from localhost ([::1]:48504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktwEM-0004Xw-8O
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 12:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ktwC1-0003vV-0U
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 12:20:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ktwBy-0007ml-VI
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 12:20:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609176020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7aR6iO3z52jGPsqCaqNHN4hfgccgjabvTqUskD23K8w=;
 b=d+YMLgEw9fQPiojJKWSTel7EjqQHpKiWC5BY1S/g8F4ZgGt0l4Yg9WBB/qgMrn3B1cN/Xi
 DGO8gKyPUuHzSHnLnMU8OM417UdU8aI0ezp7tgh3Qb4xzfqVL0a9bPMvaxvGe3pALw9USb
 P611qzp5ZguqOhaWcXFSfy9gt1uBhyo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-PVB5-t5hMEelB-u8AX7fXg-1; Mon, 28 Dec 2020 12:20:16 -0500
X-MC-Unique: PVB5-t5hMEelB-u8AX7fXg-1
Received: by mail-wr1-f69.google.com with SMTP id e12so6537988wrp.10
 for <qemu-devel@nongnu.org>; Mon, 28 Dec 2020 09:20:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7aR6iO3z52jGPsqCaqNHN4hfgccgjabvTqUskD23K8w=;
 b=HnSd2ePsO3sqEgzp6yrqgJOoQKjmxtHhxrUU4kq++Ws3HTTDVvlOjo+gD7ttxbMtAS
 fsxB5JOVLzSqgUb++6CaQb5BvhqyX2y1zhNCunbT3cnuHDlox8Fae/WGixDL+rgGlP6j
 tE3slH9E+z7q58/5Obv7bn7UUngnNXf9+b1c15iiTZNHxLTUoC55fJ73SZIYLvoxHqL1
 jFkg/CWPqO/AvP1UXyOs9X0XVhvTo8IKCEp8zRyjmvHvAjd/Dw21nCfDHBE23mHm2klV
 Mh+ZMSZjRd+rJeKKbPMfcDjavwJ4bLD3GgElyvIrM8mHvuPFwImKmiKC7wsETnjzLL8w
 Cm0A==
X-Gm-Message-State: AOAM530kmos549uaRrgP3xSjy7p7B62qKUt4LZcek/DsioFTsLWKuc+j
 ZljC4Q1vaBNWKWZ3oEy2TalBtbg4XE15OCGa6k/ga8wobpFkiUjs4rIu9elq+Eu2rN5rFUHqUd/
 7dr4rvFFfnFSPLKk=
X-Received: by 2002:adf:f101:: with SMTP id r1mr52075297wro.112.1609176015322; 
 Mon, 28 Dec 2020 09:20:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJNcL+HlZ6FBfhDcQb/OYbPm1eWx/b6RJx929b1UCrwXZhMqSrH+qrmqJsGcudBdouQScDWA==
X-Received: by 2002:adf:f101:: with SMTP id r1mr52075284wro.112.1609176015171; 
 Mon, 28 Dec 2020 09:20:15 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id o23sm61544925wro.57.2020.12.28.09.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Dec 2020 09:20:14 -0800 (PST)
Subject: Re: [PATCH] meson: fix ncurses detection on macOS
To: Chris Hofstaedtler <chris@hofstaedtler.name>, qemu-devel@nongnu.org
References: <20201228151652.235542-1-chris@hofstaedtler.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ad2133a5-522d-b283-9abb-4c07e790c233@redhat.com>
Date: Mon, 28 Dec 2020 18:20:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201228151652.235542-1-chris@hofstaedtler.name>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.178,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: pbonzini@redhat.com, Yonggang Luo <luoyonggang@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/20 4:16 PM, Chris Hofstaedtler wrote:
> Without this, meson fails with "curses package not usable"
> when using ncurses 6.2. Apparently the wide functions
> (addwstr, etc) are hidden behind the extra define, and
> meson does not define it at that detection stage.

Seems reasonable, but still Cc'ing more developers.

> 
> Signed-off-by: Chris Hofstaedtler <chris@hofstaedtler.name>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 9c152a85bd..7b9d92c14a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -510,7 +510,7 @@ if have_system and not get_option('curses').disabled()
>    endforeach
>    msg = get_option('curses').enabled() ? 'curses library not found' : ''
>    if curses.found()
> -    if cc.links(curses_test, dependencies: [curses])
> +    if cc.links(curses_test, args: '-DNCURSES_WIDECHAR', dependencies: [curses])
>        curses = declare_dependency(compile_args: '-DNCURSES_WIDECHAR', dependencies: [curses])
>      else
>        msg = 'curses package not usable'
> 


