Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D8C57A11F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 16:19:21 +0200 (CEST)
Received: from localhost ([::1]:39760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDo4G-0002wT-IE
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 10:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDndR-0003gu-92
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:51:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDndO-0002tF-ON
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658238694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OTl9aXcRjhVLwfyFuU7nX+ff9vhIC4Fz3hKZXHDbIMU=;
 b=Oqg6WWa7h6bUZHKgkKBDcDYeEr9Vg8fq3jclwkvLAccLbv/A59KmXkmwtjgsOfOvFB+Veb
 r3WGNhy3T9Do+3CwVLLTLDvbUul/Tj3sdVZwVBMFpFtiTNhbyOcbUoX8mn/cRwVfpICQ6r
 p0ar3cnpS0DdwaJ4wG/mckfRr+lm4yc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-3xNZZoBnNymiVfZQQH61jA-1; Tue, 19 Jul 2022 09:51:32 -0400
X-MC-Unique: 3xNZZoBnNymiVfZQQH61jA-1
Received: by mail-wr1-f71.google.com with SMTP id
 j16-20020adfa550000000b0021d63d200a8so2591702wrb.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 06:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=OTl9aXcRjhVLwfyFuU7nX+ff9vhIC4Fz3hKZXHDbIMU=;
 b=xuhPToSzBAZyloc1ZHTnY2yV+QjGePe1qpeghCwYxmYPt7dhidTzHK+hId4JceNDA/
 M43a+q7TBK/98wE2fRzkJHNHgpM/4J4EUrepoS3HryOvTkI2kWduYqaE5jzbgIbyU2XQ
 5irxcj9sX1/numAy3liYXDb2sFD/C5HYc0wFDs/LaIUAhlglPZF6HD/7Hcjr+4Fqo58m
 Gz5yCrho/qME0FVx/ndVXbTxm/BpBwqTwqPRQTqypFmVk7uSmc+Q1t+0C+EEbge1d8R0
 sAnogvobyRmlg8gcBO4RqZdC6PIjEYbYgb0sO9lUIcUFCCD9cemxcOS2FWo84ALjJDzm
 yV5A==
X-Gm-Message-State: AJIora81dpLz5U+UwssVDkRTI9UJyXHYLEWjheJuVrDb9IaKeEA7XX1f
 bGFiGYbRcAdVG9zV6tGTtJyc9aHPekxHesWsMmWV7kb5NoRvFxU4VES9OU5eE9CN3qYgOI3g9O5
 Oi5MHXz5ingFl/WA=
X-Received: by 2002:a5d:5c05:0:b0:21d:83b4:d339 with SMTP id
 cc5-20020a5d5c05000000b0021d83b4d339mr26999481wrb.611.1658238691113; 
 Tue, 19 Jul 2022 06:51:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1urX042LggmEnTsMZU+FXoksV12rra+gOJ0NuCAFTm+lEhhMkA/k6Bnu+4EIuhB5HMjmKlgSQ==
X-Received: by 2002:a5d:5c05:0:b0:21d:83b4:d339 with SMTP id
 cc5-20020a5d5c05000000b0021d83b4d339mr26999469wrb.611.1658238690899; 
 Tue, 19 Jul 2022 06:51:30 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 j9-20020a05600c190900b0039db31f6372sm26053230wmq.2.2022.07.19.06.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 06:51:30 -0700 (PDT)
Date: Tue, 19 Jul 2022 14:51:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] migration: remove unreachable code after reading data
Message-ID: <Yta24JtoX8+N1s52@work-vm>
References: <20220627135318.156121-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220627135318.156121-1-berrange@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> The code calls qio_channel_read() in a loop when it reports
> QIO_CHANNEL_ERR_BLOCK. This code is reported when errno==EAGAIN.
> 
> As such the later block of code will always hit the 'errno != EAGAIN'
> condition, making the final 'else' unreachable.
> 
> Fixes: Coverity CID 1490203
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Queued

> ---
>  migration/qemu-file.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 1e80d496b7..1615c48b7e 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -384,10 +384,8 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
>          f->total_transferred += len;
>      } else if (len == 0) {
>          qemu_file_set_error_obj(f, -EIO, local_error);
> -    } else if (len != -EAGAIN) {
> -        qemu_file_set_error_obj(f, len, local_error);
>      } else {
> -        error_free(local_error);
> +        qemu_file_set_error_obj(f, len, local_error);
>      }
>  
>      return len;
> -- 
> 2.36.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


