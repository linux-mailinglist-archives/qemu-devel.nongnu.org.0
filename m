Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49473DE9BF
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 11:36:01 +0200 (CEST)
Received: from localhost ([::1]:38922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAqq8-00066c-OS
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 05:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mAqoL-000488-6J
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:34:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mAqoI-0000YG-0H
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627983244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eE1GgcYKV2KKsGa2XkbTQwndCoygs9wCpF+/TFCwk5Y=;
 b=SVBoPwEonzsVLmCfmn8nChiFXvcFYYcWFn4MzDonjG7dPp5ETgoFrURaWrq8go1D7xCKN5
 Zw1LgGkANMIlNgzrwTb4lqzR7LRtWB8cc977AVeVwFT+NRgaVN+mttH5AMws2zMcZw6CwT
 nlP9TdrKAYJ8xfB39Lkxi/6Nt5aEcFA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-R_2UQ74pOAW11XcsBUBkdA-1; Tue, 03 Aug 2021 05:34:03 -0400
X-MC-Unique: R_2UQ74pOAW11XcsBUBkdA-1
Received: by mail-wm1-f70.google.com with SMTP id
 f10-20020a7bcc0a0000b0290229a389ceb2so743184wmh.0
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 02:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eE1GgcYKV2KKsGa2XkbTQwndCoygs9wCpF+/TFCwk5Y=;
 b=l3srPtdoubvhupNwRWEVwZom3mx0nQBpBdnVTDgilxyHpw678Z2GrxBoPc3JM7Owyc
 tEshLMQ0nnd7yeCu3y/iTMXvGabNFyBGy6TLIWXZiuWWCxQVmsQQzHTly6PKEGwAd1Tw
 XwRTmKvOo0I+KCHlaDYS+5pUnfYzisKmHwqPbNxDwdhHdIloS53qwYrADJ/Cw3td+Ty2
 GVLA0C8u8ZDOnFgNuDw8QW6TjKTm7Za7QgM9kpKvWac3P6SQAOXlEwCP3cSWkomtEPp4
 Wiahv94wRWXoDIhdAQrpUFiv2Q7rbEw5o97xNv9Z4h0b/y66J4Xoq43R51GVIFMG5PSO
 cgIg==
X-Gm-Message-State: AOAM530Wcl7+boq0Gz9++8EoB8I2YT5LcsRNgGyBA5dPPhiC4seZgsUP
 aw7RohsGjiNmrPYRh00L4DcjX/YhdIMC4BaaQFIX0rHm+hUJ5B5sTLJP/4Ge19VCITi+ADfV6/F
 rX48eXMHP2J0Omvc=
X-Received: by 2002:a1c:95:: with SMTP id 143mr17913296wma.29.1627983242072;
 Tue, 03 Aug 2021 02:34:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1BpLiakNbBplT6hFAQ6lglTiqeGJLiMvv5JpLbCtsoNJhfm1CKlaze6If591Lk+ZMG9PMAQ==
X-Received: by 2002:a1c:95:: with SMTP id 143mr17913279wma.29.1627983241898;
 Tue, 03 Aug 2021 02:34:01 -0700 (PDT)
Received: from thuth.remote.csb (p5791d8a3.dip0.t-ipconnect.de.
 [87.145.216.163])
 by smtp.gmail.com with ESMTPSA id h25sm1910739wmp.33.2021.08.03.02.34.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 02:34:01 -0700 (PDT)
Subject: Re: [PATCH] hw/net: Discard overly fragmented packets
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>
References: <20210705084011.814175-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <adb810ea-a4f3-3ff9-3f4b-9973c3e1f518@redhat.com>
Date: Tue, 3 Aug 2021 11:33:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210705084011.814175-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-stable@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, Andrew Melnychenko <andrew@daynix.com>,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/2021 10.40, Philippe Mathieu-Daudé wrote:
> Our infrastructure can handle fragmented packets up to
> NET_MAX_FRAG_SG_LIST (64) pieces. This hard limit has
> been proven enough in production for years. If it is
> reached, it is likely an evil crafted packet. Discard it.
> 
> Include the qtest reproducer provided by Alexander Bulekov:
> 
>    $ make check-qtest-i386
>    ...
>    Running test qtest-i386/fuzz-vmxnet3-test
>    qemu-system-i386: net/eth.c:334: void eth_setup_ip4_fragmentation(const void *, size_t, void *, size_t, size_t, size_t, _Bool):
>    Assertion `frag_offset % IP_FRAG_UNIT_SIZE == 0' failed.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: OSS-Fuzz (Issue 35799)
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/460
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/net/net_tx_pkt.c             |   8 ++
>   tests/qtest/fuzz-vmxnet3-test.c | 195 ++++++++++++++++++++++++++++++++
>   MAINTAINERS                     |   1 +
>   tests/qtest/meson.build         |   1 +
>   4 files changed, 205 insertions(+)
>   create mode 100644 tests/qtest/fuzz-vmxnet3-test.c

Reviewed-by: Thomas Huth <thuth@redhat.com>

Jason, I think this would even still qualify for QEMU v6.1 ?


