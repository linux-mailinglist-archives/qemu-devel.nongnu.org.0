Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F276A3D7A4D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 17:57:53 +0200 (CEST)
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8PSq-0003EB-Pr
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 11:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8PRg-00023c-Hh
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:56:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8PRe-0000Qg-UM
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627401397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dbNZY3Tk1qteC6DKM8jKPyCVUk/SHNP/JfNywxVw2+k=;
 b=iREMyYMX7rSpnwZAZbrabp03fghrWjzb9fAPIrTeZ0lhcINJJ0y5gxH924ln8DJj7UlxlD
 TrNhCoi/WZFDOoWXl63LIywF8RQroXHBalWlHLAuzx37tmd+ul8St2uBThzpaWnqNGZPR5
 c7YU33JOzgecy20EF4G+LzElZj6LkrU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-YK9jEhFANJOhwvjuGt-bgQ-1; Tue, 27 Jul 2021 11:56:36 -0400
X-MC-Unique: YK9jEhFANJOhwvjuGt-bgQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 a1-20020a7bc1c10000b0290225338d8f53so1538688wmj.8
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 08:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dbNZY3Tk1qteC6DKM8jKPyCVUk/SHNP/JfNywxVw2+k=;
 b=d3sf11AcqQF4a+A+W0Fy2vRst7ZxRS0t8/ljhOoRPAEloj2ZqEGTPfajyanIYOrBLI
 UZOHXTOw6Gz1Xw0O7MlwfrPSIR8O08C/XVxNZ2JsFvPSf6IDW9GAeZM8ERHUq53DNfE/
 a9CmK5vyUWLcxlAgdxfaf+aC2o5yGOgAaCvpxo5deW81ylYKwDK5kaJPydTB6T7blbgo
 9Or/Bw6RodCFFGYwxv2093H5NlG3sXGFIYFM9hNPFTegj+lrFLdUsihLOP86CVLPJCB0
 cdmVi9J+t6uYM9MLq+o/DhieCmW3SyIWca2O7wHZrENw79BxYnanhGTJPPpdgFVsBPO7
 Y8jw==
X-Gm-Message-State: AOAM530kxZ9bVo6R/k6bDSv/Hh8mjCRT59zCdgLiO17QeDrWglUxXDIw
 IXIiovhwHqaXHKCTflehgV4dgjzfrQt+3W/hXuKjtk11CorDc9JFvxVWGGwhQsCIpUjyQpCUSf2
 xnLt/jRuz/JYcSDTho3WcQCuD1hMN8yvtAzv74ohOfipB7RhKBK9z55QWoZ871mU=
X-Received: by 2002:a1c:cc12:: with SMTP id h18mr5072379wmb.12.1627401395104; 
 Tue, 27 Jul 2021 08:56:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxc4qrGLQDQm7C69Ix0/e8EWX7p/kQcg0FsH7ldoMexabafhDwOcsBQkov/2b8y1mmFnqitQw==
X-Received: by 2002:a1c:cc12:: with SMTP id h18mr5072367wmb.12.1627401394822; 
 Tue, 27 Jul 2021 08:56:34 -0700 (PDT)
Received: from thuth.remote.csb (pd9e8352f.dip0.t-ipconnect.de.
 [217.232.53.47])
 by smtp.gmail.com with ESMTPSA id c10sm352859wml.12.2021.07.27.08.56.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 08:56:34 -0700 (PDT)
Subject: Re: [PATCH 1/2 v5] Configure script for Haiku
To: Richard Zak <richard.j.zak@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAOakUfM8zMpYiAEn-_f9s1DHdVB-Bq9fGMM=Hfr8hJW9ra6aWw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <67131919-0c13-9975-21da-8b9605fb716a@redhat.com>
Date: Tue, 27 Jul 2021 17:56:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAOakUfM8zMpYiAEn-_f9s1DHdVB-Bq9fGMM=Hfr8hJW9ra6aWw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 21/07/2021 03.40, Richard Zak wrote:
> Signed-off-by: Richard Zak <richard.j.zak@gmail.com 
> <mailto:richard.j.zak@gmail.com>>
> ---
>   configure | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 232c54dcc1..163af793e9 100755
> --- a/configure
> +++ b/configure
> @@ -768,7 +768,8 @@ SunOS)
>   ;;
>   Haiku)
>     haiku="yes"
> -  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE $QEMU_CFLAGS"
> +  pie="no"
> +  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -fPIC $QEMU_CFLAGS"
>   ;;
>   Linux)
>     audio_drv_list="try-pa oss"

Thanks, I've slightly updated the title and patch description and  queued it 
now to my branch here:

https://gitlab.com/thuth/qemu/-/commits/testing-next/

  Thomas


