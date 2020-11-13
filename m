Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01522B192D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 11:38:49 +0100 (CET)
Received: from localhost ([::1]:53350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdWTh-0005U5-0Q
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 05:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdWSc-00052r-G9
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:37:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdWSZ-0003AD-LP
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:37:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605263856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c4Qj2xyrYn+08pTJ8VD35o/InrIJujFUI6tEEl7EdSo=;
 b=C9dDVyyO/sxK6cwtNFMa3V/dupCtUKwINOJZbI7ZSscOQCWYS8Oo1yJmUMronv+YlBdijR
 bbwzW40mVlWnWr7TKOgSe+zHV4VDgnNqcM2Gu2bCcvvHbm0r/gM2nAd6GfZH3eXtd0GC4f
 njqAteXsIs3LZlXTOKAWwMtCMAPwW3s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-uUXQLKhcP0aFFmoN-dz5vw-1; Fri, 13 Nov 2020 05:37:34 -0500
X-MC-Unique: uUXQLKhcP0aFFmoN-dz5vw-1
Received: by mail-wr1-f70.google.com with SMTP id w6so3594116wrk.1
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 02:37:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c4Qj2xyrYn+08pTJ8VD35o/InrIJujFUI6tEEl7EdSo=;
 b=BLDlr8Jwlplti3jRHGaF9NxYvURg8kjgCBbeHj0WVunvaNyoFo7CsVHQZZc3wQJEu7
 B6vm60P7e4SmY8ltyfA50tm7EX/9uXsLATNBEl04jHHv7jEtmhjD+7DLqrEBkAx1/nr6
 lMyclRGpnIn5V3PcjSrYUm/BBZw2AI+sAqLzOq6/2mPecx0sAZZmpy+ptyxs8jUyj7QT
 YnY9RjnCsUm/eftD0FZqZMvurnEgbgYPU8lGoInYkZpKsLThHc0Dp0IO60iLmXkGi58p
 AEEJ0NAwRQpqIHrpPteW4d+fnPebil5j+xRC0dEDy4PksSkEYhFLubLJmtrXQtV5xW33
 ulmQ==
X-Gm-Message-State: AOAM5327G3/VY4T6K4zUPZbHz9meSm/x7YiaXNJyf45v2jGtgZAe9CXq
 oNf9shx8J4RVcSJBpCp3CbCGKYRWeTmNMsSz4jIA9dDrzmcUh8+6/LCabXXoB+hWGROwhjeBbrO
 YuGNhA+Wie5InFHk=
X-Received: by 2002:adf:fcc8:: with SMTP id f8mr2562938wrs.331.1605263853425; 
 Fri, 13 Nov 2020 02:37:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx39fUrZrqoTEMoiboJR9CKfyf+LELSBzGkW42RiIhdGY3AP/QrBekYG0mW0csfwzP1NZJ57g==
X-Received: by 2002:adf:fcc8:: with SMTP id f8mr2562917wrs.331.1605263853248; 
 Fri, 13 Nov 2020 02:37:33 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b1sm10182083wmd.43.2020.11.13.02.37.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 02:37:32 -0800 (PST)
Subject: Re: [PATCH v2] digic: remove bios_name
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201113101715.1438460-1-pbonzini@redhat.com>
 <CAFEAcA_rg8hZTH8pb6VJ8Wo7z52pqx0TOsXB-hOfmaHmHBLg0w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2e9c99af-7bf0-902c-f673-1ed233af9225@redhat.com>
Date: Fri, 13 Nov 2020 11:37:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_rg8hZTH8pb6VJ8Wo7z52pqx0TOsXB-hOfmaHmHBLg0w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/11/20 11:22, Peter Maydell wrote:
>> Pull defaults to digic4_board_init so that a MachineState is available.
>>
>> Cc: Peter Maydell<peter.maydell@linaro.org>
>> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
>> ---
>>   hw/arm/digic_boards.c | 19 +++++++------------
>>   1 file changed, 7 insertions(+), 12 deletions(-)
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> 
> Did you want me to take this via target-arm.next or are you
> planning to include it in some other series/pull ?

I have ~15 patches each for bios_name and ram_size and I was planning to 
send them all myself (most have already received acks/reviews from 
maintainers), but it's the same.

I did want to run this through you since this particular board was one 
of very few that didn't have a purely mechanical change, and you had a 
suggestion on how to improve on v1.

Paolo


