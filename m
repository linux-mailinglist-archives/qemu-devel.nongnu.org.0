Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4B5450805
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:15:23 +0100 (CET)
Received: from localhost ([::1]:53230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdha-0003dT-Kl
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:15:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmde2-0005xX-Rs
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 10:11:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmddu-0001kY-Kv
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 10:11:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636989092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C7H2EjRkQ3VmJjnbzonBQIfVtMGJlpQge6uNtMxZkCs=;
 b=HO3z+fbkcI37CSd2MFZQ6bxfPLt1sC36pg+/xFJkJL5h9hUmtv0s3PRMXDnWa03V9Fr13U
 cvd+Jx/G1RXaScHd8OVufUeKr5/H680L9IkfmqQIEnGCtPW9PyAr0hT7I7ozVUoLVv1vGt
 Qi6Fth6ZIE11NYvt75wt5hTD+DNckYc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-3-7mksAZMsOkkSFTXDSYGg-1; Mon, 15 Nov 2021 10:11:29 -0500
X-MC-Unique: 3-7mksAZMsOkkSFTXDSYGg-1
Received: by mail-wr1-f69.google.com with SMTP id
 a2-20020a5d4d42000000b0017b3bcf41b9so3668786wru.23
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 07:11:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C7H2EjRkQ3VmJjnbzonBQIfVtMGJlpQge6uNtMxZkCs=;
 b=jcuTPEcsWh1KpB/xP4fNj55H/deYjBuM8chYu03mkMQaDf2EGCpNDUgjT/Jp9H4GRU
 SU9v7J27tdIh/XI8jUuYw5700/4wP3sx7smrf6el6cSBfEHgpwyx54e+degGVnqKcRp0
 pEe7u8dN/3XsYDRb0OLNMoh/SclK9+ybgLyjQvywm506lDJjIAmiWq7Z6E0ePNX6Dn1X
 WXmEkKqTVoP70r8Af6Y5LDoHiE5xuApSjILE8mP2U9b7clR4jLvNjsZUryG3wjIQJd8K
 nRarvP8RWU6DnaFjZJA6g3K2c5IDYARWUeQo+lfIVnIBDwaSXxvDZhGeCxobBKIKEfwf
 oTOg==
X-Gm-Message-State: AOAM532nwgLZcB5lwoXM83FGQHpsQQVEn8p7kB1ATvgIlj6gZfZU9xnm
 ldxrpjpen09abfgE6L92A5dXgsHp678PpnTSk8HVzVt9nuki8ebHOcmG4L8+VrckXM3jurm90HK
 wcgkvkYc1Y3odV0g=
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr43385015wru.89.1636989088454; 
 Mon, 15 Nov 2021 07:11:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMik7wGjLVanVAWqwULfkLDa9uneON/SP+lmj9mI/FZcEKhuYzl0NnHHoL+xICqZ2VLV31kA==
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr43384962wru.89.1636989088237; 
 Mon, 15 Nov 2021 07:11:28 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id t11sm14327109wrz.97.2021.11.15.07.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 07:11:27 -0800 (PST)
Message-ID: <c7324851-ebe8-c797-360a-a5ec1c465d06@redhat.com>
Date: Mon, 15 Nov 2021 16:11:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 24/25] job.h: split function pointers in JobDriver
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-25-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-25-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
> The job API will be handled separately in another serie.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/qemu/job.h | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index 6e67b6977f..7e9e59f4b8 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -169,12 +169,21 @@ typedef struct Job {
>    * Callbacks and other information about a Job driver.
>    */
>   struct JobDriver {
> +
> +    /* Fields initialized in struct definition and never changed. */

Like in patch 19, I’d prefer a slightly more verbose comment that I’d 
find more easily readable.

> +
>       /** Derived Job struct size */
>       size_t instance_size;
>   
>       /** Enum describing the operation */
>       JobType job_type;
>   
> +    /*
> +     * Functions run without regard to the BQL and may run in any

s/and/that/?

> +     * arbitrary thread. These functions do not need to be thread-safe
> +     * because the caller ensures that are invoked from one thread at time.

s/that/they/ (or “that they”)

I believe .run() must be run in the job’s context, though.  Not sure if 
that’s necessary to note, but it isn’t really an arbitrary thread, and 
block jobs certainly require this (because they run in the block 
device’s context).  Or is that something that’s going to change with I/O 
threading?

Hanna


