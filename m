Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7D36002AC
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 20:09:41 +0200 (CEST)
Received: from localhost ([::1]:40050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok84x-0004yi-Ks
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 14:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <julien@xen.org>) id 1ok83C-0003Ry-Tr
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 14:07:50 -0400
Received: from mail.xenproject.org ([104.130.215.37]:37918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <julien@xen.org>) id 1ok83B-000893-FP
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 14:07:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID;
 bh=CuGOnrDMtV5vDQ/7F1e9NAArcg8H+cC0WxXQP5snmQs=; b=wlR1SUifYbJbzN0B+SnCKsa/jD
 IFHUcR1/0r26ctoxccVcK3/juFMuqM32llxWh/hgPFD3eKVPtVxXH9+Vx3S45DQkyUO65rsXIWP8x
 PNCwMLXk9ORoZ6A6uaPTjSJbkoWUnVNp8aahibDNBecoz/FYfotN6aEv79yzaD49AxhE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ok839-0003kh-GA; Sun, 16 Oct 2022 18:07:47 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.85.34.141])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ok839-0003qH-9L; Sun, 16 Oct 2022 18:07:47 +0000
Message-ID: <31c4102e-372e-85f9-301e-7fdc18b29bd7@xen.org>
Date: Sun, 16 Oct 2022 19:07:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v1 06/12] xen-hvm: move common functions to
 hw/xen/xen-hvm-common.c
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: stefano.stabellini@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-7-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221015050750.4185-7-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=104.130.215.37; envelope-from=julien@xen.org;
 helo=mail.xenproject.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Vikram,

On 15/10/2022 06:07, Vikram Garhwal wrote:
> +void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
> +                        MemoryListener xen_memory_listener)
> +{


[...]

> +
> +    xen_bus_init();
> +
> +    /* Initialize backend core & drivers */
> +    if (xen_be_init() != 0) {
> +        error_report("xen backend core setup failed");
> +        goto err;
> +    }
> +    xen_be_register_common();

Calling xen_be_init() and xen_be_register_common() from 
xen_register_ioreq() sounds wrong to me. There are no dependency between 
the two. I think it would be better to create a new function to register 
backends.

Cheers,

-- 
Julien Grall

