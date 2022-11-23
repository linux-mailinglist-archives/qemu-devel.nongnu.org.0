Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB5F635217
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 09:18:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxkvw-0005TV-8Y; Wed, 23 Nov 2022 03:16:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oxkvg-0005TA-5i
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 03:16:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oxkvW-00067M-HS
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 03:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669191371;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nioFuEDgsjSOWnCBg58s1LZhOD2R3AqCG8pBuM0XkQQ=;
 b=FiaaJrQmIJ7EvOXDl+2Z25mz/kwARpHGG/0F+FbYWQ1IlhO459rfY/Qv+/KvEd//9h8xUw
 VKq8wBroDGj+xd5obmdImGkxkLBLdwLwE1+frWjbaHckc1P3wLAdf5IGIxdekkKXWeBdpn
 hdeqarnXrZiqvIdgs+KnIa3ZJkLaHZI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-249-Rv1UK0kxO6Chhv9zr4EyBQ-1; Wed, 23 Nov 2022 03:16:10 -0500
X-MC-Unique: Rv1UK0kxO6Chhv9zr4EyBQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 ln3-20020a0562145a8300b004b8c29a7d50so15847591qvb.15
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 00:16:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nioFuEDgsjSOWnCBg58s1LZhOD2R3AqCG8pBuM0XkQQ=;
 b=S/zHxdstejgIzErckTan2FnYWQix1cQF4rX/LVxz3Ix3gh4/TcIHGVGQTm+hP9LXDd
 wk9zZXfjwd7itG9rI2gE960XTRBW2MpiaZ64vZSDo3wnog1MaxKDjgztjKEWtETKjKjr
 eqtfmlAvk5nPhM9/3iZ+1R0+acRSoJJe7HCO3GtMBR0zHe69JWuqUh5c4FM+pvwaQc5f
 ODoXCslq3dRxwx+Mo8/2asy5ZzF5b9JLXP+BeFUUbiJdf1EZAFFDD9sSO5M6M2xo6ABK
 3u41k8I2TIZnyAickF2Y+M6ybG6RAl3WdnkP+7Jk1C/iMrlw3/GtGa8Ak6HIK6UtpVTD
 +w7A==
X-Gm-Message-State: ANoB5plhmn8PuCh7NSXSkO0S/mHp7Kf4PEV1/a7ux0BNhJ0l3dcB2JD3
 BRhM0gdcOyZlKi84mcQGDnwwsYoqVLg+8qL9Ogh++ykYiaJGdJnNzsPMEPlO4i/OTSNvQDMYLwd
 lBQB/5WI68TMWc/U=
X-Received: by 2002:a05:622a:1a99:b0:3a6:2170:b08c with SMTP id
 s25-20020a05622a1a9900b003a62170b08cmr24271791qtc.188.1669191369614; 
 Wed, 23 Nov 2022 00:16:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7nseqYTaS5x8N/FLg/MmfnN+jOSJGlQ3GbLBbPNpjK3FmyvTJQpZ4nmERmIyj0Nlz8wznTSA==
X-Received: by 2002:a05:622a:1a99:b0:3a6:2170:b08c with SMTP id
 s25-20020a05622a1a9900b003a62170b08cmr24271775qtc.188.1669191369400; 
 Wed, 23 Nov 2022 00:16:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 c8-20020ac853c8000000b003972790deb9sm9484603qtq.84.2022.11.23.00.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 00:16:08 -0800 (PST)
Message-ID: <e48c6636-99da-c607-45ce-dfadfaad8a1f@redhat.com>
Date: Wed, 23 Nov 2022 09:16:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 0/2] vfio/common: remove spurious tpm-crb-cmd
 misalignment warning
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, stefanb@linux.vnet.ibm.com, cohuck@redhat.com,
 f4bug@amsat.org
References: <20220506132510.1847942-1-eric.auger@redhat.com>
 <20221123013304-mutt-send-email-mst@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221123013304-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Michael,

On 11/23/22 07:34, Michael S. Tsirkin wrote:
> On Fri, May 06, 2022 at 03:25:08PM +0200, Eric Auger wrote:
>> The CRB command buffer currently is a RAM MemoryRegion and given
>> its base address alignment, it causes an error report on
>> vfio_listener_region_add(). This region could have been a RAM device
>> region, easing the detection of such safe situation but this option
>> was not well received.
> Eric could you point me at this discussion please?
> We are now asked to proliferate stuff like this into vdpa
> as well, this just doesn't scale. I'd like to see whether we
> can make it a RAM device region after all - was a patch
> like that posted?
The bulk of the discussion happened in
https://lore.kernel.org/all/20220208133842.112017-1-eric.auger@redhat.com/#r

See exchanges with Peter who was against turning the CRB cmd/response
buffer into a RAM device region at that time, hence the current workaround.

You will see there also discussions about the buffer size in
https://lore.kernel.org/all/eae7e6e6-2f56-c263-f1d2-19104201c8ec@redhat.com/

Thanks

Eric
>
>> So let's add a helper function that uses the
>> memory region owner type to detect the situation is safe wrt
>> the assignment. Other device types can be checked here if such kind
>> of problem occurs again.
>>
>> As TPM devices can be compiled out we need to introduce a stub
>> for TPM_IS_CRB.
>>
>> Best Regards
>>
>> Eric
>>
>> This series can be found at:
>> https://github.com/eauger/qemu/tree/tpm-crb-vfio-v5
>>
>> History:
>>
>> v4 -> v5:
>> - Add sysemu: tpm: Add a stub function for TPM_IS_CRB to fix
>>   compilation error if CONFIG_TPM is unset
>>
>> Eric Auger (2):
>>   sysemu: tpm: Add a stub function for TPM_IS_CRB
>>   vfio/common: remove spurious tpm-crb-cmd misalignment warning
>>
>>  hw/vfio/common.c     | 27 ++++++++++++++++++++++++++-
>>  hw/vfio/trace-events |  1 +
>>  include/sysemu/tpm.h |  6 ++++++
>>  3 files changed, 33 insertions(+), 1 deletion(-)
>>
>> -- 
>> 2.35.1
>>
>>
>>


