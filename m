Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D102C371650
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:56:48 +0200 (CEST)
Received: from localhost ([::1]:57048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldZ43-0007VK-UU
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldZ2Z-0006sk-92
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:55:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldZ2R-0007vS-SX
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:55:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620050105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NDbJowttMRveIhaQlCfywSUKMLojI92VPtdGYS/S/+Y=;
 b=aMW6cjNtIhAiHpVS0wZiEPt6FmnDqw7xwhWjYNs+DVZEF238gmlGOFrdmZHTeJPCjOJJYV
 u6xz19IqJWov7G5yWovpJpQ2kGATXc30RRvqSeTncGwmIX2wwtd+Hk6pMqRcyc81S3/JmW
 ynjYsM9b0Y7dYhrq/mjETUvDiYWIXwE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-XlzNg6jaPomK3j9q1mii-A-1; Mon, 03 May 2021 09:55:03 -0400
X-MC-Unique: XlzNg6jaPomK3j9q1mii-A-1
Received: by mail-wr1-f70.google.com with SMTP id
 91-20020adf94640000b029010b019075afso3957918wrq.17
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 06:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NDbJowttMRveIhaQlCfywSUKMLojI92VPtdGYS/S/+Y=;
 b=O/vQ7Rvd5KMSSuwf5Nq7RmSX/P3WL5jbH45TivbupRGTqF6FDe2lPkN51ikw1UyXTP
 VqCCQa/h8cOpHlog3JCrmCns2rcbn7x4V87265zqXYlOPnCWEVSHN5jcx4qz0Dcd2w0m
 xvO6q4ru2sGXwyaQdhzny5Itv+Y6afhZF/RBhv/4DmyFuol1TlBCfBrV3JJJIGsfSrWM
 u09xCPVhDMVunECJkozgXa3m5slDeOgCIqUJRc1HCcC8LZdirpvTmG3+G05qBMza1DDS
 W9dgZDw8GZC3UOIEQDu+tXGg1H+R234DwhEjAdYCwseLANKRr9Tkv4qAe7l/pRMkMWHJ
 uCrw==
X-Gm-Message-State: AOAM533CPCz3/H97DGYNZReVMrT/zEKJ45i9P5uHpf50K/JPx075tF8e
 WPfi/9I1r5iMA1B+txjdyegC5fkwIjKICIkQNMKyDkZlFG8Jwm/kJboAmfDKkJ62HG+kt0Qqi5H
 tXbSsEg1Vz2d+4Ac=
X-Received: by 2002:a1c:3d05:: with SMTP id k5mr21301237wma.182.1620050101302; 
 Mon, 03 May 2021 06:55:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/9vyttSphyb5KXFEfPnBZ5uAdEjm16IzDe/SXymfuZ48cTb5RNSevBkD96PU9rnksfCTD5g==
X-Received: by 2002:a1c:3d05:: with SMTP id k5mr21301225wma.182.1620050101146; 
 Mon, 03 May 2021 06:55:01 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id x17sm2667852wmc.11.2021.05.03.06.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 06:55:00 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] usb/redir: avoid dynamic stack allocation
 (CVE-2021-3527)
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210503132915.2335822-1-kraxel@redhat.com>
 <20210503132915.2335822-3-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <037011d6-d08b-d2e7-3dbd-77b617e03ac8@redhat.com>
Date: Mon, 3 May 2021 15:55:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503132915.2335822-3-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
> Fixes: 4f4321c11ff ("usb: use iovecs in USBPacket")
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/usb/redirect.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


