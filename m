Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAC53F7254
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 11:53:54 +0200 (CEST)
Received: from localhost ([::1]:59808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIpbW-0003hx-2h
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 05:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIpal-00031H-C7
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 05:53:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIpai-00015j-Qa
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 05:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629885183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7NccoJI8s54kW8xL0kSZlIElj7OSp7iQIF0WoMCJWt0=;
 b=IQ3W25fFIPxR4vZTFjS7rdLM9tOg6HY+V20AaUcPF6GHe6lf4l/RZA4JAT/L4N9yvI0EHr
 x/oGU4oEmAVogUa6Yd+VQZNmwhPfH4t7sOnJniY/xZz3RlgKsPQPdSd/diLmJv5I446yEK
 WN6298xPoXiXj47yIRwOVQoVwYJbUM8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-JrbnjbQYNwGq3cwys9yVaA-1; Wed, 25 Aug 2021 05:53:02 -0400
X-MC-Unique: JrbnjbQYNwGq3cwys9yVaA-1
Received: by mail-wr1-f71.google.com with SMTP id
 b8-20020a5d5508000000b001574e8e9237so2528218wrv.16
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 02:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7NccoJI8s54kW8xL0kSZlIElj7OSp7iQIF0WoMCJWt0=;
 b=sRwysc5khxAfgQE/j7LpNftmGNbIKmGBEyRASMNVnDHu6c92TjXUmr2lrpKpuHMy7w
 zMl7F1PsF5IjSU7keJAcZTiqG4eb/AMB+93fOWuQi4KGWcuNrOHZZHYksNWjKsYRG0XO
 LG9aYdK7fntwmcUBYb/05ZmM6gULkasHY2BQmpToyUgz7GNpiE9B9nl1nxrCBrknTmwI
 cHaiMM8rnd5bxE959lj2SIraYw9pL9UWWx3CFGOxif4s6MTf/WABF+g4E5LQCy7D4psB
 QzTKYSOQaJjTwM+Rz8fXqnisjBeyYChfYFPcG5ZE3Sk+xuS2O1S7iavuMmsHOWZ5ezTe
 NM8A==
X-Gm-Message-State: AOAM531xe+yx3ZH9wM91hcN4P2MCU2tF+GTUqjw5m9Sbj7Vj3ynn7c24
 bCeLQgsqMt0MOVqvKIFSdCF7dl5C8Oj3OiQjmg0ZzlXWuDD6Y1EOb26bmG+X3pRG0INuAQTJaOq
 SKTlQJfelanaEaSurDSRbuBKuXvIPo67ey7ebfO9GklF7bgPx68oSff4XUGc1dTo2
X-Received: by 2002:a05:6000:9:: with SMTP id
 h9mr25032536wrx.396.1629885180697; 
 Wed, 25 Aug 2021 02:53:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyadPwNv/8zWfiFyX2MoMHw9Mp90A5fMNHgFuAmawqbPdAHltMJaJ+X9QHCEUbfpOlTF5F7JA==
X-Received: by 2002:a05:6000:9:: with SMTP id
 h9mr25032507wrx.396.1629885180322; 
 Wed, 25 Aug 2021 02:53:00 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id h11sm16217377wrx.9.2021.08.25.02.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 02:52:59 -0700 (PDT)
Subject: Re: [PATCH 2/5] msix: simplfy the conditional in
 msix_set/unset_vector_notifiers
To: "Longpeng(Mike)" <longpeng2@huawei.com>, alex.williamson@redhat.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com, pbonzini@redhat.com
References: <20210825075620.2607-1-longpeng2@huawei.com>
 <20210825075620.2607-3-longpeng2@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e8e4e346-4235-8830-139c-2a4ad9cd1faf@redhat.com>
Date: Wed, 25 Aug 2021 11:52:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825075620.2607-3-longpeng2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: arei.gonglei@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/21 9:56 AM, Longpeng(Mike) wrote:
> 'msix_function_masked' is kept pace with the device's config,
> we can use it to replace the complex conditional in
> msix_set/unset_vector_notifiers.

Typo 'simplfy' -> 'simplify' in this/previous patch subject.

> poll_notifier should be reset to NULL in the error path in
> msix_set_vector_notifiers, fix it incidentally.

I'd rather see this fix in a different patch, being
unrelated to the msix_function_masked optimization.

> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> ---
>  hw/pci/msix.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
> index ae9331c..8057709 100644
> --- a/hw/pci/msix.c
> +++ b/hw/pci/msix.c
> @@ -592,8 +592,7 @@ int msix_set_vector_notifiers(PCIDevice *dev,
>      dev->msix_vector_release_notifier = release_notifier;
>      dev->msix_vector_poll_notifier = poll_notifier;
>  
> -    if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
> -        (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
> +    if (!dev->msix_function_masked) {
>          for (vector = 0; vector < dev->msix_entries_nr; vector++) {
>              ret = msix_set_notifier_for_vector(dev, vector);
>              if (ret < 0) {
> @@ -612,6 +611,7 @@ undo:
>      }
>      dev->msix_vector_use_notifier = NULL;
>      dev->msix_vector_release_notifier = NULL;
> +    dev->msix_vector_poll_notifier = NULL;
>      return ret;
>  }
>  
> @@ -622,8 +622,7 @@ void msix_unset_vector_notifiers(PCIDevice *dev)
>      assert(dev->msix_vector_use_notifier &&
>             dev->msix_vector_release_notifier);
>  
> -    if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
> -        (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
> +    if (!dev->msix_function_masked) {
>          for (vector = 0; vector < dev->msix_entries_nr; vector++) {
>              msix_unset_notifier_for_vector(dev, vector);
>          }
> 


