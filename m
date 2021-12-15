Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4428747583D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:56:49 +0100 (CET)
Received: from localhost ([::1]:34002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxStr-0005Ka-RE
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:56:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxSQ6-0001lS-So
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:26:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxSPh-0007jo-69
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:25:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639567534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pd25ed3T4ozFoLI0Os6xbOPltZ1i/9nh4rDQRO0DCXU=;
 b=S1lxi4Px+BPGUYAxLpGOi3yGeYBjxxSRYqH53cBgCVrqj15lTQIIvdwTz231lZtqP9c0OE
 NGuaI31rcjoykB6jWGIz6yiIKmZV4rPTtuPq/r2/lGoeGg74lTyviQ3YPK3jBoHukQYbZZ
 xBWG/KJRy4hQsy3DoybxuyOrjvM6kUw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-doJDoVlmOa655VZEtepfLw-1; Wed, 15 Dec 2021 06:25:32 -0500
X-MC-Unique: doJDoVlmOa655VZEtepfLw-1
Received: by mail-wm1-f69.google.com with SMTP id
 f140-20020a1c1f92000000b00344f1cae317so850299wmf.0
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 03:25:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pd25ed3T4ozFoLI0Os6xbOPltZ1i/9nh4rDQRO0DCXU=;
 b=pfH4ynJV1ZOswOuSEBf6DJtKcbpV8bPGskpTsynSku+JShCnpoEa/X3c83JrzyA3Yy
 ElESC5Np++lA5KGYR+KxBhLKalOBGnsHyan1wBiST+f0ajwTfaW0+Fd/y74itGybmoqo
 BpLs/qIa1zjh04qhKvwb+rW+V/VH2YwxMbXDuTdF7Cy//dK0O5g99xGfmbY8cRv4JTKk
 wwmKKKRdHLeEJUH4UkMcYl/0yvmedrxtshlx6YmbK1ijnCxsLJhqc/xHzv+Wu9PFcgfN
 DdbO4u2zrGoRfPrQu9FKsmdXPYmr9XcDjYjGJEM60bboXcK5FZD18TIeV7hECunlCxRS
 FPPg==
X-Gm-Message-State: AOAM5322PfKIOqN8OS9LgvqKC/teBf5B7TRPEwzbOlPa5/e/M5jUAbof
 jWLg/m5BlE4tu0I4V0qPHGHF6RGeC16ZDWdq1iIxXw3ito8E2lZigB4/VVC4+0+CP39bE49D46P
 USmlCCW2cnlu1hn4=
X-Received: by 2002:a1c:8013:: with SMTP id b19mr3946492wmd.35.1639567531435; 
 Wed, 15 Dec 2021 03:25:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztPBRtM/WQVgBI4GXVgsihzknsIg1xexh/UKuTnDz3yoNNSBCxyhe0ktK6V/SwgztNHgfH4A==
X-Received: by 2002:a1c:8013:: with SMTP id b19mr3946472wmd.35.1639567531174; 
 Wed, 15 Dec 2021 03:25:31 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id b197sm1557181wmb.24.2021.12.15.03.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 03:25:30 -0800 (PST)
Message-ID: <0d400a57-e79a-d1be-d737-ab3483d39ec6@redhat.com>
Date: Wed, 15 Dec 2021 12:25:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] linux-user: Remove the deprecated ppc64abi32 target
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
References: <20211215084958.185214-1-thuth@redhat.com>
 <fb033cf6-ab9b-3f85-e95d-0093715de48f@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <fb033cf6-ab9b-3f85-e95d-0093715de48f@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/12/2021 12.17, Philippe Mathieu-Daudé wrote:
> On 12/15/21 09:49, Thomas Huth wrote:
>> It's likely broken, and nobody cared for picking it up again
>> during the deprecation phase, so let's remove this now.
>>
>> Since this is the last entry in deprecated_targets_list, remove
>> the related code in the configure script, too.
> 
> Can we keep that part to keep the gate open to deprecate more
> targets / features?

It can simply be added again once we need it. Keeping it around would make 
the output of "configure --help" look weird, I think.

  Thomas



