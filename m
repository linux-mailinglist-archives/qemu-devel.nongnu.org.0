Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC102F4830
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 11:04:42 +0100 (CET)
Received: from localhost ([::1]:46936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzd15-0005MU-RE
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 05:04:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzcyF-00043Z-E7
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 05:01:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzcy4-0000Oo-3J
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 05:01:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610532088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p+wI3OFeGOuKgEuap+zdZ5DKfVfIsCNv90lotfITStk=;
 b=GTngozc07q4PnBWeApIhtC87RQOZUD6Al3Zm1RreSxvy9AVAws8Whmc7Y7G7iUPayaMThp
 Cfjr9oTLzvThxRCtvvwSknvYNaUWej97ckYMmYJb61ftegHtmWATJF6HsJVBGjSF72ZJQm
 zGmFyPpHOeol73UA2ywEa+qudJfxUS0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-JXS_cy2nP7KaeaRChl1jjQ-1; Wed, 13 Jan 2021 05:01:27 -0500
X-MC-Unique: JXS_cy2nP7KaeaRChl1jjQ-1
Received: by mail-ej1-f71.google.com with SMTP id m4so685709ejc.14
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 02:01:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p+wI3OFeGOuKgEuap+zdZ5DKfVfIsCNv90lotfITStk=;
 b=j0lcEi7BdxVxSY3SvX41A5tpM2THO+urlVbR+T96swktDquCBWRGMoIcDfLw4m3yOi
 +BJ0fWQd8SDAOXejV6NhoDHNXMs1ziGiTAlpRCGuYMA40ZFUcI2SZ/pe95b2ZLhh6u/3
 KSNnCok30p2k26qZ1sqOJHzLbttw0YsnaAQvgViZdFMXPwACv13fWRNyLYXSC/jWPQnw
 BMhy9q7jY9cY2xSOzIdoTpLdCpiY26Le1a7YkDJH1vXOLT/mXI5CCmG2d7d+ycqVFdhS
 nIkr2upJEJsKWH2R4vhow74nr/hvcHIHJZCFgI4VAko7P0vUIhgHTBbExjhYMf8L5BWC
 mMSw==
X-Gm-Message-State: AOAM533jDfQQgGQHjp/qf2uPvj8daiYi177VuSFHsTTYxcYC4cF3i3yg
 sX+1NV4fPTB74qj1ZVayH8PW5tFp51WpVlW72uXjPZhnCNa++TK1URbN0igxo22+8ymJy9Oe5by
 9QhFYc9k/8A7F67Q=
X-Received: by 2002:a05:6402:1d0f:: with SMTP id
 dg15mr1109237edb.1.1610532085963; 
 Wed, 13 Jan 2021 02:01:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdd6Q9XhRoSRMwnJi2n+KrViMwdxJOSN9TQ973hauyjgZv/Dt41E0HJk0Ve9LsqhvrIMrN3A==
X-Received: by 2002:a05:6402:1d0f:: with SMTP id
 dg15mr1109226edb.1.1610532085775; 
 Wed, 13 Jan 2021 02:01:25 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id oq27sm492939ejb.108.2021.01.13.02.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 02:01:25 -0800 (PST)
Subject: Re: [PATCH v2] configure: MinGW respect --bindir argument
To: Joshua Watt <jpewhacker@gmail.com>, qemu-devel@nongnu.org
References: <20210107213856.34170-1-JPEWhacker@gmail.com>
 <20210112210239.28836-1-JPEWhacker@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9c71577f-6d32-c45e-6beb-b1b8abd5c3cf@redhat.com>
Date: Wed, 13 Jan 2021 11:01:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210112210239.28836-1-JPEWhacker@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: thuth@redhat.com, luoyonggang@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/01/21 22:02, Joshua Watt wrote:
> There are two cases that need to be accounted for when compiling QEMU
> for MinGW32:
>   1) A standalone distribution, where QEMU is self contained and
>      extracted by the user, such as a user would download from the QEMU
>      website. In this case, all the QEMU executable files should be
>      rooted in $prefix to ensure they can be easily found by the user
>   2) QEMU integrated into a distribution image/sysroot/SDK and
>      distributed with other programs. In this case, the provided
>      arguments for bindir/datadir/etc. should be respected as they for a
>      Linux build.
> 
> Restructures the MinGW path configuration so that all of the paths
> except bindir use the same rules as when building for other platforms.
> This satisfies #2 and #1 since these files do not need to be directly in
> $prefix anyway.
> 
> The handling for --bindir is changed so that it defaults to $prefix on
> MinGW (maintaining the compatibility with #1), but if the user specifies
> a specific path when configuring it can also satisfy #2.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   configure | 17 ++++++-----------
>   1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/configure b/configure
> index 5860bdb77b..092e2926bc 100755
> --- a/configure
> +++ b/configure
> @@ -1571,20 +1571,15 @@ libexecdir="${libexecdir:-$prefix/libexec}"
>   includedir="${includedir:-$prefix/include}"
>   
>   if test "$mingw32" = "yes" ; then
> -    mandir="$prefix"
> -    datadir="$prefix"
> -    docdir="$prefix"
> -    bindir="$prefix"
> -    sysconfdir="$prefix"
> -    local_statedir="$prefix"
> +    bindir="${bindir:-$prefix}"
>   else
> -    mandir="${mandir:-$prefix/share/man}"
> -    datadir="${datadir:-$prefix/share}"
> -    docdir="${docdir:-$prefix/share/doc}"
>       bindir="${bindir:-$prefix/bin}"
> -    sysconfdir="${sysconfdir:-$prefix/etc}"
> -    local_statedir="${local_statedir:-$prefix/var}"
>   fi
> +mandir="${mandir:-$prefix/share/man}"
> +datadir="${datadir:-$prefix/share}"
> +docdir="${docdir:-$prefix/share/doc}"
> +sysconfdir="${sysconfdir:-$prefix/etc}"
> +local_statedir="${local_statedir:-$prefix/var}"
>   firmwarepath="${firmwarepath:-$datadir/qemu-firmware}"
>   localedir="${localedir:-$datadir/locale}"
>   
> 

Queued, thanks!

Paolo


