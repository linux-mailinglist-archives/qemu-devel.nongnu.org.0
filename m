Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CF068BD11
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:40:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0mZ-0006Wy-AR; Mon, 06 Feb 2023 07:39:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pP0m8-0006Ss-Ha
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:39:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pP0m3-0001lc-5R
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:39:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675687144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y0Climxmd80gPJCZb9kfYYkitkINiIJLh9XX7tfV0B0=;
 b=aquDf8Nf13gCxCkWWU938sY9MWGPMw81vwLT9d19ZepWXSypW3suCUUQWnTzl9TpZ+nsJa
 r8FsnwTJAMRBam8QkJtxFy13V5Ecr483h/FheX0XUXNAtr3D5Auz6FQduRuHzkiyEnKe0C
 0waarZFkSXpUfBiUrcUzzlflM/9mL9Q=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-198-A10R-pzvNWCwxC8-CjL4ag-1; Mon, 06 Feb 2023 07:39:03 -0500
X-MC-Unique: A10R-pzvNWCwxC8-CjL4ag-1
Received: by mail-qv1-f72.google.com with SMTP id
 cs17-20020ad44c51000000b0056c02b4bf4aso54427qvb.4
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 04:39:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y0Climxmd80gPJCZb9kfYYkitkINiIJLh9XX7tfV0B0=;
 b=6ipPTPIvdxj7NsF/wiaJ5HNWRVVR+fX7fqVpj2poyY6GreqsqaXXc80hajy02WtrWr
 JoFuFujwIulxjHuuKzScUBs1K9peOFUDosxlwJiJ8DY1+s6PZ3jSjfsPEO/5KKAdSux+
 mV9TE67sHFtWuZyG0BQWvvJdIy2VG8d6p/0v8aAvvujdSy6RdGWdjzCeALkSKOUy5hG7
 6fVb4sTDtILP5ZErTTBwXi9S6liXM3+OpZflzjsJrNNk+zle9yapV4zYKNm60YTkCx2+
 xxZrZbM1yF3bdPhhXolDeCdEfNSjVKCM6pmiKUcGn13/NM6jw7TUj1bNvFj2o04+xbNv
 C9bg==
X-Gm-Message-State: AO0yUKWQwkOfU0/7wSWbTZozXc+0jyHBlSMGbS39LKe5/LIQzW1sWEnA
 r5/HCNnu77waEGJxM1ZBoJK98zwUEDdlcR1HOToV2HeK1h7z7nQMWD6gfHLiCGAgneARq14Rh/W
 8VXTC4t9NKiy/u/4=
X-Received: by 2002:a05:622a:491:b0:3b9:bd05:bdf1 with SMTP id
 p17-20020a05622a049100b003b9bd05bdf1mr32230877qtx.14.1675687142673; 
 Mon, 06 Feb 2023 04:39:02 -0800 (PST)
X-Google-Smtp-Source: AK7set8RJUU66GhEeiPWpfV8qSkiLHe6iumVprXheEBwrWwN+C0Y2B4J1cbBOXtModm3cWIW9aXBOA==
X-Received: by 2002:a05:622a:491:b0:3b9:bd05:bdf1 with SMTP id
 p17-20020a05622a049100b003b9bd05bdf1mr32230838qtx.14.1675687142434; 
 Mon, 06 Feb 2023 04:39:02 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-71.web.vodafone.de.
 [109.43.177.71]) by smtp.gmail.com with ESMTPSA id
 o11-20020ac8698b000000b003b9f1b7895asm7120008qtq.10.2023.02.06.04.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 04:39:01 -0800 (PST)
Message-ID: <cce946c3-aa78-b9a2-79af-a2cf1ce32355@redhat.com>
Date: Mon, 6 Feb 2023 13:38:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-10-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v15 09/11] machine: adding s390 topology to query-cpu-fast
In-Reply-To: <20230201132051.126868-10-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 01/02/2023 14.20, Pierre Morel wrote:
> S390x provides two more topology containers above the sockets,
> books and drawers.

books and drawers are already handled via the entries in 
CpuInstanceProperties, so this sentence looks like a wrong leftover now?

I'd suggest talking about "dedication" and "polarity" instead?

> Let's add these CPU attributes to the QAPI command query-cpu-fast.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   qapi/machine.json          | 13 ++++++++++---
>   hw/core/machine-qmp-cmds.c |  2 ++
>   2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 3036117059..e36c39e258 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -53,11 +53,18 @@
>   #
>   # Additional information about a virtual S390 CPU
>   #
> -# @cpu-state: the virtual CPU's state
> +# @cpu-state: the virtual CPU's state (since 2.12)
> +# @dedicated: the virtual CPU's dedication (since 8.0)
> +# @polarity: the virtual CPU's polarity (since 8.0)
>   #
>   # Since: 2.12
>   ##
> -{ 'struct': 'CpuInfoS390', 'data': { 'cpu-state': 'CpuS390State' } }
> +{ 'struct': 'CpuInfoS390',
> +    'data': { 'cpu-state': 'CpuS390State',
> +              'dedicated': 'bool',
> +              'polarity': 'int'
> +    }
> +}
>   
>   ##
>   # @CpuInfoFast:
> @@ -70,7 +77,7 @@
>   #
>   # @thread-id: ID of the underlying host thread
>   #
> -# @props: properties describing to which node/socket/core/thread
> +# @props: properties describing to which node/drawer/book/socket/core/thread

I think this hunk should rather be moved to patch 1 now.

  Thomas


