Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91D02F0ED1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 10:15:38 +0100 (CET)
Received: from localhost ([::1]:33872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kytIX-0006Ry-AJ
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 04:15:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kytHM-0005qu-B4
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 04:14:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kytHK-0001oK-0Q
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 04:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610356460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=phxGVDoI7CEBmycCjqoKmu7ISBokTRztmcZvhCK5VgM=;
 b=H3yQRcqdxEixEpowqW6vJ13T/scQz/SVhGrZ3UkFE2EGnGHDMmAbRtxMUbXbIjnX4bcmiB
 MQkppK7/9cn+N+7WvN7BtWllMeoHAKIu0rjIDdXVnbZQHDzTb9sTrcOXM87jZOVsIhLZsO
 GHv0Tva7G+xSC+jpw8yjyNFCPVZjm6c=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-dQ8YQYe1Nuqgtw4GLwbodA-1; Mon, 11 Jan 2021 04:14:19 -0500
X-MC-Unique: dQ8YQYe1Nuqgtw4GLwbodA-1
Received: by mail-ej1-f70.google.com with SMTP id ov1so4833015ejb.1
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 01:14:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=phxGVDoI7CEBmycCjqoKmu7ISBokTRztmcZvhCK5VgM=;
 b=WhuGCFuHttIv7sQ09K5xHJjIu8fIUGb9LDVZu0THj8UjQswqqK81zvDE2W0R65ia0G
 ZcpjxKt2nsqrL72X1xcwIqT9auo5pzm8+mgC4T9gE7qB58Y1Qkiz7uLAJR8nKCSrkYN4
 iZb6ySHdIe6jHz4Zvjrx+AqTsjMPiNWz5lylelGeIEfbusIeHumWupIl6xzXFr1DoeME
 Vz6rhHzAtLNdjJsmR+WYIQKZ/FbkPbnOrMwWefiDCnj8QMjg+phAkrckqKjmvZ32eTcX
 Z/W9Wpitbxki6D6alVEK9e1LCS1Ym/vYpS1diiVkpZ5Dj9lGZ3w0QTLCMQ3tC+pj3mHP
 MrFg==
X-Gm-Message-State: AOAM5313PGSxZeHeWsfv2nhgove4HW8csLtzP5s0aQ6lgGyGjTLAdNYR
 hXXESUuqXMjJbwmvjVxCkwC78/FVd6irMdnwwig1rrvT2nOCFjRdlmiIxlst+uzg12LsaHf+KC8
 IDp4oobnEefTAZ34=
X-Received: by 2002:a17:906:3593:: with SMTP id
 o19mr9899567ejb.377.1610356458008; 
 Mon, 11 Jan 2021 01:14:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx47SsS2lSdbpS3ILAt+RWBku20jMyCkqdYGUyHXJ3uatw5sDqL+kcficw5WjR0unBv0/PCHg==
X-Received: by 2002:a17:906:3593:: with SMTP id
 o19mr9899551ejb.377.1610356457677; 
 Mon, 11 Jan 2021 01:14:17 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id s26sm7428723edc.33.2021.01.11.01.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 01:14:16 -0800 (PST)
Subject: Re: [PATCH] hw/block/nvme: add smart_critical_warning property
To: zhenwei pi <pizhenwei@bytedance.com>, kbusch@kernel.org,
 its@irrelevant.dk, kwolf@redhat.com
References: <20210111075003.151764-1-pizhenwei@bytedance.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3ebda26a-2734-242b-c553-2092ba7f4b35@redhat.com>
Date: Mon, 11 Jan 2021 10:14:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111075003.151764-1-pizhenwei@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

On 1/11/21 8:50 AM, zhenwei pi wrote:
> There is a very low probability that hitting physical NVMe disk
> hardware critical warning case, it's hard to write & test a monitor
> agent service.
> 
> For debugging purposes, add a new 'smart_critical_warning' property
> to emulate this situation.
> 
> Test with this patch:
> 1, append 'smart_critical_warning=16' for nvme parameters.
> 2, run smartctl in guest
>  #smartctl -H -l error /dev/nvme0n1
> 
>   === START OF SMART DATA SECTION ===
>   SMART overall-health self-assessment test result: FAILED!
>   - volatile memory backup device has failed
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  hw/block/nvme.c | 4 ++++
>  hw/block/nvme.h | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 27d2c72716..2f0bcac91c 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1215,6 +1215,8 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
>  
>      trans_len = MIN(sizeof(smart) - off, buf_len);
>  
> +    smart.critical_warning = n->params.smart_critical_warning;
> +
>      smart.data_units_read[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_read,
>                                                          1000));
>      smart.data_units_written[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_written,
> @@ -2824,6 +2826,8 @@ static Property nvme_props[] = {
>      DEFINE_PROP_UINT32("aer_max_queued", NvmeCtrl, params.aer_max_queued, 64),
>      DEFINE_PROP_UINT8("mdts", NvmeCtrl, params.mdts, 7),
>      DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
> +    DEFINE_PROP_UINT8("smart_critical_warning", NvmeCtrl,
> +                      params.smart_critical_warning, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index e080a2318a..76684f5ac0 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -16,6 +16,7 @@ typedef struct NvmeParams {
>      uint32_t aer_max_queued;
>      uint8_t  mdts;
>      bool     use_intel_id;
> +    uint8_t  smart_critical_warning;
>  } NvmeParams;
>  
>  typedef struct NvmeAsyncEvent {
> 

This is an easy way to achieve your goal.

However a better way is to add a QMP command to
change NvmeCtrl->temperature.

See for example tmp105_initfn() in hw/misc/tmp105.c
and qmp_tmp105_set_temperature() in tests/qtest/tmp105-test.c.

Regards,

Phil.


