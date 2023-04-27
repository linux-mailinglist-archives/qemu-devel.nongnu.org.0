Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B306F0640
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:57:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps1Ai-0004HF-KP; Thu, 27 Apr 2023 08:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ps1Ag-0004ER-KE
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:56:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ps1Ae-0004m8-7t
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:56:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682600182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IfclxeSdUSyg5QrSLqcHhq+pSnFVJv1yUJYwKGUdf4c=;
 b=Nc40K73rF7t/zYfFA/DtoDyr1IFjGIPvXBeUip5XAscoURRP7QRiBP2Si+Id21m7AzALbN
 F6wJbxAO7q3RYHR+vpLxjcTDXvAFNxxHxx7QDlv9mJ0VGsHcjgiQxkQIBrBEKBBW0HCiuh
 AyLMse5Lpklp5c39Ua/geFsKukn4tN0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-qjoW7ZxlNSqvqkfzQBocMA-1; Thu, 27 Apr 2023 08:56:21 -0400
X-MC-Unique: qjoW7ZxlNSqvqkfzQBocMA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f1749c63c9so30171515e9.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 05:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682600180; x=1685192180;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IfclxeSdUSyg5QrSLqcHhq+pSnFVJv1yUJYwKGUdf4c=;
 b=M5prKukkVruDzF0z89F2Otq+l67m9x4sgeXfKFaeERyj/HAucohs3inwAAB9/sOmHz
 7Gqv5gitEFRy2VqFmS+JVe50vveAd1VRHz/O+i/nvPYKURR9q/Yf8vHplcoL5L11lMRr
 kfMZYkDWTEfTpd8TN0TC5WTO4XJCWCCBPZdiYgThGRsgv3eJ+1XdBF36duisFwKuX2mq
 sx7PeGwDdOWzLH25D/LaMxLgnp1HwPFmBOT+aEPrgiffDk32vGi+FH90gRTwsJcrphie
 JK+GfFkwsYTev3U8AOFvSVvbXi4EAvlwQ0x1Cq+LlYy13fkjLWJieTkSbgsylpphzK1d
 m7nQ==
X-Gm-Message-State: AC+VfDz5z1DQKm72O8W+HePAE1F49ijE5kR1ZQ3okQ1CL86zU6aKx4md
 +GIOnbqHCE1LLRH41Ec5X4MkuHwS9r9LaYX86GjVSodDbh9Zg+GsY0Hg/UjJFFZcvax5LOsAnJR
 L4jbLgm2t7jSMSSQ=
X-Received: by 2002:a7b:cb8c:0:b0:3ee:6cdf:c357 with SMTP id
 m12-20020a7bcb8c000000b003ee6cdfc357mr1419454wmi.20.1682600180083; 
 Thu, 27 Apr 2023 05:56:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5vZ1hF6lrpvBQpu6xUI14t+rQJqjlNyuX/dy+gdY36TXRQy7F/QS7TxMkvCsufd+8kDf42Dg==
X-Received: by 2002:a7b:cb8c:0:b0:3ee:6cdf:c357 with SMTP id
 m12-20020a7bcb8c000000b003ee6cdfc357mr1419442wmi.20.1682600179825; 
 Thu, 27 Apr 2023 05:56:19 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003f191c9c4b0sm17943557wmc.11.2023.04.27.05.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 05:56:19 -0700 (PDT)
Message-ID: <58980d6b-7c33-0663-3712-7a07dc0d33ff@redhat.com>
Date: Thu, 27 Apr 2023 14:56:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] tests: vhost-user-test: release mutex on protocol
 violation
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, qemu-trivial@nongnu.org
References: <20230427125423.103536-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230427125423.103536-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/04/2023 14.54, Paolo Bonzini wrote:
> chr_read() is printing an error message and returning with s->data_mutex taken.
> This can potentially cause a hang.  Reported by Coverity.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/qtest/vhost-user-test.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
> index bf9f7c4248ca..e4f95b2858f0 100644
> --- a/tests/qtest/vhost-user-test.c
> +++ b/tests/qtest/vhost-user-test.c
> @@ -351,7 +351,7 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
>           if (size != msg.size) {
>               qos_printf("%s: Wrong message size received %d != %d\n",
>                          __func__, size, msg.size);
> -            return;
> +            goto out;
>           }
>       }
>   
> @@ -509,6 +509,7 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
>           break;
>       }
>   
> +out:
>       g_mutex_unlock(&s->data_mutex);
>   }
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


