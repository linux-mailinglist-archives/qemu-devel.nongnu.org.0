Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67776C8157
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:36:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfdRp-0002zI-Bx; Fri, 24 Mar 2023 05:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pfdRh-0002yy-I4
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 05:10:50 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pfdRL-0001nE-1z
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 05:10:44 -0400
Received: by mail-wm1-f47.google.com with SMTP id
 o24-20020a05600c511800b003ef59905f26so475322wms.2
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 02:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679649016;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WcQNFudBIICxVMlZmqLOUL99Xa6JNsPYFb9M+mi/iRU=;
 b=oztq7llC02pWsgOXLO6bRf317ofjoPliUXVI5elS50CAWEYvxxrSVvGsvnDZSl9TwB
 hdB6EYFqvrsWUL7ado8hskfHvgl8FX3XR9cTQXNHJZO1olQ1PRkyE1va7YR7pDqhMF8q
 T1FujEdQLp8EEhAVVVfb0LKsIgY+7zUkZgIbt6CVDUDgHdvU9Stqym7Ox8uK8lkmUB0m
 3drdmmMviGN4Nisu6TL3W5ByAOA1pcI2NBmD+UOhpU+Vf4ltNjw7UTTBReJaBNHlVwCe
 xvmfDJ9PP4U4q69/tLh0M9RzVtfq9IC3rCaH3mmKtvBjIS5+WFuiLPLZ6Egr6aEFw34U
 1hpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679649016;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WcQNFudBIICxVMlZmqLOUL99Xa6JNsPYFb9M+mi/iRU=;
 b=M1cq9wVYq9trKzC6YyzKuK/PtpGQ4GR4il5S8tgVz0HKUU0D2EVULezRl/FjxfvKxa
 /p+/xRwrWjlF1x9J+BKnUxx8KslTQYiGH4vIBPCijZ6pQmaQNxsg/syyqzRIZ+K55xkj
 5nhp7IFr+SG9AO+KD7GEwAMqadH0qChvZO916tvEF3HTTWgyfUhmi9Gflw65ZQZznF3N
 Lp7Zg1LmDQXMmcreqAcyPFVO2CjAXZk98dkyv58vtlTN4oZInNuWoJ4c9kfvQ7cbT5xX
 FIYYg/P0XQ2bM/utuihnng0GjAPqchE/47s2eisHQ0CQxOGb86Oe2GvbAvYjYyxYqQXp
 7tbQ==
X-Gm-Message-State: AO0yUKXbW6QGm6vPSiC2ZZv4zCZJL7OSbub+2PtScyYule8LF5Jq3K8x
 eOLZSZ1WE7WOJvBxLM6OccQ=
X-Google-Smtp-Source: AK7set+8I3ANmJZD0fGdNiJXTXqaCrw9/b6i3e9ZyYOgjKLbi1YgTxHLWwM82hWugFyTPLeiMM5zhw==
X-Received: by 2002:a7b:c5c1:0:b0:3ee:5bd8:d537 with SMTP id
 n1-20020a7bc5c1000000b003ee5bd8d537mr1857438wmk.5.1679649016329; 
 Fri, 24 Mar 2023 02:10:16 -0700 (PDT)
Received: from [192.168.5.30] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a05600c0b4b00b003edef091b17sm4272636wmr.37.2023.03.24.02.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 02:10:16 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <7039da74-6bda-8303-6d40-8e9ddfbdc7e9@xen.org>
Date: Fri, 24 Mar 2023 09:10:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] hw/xen: Simplify emulated Xen platform init
To: David Woodhouse <dwmw2@infradead.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
References: <20230301135223.988336-1-dwmw2@infradead.org>
 <20230301135223.988336-16-dwmw2@infradead.org>
 <96e49428-0c2a-2a50-42e0-31c8e553a34b@intel.com>
 <ae5ce529ef1e492e4f8b06eece6528990ca965e6.camel@infradead.org>
 <7d6e4ef2-1f27-f210-0378-879852a70024@redhat.com>
 <4bae59aba8f3016afe295b2525ab76bb51ac3229.camel@infradead.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <4bae59aba8f3016afe295b2525ab76bb51ac3229.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.128.47; envelope-from=xadimgnik@gmail.com;
 helo=mail-wm1-f47.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/03/2023 10:54, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> I initially put the basic platform init (overlay pages, grant tables,
> event channels) into mc->kvm_type because that was the earliest place
> that could sensibly test for xen_mode==XEN_EMULATE.
> 
> The intent was to do this early enough that we could then initialise the
> XenBus and other parts which would have depended on them, from a generic
> location for both Xen and KVM/Xen in the PC-specific code, as seen in
> https://lore.kernel.org/qemu-devel/20230116221919.1124201-16-dwmw2@infradead.org/
> 
> However, then the Xen on Arm patches came along, and *they* wanted to
> do the XenBus init from a 'generic' Xen-specific location instead:
> https://lore.kernel.org/qemu-devel/20230210222729.957168-4-sstabellini@kernel.org/
> 
> Since there's no generic location that covers all three, I conceded to
> do it for XEN_EMULATE mode in pc_basic_devices_init().
> 
> And now there's absolutely no point in having some of the platform init
> done from pc_machine_kvm_type(); we can move it all up to live in a
> single place in pc_basic_devices_init(). This has the added benefit that
> we can drop the separate xen_evtchn_connect_gsis() function completely,
> and pass just the system GSIs in directly to xen_evtchn_create().
> 
> While I'm at it, it does no harm to explicitly pass in the *number* of
> said GSIs, because it does make me twitch a bit to pass an array of
> impicit size. During the lifetime of the KVM/Xen patchset, that had
> already changed (albeit just cosmetically) from GSI_NUM_PINS to
> IOAPIC_NUM_PINS.
> 
> And document a bit better that this is for the *output* GSI for raising
> CPU0's events when the per-CPU vector isn't available. The fact that
> we create a whole set of them and then only waggle the one we're told
> to, instead of having a single output and only *connecting* it to the
> GSI that it should be connected to, is still non-intuitive for me.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c | 40 ++++++++++++++++++++--------------------
>   hw/i386/kvm/xen_evtchn.h |  3 +--
>   hw/i386/pc.c             | 13 ++++---------
>   3 files changed, 25 insertions(+), 31 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


