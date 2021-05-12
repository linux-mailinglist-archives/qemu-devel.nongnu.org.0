Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFACB37B6F9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 09:36:52 +0200 (CEST)
Received: from localhost ([::1]:49776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgjQJ-0003SV-Qr
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 03:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjOV-0001lX-2y
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:34:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjOT-0003u4-NK
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620804897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cy5rZ7QA0vSy2CPqhMSqWSPxQAwO9UIDSQe55U8zvzg=;
 b=fG+i7CF41MlEKa21hmv18TQBASNQuozU9fDiBM0moi+3FXg2wt9z4T3JicEF3hczDkHGb1
 nkSKnY1mbAugAvEBGMO8bRbgfP6Ht82D56u6f6aew9fz65hZtsVcKwdIcDa3/WnynuBAP4
 FnK7jeSuFAQU2VANKoPxP7VA2/zFSlQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-2vnRnolYOvCOMV8CBy4Tvw-1; Wed, 12 May 2021 03:34:53 -0400
X-MC-Unique: 2vnRnolYOvCOMV8CBy4Tvw-1
Received: by mail-ej1-f71.google.com with SMTP id
 x20-20020a1709061354b02903cff4894505so233286ejb.14
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 00:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cy5rZ7QA0vSy2CPqhMSqWSPxQAwO9UIDSQe55U8zvzg=;
 b=uT1Wgxivq/gQzTghAoH0wPTUUnK8ZNNoNgFpxkfq1MsfZWJzcxz5my6VK7YwYU45Iw
 7TdSpqcpk5AvEa1+cLgVuEBFqugtEN9CA91KFgvBLktHWQ5Rht4EHKQo/JkwqQzp0WN6
 MfT17jSG7SiYQEJybsmWAuq6RYZgDUAGQ0hLnwLeclYGmozVA+wJ1c2fnl2vS5nvZ+fy
 4ke92d9Qt//WC80Y9cKaAIe674ESkWLI/ZeJVhMukMefqVTZkz25fdnavzzS1fENdvBJ
 IU0a4H3NuvL3VPXZvOIB+pyymwruyOHyBEVqjXLCx36Ust4ku1+obYUc7u4PBL8ek3JM
 Rf0g==
X-Gm-Message-State: AOAM530cA5zkjOHo1ovejmLnL73K+B8q17gD3cs2NuUbiUGtQS6gWfXc
 PjKECmhQxfcwtvqydLr3pb3Q8A7S993IIxEY17LzzlKvSXQ9vJvGFGBWkp3Vp/IIh3BlHzoSd6+
 dzbsuFi8LE9ff16w=
X-Received: by 2002:a05:6402:430e:: with SMTP id
 m14mr42244759edc.308.1620804892406; 
 Wed, 12 May 2021 00:34:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWmaRIDPgycJ6rwQVgVAF38lVi2hrWrZKDDOTTmMsIu7KiOfTAlz8L2lPZRB7MOoRKMSgsTw==
X-Received: by 2002:a05:6402:430e:: with SMTP id
 m14mr42244743edc.308.1620804892238; 
 Wed, 12 May 2021 00:34:52 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w14sm17063113edj.6.2021.05.12.00.34.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 00:34:51 -0700 (PDT)
Subject: Re: [RFC PATCH 0/5] buildsys: Do not use internal fdt library when
 asked for the system one
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511155354.3069141-1-philmd@redhat.com>
 <ed80da42-74e1-d112-5cd2-8c7456ce6e4b@redhat.com>
 <7eabc7c2-d2cd-2bbd-c5b5-85defc649b9b@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4df31517-38da-4863-4595-03523f5af7db@redhat.com>
Date: Wed, 12 May 2021 09:34:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7eabc7c2-d2cd-2bbd-c5b5-85defc649b9b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/21 05:56, Philippe Mathieu-Daudé wrote:
>>    qemu/meson.build:1352:4: ERROR: Running configure command failed.
>>    The following clauses were found for PSERIES
>>
>>      CONFIG_PSERIES=y
>>      config PSERIES depends on FDT
>>
> This is triggered with:
> 
>                 fdt support: NO
> 
> having:
> 
> default-configs/targets/ppc64-softmmu.mak:6:TARGET_NEED_FDT=y
> 
> So this code doesn't seem to work:
> 
> if not fdt.found() and fdt_required.length() > 0
>    error('fdt not available but required by targets ' + ',
> '.join(fdt_required))
> endif
> 
> BTW I disagree FDT is target-dependent, it is machine-dependent IMO.
> 

I agree.  It is much better to depend on FDT consistently for machines 
that require it.

Paolo


