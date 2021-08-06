Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6A93E2438
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 09:38:05 +0200 (CEST)
Received: from localhost ([::1]:55310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBuQe-00046C-PT
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 03:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBuPL-0002iR-6T
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:36:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBuPJ-0003BF-Pi
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:36:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628235401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VYQNa64a7bmLyc9kIhGZ4x7gdLa1EV26qw2oz4E9IC8=;
 b=KSaKhMqbjWAfQkb0O+VC8xUq3c7LO00r7kjitGYltJcvCDaNV3H8wkx+qTCLh5Urfvgvk3
 Y0mzwWzkPMbzZ5c5PiTJGqOVcJjxLpp+DwZUOpmSTn6aGFguHkzBKhJ7UGKuIePABVb/nu
 U5ThTSn6LWs+fDev0YCK6jX+Pq7fYc0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-LEr3bltzNwm_OHuBHiEK5Q-1; Fri, 06 Aug 2021 03:36:40 -0400
X-MC-Unique: LEr3bltzNwm_OHuBHiEK5Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 e21-20020a05600c4b95b029025b007a168dso3580338wmp.4
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 00:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VYQNa64a7bmLyc9kIhGZ4x7gdLa1EV26qw2oz4E9IC8=;
 b=ZPptiizkT5sxQvSrHivxq5KrlIdTfyfSH7WXxp4I0yakYALV2Yza7MEfvyzUXG48GY
 qIDQKGIQljsY9zVok2kCH1jUns1HRKgI+XQYUX3zSXKgbkAgQJWxAADyAM7lZNp9j+Gy
 2VtmyxAqpKWctjLcjoFDc3vfEceumdo4LZjiUwJeKqnFF2V60es83pkDITwce3SETVlA
 xAFtFmrpjrUwzNbOgVLFKLDAm7le38WJ6BadQlUH82obgqUwoyZKbbVntR7ml2aHCK9Z
 Pp0RnKvWEjG0Ljnz6/+DHCOdqXmpvEZRPMEDacwJYVEOl9cKRoAs5Tv8+S61lhXmqYyv
 mShA==
X-Gm-Message-State: AOAM5301qrKfGo4gQABJ2GBYH7JFLgFl98kZ+tAhbZ1igpRuNGrFCiYr
 ZBDaWJPBkpGJIFCZpU7cH0OwFI3rN5nmQQT053VR9Xq2PoYvxJwoKuwTtxZNBijndQ1HcNn78lL
 R6ZDRMeSEK0wLD7k=
X-Received: by 2002:a7b:c354:: with SMTP id l20mr1861366wmj.159.1628235398973; 
 Fri, 06 Aug 2021 00:36:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzt1I92RGdqNAwYnP/rLbVNho+uToAqguD9tk8c7zTjtwGsW484LSY4tQR0vGpF867KjWNQzA==
X-Received: by 2002:a7b:c354:: with SMTP id l20mr1861330wmj.159.1628235398572; 
 Fri, 06 Aug 2021 00:36:38 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6104.dip0.t-ipconnect.de. [91.12.97.4])
 by smtp.gmail.com with ESMTPSA id f3sm8893541wro.30.2021.08.06.00.36.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 00:36:38 -0700 (PDT)
Subject: Re: [PATCH v1 05/12] s390x/mmu_helper: no need to pass access type to
 mmu_translate_asce()
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-6-david@redhat.com>
 <3a4db6af-3f9a-634a-6ff3-2e6cc875b886@redhat.com>
 <fbc5ea20-14bb-e6ca-65f4-7fcfd8fcea04@redhat.com>
 <17df3d6f-9eae-7275-86b2-86d4d40a7cc2@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <0be9d735-4ab9-38ce-84c3-a1eb9531299d@redhat.com>
Date: Fri, 6 Aug 2021 09:36:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <17df3d6f-9eae-7275-86b2-86d4d40a7cc2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.08.21 09:36, Thomas Huth wrote:
> On 06/08/2021 09.34, David Hildenbrand wrote:
>> On 06.08.21 09:30, Thomas Huth wrote:
>>> Fixes: 81d7e3bc45 ("s390x/mmu: Inject DAT exceptions from a single place")
>>>
>>> Reviewed-by: Thomas Huth<thuth@redhat.com>
>>
>> I'm usually a bit careful with Fixes tags if we're not fixing real BUGs. At
>> least in the kernel people will really complain if you do that (because it
>> might result in backports of patches that are absolutely not worth
>> backporting and makes actual bugfixes harder to track). But maybe QEMUs
>> policy is different, so I can add it.
> 
> Fair point. Maybe simply mention the commit id in the patch description?

Agreed, thanks!


-- 
Thanks,

David / dhildenb


