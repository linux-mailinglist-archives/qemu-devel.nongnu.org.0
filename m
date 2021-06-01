Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D7E397237
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 13:19:42 +0200 (CEST)
Received: from localhost ([::1]:59250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo2Qv-0002pZ-DR
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 07:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo2Oc-0000NA-AN
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:17:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo2Oa-0003SZ-QI
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622546236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2iPjR3Nk1ihO1wi9fHusdUyudrbfIzUIc139pBywCeY=;
 b=Nn3ckuHSGEE0uvG6qKWbwtEc18I//Gs5+SiTJpj4pgk/76Srtt9SbqjeIYJ9NZkIftbXS1
 sH0lWpAv48RNOkRM5mWDBTcfHcTp+w/+NV6k0bk+RHYkHwW3XoXH0qIVaGLXpjeBBrZMRs
 exOBi2z4jU25r7PnRbSR7ZZpvp4l0l0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-4iCBENc0Pf6AKTPmGLGKfQ-1; Tue, 01 Jun 2021 07:17:12 -0400
X-MC-Unique: 4iCBENc0Pf6AKTPmGLGKfQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 jz28-20020a17090775fcb02903dc26615f46so3248331ejc.8
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 04:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=2iPjR3Nk1ihO1wi9fHusdUyudrbfIzUIc139pBywCeY=;
 b=GMqqTb66pRHHSksMVru+b9E0O5496H3I1ldxGJW+wHlCYK7cdsQs9XxgIHKfpVGCw4
 cbNcuJOEOtqBOs355A2yKHHL37sojdxdleXJyMhWIu+mwH3xje8hmc7wGzFVnWFbSlDO
 HYlUztnrmahSLAePkghVfHNyRo6/Wq2HIAMZMUaEUy82d8usU2P3rAZfDAVHkB2UnFfC
 UdgXByfhU+l4Do3w4vXIo8foagKeeZ0EQfaXQ5f6S70vJjDC7n69TyHw49HJsBVA4uq9
 iobru9qVht5v/69KXJ1qnmZkYlA2aMwX2KhWKTffTq+Mqti92uW9LZeM83hYA1rQBPqH
 LQ3w==
X-Gm-Message-State: AOAM532Ss/UtyRuEJDYHq6Y54CcjtjfqG6h6dul7OzGcTXVeCdZeqJXO
 XLYIkyNM6Lcy4LUNCRB49f+5CPXyS9eKZushAYufSh7s4++i7aQTd6xdem3zgnz8qLPCDqF0Mv9
 HTKejL6O3vQBFwkI=
X-Received: by 2002:a17:906:2854:: with SMTP id
 s20mr28562385ejc.335.1622546231773; 
 Tue, 01 Jun 2021 04:17:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywbJgB1Egr9BxLU1CcbJtyD4Axn8W/B/Ku+X5mLf9k3S6wxdcYdbZcEpVUFUlpjCb5Lf65gA==
X-Received: by 2002:a17:906:2854:: with SMTP id
 s20mr28562355ejc.335.1622546231607; 
 Tue, 01 Jun 2021 04:17:11 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 j7sm8253257edr.79.2021.06.01.04.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 04:17:11 -0700 (PDT)
Subject: Re: [PATCH v2 27/33] iotests/222: constantly use single quotes for
 strings
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-28-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <a654db46-aeba-f1b7-5d6c-3107107587bc@redhat.com>
Date: Tue, 1 Jun 2021 13:17:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-28-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:21, Vladimir Sementsov-Ogievskiy wrote:
> The file use both single and double quotes for strings. Let's be
> consistent.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/222 | 68 +++++++++++++++++++++---------------------
>   1 file changed, 34 insertions(+), 34 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


