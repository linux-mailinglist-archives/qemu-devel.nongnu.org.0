Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8D32B78B5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:33:08 +0100 (CET)
Received: from localhost ([::1]:33554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfItn-0001Bv-MB
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:33:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfIs7-00081G-60
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:31:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfIs4-0004fc-ND
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:31:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8YHFfKsDiqVIcXpUJvD7U/GPYT2/wQrACBnDe8N2tNA=;
 b=fsnDou8l7ygdFIRvuWJ+DlV4FWjQwLec8tKMrRGFtoTbvvYw+Pj78lq3T5r0MMfP02mceP
 52DBZK0IL1jOKdMO4nl9vma3EPRdZk0GygZUDnPI038Pg0lf0MZxtMJq1U8wiEgGu6GVI1
 n85SIWOFjos/+4s5JjkHMexyhedNMok=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-OMJ4NWHSMT220WgQGKEl9g-1; Wed, 18 Nov 2020 03:31:16 -0500
X-MC-Unique: OMJ4NWHSMT220WgQGKEl9g-1
Received: by mail-ed1-f70.google.com with SMTP id s7so481547eds.17
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8YHFfKsDiqVIcXpUJvD7U/GPYT2/wQrACBnDe8N2tNA=;
 b=ZlrgGO3SUbNf9Rs8l441lhNlUOr0kGggjygw7+wvCC48HVJgY691Qn7B5MAgqRaefx
 CGrcGQt2aoVnIj5wG5htetHVluVfbFF+71ocQbYcpV2OD/KfkWncl9OGUnDueKNmPVsH
 hzvRs7ZpozkFqCIF1byKvlDO+DoEZSma97AlDM/z/jdLgf6Q4Ux6I6SIq5FyYr70WLi6
 zbkFgK8c9DpHs5GReo9C5zzhz7zt2deUbEqxShv9eGzy/J1JrFqW5ZoxI9kme+1+adJA
 wsTOSRZ03UfaNAYEuH7dRyhkZr0pxJJ2OyKi7DtwCfs/zBZrF55j5D8asBk5fhx+SFQk
 KRcw==
X-Gm-Message-State: AOAM531pZt5j9hNnI4y6NT/rtK3hKc2jTz4mEGseGOzGfw2qtS+3qXW7
 CqhOPSMyDVv4vMabpky6FBJ2McahTMdHo5or5PZyOugtbtYwz+kxTJXbEaIdkbeNz/EFgJc2e9h
 8YODljEM3aOUhDlE=
X-Received: by 2002:a17:906:ece7:: with SMTP id
 qt7mr4598002ejb.316.1605688274822; 
 Wed, 18 Nov 2020 00:31:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztpPXyBaN5V06EmjWWCZuAUKVI0wITg6DNFLTosfjiwhGKJ1+x1wN3/gC/CImxDWBJ6riTzA==
X-Received: by 2002:a17:906:ece7:: with SMTP id
 qt7mr4597987ejb.316.1605688274604; 
 Wed, 18 Nov 2020 00:31:14 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gl23sm12365587ejb.113.2020.11.18.00.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 00:31:13 -0800 (PST)
Subject: Re: [PATCH] meson: Fixes curses detection on msys2
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
References: <20201116213106.589-1-luoyonggang@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <79f83095-560a-27de-cad9-c84266ee16d4@redhat.com>
Date: Wed, 18 Nov 2020 09:31:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116213106.589-1-luoyonggang@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/20 22:31, Yonggang Luo wrote:
> Fixes regression on curses detection in msys2
> by commit#925a40df2828d32d3aaaf022282cba81082fb263
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   meson.build | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index bbff0880f4..8695f7d1c2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -494,10 +494,15 @@ if have_system and not get_option('curses').disabled()
>         return 0;
>       }'''
>   
> -  curses = dependency((targetos == 'windows' ? 'ncurses' : 'ncursesw'),
> -                      required: false,
> -                      method: 'pkg-config',
> -                      static: enable_static)
> +  curses_dep_list = targetos == 'windows' ? ['ncurses', 'ncursesw'] : ['ncursesw']
> +  foreach curses_dep : curses_dep_list
> +    if not curses.found()
> +      curses = dependency(curses_dep,
> +                          required: false,
> +                          method: 'pkg-config',
> +                          static: enable_static)
> +    endif
> +  endforeach
>     msg = get_option('curses').enabled() ? 'curses library not found' : ''
>     if curses.found()
>       if cc.links(curses_test, dependencies: [curses])
> 

Queued, thanks.

Paolo


