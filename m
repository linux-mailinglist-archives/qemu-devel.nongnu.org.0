Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F913A2D68
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:47:10 +0200 (CEST)
Received: from localhost ([::1]:53058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrL1Z-0000tr-KS
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrKw6-00070g-65
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:41:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrKw4-0000Vz-CT
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623332487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wXhvonUfD0jC3/nY4sqGgZ7F8OrcnSyjrRzZec22OUk=;
 b=Lsl/pM+pN+Nwwx6ifGgoFa33Uvfjfd0+NBzLTujo9CfaaJJWE7KUtsrCIacDJRQSOWsFmx
 DlbUTsSrc3RuFY3y4Q68mciiNgz0l3L3sLV7EKpUFvHWwqA4wW3Rb3n5sot2lidJ+7yqwk
 HG7a8ZlKByHjsFQCJbkv+Qy+WTo3Qos=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-C7p_kSc-MB-gfRb22UPFjQ-1; Thu, 10 Jun 2021 09:41:26 -0400
X-MC-Unique: C7p_kSc-MB-gfRb22UPFjQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 m27-20020a056000025bb0290114d19822edso901950wrz.21
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wXhvonUfD0jC3/nY4sqGgZ7F8OrcnSyjrRzZec22OUk=;
 b=TNag+2qA7Vli0SugUDPONiMwj+UXAnj1vGZ3VGdM98N9/cgoZo0s/xP+k8+DagDBFp
 2jaJRSuaLhb4RgvxjLxgmVseEgNGXvkO0x7I2bRtEfSV6lPQtuaYJtj/3Axuy9DAGJvL
 P0HWG3xkmTorCl9hiSsulogXh1wOLx1zQ9e0CblKw/eDUY16hNmCoGyQ9ee6LlJtyo1C
 agb5YIz1XRoleEctlPNB/2Z5cWa3n/N1L+zSPsy6SxHC1r2KzTxuQzeE3Zqi/LJbqnOY
 vxqV8sf/7SREh8X3Y+MG8tvq3erorDKzAUCqmGRyAmzwrw8Xjp72z3D7i/ZCBm9qRq3q
 ZMVg==
X-Gm-Message-State: AOAM530CC2kLLVfaq/aZhXQX1DkWhodbk3VMyNaJTDuVu8zGO4tM/04S
 Ne+09vQc0m4rY8K6y+GBVW8OcMfuObCOvPp0stxQe7P5geDXqEjfnTgujJNdx3UHA7TUdWaQX+E
 9FjPzwb8vsCyYiiE=
X-Received: by 2002:a05:600c:251:: with SMTP id
 17mr15087270wmj.137.1623332484504; 
 Thu, 10 Jun 2021 06:41:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvOTfvJnb/8pzAcHWCcZhON9aGsu6yNb34AfvnoYcZywUzgsVtmsZJ4Y8tn21ZLh53cc27WQ==
X-Received: by 2002:a05:600c:251:: with SMTP id
 17mr15087252wmj.137.1623332484312; 
 Thu, 10 Jun 2021 06:41:24 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id m23sm2994535wmc.29.2021.06.10.06.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 06:41:23 -0700 (PDT)
Subject: Re: [PATCH] runstate: Initialize Error * to NULL
To: Peng Liang <liangpeng10@huawei.com>, qemu-devel@nongnu.org,
 qemu-stable <qemu-stable@nongnu.org>
References: <20210610131729.3906565-1-liangpeng10@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <028fda0a-3918-af41-7dd9-3b64173cb106@redhat.com>
Date: Thu, 10 Jun 2021 15:41:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210610131729.3906565-1-liangpeng10@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: philmd@redhat.com, alejandro.j.jimenez@oracle.com, laurent@vivier.eu,
 xiexiangyou@huawei.com, armbru@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/06/21 15:17, Peng Liang wrote:
> Based on the description of error_setg(), the local variable err in
> qemu_init_subsystems() should be initialized to NULL.
> 
> Fix: efd7ab22fb "vl: extract qemu_init_subsystems"
> Signed-off-by: Peng Liang <liangpeng10@huawei.com>
> ---
> The patch is generated by the following coccinelle script (thanks to
> Markus):
> @ r @
> identifier id;
> @@
> (
>    static Error *id;
> |
>    Error *id
> + = NULL
>    ;
> )
> And exclude the modifications in softmmu/vl.c (which has fixed by
> Zhenzhong Duan already) and util/error.c (which are unnecessary).
> 
>   softmmu/runstate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index ce8977c6a29c..54713100c2ea 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -746,7 +746,7 @@ static void qemu_run_exit_notifiers(void)
>   
>   void qemu_init_subsystems(void)
>   {
> -    Error *err;
> +    Error *err = NULL;
>   
>       os_set_line_buffering();
>   
> 

Queued, thanks.

Cc: qemu-stable@nongnu.org

Paolo


