Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335C9473EEB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 10:06:38 +0100 (CET)
Received: from localhost ([::1]:56170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx3lb-0001Hu-QX
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 04:06:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mx3jK-0000bE-Py
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 04:04:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mx3jG-0000ma-Dx
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 04:04:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639472647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MzyNNMa3/kRpUH5G1X6/8ZlWIqSqnQarNsdXTKSFPVU=;
 b=hAVVPialY0Njn/LHN6nKQhGvL2QAwwWUCIWfCRxUTXj0rz3Rf+e2fw9FHpW15cfOn7r+tA
 9JXP5aH9CjFDUDFwrKvZX7kw3Yhz3Qine7+oP45nBkfqmOKQP/VjF2j6jqwqQSUDhc+VRj
 a3Kv8w2IQyqegH9ZeZNljFnSFuTCmAc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-H4ttxVDcObuWXAiL0DK0wQ-1; Tue, 14 Dec 2021 04:04:06 -0500
X-MC-Unique: H4ttxVDcObuWXAiL0DK0wQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 g11-20020a1c200b000000b003320d092d08so10995268wmg.9
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 01:04:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MzyNNMa3/kRpUH5G1X6/8ZlWIqSqnQarNsdXTKSFPVU=;
 b=p54jbTYzYFlQYl5WgFDg6/8Is8dA+l5zCVD/ZcMlWWujV3m+9CaPRVo7pKFEIam1Xe
 NGkYhttlunfytwr9ha6qWEbAHdedillOBXjExsNv4wE3ahdqk+qVu4ppCTr8p8hRo9X5
 93uQ2O+IGZP4b9uZtThcc4aaZm62id7cZDEoEitrLEYFKGq5IHS067H6jDxXYe0sAT5j
 xrXlr6IA2EFVd8G9Uexzo9D54zl0uTY5FCFiPEaBYamgtaec0ia9wJg40Ecsucs4wqZ8
 dQXu1WlkS4f/5GXWkWfmAmqU0Hyb+gAeF1ZQozM4mxJfnDQ/u9BzK7UUz7Y/5ZUMc/JE
 th6A==
X-Gm-Message-State: AOAM533aQMiGnrgIQpJYGZPZB4hUV9m6pjwUOCg8hPnlxkUeF8Mqt6O8
 0CJtax6k7GFpcGRJvdeee+VYXf2JRZLco09u5WRSfC1IGzuGP8XPaltup9Susg2onnTCDPWIuff
 OXyN+3k2j/pdjjww=
X-Received: by 2002:a5d:64cd:: with SMTP id f13mr4628704wri.382.1639472645251; 
 Tue, 14 Dec 2021 01:04:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRkCFaLDzKemrK7tubIs2eFlNAC+Mh2lBL47JXgk49GzaiwFsiTzIxt8l2CRnn0wMGOSx5Ag==
X-Received: by 2002:a5d:64cd:: with SMTP id f13mr4628674wri.382.1639472644986; 
 Tue, 14 Dec 2021 01:04:04 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id d6sm13083282wrn.53.2021.12.14.01.04.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 01:04:04 -0800 (PST)
Message-ID: <fc7b5d91-98f6-b146-4a67-5e6800bccadc@redhat.com>
Date: Tue, 14 Dec 2021 10:04:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] MAINTAINERS: Change my email address
To: Hailiang Zhang <zhanghailiang@xfusion.com>, qemu-devel@nongnu.org,
 Gonglei <arei.gonglei@huawei.com>, Wen Congyang <wencongyang2@huawei.com>
References: <20211214075424.6920-1-zhanghailiang@xfusion.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211214075424.6920-1-zhanghailiang@xfusion.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.962, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 08:54, Hailiang Zhang wrote:
> The zhang.zhanghailiang@huawei.com email address has been
> stopped. Change it to my new email address.
> 
> Signed-off-by: Hailiang Zhang <zhanghailiang@xfusion.com>
> ---
> hi Juan & Dave,
> 
> Firstly, thank you for your working on maintaining the COLO framework.
> I didn't have much time on it in the past days.
> 
> I may have some time in the next days since my job has changed.
> 
> Because of my old email being stopped, i can not use it to send this patch.
> Please help me to merge this patch.

Can we have an Ack-by from someone working at Huawei?

> Thanks,
> Hailiang
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7543eb4d59..5d9c4243b4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2967,7 +2967,7 @@ F: include/qemu/yank.h
>  F: qapi/yank.json
>  
>  COLO Framework
> -M: zhanghailiang <zhang.zhanghailiang@huawei.com>
> +M: Hailiang Zhang <zhanghailiang@xfusion.com>
>  S: Maintained
>  F: migration/colo*
>  F: include/migration/colo.h
> 


