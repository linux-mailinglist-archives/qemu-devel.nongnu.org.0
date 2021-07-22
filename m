Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D943D2BAD
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 20:03:53 +0200 (CEST)
Received: from localhost ([::1]:36908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6d32-0006eO-Nq
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 14:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6ctU-0000kJ-LS
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:54:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m6ctT-0002tg-5H
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eQ9PfyYo0VZyCVLkadaLAOsWh1sYSHEr6fbIS39JgK4=;
 b=YTwMEXmJuSiTKeVfkspcFBXPyHQCCCwFqA2vZlN3gCbXCUMD4/aQnLbGwr/0cCleKAtKLK
 7FVkxMoKy9YmqnaQQH8tB7tl/7IKib+09XcENcaGO1DuWEBX3kAkmnOdtv/NgHRR6Y6dgF
 knXnbNunrRUTKokvK8EX7LtnIS4hfVU=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-0PRzEX7wOBat64UVQCUL0Q-1; Thu, 22 Jul 2021 13:53:57 -0400
X-MC-Unique: 0PRzEX7wOBat64UVQCUL0Q-1
Received: by mail-oo1-f69.google.com with SMTP id
 z186-20020a4a49c30000b02902621047077eso2387014ooa.3
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eQ9PfyYo0VZyCVLkadaLAOsWh1sYSHEr6fbIS39JgK4=;
 b=B3GCyRz98dS9q15Kb8qEncrdrJcVJugNdE2OMGggjuZibfkD03e1b6Pm1yWZhvaxHl
 toFZeUVFP/WR6V9y8Aioo2CbfyFvkm55wnEzxPemmxkR414IWHJ0xzJxiA2J5No/GMmQ
 Znlu2/kPo3MpnykFKD6zkVLOTR4mZEpRnbPM1KBj//UOU2M3+k8r60M6EcXiMgHSFGZT
 CT+w6F00SjpdlWxNNPRagd6a/lWvvFC/kX+H5/rwF0VO8a8nOrpc8fmq/aZbBbWd+4PN
 iVkTgi3GSvE+vGx3rbI6nFN6oEhvAalZ2h+XGcpONlvkf4YvqWLfHd5x2P2LYlI4K/nq
 AiAA==
X-Gm-Message-State: AOAM532PShT12vGEUPguXFH1nQllb3fO6Nw1vt9QGB+0wfj2pjaZLy/M
 R5SBGIJGR4BUltWiKDWFH9A7kJKBMXycyStry4lpvYPZjbtXvXJQ2P5i6KzkuCfIN8NygyiG6d5
 1xatOC6MGU4Up1y0=
X-Received: by 2002:a9d:5f93:: with SMTP id g19mr673601oti.236.1626976436724; 
 Thu, 22 Jul 2021 10:53:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy86xavV/0DrIGNUTle5OGdO/XAB11pCbeZG9OFmaf+myDiV3jIMEiVMfShYxoPi20xOzE3Fg==
X-Received: by 2002:a9d:5f93:: with SMTP id g19mr673587oti.236.1626976436569; 
 Thu, 22 Jul 2021 10:53:56 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-176.ks.ok.cox.net. [68.102.25.176])
 by smtp.gmail.com with ESMTPSA id n23sm4388620ooq.48.2021.07.22.10.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 10:53:56 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [RFC PATCH v2 11/44] i386/tdx: Implement user specified tsc
 frequency
To: isaku.yamahata@gmail.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 alistair@alistair23.me, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, cohuck@redhat.com, mtosatti@redhat.com,
 xiaoyao.li@intel.com, seanjc@google.com, erdemaktas@google.com
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <564e6ae089c30aaba9443294ecca72da9ee7b7c4.1625704981.git.isaku.yamahata@intel.com>
Message-ID: <42187f1c-26b5-b039-8fcf-f9268129feb8@redhat.com>
Date: Thu, 22 Jul 2021 12:53:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <564e6ae089c30aaba9443294ecca72da9ee7b7c4.1625704981.git.isaku.yamahata@intel.com>
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
> From: Xiaoyao Li <xiaoyao.li@intel.com>
> 
> Reuse -cpu,tsc-frequency= to get user wanted tsc frequency and pass it
> to KVM_TDX_INIT_VM.
> 
> Besides, sanity check the tsc frequency to be in the legal range and
> legal granularity (required by SEAM module).
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
> [..]
> +    if (env->tsc_khz && (env->tsc_khz < TDX1_MIN_TSC_FREQUENCY_KHZ ||
> +                         env->tsc_khz > TDX1_MAX_TSC_FREQUENCY_KHZ)) {
> +        error_report("Invalid TSC %ld KHz, must specify cpu_frequecy between [%d, %d] kHz\n",

s/frequecy/frequency

> +                      env->tsc_khz, TDX1_MIN_TSC_FREQUENCY_KHZ,
> +                      TDX1_MAX_TSC_FREQUENCY_KHZ);
> +        exit(1);
> +    }
> +
> +    if (env->tsc_khz % (25 * 1000)) {
> +        error_report("Invalid TSC %ld KHz, it must be multiple of 25MHz\n", env->tsc_khz);

Should this be 25KHz instead of 25MHz?



