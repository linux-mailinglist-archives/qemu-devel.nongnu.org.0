Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0395171FE
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 16:52:30 +0200 (CEST)
Received: from localhost ([::1]:42020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlXPZ-00048W-R3
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 10:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nlXGq-0008Qs-A0
 for qemu-devel@nongnu.org; Mon, 02 May 2022 10:43:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nlXGm-0003XI-RN
 for qemu-devel@nongnu.org; Mon, 02 May 2022 10:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651502604;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8m6PQHI2k5dDZSKMd9cUWtwTZGJ8v3Dufttsgz9Agnk=;
 b=eQGcjXUiX5juGGvBRbQfSSifnlDBtTbm3pHA4/mrY1FctHinjMBEzSmSWuLNhBdCBIl/xB
 Cd3aDoy1l/YD4LKBJNbdXHwVye1DCdJ8LuB06dccMy2rTQ4WU+wgFzstev2Y53bRHrWs/8
 UoMkxupWt4LTFxdNIZqBn7TrBeNF6dI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-HNRUZ2pqMH-nYOeWRvlb1A-1; Mon, 02 May 2022 10:43:23 -0400
X-MC-Unique: HNRUZ2pqMH-nYOeWRvlb1A-1
Received: by mail-wm1-f71.google.com with SMTP id
 t184-20020a1c46c1000000b00394209f54f1so2695317wma.4
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 07:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8m6PQHI2k5dDZSKMd9cUWtwTZGJ8v3Dufttsgz9Agnk=;
 b=D9CZgyzhF+JzEERa9daGStdKyFJAcizu+iBNlEU5Zt/fU7F0Lt9CcGE/rMejXtvKHy
 goGxOz25NDk+SESpGeYkeZD2/QtOCMF/yjlWN0xpRjyNXAUp3PyfjTr9+6ubrzT4gOKb
 qQI2PQyCA5mqJUDyiIeFy8MKus7Y9GKJaqqcGWWqXWuXLmeB0rneKfk1451HoMg5bRdn
 aScXdu9g9UQnnvPdEigM6goyKivIz4v1+4t9bPc5msVYX7cUf5cGd0mHAVW4dE7yqBVc
 n+SqRNckhkGD5Xtvzdrth/e09ecOlpKfETlSxLeJKGNxbSkhgrSqlT51tCiLyHA1gdbP
 vHWw==
X-Gm-Message-State: AOAM531roZ4XL3uV/a8UWHyNVkcqHnDDSfpaNr1du9Q+gii/bzcS4tQS
 RYo96BX1GYoJiiCx3uUWaeEi4Idk/420acG6PTciF2VL1R+j/MnsMQ+XW77p55t/arn7vZIDbcx
 ko0mmmhFjZ7TaWfk=
X-Received: by 2002:a7b:c74f:0:b0:394:1ce3:cc42 with SMTP id
 w15-20020a7bc74f000000b003941ce3cc42mr14880902wmk.153.1651502601797; 
 Mon, 02 May 2022 07:43:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgAwHbk8X2NF7WBEmqUtCn7wptOcuVAYxKLhqfekoM47r/LIbKrb35Ax0Z2xwh0sbDnXThRg==
X-Received: by 2002:a7b:c74f:0:b0:394:1ce3:cc42 with SMTP id
 w15-20020a7bc74f000000b003941ce3cc42mr14880889wmk.153.1651502601602; 
 Mon, 02 May 2022 07:43:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a7bc24d000000b003942a244ee1sm6269502wmj.38.2022.05.02.07.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 07:43:20 -0700 (PDT)
Message-ID: <87ab9235-2de7-6843-8e7a-1f2b527e8752@redhat.com>
Date: Mon, 2 May 2022 16:43:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [Patch 1/3] hw/vfio/pci: fix vfio_pci_hot_reset_result trace point
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>, Yi Liu <yi.l.liu@intel.com>
References: <20220502094223.36384-1-yi.l.liu@intel.com>
 <20220502094223.36384-2-yi.l.liu@intel.com>
 <20220502083529.4c2f792b.alex.williamson@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220502083529.4c2f792b.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kevin.tian@intel.com, qemu-devel@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 5/2/22 16:35, Alex Williamson wrote:
> On Mon,  2 May 2022 02:42:21 -0700
> Yi Liu <yi.l.liu@intel.com> wrote:
>
>> From: Eric Auger <eric.auger@redhat.com>
>>
>> Properly output the errno string.
> More explanation please, why is it broken and how does this fix it?
> Thanks,
"%m" format specifier is not interpreted by the trace infrastructure and
thus "%m" is output instead of the actual errno string. Fix it by
outputting

strerror(errno).

Thanks

Eric

>
> Alex
>  
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
>> ---
>>  hw/vfio/pci.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index 9fd9faee1d..4a66376be6 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -2337,7 +2337,7 @@ static int vfio_pci_hot_reset(VFIOPCIDevice *vdev, bool single)
>>      g_free(reset);
>>  
>>      trace_vfio_pci_hot_reset_result(vdev->vbasedev.name,
>> -                                    ret ? "%m" : "Success");
>> +                                    ret ? strerror(errno) : "Success");
>>  
>>  out:
>>      /* Re-enable INTx on affected devices */


