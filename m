Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CC754A849
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 06:46:16 +0200 (CEST)
Received: from localhost ([::1]:42186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0yRU-0005xZ-2X
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 00:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o0yMT-0002Bh-Tx
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:41:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o0yMS-0004pl-Jj
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:41:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655181664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zolh/VJIMd/EciFDq7BwIP/hPbNXmQ6vjlxZ8e1jV0k=;
 b=SM0Z4dTI/irctaIijSLe+gQQWGy3dI4cY46e4DhJpTssO8qrwv3SMmGboFr/pGjoiYzeMj
 zrRo4ZIpiDde9zLir6waZlDWc7d3RkKrLoGIry5Rq5JQ1bfkC6FpEnhXaiW6hVsHWdnsw9
 bLIfi+FHuj8NGql7NkheALu2JhC4X08=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-YbG3vy5mMTuRlBT6xGBTuA-1; Tue, 14 Jun 2022 00:41:02 -0400
X-MC-Unique: YbG3vy5mMTuRlBT6xGBTuA-1
Received: by mail-wm1-f72.google.com with SMTP id
 o23-20020a05600c511700b0039743cd8093so4247850wms.6
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 21:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zolh/VJIMd/EciFDq7BwIP/hPbNXmQ6vjlxZ8e1jV0k=;
 b=w0vpyhEOupsZqvMYi6eYppcOsid2r8Fqe53w3oyz4oGx6zhOHJtqZ27WX0FLmsbKP+
 dhhvDgF33f3ONjrxW+dUWJlGUvKljtJ3n8kQVhUyx+7Df++ZTZfOWFVpQ4N3RdoXqYwD
 Mri3yemvIGb/uDhX+F+C+nU9ME/Gvf+OOqC3R7rt9cZ0gZsVFgaD5Y7/BfyI2k1tVNy6
 +5Fg45gcPlUnos8+18QkFViWudw6HO0HougheoY80cePELG9X5T28GYHQ/9AkDcUsfUT
 noa3JWxlIgsfyIEEOWNLnvTKwkNIXTd1CHMZBoewinG/3wdQEEckxsFb7M9WHcZRZ1kD
 UCVw==
X-Gm-Message-State: AOAM533DhvJZOdIcP9ZWoxXlZB//YdcmBoQeC9ezYnrMr45DuERYMJvF
 0DLMuAD5zMSLezYpc415yeByR7moUAwJJ8ifKlknRxyryytV9NzHl38XUI5RJBiYwTj0sMprXbb
 BayLkM2QrV5nxsbU=
X-Received: by 2002:a05:600c:2c46:b0:39c:55a0:9533 with SMTP id
 r6-20020a05600c2c4600b0039c55a09533mr2008248wmg.104.1655181661184; 
 Mon, 13 Jun 2022 21:41:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrz5sX/rLzKkVYijvz58iVfTeH3b6h3AzxguyUjRHsFuhN1c+u0zTKb+jf0Rro6JKE9WTtzg==
X-Received: by 2002:a05:600c:2c46:b0:39c:55a0:9533 with SMTP id
 r6-20020a05600c2c4600b0039c55a09533mr2008232wmg.104.1655181661009; 
 Mon, 13 Jun 2022 21:41:01 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-114-75.web.vodafone.de.
 [109.42.114.75]) by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c35d400b0039c1396b495sm12150405wmq.9.2022.06.13.21.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 21:41:00 -0700 (PDT)
Message-ID: <a1009c3f-dfb6-c4c1-1c9d-1a9e1b46ad9f@redhat.com>
Date: Tue, 14 Jun 2022 06:40:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/5] tests/vm: switch CentOS 8 to CentOS 8 Stream
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220614015044.2501806-1-jsnow@redhat.com>
 <20220614015044.2501806-5-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220614015044.2501806-5-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 14/06/2022 03.50, John Snow wrote:
> The old CentOS image didn't work anymore because it was already EOL at
> the beginning of 2022.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/vm/centos | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


