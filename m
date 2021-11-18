Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF862455DAD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 15:12:56 +0100 (CET)
Received: from localhost ([::1]:41396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mni9n-0007J5-UZ
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 09:12:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mni7x-0005oN-9J
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:11:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mni7m-0000fE-8U
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:10:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637244649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E1kX38lSUKy2zjNUru2iLZwOmlvV4w3v/4jAVDpCg5U=;
 b=Y7g3oZboOsanijnlQhKru7gA0lIS1FxKNtxHKcHJVscVd8JHOiFpeFDHBaBjQyTXGQ8DIx
 q2KAi5sHnVo3IvEzKuv7CY+E/EgcG8u72UveV0sc8BX1CY8tSfG3ca33EEEWdxM4xhXoeq
 UFzqXGeB6rdi41BJTFr7vOzC3jlphpQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-2r91_oQgPQ20hIHml6nr_g-1; Thu, 18 Nov 2021 09:10:47 -0500
X-MC-Unique: 2r91_oQgPQ20hIHml6nr_g-1
Received: by mail-wm1-f72.google.com with SMTP id
 b133-20020a1c808b000000b0032cdd691994so4389797wmd.1
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 06:10:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E1kX38lSUKy2zjNUru2iLZwOmlvV4w3v/4jAVDpCg5U=;
 b=pKEKENqcxtgD8h/QqeThEzgXtggsDsJN/5SGYtLX+iu3JG72p+7anSjrQjrnhgnhQq
 nxZmSrVxwf60Eqjgzfef7v3kehQEsFDe9+aojvFYamKA665Gjat7zAG+toLS37cahqCV
 tq2eWc/xGhecEoTJoF8d7GSuRBJ/wOudHM5P6WZ9UODSCpsg4Xs/6xlPXcRWam27QhtM
 sH+x4lCBapxwNfvGsvvpN311oFePIZ7PcEtt5r57v0QXbaP0lIO2/aTjXUyySUDvDy9b
 j194GO0iqo9GF4l2o0hsxUMvzYzoM1Uj+nHv8hzUhuW9RdFokR/WnO8gDa9buK9mGrjO
 +Qdw==
X-Gm-Message-State: AOAM530obWZl0UJdp9T8cWYJOoEGCGIXZNnBblV3jM5khdl11g30hbUH
 P3Xl9IahTasG1cAXR3EAa4yu6yVxw8TR56upDkiLzbq9qGA/aA5KoTOvux8q1BUO4s1ukJTXNXu
 qOZjVJKqVGK05xpbymTjnZhcti3JJr7gVF9PmK0fSC1OiVUw82lTLalQgZuxkKz0e
X-Received: by 2002:a05:6000:1a41:: with SMTP id
 t1mr31313241wry.261.1637244645830; 
 Thu, 18 Nov 2021 06:10:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwV1CB2YGIIuwUHeT6Xdfdi3M34omeVre83uwfFK/tHs3xEyZok0v+3JYlC80MqTxbumhbghg==
X-Received: by 2002:a05:6000:1a41:: with SMTP id
 t1mr31313185wry.261.1637244645527; 
 Thu, 18 Nov 2021 06:10:45 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z7sm8748110wmi.33.2021.11.18.06.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 06:10:44 -0800 (PST)
Message-ID: <02e7e56e-f80d-1e9c-13ec-0ddbe3b5b360@redhat.com>
Date: Thu, 18 Nov 2021 15:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [qemu-web PATCH v2] Add Sponsors page
To: qemu-devel@nongnu.org
References: <20211118122912.4051779-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211118122912.4051779-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Markey <admin@fosshost.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Alistair regarding the RISC-V foundation help:
https://www.cnx-software.com/2021/05/03/the-risc-v-foundation-to-give-away-1000-risc-v-development-boards/

On 11/18/21 13:29, Philippe Mathieu-Daudé wrote:
> Add a page listing QEMU sponsors.
> 
> For now, only mention Fosshost which requested to be listed:
> https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05381.html
> 
> Cc: Thomas Markey <admin@fosshost.org>
> Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/2
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Since v1:
> - move to footer (Daniel)
> - only list sponsor who asked to be listed (Stefan)
> ---

> diff --git a/sponsors.md b/sponsors.md
> new file mode 100644
> index 0000000..1c097c8
> --- /dev/null
> +++ b/sponsors.md
> @@ -0,0 +1,9 @@
> +---
> +title: QEMU sponsors
> +permalink: /sponsors/
> +---
> +
> +QEMU has sponsors!
> +
> +For continuous integration and testing, hardware is provided by:
> +- [Fosshost](https://fosshost.org/)
> 


