Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0EB2F62A4
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:04:08 +0100 (CET)
Received: from localhost ([::1]:42662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03EN-0004Ti-Rr
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:04:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l037X-000887-9b
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:57:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l037V-0005oE-FD
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610632620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yzkwf8Cz/RswH0mj47kB0ifS9+hsv3bGvGfp3y2MU6w=;
 b=CkheW58XzWzejaA9rc/jfiP9dedOvN5jFZLNg0Vng73W9x/6jGo5IupVaFBqcrATm5ss5u
 O1+XilR5zQL93XujX5bbFPuWNnI6/zIphsLK8IUPxLH3kxd65KrL+GhJh4k1+GKqAAzlp2
 VoedvVH53deaFAkTETygHR7o/KD0Vpc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-N9VwDas9N5qyx7DbTNpV2Q-1; Thu, 14 Jan 2021 08:56:58 -0500
X-MC-Unique: N9VwDas9N5qyx7DbTNpV2Q-1
Received: by mail-wm1-f69.google.com with SMTP id b194so813092wmd.3
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:56:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yzkwf8Cz/RswH0mj47kB0ifS9+hsv3bGvGfp3y2MU6w=;
 b=edTaWx9UcOqo5O+p3GP1MaMKXakZr36ebGDqEWGs/thEu8xH0pqncgKe2aNgcBd3Wm
 lIo43AKsPgbce++znANI2SIHJBzrbpZGr+yLfYutRQEuQvlu9UWvH9SBDUSnu3WqwXVi
 Nund6r7K0Mh6ZX2N2+JYj8TnPohmOWqcNSxN5pGgBFGev9VeT0dF1dVdp1DJMNq1XbsA
 XPzlHU0gesbwWJ427x8/+Wt3cjGWeOPFpATPVQShNgBvQzm3XCdcW02Rtl94wCHVnEBD
 BEK5qXyNUkv1zODoqSf5HID0xkJtXUbICrADT6dAPXevw7h65lrfQlfZ72gX9sIJCf+t
 33Rw==
X-Gm-Message-State: AOAM532Yyx+UbBCNgsGfts3qHHuk2GV74xPPiBOebjYtznEVT49FydaL
 QSAi5RsviGR1Q27FzMmTljG/Y9gGWZFsO3GUevVdsRwKxAv3Oxd8MDNqvvvajbDw65b3ZaqbZol
 O6L/AIyRUmomMDX4=
X-Received: by 2002:a1c:a501:: with SMTP id o1mr4109171wme.44.1610632616964;
 Thu, 14 Jan 2021 05:56:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMcxrb54+6CYgM/3tFG25eUHhSPb9r5TiymBlxdxt/KOwgDwC31YAXTQ+gLszPVLBNxV3Vjg==
X-Received: by 2002:a1c:a501:: with SMTP id o1mr4109159wme.44.1610632616723;
 Thu, 14 Jan 2021 05:56:56 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g5sm10579918wro.60.2021.01.14.05.56.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 05:56:56 -0800 (PST)
Subject: Re: [PATCH v2 23/25] tests/docker: auto-generate ubuntu2004 with
 lcitool
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-24-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <857e94de-1a6d-8405-970c-793c36b5455c@redhat.com>
Date: Thu, 14 Jan 2021 14:56:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-24-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 2:02 PM, Daniel P. Berrangé wrote:
> This commit is best examined using the "-b" option to diff.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/refresh           |   6 +
>  tests/docker/dockerfiles/ubuntu2004.docker | 237 +++++++++++----------
>  2 files changed, 136 insertions(+), 107 deletions(-)
> 
> diff --git a/tests/docker/dockerfiles/refresh b/tests/docker/dockerfiles/refresh
> index ab1d00fcf8..658a57c28c 100755
> --- a/tests/docker/dockerfiles/refresh
> +++ b/tests/docker/dockerfiles/refresh
> @@ -57,5 +57,11 @@ try:
>  
>     generate_image("ubuntu1804.docker", "ubuntu-1804",
>                    trailer="".join(skipssh))
> +
> +   tsanhack = ["# Apply patch https://reviews.llvm.org/D75820\n",
> +               "# This is required for TSan in clang-10 to compile with QEMU.\n",
> +               "RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h\n"]
> +   generate_image("ubuntu2004.docker", "ubuntu-2004",
> +                  trailer="".join(tsanhack))
...
>  # Apply patch https://reviews.llvm.org/D75820
>  # This is required for TSan in clang-10 to compile with QEMU.
>  RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


