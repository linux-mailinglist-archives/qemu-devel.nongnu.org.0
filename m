Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EA1371660
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 16:03:49 +0200 (CEST)
Received: from localhost ([::1]:36910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldZAq-0002ee-EX
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 10:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldZ3b-0007eU-8n
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:56:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldZ3Z-0000Er-PS
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:56:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620050176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AL8TeeXCKNxevWq70vL1EjWTREp8XsBRPcUgQwAh3w4=;
 b=S1bP7+02y70iOCdBQzHj65l4YsJ9CZVkK5bMNmKy/5T5y0162kgPDiCTPEXj8in8ZzHrea
 DbFGgd3NvMhf3zk00RLlHz31LhnJRJbduVEQ+XweGiGvepBq0JnB5RKXxIF+PkwdO5wPXd
 qfrGPfxCbBOUvYp3MC/EMysWn+HZSk0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-Zk-r6TyHMr-tJ1uHmAmCCA-1; Mon, 03 May 2021 09:56:15 -0400
X-MC-Unique: Zk-r6TyHMr-tJ1uHmAmCCA-1
Received: by mail-wr1-f72.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso3958975wrf.11
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 06:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AL8TeeXCKNxevWq70vL1EjWTREp8XsBRPcUgQwAh3w4=;
 b=ehuWY9ZpP/1ECA/EaVENo1su8orBMjt6g32xVomsDq14WUbjdNY+KnXh/qKF3e5EMq
 BTbTGOnbUGTOa/E6gwR94Y6EbWxIwLq1aDNV5zcmaxwjaHuldsJEQJUp5K3hz2fyE9SV
 bR2Ibev5zA4HExleOI2VIPWazBinHkWL9y+tgrj4Hwo/aIcAIoxBc3dxoXT/0KsDqgTC
 EtKmRzZAvtKJgoMLydXSwaefIj4DjkTQBkrIGvU2IgpBWMgiSeq8Rh4q7nFnEUZYjZf2
 Fo8F1QEj6XJ+32/1Mc3DVxO+aCDqPqjjYFbyKdwTh89NJ11R0R0mygTPdJAXqhyaoRIL
 mtnA==
X-Gm-Message-State: AOAM532xIutwNbvijkKZuRLn8qIr8RvLUyXeG4HKYo0yLrG/Wp17Uk/P
 +knyErE1GJFn3kDmKKOcvzvoCkjXkqp57OAd7/bV5psZRN/RgsCdfY4U69D51QDEXrD9Hl445oG
 lR8xga7biL7xHZRQ=
X-Received: by 2002:a1c:1bc9:: with SMTP id b192mr13231758wmb.3.1620050174338; 
 Mon, 03 May 2021 06:56:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwK1CkQOtGdScPBDsGV8++ElMRT7j1ALNHfQvzTAwtMA/Ht1Na5PFyNM+C7+CYPupW0ayeCgw==
X-Received: by 2002:a1c:1bc9:: with SMTP id b192mr13231753wmb.3.1620050174201; 
 Mon, 03 May 2021 06:56:14 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id x8sm12470022wru.70.2021.05.03.06.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 06:56:13 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] usb/hid: avoid dynamic stack allocation
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210503132915.2335822-1-kraxel@redhat.com>
 <20210503132915.2335822-2-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <30970d90-44f1-0690-2997-47037ee9bfec@redhat.com>
Date: Mon, 3 May 2021 15:56:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503132915.2335822-2-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: mcascell@redhat.com, remy.noel@blade-group.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 3:29 PM, Gerd Hoffmann wrote:
> Use autofree heap allocation instead.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/usb/dev-hid.c   | 2 +-
>  hw/usb/dev-wacom.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


