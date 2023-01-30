Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509C3681B8F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:32:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMamX-0008S1-6g; Mon, 30 Jan 2023 15:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pMalc-0008BQ-7S
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:28:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pMalW-00008f-Dc
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:28:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ep7uXZfXXaDiMFGHP0SJJa3NCnP55xOo5uoV6sosw8o=;
 b=cEOTWVOMnT0ChLr9ty1KeypW0tyuoLlnh82Aih55XKRAjhftbwmiLl6vE6Gd/JyJbRrnEo
 CH2Fm9T8TndKONztgXhg7YPCOaxTS3vW5D/nYJhGh14CzPilLhLT4aYWwSOVTCFauyYtBz
 zMs+Unwv3kgKPamesGBtaevtJ0j3qO8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-497-KD_c4ZIKOMaZLBHyjSziyw-1; Mon, 30 Jan 2023 15:28:31 -0500
X-MC-Unique: KD_c4ZIKOMaZLBHyjSziyw-1
Received: by mail-qk1-f199.google.com with SMTP id
 u11-20020a05620a430b00b007052a66d201so7823508qko.23
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:28:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ep7uXZfXXaDiMFGHP0SJJa3NCnP55xOo5uoV6sosw8o=;
 b=fGonyJjTX8/nUUZA2dItOaQeTQxULvfEGzruVfWbXersb7sI/iKsJ04B8BnObspaTZ
 zhYgnObtsrsQNnOjCBESrfgrVAWqvyy/oS7bI4SyeHNJVl/hetEWyaxu8lqyXKGTOYzv
 PWlBt8sbdLmll+t7+xb6h3YSNb79qLuNN6bQJ/gpYEpO6MlMJAs+akR9qqshd+AuY0pm
 k5wR3NwECr5lYtSUQqVRoJWFe/ZmHIwzp78sTIKBxLjteR1spyHTgKEpMxHGqNoCTTB7
 hKp8x1K/MtGcuExKT8HpqBS9nnRUF7YzCg/Brr+Ber9U49If+Zu/gbWzHglBCGudBv+5
 67jg==
X-Gm-Message-State: AFqh2krpeWmEl1MREcHGFwj6Dt3PUmiTyIEE6u8xBQnlgi9C+iNR1d8l
 qlsNVMZFEsZsz0x2KzowPKNZJd7MqpwdFa/0TiJKjtG2TjDBOtua64+0au5MUmBbceCai4W8ngo
 D9hRaJw5irFVVE3s=
X-Received: by 2002:a05:622a:4897:b0:3ab:5e20:f7d6 with SMTP id
 fc23-20020a05622a489700b003ab5e20f7d6mr20980456qtb.0.1675110510794; 
 Mon, 30 Jan 2023 12:28:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvxxXxawssWAricCv0f4+UBjmKzMM52CtYbM/EFu53Cm/w8GUupaoTvvobVmUWqz5kkYDv8eA==
X-Received: by 2002:a05:622a:4897:b0:3ab:5e20:f7d6 with SMTP id
 fc23-20020a05622a489700b003ab5e20f7d6mr20980438qtb.0.1675110510534; 
 Mon, 30 Jan 2023 12:28:30 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 k17-20020a05620a143100b007242a18ee8asm950306qkj.128.2023.01.30.12.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:28:29 -0800 (PST)
Date: Mon, 30 Jan 2023 15:28:28 -0500
From: Peter Xu <peterx@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] softmmu: Use memmove in flatview_write_continue
Message-ID: <Y9gobLLlMrBnJeZi@x1n>
References: <20230130135152.76882-1-akihiko.odaki@daynix.com>
 <20230130200300.be736j6ya5srnphb@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230130200300.be736j6ya5srnphb@mozz.bu.edu>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 30, 2023 at 03:03:00PM -0500, Alexander Bulekov wrote:
> On 230130 2251, Akihiko Odaki wrote:
> > We found a case where the source passed to flatview_write_continue() may
> > overlap with the destination when fuzzing igb, a new proposed network
> > device with sanitizers.
> > 
> > igb uses pci_dma_map() to get Tx packet, and pci_dma_write() to write Rx
> > buffer. While pci_dma_write() is usually used to write data from
> > memory not mapped to the guest, if igb is configured to perform
> > loopback, the data will be sourced from the guest memory. The source and
> > destination can overlap and the usage of memcpy() will be invalid in
> > such a case.
> > 
> > While we do not really have to deal with such an invalid request for
> > igb, detecting the overlap in igb code beforehand requires complex code,
> > and only covers this specific case. Instead, just replace memcpy() with
> > memmove() to torelate overlaps. Using memmove() will slightly damage the
> > performance as it will need to check overlaps before using SIMD
> > instructions for copying, but the cost should be negiligble, considering
> > the inherent complexity of flatview_write_continue().
> > 
> > The test cases generated by the fuzzer is available at:
> > https://patchew.org/QEMU/20230129053316.1071513-1-alxndr@bu.edu/
> > 
> > The fixed test case is:
> > fuzz/crash_47dfe62d9f911bf523ff48cd441b61c0013ed805
> > 
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> Since this is called fairly often, I went down a rabit hole looking at
> memmove vs memcpy perf, but It looks like this should not be much of a
> problem.

Similar here. I quickly had a look at the dump of memmove() and it seems to
me it's directly invoking the SIMD instructions.  I'm not sure whether it
means in many cases the SIMD insts are compatible with overlapped buffers
already, so it can be mostly the same as memcpy() in modern hardwares.

> 
> Acked-by: Akihiko Odaki <akihiko.odaki@daynix.com>

I received this reply from Alexander Bulekov, but I think this is the
author's contact?

Thanks,

-- 
Peter Xu


