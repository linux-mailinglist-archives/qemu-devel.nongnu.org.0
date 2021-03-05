Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6187432E53F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:50:06 +0100 (CET)
Received: from localhost ([::1]:53994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI75x-00073M-E0
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:50:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lI74u-0006QU-VA
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:49:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lI74t-0001wy-7l
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:49:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614937738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D9GSh9ulZak209DRdAxqktL50IKCyP0qKM6oTypCumA=;
 b=KB5/Rl3tstI+GF7KgoVFlCGCB2H3pI1WFo5rz/fnp3VHgz35PxE0matjv97j/8lKYI7+1x
 8EJmEqzT3kq7S2wuQVSSk6mQ8dEt9LL1MQeP8t/p5O9MaWcY+ExCipGvvA4kMIagWm+DuV
 9w+Uun1V+CzjVCj+DH/LmDsS/6FcyGo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-s3mOm_3tMKqhf1lxLzq4Ow-1; Fri, 05 Mar 2021 04:48:56 -0500
X-MC-Unique: s3mOm_3tMKqhf1lxLzq4Ow-1
Received: by mail-wm1-f70.google.com with SMTP id c9so198078wme.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 01:48:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D9GSh9ulZak209DRdAxqktL50IKCyP0qKM6oTypCumA=;
 b=mfKjpjOisPxUhsIaeTRLItsosQmWAQwMwbl6hNLQHRFG3zQV+FgTRCPMjg5AeUWNmD
 gyRGkN/+EP4JSvoyQ7gV5SZk7+IEuLLYaiKGqbtQRdoApcYZGfvuWM+FhiuJfnntRXYE
 FIDcMjdrWlb3w3h8C5uW0MPoZ8ah7JcSlAPBKTHbtSu9j6QD49ioriAXqTGix3SswlFP
 JfONqWa3wcJ6DuMi2as6wG37BI5cqF5oClXPqWQy5NUQ1H+5ypEI9A+tATFODoJw3+JY
 F1YtCquXkDxxFETfgwjZ+NHLVuqYfzYbS3kZOdf3IWIKckDnaauUsCxkCaKzLtZHepDs
 r/JA==
X-Gm-Message-State: AOAM531HQwFmaMLbxsq5BFnifzWuiFtk5IYB97sAZwubHjyUW7KLSJuS
 RxsEAyFGeMCGyfEH4TW5pN9H6ctc93vhhdauNYRKWwajB9aegoc4PCRUwXy1FBVOej8dAp+7c1b
 pS7GgGK1O5XXCQlk=
X-Received: by 2002:adf:a4d1:: with SMTP id h17mr8417088wrb.57.1614937735831; 
 Fri, 05 Mar 2021 01:48:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl6efyD/nwwPdSR6T5lomc6L9lRFDrYSALSv8EP8UbymFje9yJd8hrQT4KZR1P1nTexqwUBA==
X-Received: by 2002:adf:a4d1:: with SMTP id h17mr8417051wrb.57.1614937735665; 
 Fri, 05 Mar 2021 01:48:55 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c9sm3588502wmb.33.2021.03.05.01.48.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 01:48:55 -0800 (PST)
Subject: Re: [PATCH v2 2/2] memory: Drop "qemu:" prefix from QOM memory region
 type names
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210304140229.575481-1-armbru@redhat.com>
 <20210304140229.575481-3-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <518d680c-5567-2a50-254b-e86400d9503c@redhat.com>
Date: Fri, 5 Mar 2021 10:48:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304140229.575481-3-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: peter.maydell@linaro.org, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 frederic.konrad@adacore.com, kraxel@redhat.com, mreitz@redhat.com,
 qemu-block@nongnu.org, quintela@redhat.com, andrew.smirnov@gmail.com,
 marcandre.lureau@redhat.com, atar4qemu@gmail.com, ehabkost@redhat.com,
 alistair@alistair23.me, dgilbert@redhat.com, chouteau@adacore.com,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, jsnow@redhat.com,
 kwolf@redhat.com, berrange@redhat.com, jcd@tribudubois.net,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 3:02 PM, Markus Armbruster wrote:
> Almost all QOM type names consist only of letters, digits, '-', '_',
> and '.'.  Just two contain ':': "qemu:memory-region" and
> "qemu:iommu-memory-region".  Neither can be plugged with -object.
> Rename them to "memory-region" and "iommu-memory-region".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/exec/memory.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


