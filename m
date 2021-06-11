Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEEF3A417E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 13:53:17 +0200 (CEST)
Received: from localhost ([::1]:56174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrfiu-0003fM-Ns
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 07:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrfi1-0002AT-M8
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:52:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrfhy-0005yL-RV
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623412338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PkuN0xvEjarjZbuESSTVSTGScw2PjyYhlQmTLVXN22Q=;
 b=TXEHde3QsZXfq+lyRaxvVBlIKHydE8/jPdGqOWkvtRdTKNH96JcbmghJujyyzwlRxm+uZ1
 WQ1gHQtv8b/GhoN5WB5jFCHwTy3/jBjN5rO1GlsVzNFkImaTT+127vkC9sWY6Do5NdP5eA
 F55InU34xFfS+QBYl1XAt/7r16cggp8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-c-0y64TUMAG_whhEhrxQlA-1; Fri, 11 Jun 2021 07:52:17 -0400
X-MC-Unique: c-0y64TUMAG_whhEhrxQlA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v20-20020a05600c2154b029019a6368bfe4so4355412wml.2
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 04:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PkuN0xvEjarjZbuESSTVSTGScw2PjyYhlQmTLVXN22Q=;
 b=LU3aMKYHGFD7KL+dnp/VMmkyurAlBfW2F9g5sM+rKIFibKzj5lnRCKun5m955wL9q4
 BAPVYi9/D72mKgHqvhD3OIyuXPiYAun+sUgMkW5QVTJ7XlRSByQJ0Tw+onKBI6Oln2FI
 fxHVJVBrwB6NcZNz9m6E6pJ324WlTRqEE9voFHxHlEbm9wXacOJhPR5AIkNAFOnTNM3n
 XKfFxKW0BQ4fw0sXD3r0TmxGNzwFeiWfyTuKCtLAYAo02G4NPLQCnVTQtd/m2x8kJluC
 Vc7248qykAzOQHelvmE+21gYgLL2e48qLYs+ctAQd0c5PGmzVTGaB5shSNGpmpWTKM1g
 OPxg==
X-Gm-Message-State: AOAM532yccbp+FXo2FYfbVzmCbtbtm+E40RHLbOrfpVgjdduNFbBA8k9
 yIuBM7cea4Gjd/VgOQri1b8dtlznAGNcjwQaKZYbkxlgogk7iq2ZBYIRbbNtsm3dKKNQpvlq/qe
 bJS/aBVnuJl4PuBE=
X-Received: by 2002:adf:ec10:: with SMTP id x16mr3682746wrn.83.1623412335802; 
 Fri, 11 Jun 2021 04:52:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7rEQSDiNv8MEiW1MDTLwqOztoXTI1VwJI4zK97oORwdgkAiAukmv9/MKjdrz0v0+tbE1CIg==
X-Received: by 2002:adf:ec10:: with SMTP id x16mr3682720wrn.83.1623412335568; 
 Fri, 11 Jun 2021 04:52:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x10sm6805931wrt.26.2021.06.11.04.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 04:52:14 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] hw/timer: Initial commit of Ibex Timer
To: Alistair Francis <alistair23@gmail.com>
References: <cover.1623196022.git.alistair.francis@wdc.com>
 <b40ec8986ba8e7de3a3cf0ee4718b4868793be67.1623196022.git.alistair.francis@wdc.com>
 <d3057566-0b3f-4fdc-73c6-323eb6366b8f@redhat.com>
 <CAKmqyKNs5GwcGwRUZ8v17MJd40_STjOgqu-2vRU7ee21x79cKw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e2d39538-ee41-97e5-f547-793229a998b0@redhat.com>
Date: Fri, 11 Jun 2021 13:52:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNs5GwcGwRUZ8v17MJd40_STjOgqu-2vRU7ee21x79cKw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/06/21 01:01, Alistair Francis wrote:
> On Wed, Jun 9, 2021 at 5:57 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 09/06/21 01:48, Alistair Francis wrote:
>>> Add support for the Ibex timer. This is used with the RISC-V
>>> mtime/mtimecmp similar to the SiFive CLINT.
>>>
>>> We currently don't support changing the prescale or the timervalue.
>>>
>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>
>> Any chance this could have a qtest?  It would also be nice if the CPU
> 
> Yep, do you have a good example of what the qtest should look like?

Without having access to the IRQ line it's a bit hard to write it, but 
the qtests for various real-time clocks are probably the closest.

>> had qemu_irqs for MEIP/MTIP/SEIP (possibly MSIP too but that one is
>> bidirectional), so that instead of riscv_cpu_update_mip you can just
>> connect to a GPIO pin of the CPU and do qemu_set_irq.  It could also be
>> used by the qtests via irq_intercept_in.
> 
> Yeah the riscv_cpu_update_mip() is not ideal. As it is what we
> currently also use for the CLINT I don't want to fix it up here. In
> the future I'll work on changing riscv_cpu_update_mip in all the
> RISC-V timers to use GPIO lines instead.

If you add GPIO output pins to the CPU, the devices can be converted 
away from riscv_cpu_update_mip one by one.

Paolo


