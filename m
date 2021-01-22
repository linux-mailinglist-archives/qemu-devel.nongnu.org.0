Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191E9300648
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:56:51 +0100 (CET)
Received: from localhost ([::1]:59532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xrm-00054W-6O
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:56:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2xq4-00044v-NN
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:55:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2xq2-0001EO-Ol
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:55:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611327302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vdc9+ixot2Dn1Pvtz5b0RRWlWNlqTvg4NIe3YtO1Nic=;
 b=KVPP543TyeOORRvmsjnSlG+Wgic46+8+LnmAf4vWlo0mt8x9ehYsDZMCmUsArpR8iUU4AK
 LJHsdTZG4OnTibuagZIleVquIqOaNFAeXRhcy6EC84ZbXbG7qygOpZXAc2eZwixqBKxJKV
 2INDT6HiizOYWexBVWZE9TI4LIlkNcw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-z1NzQGdjO7KCrSdXErRrsQ-1; Fri, 22 Jan 2021 09:55:00 -0500
X-MC-Unique: z1NzQGdjO7KCrSdXErRrsQ-1
Received: by mail-ed1-f70.google.com with SMTP id 32so3022720edy.22
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 06:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vdc9+ixot2Dn1Pvtz5b0RRWlWNlqTvg4NIe3YtO1Nic=;
 b=pr32qfIPuywTON2g/QlImLLlhrlmAuOAlPL+HpHbm/9bA9cwfApD8ZTRyMlMmmZ2rW
 MepxHHnzT5Ih+Tx/kPalE6Y1Cn9usy+bN9TSmpJVbqeVN4r/+cRAkDq3X/bFqOE3v6s9
 LD7PA6UIRsBE4WYZg5801QauQlBgOl0jAwmJrC2jaScuuIVvR6jyffSNqLZKONfcUecu
 k8BcJ3ktu7orfAaG+G6RpYDiHo8a7HPaEd9QN3oDtui4SUoFHzPfoNyXQ15N8cM3SpPZ
 eOZVqF9aaRUSg47m/Da0Pa9b3VG/tSTYRHX+Mol2qIby7soYzV428Jmdj7s7cjSQIET+
 ibyw==
X-Gm-Message-State: AOAM532n5sEase8ZGMqgfxIZUYv93YUnb4rw4OI6D4uB3ZnvSi3o/u2i
 HI0Kak0hASpHxER6HAztQfZdMDnL/NnrHypzeV9XwPytRIxIAvzFDG6qj4d6smAVKt0xOJt2WnG
 KkG41Cq99TuwG6Q4=
X-Received: by 2002:a17:906:a015:: with SMTP id
 p21mr3330879ejy.49.1611327298656; 
 Fri, 22 Jan 2021 06:54:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxChfV/nXYKa2JsRpMXiAFgtr1JBSgPnFmt40uLLe0iaYV47zOt4MmHDSIvIL5NtUr+gcFT0w==
X-Received: by 2002:a17:906:a015:: with SMTP id
 p21mr3330860ejy.49.1611327298430; 
 Fri, 22 Jan 2021 06:54:58 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id s18sm5663457edw.66.2021.01.22.06.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 06:54:57 -0800 (PST)
Subject: Re: [PATCH] pci: add romsize property
To: Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Haibin Zhang <haibinzhang@tencent.com>,
 David Edmondson <david.edmondson@oracle.com>
References: <20201218182736.1634344-1-pbonzini@redhat.com>
 <b9b7e55a-0f90-6680-8e15-992997afdd38@redhat.com>
 <1c506da5-26bc-9821-5096-16bc1458c342@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9edf5fb6-b888-d731-3d25-df003c55109b@redhat.com>
Date: Fri, 22 Jan 2021 15:54:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1c506da5-26bc-9821-5096-16bc1458c342@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: mst@redhat.com, Markus Armbruster <armbru@redhat.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/01/21 18:20, Laszlo Ersek wrote:
> I only have superficial comments:
> 
> - if we're talking uint32_t, I'd kind of prefer UINT32_MAX to (-1),
> style-wise -- but feel free to ignore
> 
> - we should print a uint32_t with ("%" PRIu32), not "%d" (again, only
> pedantry, but PRIu32 is widely used in qemu, AFAICS)

I would use %u, but yeah you're correct.

> - OK, so get_image_size() returns an int64_t, which pci_add_option_rom()
> assigns to an "int" without any range checking.

This is pre-existing, but it should be fixed indeed.

> Then we compare that int
> against the new uint32_t property... or else, on the other branch, we
> assign pow2ceil() -- a uint64_t -- to the new (uint32_t) property.
> 
> - In pci_assign_dev_load_option_rom(), "st.st_size" (which is an off_t)
> is assigned to the new property...
> 
> 
> I find it hard to reason about whether this is safe. I'd suggest first
> cleaning up "int size" in pci_add_option_rom() -- use an int64_t, and
> maybe check it explicitly against some 32-bit limit? --, then introduce
> the new property as uint64_t. (Print it with PRIu64 then, I guess.)

ROM BARs cannot be 64-bit in size.  There's just no room in 
configuration space for that.  Anyway yes pci_add_option_rom() is iffy 
and I'll send v2.

Paolo

> BTW there's another aspect of is_power_of_2(): it catches the zero
> value. If the power-of-two check is dropped, I wonder if a zero property
> value could cause a mess, so it might be prudent to catch that
> explicitly. (Precedent: see the (size == 0) check in pci_add_option_rom().)
> 
> Anyway, feel free to ignore all of my points; I just find it hard to
> reason about the "logic" when the code is not obviously overflow-free in
> the first place. (I'm not implying there are overflows; the code may be
> free of overflows -- it's just not*obviously*  so, to me anyway.)


