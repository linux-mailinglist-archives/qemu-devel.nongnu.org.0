Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FECB2F65F8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:30:55 +0100 (CET)
Received: from localhost ([::1]:34994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05WQ-0002qp-3u
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:30:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l04yM-0007Eg-1O
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:55:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l04yJ-0007zZ-DY
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610639737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bgOZ7j8BDb9zSWv7KNA3RMdoj7O75Aa0jzol0iE3zig=;
 b=AnqKI+oJOt81+550zw8DLXixy8uLhJLoP0daRV5kyuJdTvTB5yVEn6plVNTt6vf2Fjpjft
 r426XFWM9YruHI52jR4Y7aWBgXrFUf3Lwcf5BSmEG/tJ+1nNO36wdqdmeofShDy9P8Jxt1
 KT22QQppYmQkR+bOetitmRUAQcmXlJM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-IEcGf8UjNziIUmabcslfpQ-1; Thu, 14 Jan 2021 10:55:35 -0500
X-MC-Unique: IEcGf8UjNziIUmabcslfpQ-1
Received: by mail-wm1-f71.google.com with SMTP id b184so915720wmh.6
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 07:55:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bgOZ7j8BDb9zSWv7KNA3RMdoj7O75Aa0jzol0iE3zig=;
 b=DFtsb4cKOfRIs8E5kbTxx+tNm66Vu+6ceXUEOu3MorZ/ZT7KMiZMRw4K9P/f/jVzFu
 bQD7YA7QRWBeRjrDBr9syEAnzErjzVyfy8p8hM3SGuFCc6w6HhXTizkA7kx/rMe5ZYGA
 7Was1ijK8lMGD32JFBlPKWa4M1RxoP2+RuUIw/4spP/9whwMyWCV7lbclFpTW/0mkqNA
 XwZrj1yM6+JG44AhK3Rw133AQvJv2vtPp1c643UHsyLEY5naASAFFWZiVC3rCBkr8A8Z
 F0T4uSiW7+Yt1aOWEgtQk3KWYapCk0e+NmlMgW93+D17VPaTDDGZICwIRqSGIcWHukCd
 5hhQ==
X-Gm-Message-State: AOAM533AdapKdtdhuPl1+sDo2AQyq5H4liwO26kYqzD8lh5ELpsQEkjy
 rPbl4rlSWo+Tc4ZyERi+VCHid6wFQD7UxL16CPP3SSAHZSog2Mv6hlNpjv92MIyaTV/BKmoJCY+
 w5erNrRrwRTHwdj+uFr0XhdE/iCuRifZU1DllOXaptdQIzZIl8jiNd96lZsPx6aDN
X-Received: by 2002:a5d:558a:: with SMTP id i10mr8789502wrv.363.1610639734441; 
 Thu, 14 Jan 2021 07:55:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkAKa6MKo30Ctqklhy+mRB++VNs1p1T1OSHqWcjNCsems9ZKz41eqkH/3YlJT+xofu33EXDw==
X-Received: by 2002:a5d:558a:: with SMTP id i10mr8789478wrv.363.1610639734190; 
 Thu, 14 Jan 2021 07:55:34 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id i59sm6870614wri.3.2021.01.14.07.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 07:55:33 -0800 (PST)
Subject: Re: [PATCH v3 3/4] hw/block/nvme: add smart_critical_warning property
To: zhenwei pi <pizhenwei@bytedance.com>, kbusch@kernel.org,
 its@irrelevant.dk, kwolf@redhat.com, mreitz@redhat.com
References: <20210114072251.334304-1-pizhenwei@bytedance.com>
 <20210114072251.334304-4-pizhenwei@bytedance.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4d38ab86-cd88-8c51-d15f-1117db8c3d10@redhat.com>
Date: Thu, 14 Jan 2021 16:55:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114072251.334304-4-pizhenwei@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 8:22 AM, zhenwei pi wrote:
> There is a very low probability that hitting physical NVMe disk
> hardware critical warning case, it's hard to write & test a monitor
> agent service.
> 
> For debugging purposes, add a new 'smart_critical_warning' property
> to emulate this situation.
> 
> The orignal version of this change is implemented by adding a fixed
> property which could be initialized by QEMU command line. Suggested
> by Philippe & Klaus, rework like current version.
> 
> Test with this patch:
> 1, change smart_critical_warning property for a running VM:
>  #virsh qemu-monitor-command nvme-upstream '{ "execute": "qom-set",
>   "arguments": { "path": "/machine/peripheral-anon/device[0]",
>   "property": "smart_critical_warning", "value":16 } }'
> 2, run smartctl in guest
>  #smartctl -H -l error /dev/nvme0n1
> 
>   === START OF SMART DATA SECTION ===
>   SMART overall-health self-assessment test result: FAILED!
>   - volatile memory backup device has failed
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  hw/block/nvme.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  hw/block/nvme.h |  1 +
>  2 files changed, 41 insertions(+)
...

> +static void nvme_set_smart_warning(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
> +{
> +    NvmeCtrl *s = NVME(obj);
> +    uint8_t value, cap = 0;
> +    uint64_t pmr_cap = CAP_PMR_MASK;
> +
> +    if (!visit_type_uint8(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    cap = NVME_SMART_SPARE | NVME_SMART_TEMPERATURE | NVME_SMART_RELIABILITY
> +          | NVME_SMART_MEDIA_READ_ONLY | NVME_SMART_FAILED_VOLATILE_MEDIA;
> +    if (s->bar.cap & (pmr_cap << CAP_PMR_SHIFT)) {
> +        cap |= NVME_SMART_PMR_UNRELIABLE;
> +    }
> +
> +    if ((value & cap) != value) {
> +        error_setg(errp, "unsupported smart critical warning value");

More useful:

           error_setg(errp,
                      "unsupported smart critical warning bits: 0x%x",
                      value & ~cap);

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks!


