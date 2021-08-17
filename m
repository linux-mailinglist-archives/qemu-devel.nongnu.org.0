Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101F03EEDBF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 15:51:21 +0200 (CEST)
Received: from localhost ([::1]:45914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFzUt-0005Sp-AL
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 09:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFzTl-0004hC-7u
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 09:50:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFzTh-000558-Sv
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 09:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629208204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QspSGJvOH/ctE3FKLW1adFTN5nvhQEpZYM3w5V7bcJ8=;
 b=d7hoCPpY8a83S9N9YaiZFfsPB9ipl75wmjcPdWNkNOnVbJcp7vUHOShHHjSDPonWGfNBqP
 NuE8QrqK4TFyMMsJICGrQEaK5vXJJkQurA1dJvA5YLkb1NbwC4U3oVKKf0PDDJ/UvCKA+2
 nlNLDyHK1iL78XXSYULTyuc5TplG05o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-JpqwxBk-PxW320SQFl4hvg-1; Tue, 17 Aug 2021 09:50:03 -0400
X-MC-Unique: JpqwxBk-PxW320SQFl4hvg-1
Received: by mail-wr1-f69.google.com with SMTP id
 m5-20020a5d6a050000b0290154e83dce73so6551681wru.19
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 06:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QspSGJvOH/ctE3FKLW1adFTN5nvhQEpZYM3w5V7bcJ8=;
 b=UBKtzInt1/iwSkEJGTI8L7eAWdZBJb5A2VBjzwfn1nUc6rd9nRJts1fZ2rPoZFNQmv
 cAoKfLiwpRkWnjdTupN4fg4P+8llZftICxcQmJ5kolPIzVTmiR+Lbz91ikcJ7IFPj6nj
 t8v3lKbrAkwjqBi2yi1ESrL5SWjz57jq0HiqOlNCEUwXZV0w4WAEc91Of7qOoHZaxx2o
 uH7sUWuW7mIR9P3T8wb01vq32BScBq4Z9wq6+c2toxKDJVlMJ22TiRrNZsfe/L9Kv/Lm
 Hn8FOcxtr3BOC0WXir04hcDdVuiSHhIIhga9QU3Ph5+j27eqAD/bVTy0nua8ZwRUkljU
 RQLg==
X-Gm-Message-State: AOAM532//43S9L1I8X6VtV8Rs/Y19sXjtwFwsfMzJeHkwijLwsDB/2uQ
 EwAwooRh3KxEeKJQxwkTDUjFvAuEbSbGKo2IV7CT47q0vYqukD2bDn3Re/U5x6ntWeChzTXMuN7
 m6SqHZ5vHDWiaOFo=
X-Received: by 2002:a1c:1dc4:: with SMTP id d187mr3538554wmd.1.1629208202460; 
 Tue, 17 Aug 2021 06:50:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7oTG7UDRtYq/aihc5Elr5Yrrr7dPCn7cXa4EW35Vf4U98nCazkGS+DzZA+kBOjDxufGPY9g==
X-Received: by 2002:a1c:1dc4:: with SMTP id d187mr3538533wmd.1.1629208202265; 
 Tue, 17 Aug 2021 06:50:02 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id q11sm2226444wmc.41.2021.08.17.06.50.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 06:50:01 -0700 (PDT)
Subject: Re: [PATCH] qapi/machine.json: Remove zero value reference from
 SMPConfiguration documentation
To: Andrew Jones <drjones@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <20210817125356.9461-1-drjones@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <efcde1ef-8d9f-8e4a-355c-aec6a527d8f3@redhat.com>
Date: Tue, 17 Aug 2021 15:50:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817125356.9461-1-drjones@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/21 2:53 PM, Andrew Jones wrote:
> Commit 1e63fe685804 ("machine: pass QAPI struct to mc->smp_parse")
> introduced documentation stating that a zero input value for an SMP
> parameter indicates that its value should be automatically configured.
> This is indeed how things work today, but we'd like to change that.
> Avoid documenting behaviors we want to leave undefined for the time
> being, giving us freedom to change it later.
> 
> Fixes: 1e63fe685804 ("machine: pass QAPI struct to mc->smp_parse")
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  qapi/machine.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qapi/machine.json b/qapi/machine.json
> index c3210ee1fb24..157712f00614 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1288,7 +1288,7 @@
>  ##
>  # @SMPConfiguration:
>  #
> -# Schema for CPU topology configuration.  "0" or a missing value lets
> +# Schema for CPU topology configuration.  A missing value lets
>  # QEMU figure out a suitable value based on the ones that are provided.
>  #
>  # @cpus: number of virtual CPUs in the virtual machine
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


