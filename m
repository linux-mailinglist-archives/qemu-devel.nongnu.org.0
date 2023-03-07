Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5A76AE645
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:21:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZa4O-0000cJ-UO; Tue, 07 Mar 2023 11:21:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZa4M-0000br-K0
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:21:42 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZa4K-0006yn-0G
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:21:42 -0500
Received: by mail-wr1-x434.google.com with SMTP id q16so12725274wrw.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 08:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678206098;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3KZYphWhdVAnvWbr1j7QS/cc1nY/OgAy/9gY36WtPWI=;
 b=duGi6ChPks1NvHE4h27ex6WPEMMvNMfP2+x1WIy3UlfnGH2+Ij/4ZlcNxSKIhDBKgA
 AdExmMYXJqNS+04U5BXXrD9W2a/oNousIf/in9oBon62M20O8c2aO4pcc33gXfSIfZcM
 ZsJMLvXFwkaOJqcJPYE0xpeVRDqaiVpFEmU11bf+f0Yu2gwlZyYDlKcfZ0ZUhzXhfdwL
 jI2PWs860DotTqcJz0yrRMxRkztlWDc0q4iyfPL0XJyVY4JKHxOb/P0aMgkfNx8x1AvS
 oHNQ5kLrxeZ/N+FMoSYvUWKGjg25o5/JdntYq3MqIcj3ok7/rE18x5ADMXdqNqhipiFK
 WT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678206098;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3KZYphWhdVAnvWbr1j7QS/cc1nY/OgAy/9gY36WtPWI=;
 b=hJsa3Mq6cPg5ct+lgLgoeAHT6NnbMiw8R9rZ5NuD9VMKz3+jLeMaiYZnVUcMpkt2yS
 cOFtEPGKg/g8arf+43ixjuVjfQZgvd39P0//aIS3VET1QkNA6p2CiPyhPdWoob/JGY8g
 oKvNLleEsWs7Hct1pLLffFZ1cHk2SXpkdlGgdfPCZwl5zf86wNkjl1BSfuLJ49mqwAX+
 EWZFR4Hqt5qurSMs+z/Pmnvk/WEuh0WXd5PTUJUdyg3eWj/6um0+RNMSsNacNfCS5USE
 bhoIlpgvuhw6VXL9ll9S2vjz7R4wAp50+QYA3BW/KEhWNhkjrqod/IIKymrJTxWQ2vAs
 N2QA==
X-Gm-Message-State: AO0yUKVhDFuDGT+6UwK4wSCLIi4sVup8Y6GbtSvM1kLgMbDz1jxBT/wa
 6xiV4DY5pnnUNZmMkLWT6II=
X-Google-Smtp-Source: AK7set8Pip1A75xuZnNQJFUj1hyUMwO0SBfJbPEaTxxl9w7OUPd+9KViTpH6IT8JdSgOGMaYHrsISw==
X-Received: by 2002:a5d:63c9:0:b0:2c3:d707:7339 with SMTP id
 c9-20020a5d63c9000000b002c3d7077339mr12850070wrw.6.1678206098214; 
 Tue, 07 Mar 2023 08:21:38 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 z1-20020adff1c1000000b002c70c99db74sm12995127wro.86.2023.03.07.08.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:21:37 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <7c77dee8-a7b6-b41a-bf0a-ddec69ad0d48@xen.org>
Date: Tue, 7 Mar 2023 16:21:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 22/25] hw/xen: Add emulated implementation of
 XenStore operations
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-23-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-23-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Now that we have an internal implementation of XenStore, we can populate
> the xenstore_backend_ops to allow PV backends to talk to it.
> 
> Watches can't be processed with immediate callbacks because that would
> call back into XenBus code recursively. Defer them to a QEMUBH to be run
> as appropriate from the main loop. We use a QEMUBH per XS handle, and it
> walks all the watches (there shouldn't be many per handle) to fire any
> which have pending events. We *could* have done it differently but this
> allows us to use the same struct watch_event as we have for the guest
> side, and keeps things relatively simple.

Yes, it's more consistent with watch events on real Xen this way.

> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_xenstore.c | 273 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 269 insertions(+), 4 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


