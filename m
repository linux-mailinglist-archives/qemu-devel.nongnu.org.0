Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6496C2B505F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:58:09 +0100 (CET)
Received: from localhost ([::1]:35090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejhY-0000CU-CA
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kejCW-0005a8-1J
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:26:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kejCQ-0004T9-4u
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605551155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YBEtFSxXTL9EM6rBIX9Jvb1S6R80yFa70Vk5Uicv2sE=;
 b=EeFVDV9PivF7CtyxurcwkfzzTYky/GJcltYQb0DXA2499580SojCOuDIQ6uDcHBf63hQV3
 lsXM6fUFc2ahyblcLxmNvXZn01I9bC/7mUjFKklU+mpVn21p4pfaU3NXHLKFPgswWcTMHs
 RvokmjpVKOOJuvClbtA5duoKTiEuDv0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-_4LA8Q_iPf6rdtOwe9z4Nw-1; Mon, 16 Nov 2020 13:25:54 -0500
X-MC-Unique: _4LA8Q_iPf6rdtOwe9z4Nw-1
Received: by mail-wm1-f69.google.com with SMTP id h9so73389wmf.8
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 10:25:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YBEtFSxXTL9EM6rBIX9Jvb1S6R80yFa70Vk5Uicv2sE=;
 b=YrxEpsNcHtwhF68tOvkCE3q92gd911wD2hIkfq7B05NIQmzGabM8s4Q49yOIns4G1A
 vEpotnB+Zx2MffTI27UcME2X1rMHKLF0xz4lmkJb/iK9CNDt/0ZdzHAEZ3zQnKFLGw/g
 yCB3GYOXfX5ImvLz79f9FbK+gYAiQszz/8ljHCJcRq9Uict1qjBaW+vsYq5TBOqKGhte
 UubxCTYV/6+J3c2HAwrHdSO1G8Bg0ILUE5h53YLt0WdT3ZwcmOqgTK/O0TR5JP9SLydQ
 9oGK09NULh52D6+9J1ag+N6k+8PlQPcBIYPNP+Bj9QFwQHn5YAHOM7qlLTowCem+c5t7
 cn0w==
X-Gm-Message-State: AOAM532ukCUWPeWcYiBH78r1/B4/5r4NizmuSt6e1IKQkT8s1rneAwL8
 CRWUEaY1PehBtGMkdEa+1cpcHQO9CymoVTfqV03/f+abj+eDLrn0tgKNiiMyhRLGgWeAGzLFtnr
 G7Xb4TOYbJjXPGqvsCJaVNfe6qLVx0md32xTKuYaJ/8uMfcIY1K2LfYFq3vaJ0hXUmz4=
X-Received: by 2002:a1c:e056:: with SMTP id x83mr189438wmg.83.1605551149677;
 Mon, 16 Nov 2020 10:25:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyI6eho+6cqTjJ27Wb1X4AYFe2LfNI3C8P5z7VicmcBVXZSgqzGY460FIsl4VUwZHKPnhrpzA==
X-Received: by 2002:a1c:e056:: with SMTP id x83mr189412wmg.83.1605551149248;
 Mon, 16 Nov 2020 10:25:49 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v6sm26489033wrb.53.2020.11.16.10.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 10:25:48 -0800 (PST)
Subject: Re: [PATCH for-5.2] configure: Make "does libgio work" test pull in
 some actual functions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201116104617.18333-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1f4476ba-fe58-e7f8-c165-9cf501511f95@redhat.com>
Date: Mon, 16 Nov 2020 19:25:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116104617.18333-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/20 11:46, Peter Maydell wrote:
> In commit 76346b6264a9b01979 we tried to add a configure check that
> the libgio pkg-config data was correct, which builds an executable
> linked against it.  Unfortunately this doesn't catch the problem
> (missing static library dependency info), because a "do nothing" test
> source file doesn't have any symbol references that cause the linker
> to pull in .o files from libgio.a, and so we don't see the "missing
> symbols from libmount" error that a full QEMU link triggers.
> 
> (The ineffective test went unnoticed because of a typo that
> effectively disabled libgio unconditionally, but after commit
> 3569a5dfc11f2 fixed that, a static link of the system emulator on
> Ubuntu stopped working again.)
> 
> Improve the gio test by having the test source fragment reference a
> g_dbus function (which is what is indirectly causing us to end up
> wanting functions from libmount).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The ideal thing here might perhaps be to force the linker to
> pull in everything in the library rather than trusting that
> this particular function is sufficient to trigger the need
> for libmount functions, but annoyingly gcc and clang
> have different command line options to do that.
> 
>   configure | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 4cef321d9dc..2717cf1db0a 100755
> --- a/configure
> +++ b/configure
> @@ -3512,8 +3512,15 @@ if $pkg_config --atleast-version=$glib_req_ver gio-2.0; then
>       # Check that the libraries actually work -- Ubuntu 18.04 ships
>       # with pkg-config --static --libs data for gio-2.0 that is missing
>       # -lblkid and will give a link error.
> -    write_c_skeleton
> -    if compile_prog "" "$gio_libs" ; then
> +    cat > $TMPC <<EOF
> +#include <gio/gio.h>
> +int main(void)
> +{
> +    g_dbus_proxy_new_sync(0, 0, 0, 0, 0, 0, 0, 0);
> +    return 0;
> +}
> +EOF
> +    if compile_prog "$gio_cflags" "$gio_libs" ; then
>           gio=yes
>       else
>           gio=no
> 

Looks good,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


