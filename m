Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED64742224E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 11:29:12 +0200 (CEST)
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXgl4-0007Dh-Lw
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 05:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXgjx-0006Jb-UX
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 05:28:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXgju-00007i-Qq
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 05:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633426077;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NutA/OaEonlKr73NV3VU75H2S44oeu7nLXQVMYkp6qQ=;
 b=QkaIJdUXzltw+wi1RlCvkJQv4nbfY8QSPZoZ2QsOSgqehpOZlvBPiK1Hwjw+qzwsOLli0p
 wEXRUnM3o08DZTw22eG6BbL8C64RyCU5SGo0xoUw3JFGmlXFyh823ljPJRTR+hRYUvW57U
 3w068kwkiwrsgh1dDNqy/qfi5WSqeSg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-v2v6CaJ8PoW7M9dX_uK_Pw-1; Tue, 05 Oct 2021 05:27:56 -0400
X-MC-Unique: v2v6CaJ8PoW7M9dX_uK_Pw-1
Received: by mail-wm1-f70.google.com with SMTP id
 n17-20020a7bc5d1000000b0030d4041f73eso855005wmk.4
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 02:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=NutA/OaEonlKr73NV3VU75H2S44oeu7nLXQVMYkp6qQ=;
 b=feEQOOshTaV1aaqcsgFllbaz8GgZD52LfnyxLWniJRaoH28WdYV91BGODwoP4tR0s0
 DjuP/IBnqIVNroozUT+pn0e8QrGpZy3bugCPchEyZ9GBm/yAbTeBo4e6qphbJ/PvOu0f
 MRe5F9Fozf9I2Zd37dtnnxZBOSZ+3XyPq+X4psJOSD31jKiERgf432oDSIp3WEDfYAIf
 GrrUOMMY6TuBxogGKW+c/YZWY65C6jZ/RjAubwc8ZGa+KB2R7jANQg+FN+oL0fPfkH2/
 2ji7flo/uFzg/UmAq4ZzU8nm0fubHwPZssQLyGhiDdOI5jy9MfoGbwCPdwROz1QVx4ck
 2ljg==
X-Gm-Message-State: AOAM533TUpuFmJldwP79fTk0x+qYSyUeZ5MexNn+J3c/+ZPRGDYN1Dq0
 XY1/UFpR+9m0Ud5KRGADlIhnT01IateVuoYH7/ocH+aHcYTPxEingnCTKA/qNlpKL4CMvwzh6Cb
 U8LDDmnENJBQZVOo=
X-Received: by 2002:adf:a48f:: with SMTP id g15mr16630355wrb.259.1633426075164; 
 Tue, 05 Oct 2021 02:27:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxauG+8DvP0FgohJLbAN5/cxH5f/ziPRVm5WDpVMHriaQrcHwDhaPIS6ZXsqjW/WMi16VwL2g==
X-Received: by 2002:adf:a48f:: with SMTP id g15mr16630318wrb.259.1633426074857; 
 Tue, 05 Oct 2021 02:27:54 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id 61sm17092542wrl.94.2021.10.05.02.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 02:27:54 -0700 (PDT)
Subject: Re: [PATCH v4 05/11] hw/arm/virt: Use object_property_set instead of
 qdev_prop_set
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, imammedo@redhat.com
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-6-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <6ac00f79-57b9-0fd5-0652-1f0a01a39d4c@redhat.com>
Date: Tue, 5 Oct 2021 11:27:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211001173358.863017-6-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/1/21 7:33 PM, Jean-Philippe Brucker wrote:
> To propagate errors to the caller of the pre_plug callback, use the
> object_poperty_set*() functions directly instead of the qdev_prop_set*()
> helpers.
>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/virt.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 36f0261ef4..ac307b6030 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2465,8 +2465,9 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                          db_start, db_end,
>                                          VIRTIO_IOMMU_RESV_MEM_T_MSI);
>  
> -        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
> -        qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);
> +        object_property_set_uint(OBJECT(dev), "len-reserved-regions", 1, errp);
> +        object_property_set_str(OBJECT(dev), "reserved-regions[0]",
> +                                resv_prop_str, errp);
>          g_free(resv_prop_str);
>      }
>  }


