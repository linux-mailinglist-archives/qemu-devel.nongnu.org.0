Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D471B4C2C34
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:54:49 +0100 (CET)
Received: from localhost ([::1]:45978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNDdw-0006Ll-Qf
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:54:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNDY9-00023E-EL
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:48:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNDY6-0000su-IR
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:48:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645706926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=miiCEC55rq9WuCWlwQ/P1bFP9bZeMHlu67v+FIFr56A=;
 b=g/8kTDFXqQsee+lWu3vUHbkqqPrdySYgTtxP2pwCP0Nj/iM7xRHTn7f7WSE4uJ55Csgiwk
 0vH+d8bIA08e6P8Lg9iYMkOqcvMDTZ0JazbUvsWF/rBMOmvHEaHMCA6474SB3iXkJH6JJV
 C5z7Ddqc5muJM2nKZbBpjBnHzkbpEYk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-ipV5VOVtMNGqOdtpe53xNg-1; Thu, 24 Feb 2022 07:48:44 -0500
X-MC-Unique: ipV5VOVtMNGqOdtpe53xNg-1
Received: by mail-ej1-f72.google.com with SMTP id
 i20-20020a17090671d400b006d0ed9c68c1so1159949ejk.14
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 04:48:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=miiCEC55rq9WuCWlwQ/P1bFP9bZeMHlu67v+FIFr56A=;
 b=1thbUc650LXIfUn8IBG+WwNI54hIfA65Lm9Z97K/tL9r14S2TyhvkaITXClQzoLpcc
 ieSZ6CMe5V4/ZxfL7Ec+dCmYRbJxlTlS0jXbnbAR56PuG5dx7vRaKnf/PVbjpMKSeoMP
 5FVKeGFRginaj7Ll8t6romaX+D48NaoIwi3KkTZF73CX3zhXlsKwzgwJjJPZISEIHbjq
 /ccjGPJm/STRYbLbnasVhWqnsihHMu0Dcrzcjh3Qt11nXAbZFk4osE3D+baUi7x0jbTS
 4vFMRFmSG0bG6gWO8Nagfh+2czVDeR39G6ahP6SfshcCyfDoGPl2zXNl0/o8EnoX9Bfg
 Lvwg==
X-Gm-Message-State: AOAM531XfbhG81BezkphMdGEyYHXLihuZJTrPux7k8ivJuBBPJIgoeXT
 //4+JUq59O986UXZ5Q3glDXCMhGuZwCpo+ONRupbfsWvtL9seAAouYUKEE0dOor9f4+xvXm4fBV
 tOCjNpgi5oc+TilM=
X-Received: by 2002:a05:6402:430f:b0:410:a082:c6da with SMTP id
 m15-20020a056402430f00b00410a082c6damr2115794edc.438.1645706923644; 
 Thu, 24 Feb 2022 04:48:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwd7L3KbKp/PzLPRjHOdkGR6KY6OWHQZssO5GHagUc3xCMkPw2wcV1WnPgaN9XVf1ntObAWAA==
X-Received: by 2002:a05:6402:430f:b0:410:a082:c6da with SMTP id
 m15-20020a056402430f00b00410a082c6damr2115781edc.438.1645706923439; 
 Thu, 24 Feb 2022 04:48:43 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id u26sm1310104ejg.196.2022.02.24.04.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 04:48:43 -0800 (PST)
Message-ID: <f66b3c82-130a-e39f-7b28-572cb070eaf3@redhat.com>
Date: Thu, 24 Feb 2022 13:48:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 13/18] iotests/image-fleecing: add test-case for
 fleecing format node
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
 <20220216194617.126484-14-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220216194617.126484-14-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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
Cc: fam@euphon.net, kwolf@redhat.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, nikita.lapshin@virtuozzo.com, stefanha@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.22 20:46, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/tests/image-fleecing     | 64 ++++++++++++-----
>   tests/qemu-iotests/tests/image-fleecing.out | 76 ++++++++++++++++++++-
>   2 files changed, 120 insertions(+), 20 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


