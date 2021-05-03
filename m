Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CB337131A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:41:15 +0200 (CEST)
Received: from localhost ([::1]:58580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldV4i-0000Se-D8
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldUvS-00048W-Ms
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:31:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldUvR-0007pv-3h
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620034295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CPKatOAtXzW3W4vNf0lNdu/PLt+TgLfC5p376XTkxOg=;
 b=ON99vRIP2QKg0Ii6N+bGHUh1DW4e37Q5Yt0vghjh0Nd9oHgG4EkVSv5MPpK6KFfSP2KnPJ
 6J4X6dNI/Ul/wFsdrZlfUuB5sif1qyP4AkUTukoXPRP+wrrEyDxanPNtzgJ/M7JckRXVbs
 hao688gf88J+r4Pcb0hieQWdXxqa+QI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-fNu9UqIbOFW2G1IMn5kTRA-1; Mon, 03 May 2021 05:31:33 -0400
X-MC-Unique: fNu9UqIbOFW2G1IMn5kTRA-1
Received: by mail-wr1-f71.google.com with SMTP id
 93-20020adf93e60000b029010d9bb1923eso3595497wrp.4
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 02:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CPKatOAtXzW3W4vNf0lNdu/PLt+TgLfC5p376XTkxOg=;
 b=QGKnJFRqZ02FOG9I/IxRPprDbCN30rvLgHIsr03Ghj25pQ5j4GUvPtjPXGF90pEfWP
 WJhiJyXOYfAq4UjbMrb/VeXH4CIAPeg4EZXLdOVaawo9VxsEItSNckviGuEWPb4g00/c
 D07BB7le8ahGr7AP0Zx31GU3tstx46UN73iCoNcLAptQAh3dU+XyCj94yuyEgTwXxc0P
 xQzfdyHnCnOhGxgcaMQwBJdOONBx8w2piJoSY2WK4RtTpzAasSyZr43wmruieaVw1KTB
 j6QUo1Vnc4Imx0tSV4eIO77FZ8QjnOAybqG3ptNsB4chVYdf/xieZIU7E10hRRk3c/9l
 UW8g==
X-Gm-Message-State: AOAM5323JMVP5ls01vnYW+3XtJ3033HYEwii8/FaKmLh/pSOhK95x3h5
 gx4BSY7a8FtgPSTSoDGY9vgbAf4ZYDzSJWS1dRT61dqUCiWvDkm3/e1htyQNvJG+7jYSJ6wp/Dh
 fCBntumZQ30T2r/yIFwgq+pv1pidLF0XreGAM65/KUx4Dose+E6735HvdlJR2Ua0=
X-Received: by 2002:a1c:1f95:: with SMTP id f143mr19771151wmf.77.1620034292584; 
 Mon, 03 May 2021 02:31:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8RqZsxXPah4ThR7POvebsEGgfYf/XrZFhAK+3qJAOeyBQw4vxPxroQSCwD7eR4PKSsJ92dg==
X-Received: by 2002:a1c:1f95:: with SMTP id f143mr19771124wmf.77.1620034292362; 
 Mon, 03 May 2021 02:31:32 -0700 (PDT)
Received: from thuth.remote.csb (p5791d0bc.dip0.t-ipconnect.de.
 [87.145.208.188])
 by smtp.gmail.com with ESMTPSA id n5sm7339244wrx.31.2021.05.03.02.31.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 02:31:31 -0700 (PDT)
Subject: Re: [PATCH 3/4] pc-bios/s390-ccw: Silence GCC 11 stringop-overflow
 warning
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20210502174836.838816-1-thuth@redhat.com>
 <20210502174836.838816-4-thuth@redhat.com>
 <20210503110000.56f175ac.cohuck@redhat.com>
 <8a3e7c60-4b71-aa28-938c-f42259e9435b@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <000ea451-915f-13d1-aebe-48eeb80277db@redhat.com>
Date: Mon, 3 May 2021 11:31:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <8a3e7c60-4b71-aa28-938c-f42259e9435b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/05/2021 11.30, Philippe Mathieu-Daudé wrote:
> On 5/3/21 11:00 AM, Cornelia Huck wrote:
>> On Sun,  2 May 2021 19:48:35 +0200
>> Thomas Huth <thuth@redhat.com> wrote:
>>
>>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>
>>> When building on Fedora 34 (gcc version 11.0.0 20210210) we get:
>>>
>>>    In file included from pc-bios/s390-ccw/main.c:11:
>>>    In function ‘memset’,
>>>        inlined from ‘boot_setup’ at pc-bios/s390-ccw/main.c:185:5,
>>>        inlined from ‘main’ at pc-bios/s390-ccw/main.c:288:5:
>>>    pc-bios/s390-ccw/libc.h:28:14: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
>>>       28 |         p[i] = c;
>>>          |         ~~~~~^~~
>>>
>>> The offending code is:
>>>
>>>    memset((char *)S390EP, 0, 6);
>>>
>>> where S390EP is a const address:
>>>
>>>    #define S390EP 0x10008
>>>
>>> The compiler doesn't now how big that pointed area is, so assume its
>>
>> s/now/know/
>> s/assume/it assumes that/
> 
> Oops, thanks. Thomas, do you want me to repost this patch fixed?

I can fix it up in my tree here, no need to resend.

  Thomas


