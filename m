Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB1E46604A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 10:25:20 +0100 (CET)
Received: from localhost ([::1]:45260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msiL9-0001yD-Bx
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 04:25:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1msiJ4-0000aN-9P
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 04:23:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1msiIz-0008Dc-Mf
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 04:23:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638436984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FDJBM29qbnTNN+W+S1MsY+LVLmWKBKBYiBlC4ur/CzQ=;
 b=Vr/qFWSODwasqBRtDmKAITVNREURgmex43b6hfeaGM9TjHrjSggWvdL/NgvgBVWH0oF/xk
 86a8lQrzrEPYO+z4WvVBbL/v4QTg47+1vNewhVA+GUGfCr0DA0GpbiHGbV318M2RJVaS6P
 BpEqPuj8GEDpnXYE/3HOSpOG+VV9hco=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-3m4vj2KJNTeEp6nU9xs1AA-1; Thu, 02 Dec 2021 04:23:03 -0500
X-MC-Unique: 3m4vj2KJNTeEp6nU9xs1AA-1
Received: by mail-wm1-f72.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so1367634wmc.7
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 01:23:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FDJBM29qbnTNN+W+S1MsY+LVLmWKBKBYiBlC4ur/CzQ=;
 b=EzKNXQ+mnQTqS7WzobLIS2YvYj9Bk/KUm/57T4GVKIync7EsSPIaJ092Ri2IrWUJOP
 aH86xSA7sLpMasxCu8dnEYp2pMxSxCd0QQ3to8J7uQLsQSMFo3jN6VAvCRnA2830kiC/
 ntdviWrijbE2rJW7L7CVuFzHSpgZ5nGcj9J/YXCttKsPfGy9E4uAXNCO62F2klFvjb1Q
 SReno9rzPQ41erdCCeD64YdqKoe0kNVr9ntpELdOl9zs2921bmniT4mzpQpdEa29XaV/
 UQMD8Gta3jreoPpAg3CXKmpMtsLke0wiassc5eQCzS8q/dxfOD+NXKkBCjxngp2KgK64
 GC6g==
X-Gm-Message-State: AOAM532fFQbdAksRoVSeGtYodx5qtOtTBs09hwJJjZoZDWzmb2tBziCJ
 OIoGxkFA68oHqB8K3noHrFyYeM1Ks00oDCDsw4+Yy4aXPX+ZxPXalaGdEztrorTEBSEV7Jf+z9C
 OTAcwMoKO79lYDPU=
X-Received: by 2002:a5d:6351:: with SMTP id b17mr13062942wrw.151.1638436982257; 
 Thu, 02 Dec 2021 01:23:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKtjIZaWHF1io9vfnn95r+3m/bNMXt8do1oKWDDvwvjdh45Tcs6Bh6TzpAbLnh8lclQx5P6w==
X-Received: by 2002:a5d:6351:: with SMTP id b17mr13062907wrw.151.1638436981948; 
 Thu, 02 Dec 2021 01:23:01 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id g124sm1526850wme.28.2021.12.02.01.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 01:23:01 -0800 (PST)
Message-ID: <776ef06a-525a-6aaa-fe7c-b99c91c6b7fe@redhat.com>
Date: Thu, 2 Dec 2021 10:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4] s390: kvm: adjust diag318 resets to retain data
To: Collin Walling <walling@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
References: <20211117152303.627969-1-walling@linux.ibm.com>
 <6befad1c-af14-8fe6-e3a6-a022b053f1c1@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <6befad1c-af14-8fe6-e3a6-a022b053f1c1@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.3, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: borntraeger@de.ibm.com, cohuck@redhat.com, frankja@linux.ibm.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/12/2021 19.45, Collin Walling wrote:
> Polite ping. I may have missed if this patch was picked already. Thanks!

I've already queued it to my s390x-next branch:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

It just came in very late for 6.2, and it didn't seem too critical to me, so 
I didn't sent a separate pull request for this one. Thus it will get merged 
once the hard freeze period of QEMU is over.

  Thomas


