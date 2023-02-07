Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB72868E07A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 19:48:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPT0O-0001Yq-Ds; Tue, 07 Feb 2023 13:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPT0L-0001TD-Vl
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:47:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPT0J-000113-Ph
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:47:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675795661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyRs0XV4an3wv5UVoZltkE1Df7nRCnoPLNHwaAkcOnY=;
 b=HbvCrAxJDOGficsMKhCz6ayOr4wlhp6QLum5miUQRLOr7MnBNi3HJ4j6nMMWrjPz0dHGBM
 Lx6IAVoP7IQJRYC2LWZSHuenRWkb6RKGo9mEElKARd/1Ma4p9jG32efR4vR+7Ux5cipr1M
 qzeA+bL9bq+O6CWGI2rFkqEVg/bHkQ8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-221-vvF4UTAHMQ-YO_bOcKVHbA-1; Tue, 07 Feb 2023 13:47:37 -0500
X-MC-Unique: vvF4UTAHMQ-YO_bOcKVHbA-1
Received: by mail-qv1-f69.google.com with SMTP id
 pv16-20020ad45490000000b0056bf828babfso3547445qvb.23
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 10:47:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cyRs0XV4an3wv5UVoZltkE1Df7nRCnoPLNHwaAkcOnY=;
 b=5SPbE5HwGAeXKZVTKukEUf9zEoSxL6XHiP8pIDSB3XMC0F8YZ9R/fRXjFAjTMWo0J1
 KZBVEzG9RJHPp+DTLfJQ3vIRFKRgCOjVEd/KgW3fCmOudTAgyQTvhSL7KDgD8/0L+2J9
 bW6r9ztlR3/U2WVPdAZaCcXfQJN9Hc6004HMaLXXAp2ELokneIP8/v2pI6si1HuWJYcz
 odwzfhU+RhNEMdeC9PIVZNNkGay1TwIq2Uf42MxAbzZv8w5jQHQOw/vGfIufyr1G2hPb
 lw+wBdEUFhIkZNbYWx24gi845zSxAaZEXmWDkEpW+8DNIteM0+J/O93ZvH6eAEYQ84WB
 vHIg==
X-Gm-Message-State: AO0yUKV+uJNpnbx3nBQZQvCaY3Ena+MTZluCs+Qr0X+Oa/74sJ5VWA+w
 HZBTwSz7+dHTxKCihNv5NJGv5bLHDgOrt0XeauG63CNxaOml8DFmEqdEIPc0TNhsP2mKpSbpRy0
 UZu+9KNCgeSlcGzY=
X-Received: by 2002:ac8:5cd2:0:b0:3b8:41d2:1b43 with SMTP id
 s18-20020ac85cd2000000b003b841d21b43mr7069504qta.61.1675795656778; 
 Tue, 07 Feb 2023 10:47:36 -0800 (PST)
X-Google-Smtp-Source: AK7set9y905j8ftZHXUY5lhdUuAbSxZytHW1oolIQVxhGFo5kTogizqoPiMTqOWdT+QFwcPqiIh1hQ==
X-Received: by 2002:ac8:5cd2:0:b0:3b8:41d2:1b43 with SMTP id
 s18-20020ac85cd2000000b003b841d21b43mr7069480qta.61.1675795656514; 
 Tue, 07 Feb 2023 10:47:36 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-228.customers.d1-online.com.
 [80.187.99.228]) by smtp.gmail.com with ESMTPSA id
 c29-20020ac8009d000000b003b323387c1asm9877524qtg.18.2023.02.07.10.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 10:47:35 -0800 (PST)
Message-ID: <badcc737-279c-4a03-13fc-167501716f3c@redhat.com>
Date: Tue, 7 Feb 2023 19:47:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest/netdev-socket: Raise connection timeout to 60
 seconds
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
References: <20230207165119.1479132-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230207165119.1479132-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 07/02/2023 17.51, Peter Maydell wrote:
> The netdev-socket test intermittently fails on our s390x CI runner:
> 
> 633/659 ERROR:../tests/qtest/netdev-socket.c:197:test_stream_unix:
> assertion failed (resp == expect): ("st0: index=0,type=stream,connection error\r\n" == "st0: index=0,type=stream,unix:/tmp/netdev-socket.GZUG01/stream_unix\r\n")
> ERROR
> 633/659 qemu:qtest+qtest-xtensa / qtest-xtensa/netdev-socket
> ERROR           5.47s   killed by signal 6 SIGABRT
> 
> This may just be because when the machine is under heavy load
> running the CI tests it hits the timeout before the QEMU
> under test has started to the point of being able to respond
> to HMP queries.
> 
> Bump the timeout to 60 seconds to see if the intermittent
> goes away.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/qtest/netdev-socket.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
> index 6ba256e1730..1d98dca821f 100644
> --- a/tests/qtest/netdev-socket.c
> +++ b/tests/qtest/netdev-socket.c
> @@ -12,7 +12,7 @@
>   #include "../unit/socket-helpers.h"
>   #include "libqtest.h"
>   
> -#define CONNECTION_TIMEOUT    5
> +#define CONNECTION_TIMEOUT    60

Acked-by: Thomas Huth <thuth@redhat.com>

Feel free to apply directly as a CI fix, I don't have any pull request 
planned in the next days.


