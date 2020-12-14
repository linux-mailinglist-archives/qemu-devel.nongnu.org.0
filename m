Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D172D2D9C7F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:24:38 +0100 (CET)
Received: from localhost ([::1]:51618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqeL-0005cW-LO
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1koqc4-0003gS-UY
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 11:22:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1koqc0-0005oR-VD
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 11:22:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607962930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HcALhnfrwpPbRgsV+4n2JJK9yWa9VR6NM7p5U+6SRrw=;
 b=ex8MFJ5XlA4rIyE8236gNQzK5T9RB3P+HFo2vGJ9+BB8Wks3NNyTy6uOqm7VsXqlIE22M6
 tP1ihLW+Nn/r11jUfChJgMPgOm4L3D1sYG6OLqFw3mfL7pxF1Xr/33oiBUojCPX+5rh/10
 X8rwhWapQQKbNVdqMrT+kQ9YDA7k/wM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-1EmL0rqWP6GCA9sAo3DuEQ-1; Mon, 14 Dec 2020 11:22:07 -0500
X-MC-Unique: 1EmL0rqWP6GCA9sAo3DuEQ-1
Received: by mail-ed1-f72.google.com with SMTP id l33so8516733ede.1
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 08:22:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HcALhnfrwpPbRgsV+4n2JJK9yWa9VR6NM7p5U+6SRrw=;
 b=UMc+eoj84tmw3ebCfWyHLHE8UE6LNhWVUp3goj6AEsJx/QkU6Y3DgWFTGtpmI4fmVR
 Oo2R5TQGOf4YY118cUoo6onGW9QMqzAXI96XoKeYG/PSHZ9udvBvQDnYpOby3i/Ikcdd
 pGkEpQWQ0Zb2m7MWW+F1n1Vq0dA2br+a4lq8u7nTu+uGzUP8zjpM8d3KYJ33rhHSvoC0
 HsX7Jneo1cAkNu3bQeuJBQO+/SQWhuj4HnwR5rGFIoxKMXeorTCMfvreKOyGTmVuRsbe
 j3Yv59jVehzCnZE3iTGvVUd+kcdb6ujfsZHHJwlRsyrFY3XbaTlY9DZ5Gy/6owYKq3P1
 4N/g==
X-Gm-Message-State: AOAM530Is32J5lJJpbnI/ao2y2xvEvYAmrwLTdPDjXnztE+aH6di1NIG
 /QPajFV5vVSEt+VDVlE565lDN4IVcskbHS5zGfMn8dbKtb3FyeyzPjHG3vl/b0/iXB6n7qbB2p0
 rKGhsZU0Ihpftu6Y=
X-Received: by 2002:a17:906:1ed6:: with SMTP id
 m22mr6248462ejj.231.1607962926648; 
 Mon, 14 Dec 2020 08:22:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYcr8kF8gVW5yQF4rWnyEilzwcaTBKKzKdvkJin/1ALHXsfDn7EqXq5PS5ysVHg+5+67XPBQ==
X-Received: by 2002:a17:906:1ed6:: with SMTP id
 m22mr6248446ejj.231.1607962926457; 
 Mon, 14 Dec 2020 08:22:06 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bq20sm13851501ejb.64.2020.12.14.08.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 08:22:05 -0800 (PST)
Subject: Re: [PATCH] libvhost-user: add a link-static option
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20201212090834.1126274-1-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c222007a-63af-2cc1-cae4-c2ca7fb58ccd@redhat.com>
Date: Mon, 14 Dec 2020 17:22:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201212090834.1126274-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: peter.maydell@linaro.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/12/20 10:08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Fix linking vhost-user binaries with with ./configure -static.
> 
> Fixes: 0df750e9d3a5fea5e1 ("libvhost-user: make it a meson subproject")
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   configure                                   | 1 +
>   subprojects/libvhost-user/meson.build       | 3 ++-
>   subprojects/libvhost-user/meson_options.txt | 5 +++++
>   3 files changed, 8 insertions(+), 1 deletion(-)
>   create mode 100644 subprojects/libvhost-user/meson_options.txt
> 
> diff --git a/configure b/configure
> index 18c26e0389..465f7bb150 100755
> --- a/configure
> +++ b/configure
> @@ -7014,6 +7014,7 @@ NINJA=$ninja $meson setup \
>           -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
>           -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
>           -Dvhost_user_blk_server=$vhost_user_blk_server \
> +        -Dlibvhost-user:link-static=$(if test "$static" = yes; then echo true; else echo false; fi) \
>           $cross_arg \
>           "$PWD" "$source_path"
>   
> diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvhost-user/meson.build
> index c5d85c11d7..5a9cc8675e 100644
> --- a/subprojects/libvhost-user/meson.build
> +++ b/subprojects/libvhost-user/meson.build
> @@ -2,7 +2,8 @@ project('libvhost-user', 'c',
>           license: 'GPL-2.0-or-later',
>           default_options: ['c_std=gnu99'])
>   
> -glib = dependency('glib-2.0')
> +link_static = get_option('link-static')
> +glib = dependency('glib-2.0', static: link_static)
>   inc = include_directories('../../include', '../../linux-headers')
>   
>   vhost_user = static_library('vhost-user',
> diff --git a/subprojects/libvhost-user/meson_options.txt b/subprojects/libvhost-user/meson_options.txt
> new file mode 100644
> index 0000000000..03fe088e36
> --- /dev/null
> +++ b/subprojects/libvhost-user/meson_options.txt
> @@ -0,0 +1,5 @@
> +option('link-static',
> +  type: 'boolean',
> +  value: false,
> +)
> +

No, this is wrong.  We need to use the results of the configure test 
uniformly until we can move it to meson.build.

Ask yourself if you'd like to have this option in a standalone project, 
the answer most likely is no...  Can you use override_dependency from 
the toplevel meson.build instead?  It's usually meant for 
sub->superproject, but we can use it in this case as well I think.

Paolo


