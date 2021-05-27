Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D92A393059
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 15:59:38 +0200 (CEST)
Received: from localhost ([::1]:33688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmGXw-0004nL-1Y
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 09:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lmGJZ-0008UX-LL
 for qemu-devel@nongnu.org; Thu, 27 May 2021 09:44:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lmGJW-0006CE-CZ
 for qemu-devel@nongnu.org; Thu, 27 May 2021 09:44:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622123080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tX8JdwiT799eVOROa2YgGBAM8UgPRuX/edGtdVM+/hA=;
 b=IJREeF8JiqZz/b81VQvngSMAab2ZXDSn9LKhhL0y4pzfWKsEbYnhuCZJmQgqLzJjcWBZNH
 trDBIAqoTUKQ+3ahAdX7vwvDTHSPxk9vJ0vPpURLZiKF597t3QolN7CYOpU35mTZ6YeuGU
 YrBuBqn+hLgKRFS3fASpmNTH84N4lYU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-ZteNUHimOxWLOOK10Ttz4w-1; Thu, 27 May 2021 09:44:39 -0400
X-MC-Unique: ZteNUHimOxWLOOK10Ttz4w-1
Received: by mail-wm1-f69.google.com with SMTP id
 a19-20020a1c98130000b02901960b3b5621so136024wme.8
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 06:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tX8JdwiT799eVOROa2YgGBAM8UgPRuX/edGtdVM+/hA=;
 b=Y4ZLp2CL/J+w02DWPTl+5Xm6p0dO4yFv1vWabzbSVEtk/vf/p2RgoN7ogLZUIu9g+/
 67qLQYqSxTucQU7vD7MFeUTB5xm7RNEADE0BENqdu/7riwdyPWEJG8TWMn3U2Hs5dsaS
 NXG7DB+Fb1I4Swryw2Ink0/MGcga6OE/sFzKG+jKg8h3j1Yu9Bn80p1fxvlMng4wr3T1
 bEk54jQ07eltAV884qo8pgCHyRreREC/2Paz03VgeizY+bTo2j0TM7j5uKxBy+rNsAkR
 iflKC+tO/lmX0g/32YsT3gTn9KKYXP24R9vLqRlS64BNLkGJTiH/Nfyw4mnvqFbfKOQO
 Zb5Q==
X-Gm-Message-State: AOAM531d8Gn6vGJBZX9ShverEt6PYJRYvQMv3XaEG4zi3VVqecZjqTNQ
 TNU8H87tjs2KmXVgLRpn/eBOC0lv3ZhJ0bj9kCTT6gfQ5VASfzaOVoCM5Syp/8Xys3WPp2bKarI
 xt+4Vq0jqUuvVjNE=
X-Received: by 2002:adf:fccc:: with SMTP id f12mr3467050wrs.103.1622123078121; 
 Thu, 27 May 2021 06:44:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsxLTxTjbNHJiYEoLUgRY6YpYzCBQtMU4dx9hdZ0gJlJyNnxX1Qosfio/186/6OEEKuinFOA==
X-Received: by 2002:adf:fccc:: with SMTP id f12mr3467024wrs.103.1622123077880; 
 Thu, 27 May 2021 06:44:37 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id a123sm11055057wmd.2.2021.05.27.06.44.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 06:44:37 -0700 (PDT)
Subject: Re: [PATCH] vfio: Fix unregister SaveVMHandler in
 vfio_migration_finalize
To: Kunkun Jiang <jiangkunkun@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20210527123101.289-1-jiangkunkun@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fcfa0ad2-4819-8ea3-b69c-01b4d1e97269@redhat.com>
Date: Thu, 27 May 2021 15:44:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210527123101.289-1-jiangkunkun@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, ganqixin@huawei.com,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/21 2:31 PM, Kunkun Jiang wrote:
> In the vfio_migration_init(), the SaveVMHandler is registered for
> VFIO device. But it lacks the operation of 'unregister'. It will
> lead to 'Segmentation fault (core dumped)' in
> qemu_savevm_state_setup(), if performing live migration after a
> VFIO device is hot deleted.
> 
> Fixes: 7c2f5f75f94 (vfio: Register SaveVMHandlers for VFIO device)
> Reported-by: Qixin Gan <ganqixin@huawei.com>
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>

Cc: qemu-stable@nongnu.org

> ---
>  hw/vfio/migration.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 201642d75e..ef397ebe6c 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -892,6 +892,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
>  
>          remove_migration_state_change_notifier(&migration->migration_state);
>          qemu_del_vm_change_state_handler(migration->vm_state);
> +        unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
Hmm what about devices using "%s/vfio" id?

>          vfio_migration_exit(vbasedev);
>      }
>  
> 


