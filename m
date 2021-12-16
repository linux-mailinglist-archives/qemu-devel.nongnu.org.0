Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14AE476CE2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:08:51 +0100 (CET)
Received: from localhost ([::1]:58060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmks-0006zW-Lf
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:08:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxmjC-0004oX-VV
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:07:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxmj9-0006Qz-PY
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639645622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2YjNT5m5X06ei2XIbYTAlr1unO0OQx82Xj1Yd5it48g=;
 b=FADj0y+xSB6WBxQppzSDMaJX+OfXWPQ6/x7MK7o5PtAUIct81Dv0ryP5iq9LbqzJL8Ue3X
 N1hVdqXqz2XSsc/3HQcBsrmhybl7GkM1Q2wzWzeXhm2ikdo6kqikL3ZVTVZrr0/9lQyR7m
 jFoaQiMfUrxjubB9Nk6yxBdB1zz1rF0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-dqbXoBXtOWyYoyMKHZj1rw-1; Thu, 16 Dec 2021 04:07:01 -0500
X-MC-Unique: dqbXoBXtOWyYoyMKHZj1rw-1
Received: by mail-wm1-f72.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so13560458wmb.3
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 01:07:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2YjNT5m5X06ei2XIbYTAlr1unO0OQx82Xj1Yd5it48g=;
 b=fFe+MNtAJuQSmhbDuAHEd8pU90CA+hTtRH9IOWZ94GTnTXpzLH07ajSa0RrDTrpCuc
 hf8VFzkmYu6x3bjAvfOUSZIYddwv6CDS9Rfip3/f6FPrVzbbV4s8rYGR5hvBR7/Q2vlK
 yywWwe7R4ld9gQ1fLIbr5Y7vhccen6kktNpG18McdZBn0wPXKIfR/p3j9sZnfU3Q/1vC
 z9T/A8KK56oNl6346HR2Dd6SOjA5AbtuxfCvWAC6SwRGYgbxPCqhLGbXD6MB/ivqFSK7
 K55aJyAO837N2gEEPTffefXlSJjDWWg1KwMUpJXkmVEMyqPrd2d+JjI4mPMe1FVFLhU+
 HMCA==
X-Gm-Message-State: AOAM532ZdB1KjKpobOSuGm2UYguNtOqeURV2G34053WLtRyoDUdWmSHD
 SROszWaciX/HR9IQFJkWJWtfSDxGodjfLf+iVZbevA9qjo2BxMsieMNwMM5tpmgfiVIFZgkcBQP
 8aJu3bn2h3Cnfnbc=
X-Received: by 2002:adf:9e49:: with SMTP id v9mr7909754wre.469.1639645620113; 
 Thu, 16 Dec 2021 01:07:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwug9nHjPP/TgK4JwOxs18pXHP+EUJYKH8sbaTlA7lAnKv1OfObjzIGOiWHEL7/I0oFDnJOfA==
X-Received: by 2002:adf:9e49:: with SMTP id v9mr7909747wre.469.1639645619937; 
 Thu, 16 Dec 2021 01:06:59 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id k7sm4255888wri.110.2021.12.16.01.06.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 01:06:59 -0800 (PST)
Message-ID: <b9f4aea8-d101-ce0b-d29d-aceb730b4300@redhat.com>
Date: Thu, 16 Dec 2021 10:06:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 06/10] configure: unify ppc64 and ppc64le
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211216085139.99682-1-pbonzini@redhat.com>
 <20211216085139.99682-7-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211216085139.99682-7-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 12/16/21 09:51, Paolo Bonzini wrote:
> The only difference between the two, as far as either configure or
> Meson are concerned, is the default endianness of the compiler.
> 
> For tests/tcg, specify the endianness explicitly on the command line;
> for configure, do the same so that it is possible to have --cpu=ppc64le
> on a bigendian system or vice versa.  Apart from this, cpu=ppc64le can
> be normalized to ppc64 also in configure and not just in the meson
> cross file.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure              | 10 ++++------
>  tests/tcg/configure.sh |  4 +++-
>  2 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


