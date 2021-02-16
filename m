Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D603731CCCA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:19:09 +0100 (CET)
Received: from localhost ([::1]:35076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC284-0004ST-UV
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lC1si-0004HN-5v
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:03:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lC1sg-0006M7-9v
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:03:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613487793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d33dCm4FBOcq44mpD+DLalzE31ZqO1knvxHtN/4GQac=;
 b=ZUElwIqTMW2+dz6e+4CEQkgscKXJMU6LjhpX/dkxvxRJ4h6nbDvDAwZ2TvewuGOgMLeO+w
 T7KUMsv5DkkHgajheQHKk/PPY2e/niTcctHNqcIhinnNUqUwtVYNIGC7vWxwkVmAQW1CrD
 gGdqcQIhM151yePlBl1a7EvIv7S9/iY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-hIuxvYRfNp6dFxeUCJ1N5w-1; Tue, 16 Feb 2021 10:03:12 -0500
X-MC-Unique: hIuxvYRfNp6dFxeUCJ1N5w-1
Received: by mail-wr1-f72.google.com with SMTP id l10so13555082wry.16
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 07:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d33dCm4FBOcq44mpD+DLalzE31ZqO1knvxHtN/4GQac=;
 b=PYrdqCkXehAi1GaJZyWHUoRrosMAueEL7cPtowu2S0ke1amEsYkzENfvjiB4bJJ1c0
 4eExlpJCOB0zjnjBJoCQTpDbQTkGs1mucNxKTyAwHQixjaUyMghzy5/ICYKpJH2IJNHk
 2PmKexi1kKzRyJ83gZwFZklJIrD1f8Z/Y41Zap6kjNEzwYq40WelroYOz3DrmAofFRXP
 gdx7QeddQtC/488SBrOlncDDZXORkoI7UM0cOfuHAb+vjdqqFnjR5nN0Bhv0e6hhf8iw
 tlrXzjzKR0EJGN4W98++6uKpYJhlPWrzn3QRHsseCxqWd8KFQum/29HJaP0KyfEOxcpT
 aNBw==
X-Gm-Message-State: AOAM532TLprLrjwiPf8iYNR8jbyHHNrqRbIz+P8hlw+JXQv27kv+Z2j+
 GvcuUSQw/WG2TuvmJM42myycj8MDHV33OOon46JWCD4bwWoCsiaKBAGiXsXcCcx0MhrU22YvwO9
 4/VMDxiUxNSivTUH9XmCzuA7TZSqXGzQn29aBC3gfO536DQPSQ4v/1y3RS5UtfUBG
X-Received: by 2002:a1c:1fce:: with SMTP id f197mr3646586wmf.110.1613487790449; 
 Tue, 16 Feb 2021 07:03:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyR8buDJPcVEtSvT8+2md6ZXs+iajoJ3Pzg/W5/FXaXn800bdH1LgHIrH1Rzxm7H62YB5jHAA==
X-Received: by 2002:a1c:1fce:: with SMTP id f197mr3646407wmf.110.1613487787308; 
 Tue, 16 Feb 2021 07:03:07 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w2sm5089853wmg.27.2021.02.16.07.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 07:03:06 -0800 (PST)
Subject: Re: [RFC PATCH 0/3] hw/pflash_cfi01: Reduce memory consumption when
 flash image is smaller than region
To: David Edmondson <david.edmondson@oracle.com>, qemu-block@nongnu.org
References: <20210216142721.1985543-1-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <df4db595-c2db-4fa8-0a4b-1403117dcc76@redhat.com>
Date: Tue, 16 Feb 2021 16:03:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216142721.1985543-1-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 3:27 PM, David Edmondson wrote:
> As described in
> https://lore.kernel.org/r/20201116104216.439650-1-david.edmondson@oracle.com,
> I'd like to reduce the amount of memory consumed by QEMU mapping UEFI
> images on aarch64.
> 
> To recap:
> 
>> Currently ARM UEFI images are typically built as 2MB/768kB flash
>> images for code and variables respectively. These images are both
>> then padded out to 64MB before being loaded by QEMU.
>>
>> Because the images are 64MB each, QEMU allocates 128MB of memory to
>> read them, and then proceeds to read all 128MB from disk (dirtying
>> the memory). Of this 128MB less than 3MB is useful - the rest is
>> zero padding.
>>
>> On a machine with 100 VMs this wastes over 12GB of memory.
> 
> There were objections to my previous patch because it changed the size
> of the regions reported to the guest via the memory map (the reported
> size depended on the size of the image).
> 
> This is a smaller patch which only helps with read-only flash images,
> as it does so by changing the memory region that covers the entire
> region to be IO rather than RAM, and loads the flash image into a
> smaller sub-region that is the more traditional mixed IO/ROMD type.
> 
> All read/write operations to areas outside of the underlying block
> device are handled directly (reads return 0, writes fail (which is
> okay, because this path only supports read-only devices)).
> 
> This reduces the memory consumption for the read-only AAVMF code image
> from 64MB to around 2MB (presuming that the UEFI image is adjusted
> accordingly). It does nothing to improve the memory consumption caused
> by the read-write AAVMF vars image.

So for each VM this changes from 64 + 64 to 2 + 64 MiB.

100 VMs now use 6.5GB instead of 400MB. Quite an improvement already :)

> There was a suggestion in a previous thread that perhaps the pflash
> driver could be re-worked to use the block IO interfaces to access the
> underlying device "on demand" rather than reading in the entire image
> at startup (at least, that's how I understood the comment).
> 
> I looked at implementing this and struggled to get it to work for all
> of the required use cases. Specifically, there are several code paths
> that expect to retrieve a pointer to the flat memory image of the
> pflash device and manipulate it directly (examples include the Malta
> board and encrypted memory support on x86), or write the entire image
> to storage (after migration).

IIUC these are specific uses when the machine is paused. For Malta we
can map a ROM instead.

I don't know about encrypted x86 machines.

> My implementation was based around mapping the flash region only for
> IO, which meant that every read or write had to be handled directly by
> the pflash driver (there was no ROMD style operation), which also made
> booting an aarch64 VM noticeably slower - getting through the firmware
> went from under 1 second to around 10 seconds.
> 
> Improving the writeable device support requires some more general
> infrastructure, I think, but I'm not familiar with everything that
> QEMU currently provides, and would be very happy to learn otherwise.

I am not a block expert, but I wonder if something like this could
be used:

- create a raw (parent) block image of 64MiB

- add a raw (child) block with your 768kB of VARS file

- add a null-co (child) block of 63Mib + 256kiB

- pass the parent block to the pflash device

Regards,

Phil.


