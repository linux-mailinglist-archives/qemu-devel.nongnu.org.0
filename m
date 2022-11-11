Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D0C625529
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:25:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOmV-0003ud-Ke; Fri, 11 Nov 2022 02:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otOmS-0003sO-FJ
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:48:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otOmQ-0001Wq-WB
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668152930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ei7ij+MwHgbXYfsS46GAtVD7XX+HveDX17t4Oegiksk=;
 b=MjheNt4OBtHbE3LA7UjImwcLHW+5daPDagmes33SYIS+fpu9rgrhFhqtBiM1LjuNV1ldxO
 al/1E/thXnDQ9BC03RbwxCj+hqyDbOl9yMooh1yO4jBKzmlLvaUafAy34QfyHN0UnSYecK
 n6XOaaBPT5DMcCU0EcuiZLfI3J2JOfM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-503-s6DsL1TsNrCEGucRj7FoNw-1; Fri, 11 Nov 2022 02:48:48 -0500
X-MC-Unique: s6DsL1TsNrCEGucRj7FoNw-1
Received: by mail-qt1-f200.google.com with SMTP id
 f4-20020a05622a114400b003a57f828277so3171132qty.22
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:48:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ei7ij+MwHgbXYfsS46GAtVD7XX+HveDX17t4Oegiksk=;
 b=TVgcuKT+Q0X9Fi/cTal85sgj74ACopgiM4GM28UZvjb5aN4XfgqwVzV63BBAvRyUJx
 KWqZzEeeYMax14V8PH/QNY7r5KWMoKmBgYmgovtkL0z3VHzpkaA9aQo0/PMAqkAZ9V06
 ZnBmEmJfDus94eBC0X3kLzoHbpp6k/y/BvPHVLe4UQJzv2GoF6UV5cSJXevgptbwwayZ
 yJ6HZZg/UGGEEhtETqHEz07dLy+xeIYFHMbqwErIwLbVtaBH/hiJrxsLUFoSS2CeVVf6
 lURc7R3GJuwCLcH7uWbX37lcF/2Z7je+8Pve2A7Fo5Zy/QghPFCILhZCM9fIW5cassfn
 ifYg==
X-Gm-Message-State: ANoB5pkpOnXh6vlZMpT1vrhjRxqXRdTvPgJ2MnRJ3GXylKZqw7sCImM7
 8Nfblg3beB6r06YbL01TR96hGNIGof7iFkntxjtgYJzQQWz23r0tRdX5vuavY/L0UQlq5MlhPYA
 0hXrh7yHPkLibo0A=
X-Received: by 2002:a05:6214:310a:b0:4bb:7dfa:2717 with SMTP id
 ks10-20020a056214310a00b004bb7dfa2717mr961538qvb.59.1668152928443; 
 Thu, 10 Nov 2022 23:48:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7j222SN/r/NEs+/pbHpl1Xl/cnXkPmRPVRt8JPUhY5h6AzNIqpLOErXN7UagEwol69CcKSog==
X-Received: by 2002:a05:6214:310a:b0:4bb:7dfa:2717 with SMTP id
 ks10-20020a056214310a00b004bb7dfa2717mr961527qvb.59.1668152928204; 
 Thu, 10 Nov 2022 23:48:48 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 a4-20020ac85b84000000b0039853b7b771sm890734qta.80.2022.11.10.23.48.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 23:48:47 -0800 (PST)
Message-ID: <aca6714b-8939-7a73-a9ca-c4cb2a07c1e7@redhat.com>
Date: Fri, 11 Nov 2022 08:48:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 18/19] tests/qtest: virtio-9p-test: Adapt the case for
 win32
Content-Language: en-US
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221111042225.1115931-1-bin.meng@windriver.com>
 <20221111042225.1115931-19-bin.meng@windriver.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221111042225.1115931-19-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 11/11/2022 05.22, Bin Meng wrote:
> From: Guohuai Shi <guohuai.shi@windriver.com>
> 
> Windows does not provide the getuid() API. Let's create a local
> one and return a fixed value 0 as the uid for testing.
> 
> Co-developed-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v2:
> - Move getuid() to virtio-9p-client.h
> 
>   tests/qtest/libqos/virtio-9p-client.h | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/tests/qtest/libqos/virtio-9p-client.h b/tests/qtest/libqos/virtio-9p-client.h
> index 78228eb97d..a5c0107580 100644
> --- a/tests/qtest/libqos/virtio-9p-client.h
> +++ b/tests/qtest/libqos/virtio-9p-client.h
> @@ -491,4 +491,11 @@ void v9fs_rlink(P9Req *req);
>   TunlinkatRes v9fs_tunlinkat(TunlinkatOpt);
>   void v9fs_runlinkat(P9Req *req);
>   
> +#ifdef CONFIG_WIN32
> +static inline uint32_t getuid(void)
> +{
> +    return 0;
> +}
> +#endif
> +
>   #endif

Reviewed-by: Thomas Huth <thuth@redhat.com>


