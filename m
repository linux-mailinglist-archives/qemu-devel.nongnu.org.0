Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4906B4029B7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:29:50 +0200 (CEST)
Received: from localhost ([::1]:35708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbAb-0000MF-Ay
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNaaI-0000qk-Qw
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:52:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNaaH-0001Xi-8Y
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631019136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y3xkzBDvOTtsG88VOHKoIPQkyaYqCcBcw6rlfpUz3Bk=;
 b=KkGOIdOTu/uKj9W3Q4lv6J1EY3yoFe/Mf0wm4SV9jB3Xj7qcz3mRopp9TCPvZFRsab1UyW
 0j6+ivraM1ucAKtePw9OP72wBb7ksHedQEdxamm0yuZEanUqMqbc2mcqlIXkxisCoPRGsZ
 f5sL/VjQUz158uhEfo0+zZdLD54qDAA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-7qntJXDJNsKkERMVtZ9oYA-1; Tue, 07 Sep 2021 08:52:13 -0400
X-MC-Unique: 7qntJXDJNsKkERMVtZ9oYA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n16-20020a1c7210000000b002ea2ed60dc6so892163wmc.0
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 05:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y3xkzBDvOTtsG88VOHKoIPQkyaYqCcBcw6rlfpUz3Bk=;
 b=ScoaaIVhMjRXLznx64yQqqgiEyxPeTFfMwZK7/AXjE+Yqn3PMhu2OTV6kEuAir2zbw
 yXNqzZqiU2w2BI6eS6gwAVTFjmOytNvr56WxC0rNmAzV+dbdq8ggDIg2TDyzSa9wxJmO
 ubdJczHFiBu3Bymm6kz+zJ9K7BWbKKRm0gJ8oAS98DzzcZUR4U7HKsyYbSPcGODlYYzR
 1ppunnpxZ79HwvebUBL7RAw1GdAEnNUczGurCZ1CdbfqHwchijZoqUNIA0SNcSSCbQKX
 M5ak5WxQkhm30FtXKaOdfdDdshdGC4aAOuhIgFxaUl8KlghGD8YkIFqkyDnFlgjxbkgb
 tnWQ==
X-Gm-Message-State: AOAM532W64WLFo7o38k/K/DbrmbeGrxbIxbpnb5KU0E0z48AW8vF6aIv
 iyCo8PGwH5QCw05wOAoHz51imCouBhl0tRR7PEzmpXInNlOSsbIiTOEk1BnABRBX71OegwkgRnH
 du71KLpGIRZ7Q4iw=
X-Received: by 2002:adf:914e:: with SMTP id j72mr18644255wrj.428.1631019132402; 
 Tue, 07 Sep 2021 05:52:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLGh1rjxgt1ZuOaSdVqIrq9rI1j1HL2CTnkjQQpUyzNbYNcfXojvefhtgqxfQpS2atZHXicg==
X-Received: by 2002:adf:914e:: with SMTP id j72mr18644238wrj.428.1631019132210; 
 Tue, 07 Sep 2021 05:52:12 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x11sm10932312wro.83.2021.09.07.05.52.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 05:52:11 -0700 (PDT)
Subject: Re: [PATCH] meson.build: Do not look for VNC-related libraries if
 have_system is not set
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210906153939.165567-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <aa254aa3-5aca-e9c3-af33-ebad20dd8a23@redhat.com>
Date: Tue, 7 Sep 2021 14:52:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210906153939.165567-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/09/21 17:39, Thomas Huth wrote:
> When running "./configure --static --disable-system" there is currently
> a warning if the static version of libpng is missing:
> 
>   WARNING: Static library 'png16' not found for dependency 'libpng', may not
>   be statically linked
> 
> Since it does not make sense to look for the VNC-related libraries at all
> when we're building without system emulator binaries, let's add a check
> for have_system here to silence this warning.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 7e58e6279b..f07236d947 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -931,7 +931,7 @@ vnc = not_found
>   png = not_found
>   jpeg = not_found
>   sasl = not_found
> -if not get_option('vnc').disabled()
> +if have_system and not get_option('vnc').disabled()
>     vnc = declare_dependency() # dummy dependency
>     png = dependency('libpng', required: get_option('vnc_png'),
>                      method: 'pkg-config', kwargs: static_kwargs)
> 

Queued, thanks.

Paolo


