Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA0564DDBF
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 16:24:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5q53-0001zU-30; Thu, 15 Dec 2022 10:23:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5q50-0001yr-AE
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 10:23:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5q4x-0006kN-Uf
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 10:23:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671117802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=glszsr0Cn8TsQ9aJ7DdxTBEoirhXy9aMk1ekc/vT6ag=;
 b=VQzoHuCJY77Xyvco7KaTcHCraVsgKyeBIrNlSnQQPCOo6Z9GvsDiAvtUGuvEDL4elcujcH
 FMuaLPEqoxFWXasR+G2kCFbjgkgDtZQW71s2djIsTQ5BtsbWdhwpse4FcbyptpTmmNsCil
 QdWlD7fVKfE86RwL1W4H1c4Ae8cvC78=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-MzP6rsgIPy2VhKEsco6n1A-1; Thu, 15 Dec 2022 10:23:05 -0500
X-MC-Unique: MzP6rsgIPy2VhKEsco6n1A-1
Received: by mail-wm1-f69.google.com with SMTP id
 t24-20020a1c7718000000b003d1fd0b866fso894702wmi.3
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 07:23:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=glszsr0Cn8TsQ9aJ7DdxTBEoirhXy9aMk1ekc/vT6ag=;
 b=3J7221MGf9AtOL25y3vJy/udLyyMA/VrC1cW+uwJmduvL3WZfCce/h0AUMGsonmVP8
 epLwYsUrK3+VFRMg/qeYEBEkm9MPH5QDfkU7DuqyNIuS0H7EbmGqEhlOVdBPB1+zYYsg
 Dh0XngkFXKctyBjcN5NvrnXOr1VXz3xFgYcYsZndNilFDyHBmBT6P43e6tOK1XO0hM+I
 zJFZdPCFR5umKeKpW+xa+iV7TSgp0G6OksqjUaowpebjpIsruWpLTFDE79CBWtKo0859
 7lGX3SGku6Cis9gnA6ZiCnZRnnmG9ccQeBXESdvVB7lOJ/ykzYaAQXfcxnktoHvyPvy/
 m7kA==
X-Gm-Message-State: ANoB5pmjO4dsnurcmNwmPfCH/UTUVSAFuyL4bgWRd67COxT48pfunPpV
 qjAZxQOHQUWEhSfsv8zQy5XNx9nQw2bI0lmIbnNSpjtC9l4PM1ytN9KHVt7Hk0LhuBBXUeO3xIC
 wWH6hqOzL9zcp6kKrpUOWgGb4nfuOWWkzlWnwYCnvX9LRI5but268dUcFqeqgPCY=
X-Received: by 2002:a05:600c:34cb:b0:3d1:f16d:5848 with SMTP id
 d11-20020a05600c34cb00b003d1f16d5848mr22153478wmq.26.1671117783340; 
 Thu, 15 Dec 2022 07:23:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4G3xbhhq7UYFqHewlPu9piLoRf/WQaflACgixntCvTkEBY3LjvCHKDNaNZAHoIEhISTZ31bw==
X-Received: by 2002:a05:600c:34cb:b0:3d1:f16d:5848 with SMTP id
 d11-20020a05600c34cb00b003d1f16d5848mr22153452wmq.26.1671117783066; 
 Thu, 15 Dec 2022 07:23:03 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a1ca1c4000000b003d22528decesm6777334wme.43.2022.12.15.07.23.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 07:23:02 -0800 (PST)
Message-ID: <ac836d36-16ab-7fca-da0b-dc9ec93ee38f@redhat.com>
Date: Thu, 15 Dec 2022 16:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 0/3] Fix the "-nic help" option
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, pbonzini@redhat.com,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20221110125224.99596-1-thuth@redhat.com>
In-Reply-To: <20221110125224.99596-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/11/2022 13.52, Thomas Huth wrote:
> Running QEMU with "-nic help" used to work in QEMU 5.2 and earlier
> versions, but since QEMU 6.0 it just complains that "help" is not
> a valid value here. This patch series fixes this problem and also
> extends the help output here to list the available NIC models, too.
> 
> v2:
>   - Add function comment in the first patch
>   - Add Reviewed-by in the third patch
> 
> Thomas Huth (3):
>    net: Move the code to collect available NIC models to a separate
>      function
>    net: Restore printing of the help text with "-nic help"
>    net: Replace "Supported NIC models" with "Available NIC models"
> 
>   include/net/net.h | 14 +++++++++++++
>   hw/pci/pci.c      | 29 +--------------------------
>   net/net.c         | 50 ++++++++++++++++++++++++++++++++++++++++++++---
>   3 files changed, 62 insertions(+), 31 deletions(-)
> 

Friendly ping!

  Thomas


