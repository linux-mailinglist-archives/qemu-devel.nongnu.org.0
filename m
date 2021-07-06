Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660233BDBAE
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 18:53:55 +0200 (CEST)
Received: from localhost ([::1]:57566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oKY-0000sN-CK
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 12:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0oJ9-00086u-Ex
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:52:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0oJ8-00080R-2O
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:52:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625590345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5sC/FkCd4NSSxWmHpqO0wHRWA7APTRyzHyHjRX6WCbM=;
 b=Jw+Vyl3I6hQ/5rFYl/kLNbGxJDTy/egux7Nl+20H71tKRqiiZzDGy3APH4zsHBYPyLIR6B
 3A3HTtTKcAAecQYYlAKcHKJ/P7SovmLjlfxjAQtamp+g3Eez52xJOhwrVvhK28g8HCI0hK
 iCslksyOe4whhYkF5wd03GKrmxsoTqY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-PwJmnn_GMGSY45z91eubyw-1; Tue, 06 Jul 2021 12:52:24 -0400
X-MC-Unique: PwJmnn_GMGSY45z91eubyw-1
Received: by mail-ed1-f70.google.com with SMTP id
 p13-20020a05640210cdb029039560ff6f46so11133311edu.17
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 09:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5sC/FkCd4NSSxWmHpqO0wHRWA7APTRyzHyHjRX6WCbM=;
 b=BWURWzoWUrqhiuwigS08I3a1aJkZafO13m7tXLPkYwtmaMib87DDU7ds9lZhjxov+J
 mVOCQV+q4Ps+Nl7ZRrzgoCmjOeLcmCKs+7MZgzP2a4hmKtLyUs1EYlbR/DMD1Qbiv6dc
 nOOPl34X+vOnUYAhfIGha3oYy6UwwlVbwiZ28NJ+qS/YqG8YJ7iwmbFdduDP/j/XRxln
 jC+1lYU4VSaCJEnY7QxIJvLRyF0mzl2rNFabmGcNEA03fsvJ5R+R5v/q9ToXz4QzFI7E
 +vkaZqfRQyBCGdht38JSgOX9fyFbdsZLEUtXBc+zvA2lR2/bsjLwQfJqPP0BrIvP/oiD
 MGZg==
X-Gm-Message-State: AOAM533zMcYFsQE7VPbNoP4796wbQaU9Z97ig6HvJp4gdhOwMKs9swiw
 hn9vrc1DRUmrhNsPfEMmchc6HcHo8YGz7KtQChq3uW/w9k2KU4AaZ7Tos7mOVImS0Jzl8ByQMf3
 LKHY4O72lQXdDUh6RFxJwOxP02kN53dUq/J2p0YEAeUV/Vu1duFSXIXh9fAAZgQqVG9Y=
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr24615750edu.273.1625590342988; 
 Tue, 06 Jul 2021 09:52:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRHg3biEsXRV8xdLhGIkXAM9uS6zG2j0SNHEbxGG5uDb6evSQp4QbWaCIkF/oQo0K4sKAaZQ==
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr24615728edu.273.1625590342816; 
 Tue, 06 Jul 2021 09:52:22 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v6sm993721ejw.94.2021.07.06.09.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 09:52:22 -0700 (PDT)
Subject: Re: [PATCH 4/4] target/i386: Added VMRUN consistency checks for CR3
 and CR4
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <20210705081802.18960-1-laramglazier@gmail.com>
 <20210705081802.18960-5-laramglazier@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <10902621-960f-3d62-bbbe-175e143382f0@redhat.com>
Date: Tue, 6 Jul 2021 18:52:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705081802.18960-5-laramglazier@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/21 10:18, Lara Lazier wrote:
> +#define CR4_RESERVED_MASK \
> +(~(unsigned long)(CR4_VME_MASK | CR4_PVI_MASK | CR4_TSD_MASK \
> +                | CR4_DE_MASK | CR4_PSE_MASK | CR4_PAE_MASK \
> +                | CR4_MCE_MASK | CR4_PGE_MASK | CR4_PCE_MASK \
> +                | CR4_OSFXSR_MASK | CR4_OSXMMEXCPT_MASK |CR4_UMIP_MASK \
> +                | CR4_FSGSBASE_MASK | CR4_PCIDE_MASK | CR4_OSXSAVE_MASK \
> +                | CR4_SMEP_MASK | CR4_SMAP_MASK | CR4_PKE_MASK))
> +

This ~ trick could also be useful for EFER, very nice!

Just a couple changes required:

1) CR4_PKS_MASK is missing here and in cr4_reserved_bits (TCG supports 
it but KVM does not)

2) the cast should be to target_ulong (to cover the case of 32-bit host 
and 64-bit emulated processor)


In addition, as discussed on our weekly call CR3 checks are not complete 
so it's probably best to focus on CR4 for this patch and split CR3 to a 
different one.

Paolo


