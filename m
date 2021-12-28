Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5FC480CCA
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:27:06 +0100 (CET)
Received: from localhost ([::1]:52286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2I7l-0005cS-Lf
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:27:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2I4C-0004JL-7g
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 14:23:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2I40-0002Li-K3
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 14:23:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640719390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bc3+qaTUdeyOdPPhLrwmGRg6msURoULR5CEU221oa/Q=;
 b=OmMNtEf6Cf66mtXtJOyYffR0ykgU16mtdm1woJdMS6Jh0L7T5rEJcUwz0qeuP7bbXa9VBl
 QFPLaVsr3JnTISgOCDOv/ANx/Go+16K5lrBtFHLxm12yi24hcUTdjXVqUwu5Lr/4jb0LoY
 XzXyfLGAgxnWhR3lUWkqidjmWeUohUs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-s3tGtGnVNf-9eNCNGFSxNg-1; Tue, 28 Dec 2021 14:23:08 -0500
X-MC-Unique: s3tGtGnVNf-9eNCNGFSxNg-1
Received: by mail-wm1-f72.google.com with SMTP id
 g189-20020a1c20c6000000b00345bf554707so10738182wmg.4
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 11:23:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bc3+qaTUdeyOdPPhLrwmGRg6msURoULR5CEU221oa/Q=;
 b=iacK66QGSl5sYyWIgqFT7rLFFYad2jjbdTix1uKsMDQNVG8Rx76Mz+bioOZDd+2fjE
 NuIJnTgAyzl9NQTTQR6t42xOCXBP4AvMxiNV9VPfIUU+0exLgH+mDBfkrQaNGIhn13ER
 0vQYxelbB59FuANEVRqpVS+Nih83mmeWGO/7jR6T0hSeFcu3tOhMCf683knwPgjR5ubM
 vVIPkPUEj+80obVD0AF0QIH1Yyi/9+/Ni8jG7fWZZnHIT6zXFfScfnX21jWnx94Uoz50
 7SeEFQpvyC9KzqPS5FsvbnEEkeYaLpvfJiZ7nxNPszEH+ZTqVKnHh1J35JGmWsgYYlMX
 8XfQ==
X-Gm-Message-State: AOAM530DIx5oH7bzFv3O2TFNYhBcK2yLlfPxrPAoAxdr5RelDhTOvo6n
 menRLPWqWYw4s1jEe1+GBIoObOkPZOGOaW9dDgmoTaNOwOnzD/UxcECGRq6PJcpPg+8OWDo7ZKg
 Wb8enrGR5aPZQAVY=
X-Received: by 2002:a7b:c108:: with SMTP id w8mr18312741wmi.136.1640719387619; 
 Tue, 28 Dec 2021 11:23:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyWILVhenOj7n3neNCcu97EHZnvzogONGKH1ygHkk9D/RdVFAsqDk5ibkVVSTt+ZqJvD6ajg==
X-Received: by 2002:a7b:c108:: with SMTP id w8mr18312715wmi.136.1640719387398; 
 Tue, 28 Dec 2021 11:23:07 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id l17sm9963035wms.24.2021.12.28.11.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 11:23:06 -0800 (PST)
Message-ID: <21974630-06ee-bacd-ca83-0116f1c6d4ec@redhat.com>
Date: Tue, 28 Dec 2021 20:23:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 03/14] hw/core/machine: Wrap target specific parameters
 together
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20211228092221.21068-1-wangyanan55@huawei.com>
 <20211228092221.21068-4-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211228092221.21068-4-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/21 10:22, Yanan Wang wrote:
> Wrap the CPU target specific parameters together into a single
> variable except generic sockets/cores/threads, to make related
> code lines shorter and more concise.
> 
> No functional change intended.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine-smp.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> index b39ed21e65..4547d7bbdc 100644
> --- a/hw/core/machine-smp.c
> +++ b/hw/core/machine-smp.c
> @@ -79,6 +79,7 @@ void machine_parse_smp_config(MachineState *ms,
>      unsigned cores   = config->has_cores ? config->cores : 0;
>      unsigned threads = config->has_threads ? config->threads : 0;
>      unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
> +    unsigned others;
>  
>      /*
>       * Specified CPU topology parameters must be greater than zero,
> @@ -111,6 +112,8 @@ void machine_parse_smp_config(MachineState *ms,
>      dies = dies > 0 ? dies : 1;
>      clusters = clusters > 0 ? clusters : 1;
>  
> +    others = dies * clusters;

This doesn't seem clearer to me...

>      /* compute missing values based on the provided ones */
>      if (cpus == 0 && maxcpus == 0) {
>          sockets = sockets > 0 ? sockets : 1;
> @@ -124,30 +127,30 @@ void machine_parse_smp_config(MachineState *ms,
>              if (sockets == 0) {
>                  cores = cores > 0 ? cores : 1;
>                  threads = threads > 0 ? threads : 1;
> -                sockets = maxcpus / (dies * clusters * cores * threads);
> +                sockets = maxcpus / (cores * threads * others);
>              } else if (cores == 0) {
>                  threads = threads > 0 ? threads : 1;
> -                cores = maxcpus / (sockets * dies * clusters * threads);
> +                cores = maxcpus / (sockets * threads * others);
>              }
>          } else {
>              /* prefer cores over sockets since 6.2 */
>              if (cores == 0) {
>                  sockets = sockets > 0 ? sockets : 1;
>                  threads = threads > 0 ? threads : 1;
> -                cores = maxcpus / (sockets * dies * clusters * threads);
> +                cores = maxcpus / (sockets * threads * others);
>              } else if (sockets == 0) {
>                  threads = threads > 0 ? threads : 1;
> -                sockets = maxcpus / (dies * clusters * cores * threads);
> +                sockets = maxcpus / (cores * threads * others);
>              }
>          }
>  
>          /* try to calculate omitted threads at last */
>          if (threads == 0) {
> -            threads = maxcpus / (sockets * dies * clusters * cores);
> +            threads = maxcpus / (sockets * cores * others);
>          }
>      }
>  
> -    maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * clusters * cores * threads;
> +    maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads * others;
>      cpus = cpus > 0 ? cpus : maxcpus;
>  
>      ms->smp.cpus = cpus;
> @@ -159,7 +162,7 @@ void machine_parse_smp_config(MachineState *ms,
>      ms->smp.max_cpus = maxcpus;
>  
>      /* sanity-check of the computed topology */
> -    if (sockets * dies * clusters * cores * threads != maxcpus) {
> +    if (sockets * cores * threads * others != maxcpus) {
>          g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
>          error_setg(errp, "Invalid CPU topology: "
>                     "product of the hierarchy must match maxcpus: "


