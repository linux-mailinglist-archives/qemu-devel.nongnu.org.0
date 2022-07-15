Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E710575FE6
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 13:19:03 +0200 (CEST)
Received: from localhost ([::1]:60772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCJLa-0006DF-BI
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 07:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oCJJt-0004YS-LO
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 07:17:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oCJJr-0000xc-MY
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 07:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657883835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1+y3cDwp+V8lDP8v2LXmSKIDLHOjmdkNogug2iuhY4g=;
 b=S4+Lf1GqDHx1mr0pU5FPIOPmmH6iy73F0sKdLex1kyR8IQM8bg9prkEkot80EAgtys6mRF
 ESGza1V+Me4gwDlucXgEQrWg4Qjb1UzH1RUs4PV79nAAexHlEEfhM/PuV2hug4OjTVSrha
 GhuCZdJCIgNo/qefsQrKeTxSPpJV8tM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-YfDWOG7bO2yUHHqIIJwuFQ-1; Fri, 15 Jul 2022 07:17:14 -0400
X-MC-Unique: YfDWOG7bO2yUHHqIIJwuFQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 m13-20020a056402430d00b0043ac2f27d83so3312566edc.20
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 04:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1+y3cDwp+V8lDP8v2LXmSKIDLHOjmdkNogug2iuhY4g=;
 b=4JH7FltqaNJhyL17Fw1L5xqxHHsoWLzFMzaQTwX2jkdbfozGTh3r4scSF5+hcKm70h
 wIIaTs+XIoM24jVLXDtybpaEDHrcmXOgK8R96+AnaZ/VopJNRxTtoO1sKezAvBhwM1dF
 b4Uloo5cRXxQcIDYJZnFwdAO5OMlAiVKRpY6N/bOncbofOQVRFqk51iS2dJuw042Qq7n
 SM4cdugg2hJ4/HI3e0kkdfQ0IsKwBmCXZ0OnDikEYZzBz1k3WsjOa9YSUpXtJthls5cy
 7CBRSJro2/8wjH9eInaxZU2hsowtPO4jZJQrSpdSDFRmM4mfbppIIuu6B3o36QHphixm
 lTfg==
X-Gm-Message-State: AJIora+iRismX7uo4Xcg3AhzmDf6us8R8P44rtFbDv/UmUw4Uu+lalsg
 s7wJvhCqcGggC8bEbIqZXYoOPl7Fi4myyPc6dMM71nUqE9TKqpOAJJhCcPA+mphgfKECgc04wey
 /fwR/sA0Gb+WKYRw=
X-Received: by 2002:aa7:d702:0:b0:43a:5296:df67 with SMTP id
 t2-20020aa7d702000000b0043a5296df67mr18095876edq.314.1657883832912; 
 Fri, 15 Jul 2022 04:17:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vH0z5RHYx4RYw/g07zOTIRxY63U1IriAgl9hO8kpRC/ritiGhvEujEkHruBtFl/heGo9U/GQ==
X-Received: by 2002:aa7:d702:0:b0:43a:5296:df67 with SMTP id
 t2-20020aa7d702000000b0043a5296df67mr18095845edq.314.1657883832594; 
 Fri, 15 Jul 2022 04:17:12 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 d25-20020aa7c1d9000000b0043a75f62155sm2624241edp.86.2022.07.15.04.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 04:17:11 -0700 (PDT)
Message-ID: <5928f49e-f4d7-b0f9-b30c-7e3b4970a4d9@redhat.com>
Date: Fri, 15 Jul 2022 13:17:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 5/8] block: implement .change_aio_ctx in child_of_bds
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-6-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220712211911.1302836-6-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.07.22 23:19, Emanuele Giuseppe Esposito wrote:
> bdrv_child_cb_change_aio_ctx() is identical to
> bdrv_child_cb_can_set_aio_ctx(), as we only need
> to recursively go on the parent bs.
>
> Note: bdrv_child_try_change_aio_context() is not called by
> anyone at this point.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


