Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D024B433D14
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:10:36 +0200 (CEST)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsdG-0003KI-Qq
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcsFP-0000a6-8b
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcsFL-0000oG-OD
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634661949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2WYwO+sOgICObATL1JqUbPicxZSdgw6x3fA25ovdcWc=;
 b=AwqK9lLPn5N0AU1ikcfLzAXDYdwNKbgrzERuJsBzcqOcbDaKtaTKo8xnIPdhsmlvbkNLGY
 meVTVzKngB0wm6caC33GzcLWj5A6/TVVI596VAjcj83P6XwMCBCIIxwfxMogkc1TA/6LjG
 AK9E5hN3oKyU32L3TWCmUwaCSIIf7P8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-VX889ccnNRSjCFTTAuHkAA-1; Tue, 19 Oct 2021 12:45:48 -0400
X-MC-Unique: VX889ccnNRSjCFTTAuHkAA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v10-20020a1cf70a000000b00318203a6bd1so1450789wmh.6
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2WYwO+sOgICObATL1JqUbPicxZSdgw6x3fA25ovdcWc=;
 b=cULjottq8ln0m4YkuwSfy7dKjhGfDy+6KE6gfx1WXfVpp4A7hR0kynJazuwT5X0XwY
 1+w6VkgBY8eXRK+2Ff7Al+5kDTxt4jm3hj9cFE4zf2a9rZWzTUh++VNe2+AIZm73Uqiy
 sYQVcIqiokAg9BishhE8DZ53MEtJd21NgW+3j2QYxEIrJMVI4fEESbGDQd3mEAJiFyF9
 9NyNmqhMBqDW9dYO4T3IraQ5OE1YXcT/DYkFfDXxi3BPfFnfy/OYlmww2pPwK13SMI8K
 a/6rt6J92/1gJ0IJLIc8br8Tqe6uTjZd0qLl7tKWUbMwfjafv5hVRn/lr/iUaAWpUjf5
 4mJA==
X-Gm-Message-State: AOAM531xzzB+VXckXV1A+KvCPrknLI4yjdtEBKVVouA3QFWLFx5o+gXM
 Q3zEYxTwxZMIAvjdGrudKZkQRiu3tnEMkt/Zm+RHYzFk0VlK5QrXcJDHcqk5myTvb5UsivdLtT4
 UFXBRVCChTrUmG/Q=
X-Received: by 2002:a7b:ca56:: with SMTP id m22mr7345864wml.34.1634661947073; 
 Tue, 19 Oct 2021 09:45:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGqhH8Q79V/XGb4bSaVwZ0mb3ujSmKyb2XKnc2xBmFXtXDxJ14MpJv1jLZuzg3EPqLoEVfcA==
X-Received: by 2002:a7b:ca56:: with SMTP id m22mr7345837wml.34.1634661946837; 
 Tue, 19 Oct 2021 09:45:46 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:8e02:b072:96b1:56d0?
 ([2001:b07:6468:f312:8e02:b072:96b1:56d0])
 by smtp.gmail.com with ESMTPSA id m2sm2680023wml.15.2021.10.19.09.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 09:45:45 -0700 (PDT)
Message-ID: <da674bf3-fc7f-28c8-7c45-f98754ecb5d1@redhat.com>
Date: Tue, 19 Oct 2021 18:45:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] multiboot: Use DMA instead port-based transfer
To: Adam Lackorzynski <adam@l4re.org>, qemu-devel@nongnu.org
References: <YWM6jboU9fUib6Iy@os.inf.tu-dresden.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YWM6jboU9fUib6Iy@os.inf.tu-dresden.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.074, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/21 21:10, Adam Lackorzynski wrote:
> Use DMA transfers in the multiboot loader to copy
> data.
> 
> This significantly lowers QEMU's startup latency by
> a factor of about 40, for example, going from 30sec
> to 0.8sec when loading modules of 120MB in size.
> This change has been used successfully for some time.
> 
> Signed-off-by: Marcus Hähnel<marcus.haehnel@kernkonzept.com>
> Signed-off-by: Adam Lackorzynski<adam@l4re.org>
> ---
>   pc-bios/multiboot.bin         | Bin 1024 -> 1536 bytes
>   pc-bios/optionrom/multiboot.S |  10 ++---
>   pc-bios/optionrom/optionrom.h |  77 ++++++++++++++++++++++++++++++++++
>   3 files changed, 82 insertions(+), 5 deletions(-)

This would break migration to QEMU 2.4 and earlier - which is in fact 
why linuxboot has a completely different option ROM when DMA is in use.

On my system (a relatively recent laptop) I get 15-20 MiB per second, 
which is slow but not as slow as what you got.  Out of curiosity, can 
you test what you get with the following kernel patch?

diff --git a/arch/x86/kvm/kvm_emulate.h b/arch/x86/kvm/kvm_emulate.h
index 798508e8b6f5..5853ae93bcb2 100644
--- a/arch/x86/kvm/kvm_emulate.h
+++ b/arch/x86/kvm/kvm_emulate.h
@@ -272,7 +272,7 @@ struct fetch_cache {
  };

  struct read_cache {
-	u8 data[1024];
+	u8 data[4096];
  	unsigned long pos;
  	unsigned long end;
  };


Paolo


