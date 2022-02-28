Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35614C6E86
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 14:49:06 +0100 (CET)
Received: from localhost ([::1]:45242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgOf-0006gQ-TA
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 08:49:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOgFF-0000Ak-3s
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:39:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOgFD-00055w-ID
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:39:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646055558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1TkHvd8zHPewcoro/yZRO4ml136A9OmOnwruZMyPVu8=;
 b=ciERYo6NMoylVJ7nPSmmY4eUfeBBjnzqCFLlvLCf7teaBhNrYbVdPkM2ICErE4lZn2GIqp
 f+pxtLX+cBhvySWRsLN6K/X1pZaNXYBMs/RlRC/wePUDH0GU4DvShrzxrxbLW+L8XFvU76
 F6ac0uwe3k6dRiPFPJMuxbQ7Ctg4DAg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-p8BzqERDPROy5fnmEe-vEQ-1; Mon, 28 Feb 2022 08:39:17 -0500
X-MC-Unique: p8BzqERDPROy5fnmEe-vEQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 t2-20020a7bc3c2000000b003528fe59cb9so6100706wmj.5
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 05:39:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1TkHvd8zHPewcoro/yZRO4ml136A9OmOnwruZMyPVu8=;
 b=WBWsbBapmSCB1+KNz2wE1yx4FMun7zFqGAqa5zXJRQSHWeZVBpXJgpOk5//Ck8Xnla
 quZKQAt+vv6/hnnLufxlMDERSuQhbisIlnZAr/0xMRzulN//safqIM/227Ki4NoUmNeN
 x8uRZA7ypwFLaQxRmK9Me5ct5CmiyFxaV9J955dxuInLEunhVMwCX53wv5fU8HyJmSf/
 eDlfOEoWxzjxCQ7xDfRNy1LDoInrCDrluxcSdkO0p/pyXutFdX+6iLTSOEYLGZB/JcxQ
 jo6mTIfdzNiRXkDK4eX0VxQl5e56/Zc2n5uvWDvdXSGHxU9znWugshz0LKa2JwdzaENA
 uc+g==
X-Gm-Message-State: AOAM530q2LB6ihlU2ZUxb1YncAVF8yoR6u89x0GiDwjUfQEwtMRALio2
 HrBagM3uDyyhejKor3ea/ePawgG6WfJvkbUkZbZXFe0gdJng/w7IPSub8RvdCDESGY0V84oCtVL
 Phr4+3tpuxWXgoq0=
X-Received: by 2002:adf:bc02:0:b0:1ef:5b49:d66f with SMTP id
 s2-20020adfbc02000000b001ef5b49d66fmr12778935wrg.360.1646055556023; 
 Mon, 28 Feb 2022 05:39:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMH4uKSqnXMOdM1woKuHtMZuOarxcJpKfM7DEWfZSqn3BRcG6iVr+0EemXn6JDebJ9krFqjg==
X-Received: by 2002:adf:bc02:0:b0:1ef:5b49:d66f with SMTP id
 s2-20020adfbc02000000b001ef5b49d66fmr12778924wrg.360.1646055555840; 
 Mon, 28 Feb 2022 05:39:15 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a05600c3b0500b00380da3ac789sm12455663wms.1.2022.02.28.05.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 05:39:15 -0800 (PST)
Message-ID: <ec845816-b6bd-bebd-a299-bb1297f4990e@redhat.com>
Date: Mon, 28 Feb 2022 14:39:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86: cleanup unused compat_apic_id_mode
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20220228131634.3389805-1-imammedo@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220228131634.3389805-1-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/02/2022 14.16, Igor Mammedov wrote:
> commit
>    f862ddbb1a4 (hw/i386: Remove the deprecated pc-1.x machine types)
> removed the last user of broken APIC ID compat knob,
> but compat_apic_id_mode itself was forgotten.
> Clean it up and simplify x86_cpu_apic_id_from_index()
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>   include/hw/i386/x86.h |  2 --
>   hw/i386/x86.c         | 16 +---------------
>   2 files changed, 1 insertion(+), 17 deletions(-)

Sorry that I missed this!

Reviewed-by: Thomas Huth <thuth@redhat.com>


