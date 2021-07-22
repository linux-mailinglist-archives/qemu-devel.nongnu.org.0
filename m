Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB883D2B94
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:59:07 +0200 (CEST)
Received: from localhost ([::1]:48476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6cyQ-0003os-DJ
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6csj-00060M-Tx
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:53:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6csh-0002Pq-VK
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Duk7mz1WDAtfAVpo8VpdbrMWMtr8blQZG/OHLGs0DI=;
 b=ZAY9oaor2dcdfN4QK/qiW9CUL+Br1nt4JJve98ZhOTLtYV3R5RErT7dNclG38sekb7sWvD
 mDxac9HzEeDJTP1iDHLd/xOj4YQejIJAsqKIOkcG3jm4emuL+m0wHpsQLgk1KPl4H4LTYy
 Lyt29XpPUep9Yft7QWwOHMDKJ193g5M=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-F9o70xv6Mn-9ToMs2z-3BA-1; Thu, 22 Jul 2021 13:53:09 -0400
X-MC-Unique: F9o70xv6Mn-9ToMs2z-3BA-1
Received: by mail-oi1-f199.google.com with SMTP id
 e17-20020a0568081491b029025c79c4ad56so4502506oiw.3
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Duk7mz1WDAtfAVpo8VpdbrMWMtr8blQZG/OHLGs0DI=;
 b=ZqqXL4xjKcq6cCOOWm+v5FRzrxA+DXxmVNOnRcLVT62fxGNXhUBa4BcyzTclzow0Wo
 L2yfVMLOEiMtYfUtJSNxESfSz/9lNxPbKQ+RbdCIS/dVkEZYM3AIV1NnjfjNERLC7JsL
 00TXr8Ptx4Krl8xd2AJ3Ro6HLpezUX7d5rCiT2EEfu1zd1omqm1nu4a/j/i/9YqJi6ZY
 wKSea65CyGaUN50/o0WAk3WD4uBfklXMPsBJiEh7r3/7wUzbVgu8WfybBTOxDVd5cK2L
 OlaLVj10/Bi+xiNRLCKLPQ0Jg7EnWcQnKbAbCy8/Vqy5gCmV3VfWjejYITjibQp8ANOv
 WgWQ==
X-Gm-Message-State: AOAM532r1vsSyKmGLIbTvb58JWHpdSXziuEbJwkvkIGdDXLEkqTxgVAb
 jmQWIOio/AQnxrVunSHP5m48+BkowST7hJf9ReQCkgYnkpVkwwDQmfqpK4xDiS/3MaqLq8GPXId
 QN/NqTXmAIE3JPa8=
X-Received: by 2002:a05:6808:aa3:: with SMTP id
 r3mr830782oij.133.1626976388868; 
 Thu, 22 Jul 2021 10:53:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyofKsPcap+O4oiIqmCn7MJJqc8IOb4IQe62OYV/zwglIDRtc3PJTwMH/WWNqgtp7kkhKR5zw==
X-Received: by 2002:a05:6808:aa3:: with SMTP id
 r3mr830763oij.133.1626976388728; 
 Thu, 22 Jul 2021 10:53:08 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-176.ks.ok.cox.net. [68.102.25.176])
 by smtp.gmail.com with ESMTPSA id q186sm2533040oib.31.2021.07.22.10.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 10:53:08 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [RFC PATCH v2 09/44] target/i386: kvm: don't synchronize guest
 tsc for TD guest
To: isaku.yamahata@gmail.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 alistair@alistair23.me, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, cohuck@redhat.com, mtosatti@redhat.com,
 xiaoyao.li@intel.com, seanjc@google.com, erdemaktas@google.com
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <b28fcb79c5fbc219b6664f7239215360c5fda04d.1625704981.git.isaku.yamahata@intel.com>
Message-ID: <f0ee77b5-eafe-ce5e-b665-0a07756efc20@redhat.com>
Date: Thu, 22 Jul 2021 12:53:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b28fcb79c5fbc219b6664f7239215360c5fda04d.1625704981.git.isaku.yamahata@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 7:54 PM, isaku.yamahata@gmail.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> Make kvm_synchronize_all_tsc() nop for TD-guest.

s/nop/noop

> 
> TDX module specification, 9.11.1 TSC Virtualization

This appears in 9.12.1 of the latest revision as of this writing.

https://software.intel.com/content/dam/develop/external/us/en/documents/tdx-module-1eas-v0.85.039.pdf

> "Virtual TSC values are consistent among all the TD;s VCPUs at the

s/TD;s/TDs

> level suppored by the CPU".

s/suppored/supported

> There is no need for qemu to synchronize tsc and VMM can't access
> to guest TSC. Actually do_kvm_synchronize_tsc() hits assert due to
> failure to write to guest tsc.
> 
>> qemu/target/i386/kvm.c:235: kvm_get_tsc: Assertion `ret == 1' failed.
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


