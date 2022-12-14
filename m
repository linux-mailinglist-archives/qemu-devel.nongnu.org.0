Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38F364C766
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:48:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5PIY-0007T1-5K; Wed, 14 Dec 2022 05:47:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5PIV-0007Rk-Uu
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:47:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5PIT-0006Vv-Qx
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:47:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671014852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eVpuXtqiOx02tHUSGnpP6vKq1MPpMSHDX2yz5VuTQX4=;
 b=J8QcFzU7MOuk0NN/d+pbfAuucXA3uRP3/edko/3d2U5G2ugi+94/Uq7qiQbw0Ah/YYIFq8
 Cn6zIQ1WHSjOGE0LwmHqJWVFODI2sb1E6tMq0lqmDX2qIIPcxnOmewyGfv/fls8dDve4dQ
 CByosftYzX1vX4lu5u/iRAo0it+PUPk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-286-P6wrhRx9O8K2Gq5kolhk-g-1; Wed, 14 Dec 2022 05:47:28 -0500
X-MC-Unique: P6wrhRx9O8K2Gq5kolhk-g-1
Received: by mail-wm1-f71.google.com with SMTP id
 i9-20020a1c3b09000000b003d21fa95c38so4259507wma.3
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 02:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eVpuXtqiOx02tHUSGnpP6vKq1MPpMSHDX2yz5VuTQX4=;
 b=FwMbDo+atE1sR24NO5O5a04qwFjbfiDhO5yCRqv3qur6moeHPrNJhzuqvTGiM3fA5i
 BSfF4BxEkHshZbWgjbkO8c0AS5eBnXPmIZw6fC0gflkbCSOlGuZo31sR0DsZMjEZ8ODj
 7XxUpSLUJQZGNo+lX1FJaceZblXmhss00102T3Hv8aMnr4KarCYVsSFi9JN5UV9riqkJ
 +Vd3sTTAYLuU3gObqkvuuDR9OO47KTCm+9Agr5Ch2BB+M3i2nXbCPrmQaU6eb6xGmAD4
 08hBapkYjwtMEQueYylKBEnf6xyfzOBWgaZmLnhW4jZ7Wv9nUYzle2P3hIzvk4GTJ2P7
 E74Q==
X-Gm-Message-State: ANoB5pl3QG87wMi6SQ5GtvsnqQTecfxw8MlIk072vJZu0auXKZt3yFDt
 9NYj2QMBJycjUv2P5yK2Tw9I6gt7bG1GvGInuxa31KKJgJxz+zJCyZaN9q/JW6+RyVn527LOH1t
 HHsaTEhS614AriaQ=
X-Received: by 2002:a05:600c:1e8a:b0:3d1:bd81:b1b1 with SMTP id
 be10-20020a05600c1e8a00b003d1bd81b1b1mr17508764wmb.18.1671014847513; 
 Wed, 14 Dec 2022 02:47:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6Cf+pnSz9J7IiJsNhAARhnJcOm+kcgr83imPDha4XOtDZtyJwO4OI7AnnMRdhsaW2nIXiKSQ==
X-Received: by 2002:a05:600c:1e8a:b0:3d1:bd81:b1b1 with SMTP id
 be10-20020a05600c1e8a00b003d1bd81b1b1mr17508750wmb.18.1671014847233; 
 Wed, 14 Dec 2022 02:47:27 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-56.web.vodafone.de.
 [109.43.178.56]) by smtp.gmail.com with ESMTPSA id
 iv19-20020a05600c549300b003d09150b339sm2399428wmb.20.2022.12.14.02.47.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 02:47:26 -0800 (PST)
Message-ID: <2d548e30-11eb-6f64-b082-25e5ff546309@redhat.com>
Date: Wed, 14 Dec 2022 11:47:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/vm: Update haiku test vm to R1/Beta3
Content-Language: en-US
To: Alexander von Gluck IV <kallisti5@unixzen.com>
References: <20220216154208.2985103-1-kallisti5@unixzen.com>
Cc: qemu-devel@nongnu.org
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220216154208.2985103-1-kallisti5@unixzen.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/02/2022 16.42, Alexander von Gluck IV wrote:
> ---
>   tests/vm/haiku.x86_64 | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
[...]
> @@ -48,8 +48,8 @@ class HaikuVM(basevm.BaseVM):
>       name = "haiku"
>       arch = "x86_64"
>   
> -    link = "https://app.vagrantup.com/haiku-os/boxes/r1beta2-x86_64/versions/20200702/providers/libvirt.box"
> -    csum = "41c38b316e0cbdbc66b5dbaf3612b866700a4f35807cb1eb266a5bf83e9e68d5"
> +    link = "https://app.vagrantup.com/haiku-os/boxes/r1beta3-x86_64/versions/20220216/providers/libvirt.box"
> +    csum = "e67d4aacbcc687013d5cc91990ddd86cc5d70a5d28432ae2691944f8ce5d5041"

  Hi Alexander!

The Haiku VM started again to fail, I'm getting these error messages now:

Encountered problems:
problem 1: nothing provides haiku>=r1~beta4_hrev56578_4-1 needed by 
glib2_devel-2.75.0-1
   solution 1:
     - do not install "providing devel:libglib_2.0"
problem 2: nothing provides haiku>=r1~beta4_hrev56578_31-1 needed by 
gettext-0.21.1-2
   solution 1:
     - do not install "providing devel:libintl"
problem 3: nothing provides haiku>=r1~beta4_hrev56578_31-1 needed by 
curl-7.85.0-2
   solution 1:
     - do not install "providing devel:libcurl"
problem 4: nothing provides haiku>=r1~beta4_hrev56578_31-1 needed by 
gnutls-3.7.8-1
   solution 1:
     - do not install "providing devel:libgnutls"
problem 5: nothing provides haiku>=r1~beta4_hrev56578_4-1 needed by 
glib2-2.75.0-1
   solution 1:
     - do not install "providing devel:libslirp"

Does it need an update to a newer version of Haiku?

  Thomas


