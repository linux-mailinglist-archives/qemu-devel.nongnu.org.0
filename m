Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DD4396595
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 18:39:32 +0200 (CEST)
Received: from localhost ([::1]:43286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnkwt-0002U5-Qp
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 12:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lnku3-0000PA-An
 for qemu-devel@nongnu.org; Mon, 31 May 2021 12:36:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lnktu-0007uk-7K
 for qemu-devel@nongnu.org; Mon, 31 May 2021 12:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622478984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cr3s+4yjLqzqynZfIStalJ8Nc2g3gtHbVXMeEFfUQoY=;
 b=LBxCYo3HcWJPiKLlFgT1epHJRfjF486iIGGm4G0l4cYiJ7w48WhF1C3AnraXFM64TMgMX1
 QQo6MVXyXRzr/xCV6x4JKOW10xys58wn4Ogtm5iAsdjt5xJFTXcC4zT2my+jpX2A7CcDS/
 qp/UysB0KAUXLcy4k/zmhZ9SPHp/mdU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-6z_tU10iNgi-3YBNb_pSTw-1; Mon, 31 May 2021 12:36:22 -0400
X-MC-Unique: 6z_tU10iNgi-3YBNb_pSTw-1
Received: by mail-wr1-f71.google.com with SMTP id
 v5-20020adf9e450000b029010e708f05b3so4161254wre.6
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 09:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cr3s+4yjLqzqynZfIStalJ8Nc2g3gtHbVXMeEFfUQoY=;
 b=YcHtfrb1O1PFwMbJBZ9nl0e/UWOBDPeOJe7kzocePaDT4uFKgn6eXqXziwTgpFRZZz
 G5e5iKLSPv0Lpybhj8Fvw5Rk5QNvaeGHmqZA/4v6ErrxHMFsWwMaOofvRsjkIJps7r0Z
 6NwvHoe6kSiKSFgSGNy7SoY+yo+w9aOIRxF/Keg+k9DGOrlw3lOeq+04irmOHhk7tRB3
 j96aND8VZKhg0GrY5io2VvzTtgg4UIOnL0Jnc3X33qRQrAnQtvRSImMhfzb/HCiaQRrz
 2UYkX9c9EbJvDtlENniGf3MFLSM11oTuWOu3LHAqibeEwu88/AeluZOUwnsNKDKNOS28
 o7MA==
X-Gm-Message-State: AOAM532ppphff5p+SFulsCeLDZE0IPgtR6zcztSkVCbblP47mAfdIdOx
 6Og7T2OKjz8R3N8H1TvxyclBdY9xj1WDlm2xWBRBbmKz6fondlyXsxLOJz4gOzkClxcqrlM+SIy
 cMr1zpYSyC3MjS8E=
X-Received: by 2002:a7b:cc10:: with SMTP id f16mr22510929wmh.24.1622478981159; 
 Mon, 31 May 2021 09:36:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztGY2oGVXLgWKRmk2AMLKq9D6wPlQWNXmMEg+x4d7H6H0kBdyYUZ8sxKLyfm7GvNe9FDW9CA==
X-Received: by 2002:a7b:cc10:: with SMTP id f16mr22510907wmh.24.1622478980880; 
 Mon, 31 May 2021 09:36:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c15sm250519wro.21.2021.05.31.09.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 09:36:20 -0700 (PDT)
To: Kevin Wolf <kwolf@redhat.com>
References: <20210524163645.382940-1-pbonzini@redhat.com>
 <20210524163645.382940-3-pbonzini@redhat.com>
 <YK/ABCylKztcARUz@merkur.fritz.box>
 <5e4476a5-bfc6-b32b-3d80-bf075ba4d4b4@redhat.com>
 <YLTrtE98m2zS3Spr@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/6] file-posix: try BLKSECTGET on block devices too,
 do not round to power of 2
Message-ID: <c19a7c8e-8259-b302-2829-1042f814cd65@redhat.com>
Date: Mon, 31 May 2021 18:36:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLTrtE98m2zS3Spr@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Cc: nsoffer@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/05/21 15:59, Kevin Wolf wrote:
>>> Apparently the motivation for Maxim's patch was, if I'm reading the
>>> description correctly, that it affected non-sg cases by imposing
>>> unnecessary restrictions. I see that patch 1 changed the max_iov part so
>>> that it won't affect non-sg cases any more, but max_transfer could still
>>> be more restricted than necessary, no?
>>
>> Indeed the kernel puts no limit at all, but especially with O_DIRECT we
>> probably benefit from avoiding the moral equivalent of "bufferbloat".
> 
> Yeah, that sounds plausible, but on the other hand the bug report Maxim
> addressed was about performance issues related to buffer sizes being too
> small. So even if we want to have some limit, max_transfer of the host
> device is probably not the right one for the general case.

Yeah, for a simple dd with O_DIRECT there is no real max_transfer, and 
if you are willing to allocate a big enough buffer.  Quick test on my 
laptop, reading 12.5 GiB:

    163840       9.46777s
    327680       9.41480s
    520192       9.39520s (max_iov * 4K)
    614400       9.06289s
    655360	8.85762s
    1310720      8.75502s
    2621440	8.26522s
    5242880	7.88319s
    10485760	7.66751s
    20971520 	7.42627s

In practice using blktrace shows that virtual address space is 
fragmented enough that the cap for I/O operations is not max_transfer 
but max_iov * 4096 (as was before the series)...  and yet the benefit 
effectively *begins* there because it's where the cost of the system 
calls is amortized over multiple kernel<->disk communications.

Things are probably more complicated if more than one I/O is in flight, 
and with async I/O instead of read/write, but still a huge part of 
performance is seemingly the cost of system calls (not just the context 
switch, also pinning the I/O buffer and all other ancillary costs).

So the solution is probably to add a max_hw_transfer limit in addition 
to max_transfer, and have max_hw_iov instead of max_iov to match.

Paolo


