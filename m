Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB956D064B
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 15:17:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phs8e-0005An-3t; Thu, 30 Mar 2023 09:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phs8Y-0005AE-CH
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:16:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phs8V-0001Ui-Ll
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680182174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F0KKvdQcq3jEAP4DogE0T5djp9shjJEgKrO/etoMPgE=;
 b=HSGOYt4aXVkzw4tiJRncwMQyQX8ORihkWul2twd8tJZhNUZi3haAhKSd3YZnlnI9XAwmTI
 +BJL10TqxWipS25+7te8uMOO/aVA+kfl1AmvXVxOcZsKe4u1bOhyoZcv9fQ7S2M0DLfnml
 3C82CHbIAzSak9KfkMnHz2mJYEyoc1k=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-rYn2Sz5BNuS8qwd9W8K5Tg-1; Thu, 30 Mar 2023 09:16:12 -0400
X-MC-Unique: rYn2Sz5BNuS8qwd9W8K5Tg-1
Received: by mail-qt1-f197.google.com with SMTP id
 t15-20020a05622a180f00b003e37dd114e3so12387779qtc.10
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 06:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680182172;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F0KKvdQcq3jEAP4DogE0T5djp9shjJEgKrO/etoMPgE=;
 b=TROzMmdu/CfDWAbuilrYyq6d/6dqhQwdQ4WOsVhZat13nN6n3fdEjP/vVUpFfFWY17
 L5Z6LRVdtnpmt6tPVJsMal54DRcq+tuTKxQyc/JMOqwnvcU68oTBKNEZp9sfjO62oeAC
 e5C+V1WuczZk3s4ffnm0lKXGGexqTUYbfAmQQ15CgwvqAKn0ikG9zxQ2MFUCvLlftxBx
 ApvC/KAXJAb2SG3plteuNMHYbHyL6H0OvxkcYGFQ1D2TUSphbK8IXQCtBeIiKkeGsGhy
 m5QSBhE2JBa6muJ7fpFwBEDklisvIWG8L0q+zwhXevI4gNIqKVs6VZ4SEic4avXa9QrO
 kH0Q==
X-Gm-Message-State: AAQBX9eqO6QEA/69+y2/Qj0I1MZ8hloDpZ48UuGe8ND9AfImz1Pm1AUR
 ZvbrfyOMRg1sSnazp8kMb4rFjqs8rd8dRoN1OQyhHuIql1vyPoa4iW9+nnY3mtuU7mKNSJ+vNZZ
 8hKMbv8oh2Bly7Yw=
X-Received: by 2002:a05:6214:f61:b0:5e0:63ec:5d7b with SMTP id
 iy1-20020a0562140f6100b005e063ec5d7bmr3315481qvb.28.1680182172194; 
 Thu, 30 Mar 2023 06:16:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350b5SJN0E2u+5f47DF0kGOfUuPLXP702ehVBFt3dDLdTDB/UW2E+n1CmyysmglJc4l+FYzm8aA==
X-Received: by 2002:a05:6214:f61:b0:5e0:63ec:5d7b with SMTP id
 iy1-20020a0562140f6100b005e063ec5d7bmr3315451qvb.28.1680182171896; 
 Thu, 30 Mar 2023 06:16:11 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 bl28-20020a05620a1a9c00b007339c5114a9sm19512863qkb.103.2023.03.30.06.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 06:16:11 -0700 (PDT)
Message-ID: <76fad258-2f98-08ee-3b54-eba4d4cbe0b5@redhat.com>
Date: Thu, 30 Mar 2023 15:16:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests: bios-tables-test: replace memset with initializer
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>
References: <20230330131109.47856-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230330131109.47856-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 30/03/2023 15.11, Paolo Bonzini wrote:
> Coverity complains that memset() writes over a const field.  Use
> an initializer instead, so that the const field is left to zero.
> Tests that have to write the const field already use an initializer
> for the whole struct, here I am choosing the smallest possible
> patch (which is not that small already).
> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/qtest/bios-tables-test.c | 123 ++++++++++++---------------------
>   1 file changed, 43 insertions(+), 80 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


