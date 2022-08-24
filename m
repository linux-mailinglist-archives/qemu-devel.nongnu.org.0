Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F5C59FDE2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 17:08:19 +0200 (CEST)
Received: from localhost ([::1]:56808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQrzN-0007Sr-TG
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 11:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oQrvw-0005FF-79
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:04:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oQrvs-0002V5-H0
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:04:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661353478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DygX394yRU1lO1BRSuzjyUMyRq6T7dOHcsoaCycCb2o=;
 b=BHTfLwyGtSKQOnd5d1+mB1Dk6JB1pTkEfROaUn8VtdNe+QghFY0OrK++u/b3KoyHkvn/sw
 fhr7HGE4+bKGpvUmsWeYkDPbByTIMFcqtDyJhEFiWs/SlpRglyB0IFW7xhwDpV6wom2g6D
 2QOjWAxOkPa/qIrV4Pzfc/LouySzi1k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-dS21x17INBOn04lrNag2_g-1; Wed, 24 Aug 2022 11:04:37 -0400
X-MC-Unique: dS21x17INBOn04lrNag2_g-1
Received: by mail-ed1-f70.google.com with SMTP id
 q18-20020a056402519200b0043dd2ff50feso11025724edd.9
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 08:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=DygX394yRU1lO1BRSuzjyUMyRq6T7dOHcsoaCycCb2o=;
 b=3ezBv1ktLNMJzFH0SwW/c6NI80EKPBDHQNjP4cFD1CPJqn89og+Mgg9FohRXRLxpy9
 evO0msN33hBka9tHm4MA54eMFDvnDOuDodVU22gaD/n+ye2SK4g0kZiMv70dAygGvSpD
 voXBXI0bdfB0w7XjRd2sZhvm/0R81JuTewqc5A3wsz33XsWvBzyZbEFgQCPivq6YJ8Hv
 yi4uOzNloORjVHQAhdcKrhlkDbvkdOeqcSEc5Ht8kX9tGKnEf5aYuVT1HDocY1sEns1b
 hn/l/w3d7dJkJ+1/9rL6/n0ri0C6TA3/MM3YQJs/xcM/LEVUKf5s++faV56qfJIye5xi
 LE3A==
X-Gm-Message-State: ACgBeo0/L1EC2u+7SRGEJfKZw5ubq/++xu5qxUHDv+8sWoa0nEU1F4Oa
 ack9Ytp55TFVgWswnIu5af0u2CNslGrNjnAO+7aLlq0Nk//RSGojjjIgVFar5VIxnN/jMMLgwWl
 tgvzA/ikhN9qHBD8=
X-Received: by 2002:a17:907:3e03:b0:722:e694:438 with SMTP id
 hp3-20020a1709073e0300b00722e6940438mr3171495ejc.755.1661353476089; 
 Wed, 24 Aug 2022 08:04:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5sEOhXXFw1YwlrLX2BmNwWqLDFhoUazNlzYwgdyi8cvoB4Pp6aaPza5dQjOvJiJLUr83qAKg==
X-Received: by 2002:a17:907:3e03:b0:722:e694:438 with SMTP id
 hp3-20020a1709073e0300b00722e6940438mr3171480ejc.755.1661353475854; 
 Wed, 24 Aug 2022 08:04:35 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a1709061db200b007306d478c62sm1282147ejh.62.2022.08.24.08.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:04:35 -0700 (PDT)
Date: Wed, 24 Aug 2022 17:04:33 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <qemu-trivial@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Eric
 Auger <eric.auger@redhat.com>, Peter Xu <peterx@redhat.com>,
 <wanghaibin.wang@huawei.com>
Subject: Re: [PATCH v2] hw/acpi: Add ospm_status hook implementation for
 acpi-ged
Message-ID: <20220824170433.7ba675ca@redhat.com>
In-Reply-To: <20220816094957.31700-1-zhukeqian1@huawei.com>
References: <20220816094957.31700-1-zhukeqian1@huawei.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Tue, 16 Aug 2022 17:49:57 +0800
Keqian Zhu <zhukeqian1@huawei.com> wrote:

> Setup an ARM virtual machine of machine virt and execute qmp "query-acpi-ospm-status"
> causes segmentation fault with following dumpstack:
>  #1  0x0000aaaaab64235c in qmp_query_acpi_ospm_status (errp=errp@entry=0xfffffffff030) at ../monitor/qmp-cmds.c:312
>  #2  0x0000aaaaabfc4e20 in qmp_marshal_query_acpi_ospm_status (args=<optimized out>, ret=0xffffea4ffe90, errp=0xffffea4ffe88) at qapi/qapi-commands-acpi.c:63
>  #3  0x0000aaaaabff8ba0 in do_qmp_dispatch_bh (opaque=0xffffea4ffe98) at ../qapi/qmp-dispatch.c:128
>  #4  0x0000aaaaac02e594 in aio_bh_call (bh=0xffffe0004d80) at ../util/async.c:150
>  #5  aio_bh_poll (ctx=ctx@entry=0xaaaaad0f6040) at ../util/async.c:178
>  #6  0x0000aaaaac00bd40 in aio_dispatch (ctx=ctx@entry=0xaaaaad0f6040) at ../util/aio-posix.c:421
>  #7  0x0000aaaaac02e010 in aio_ctx_dispatch (source=0xaaaaad0f6040, callback=<optimized out>, user_data=<optimized out>) at ../util/async.c:320
>  #8  0x0000fffff76f6884 in g_main_context_dispatch () at /usr/lib64/libglib-2.0.so.0
>  #9  0x0000aaaaac0452d4 in glib_pollfds_poll () at ../util/main-loop.c:297
>  #10 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:320
>  #11 main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:596
>  #12 0x0000aaaaab5c9e50 in qemu_main_loop () at ../softmmu/runstate.c:734
>  #13 0x0000aaaaab185370 in qemu_main (argc=argc@entry=47, argv=argv@entry=0xfffffffff518, envp=envp@entry=0x0) at ../softmmu/main.c:38
>  #14 0x0000aaaaab16f99c in main (argc=47, argv=0xfffffffff518) at ../softmmu/main.c:47
> 
> Fixes: ebb62075021a ("hw/acpi: Add ACPI Generic Event Device Support")
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/generic_event_device.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index e28457a7d1..a3d31631fe 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -267,6 +267,13 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
>      }
>  }
>  
> +static void acpi_ged_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
> +{
> +    AcpiGedState *s = ACPI_GED(adev);
> +
> +    acpi_memory_ospm_status(&s->memhp_state, list);
> +}
> +
>  static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>  {
>      AcpiGedState *s = ACPI_GED(adev);
> @@ -409,6 +416,7 @@ static void acpi_ged_class_init(ObjectClass *class, void *data)
>      hc->unplug_request = acpi_ged_unplug_request_cb;
>      hc->unplug = acpi_ged_unplug_cb;
>  
> +    adevc->ospm_status = acpi_ged_ospm_status;
>      adevc->send_event = acpi_ged_send_event;
>  }
>  


