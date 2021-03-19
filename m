Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A49341BF1
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 13:06:13 +0100 (CET)
Received: from localhost ([::1]:41718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDtM-0001F8-AG
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 08:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lNDqI-00087g-A5
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 08:03:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lNDqG-0005cj-KH
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 08:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616155379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IU+0HxYGst6qWisbI97eZfvBsZlJJJ+zARZ1nozpwK8=;
 b=GvhtJvzceNo38LVT2ZKxKNJlU5rc8l4WX/kJw9DVVkOgfZiF+SDswXK8anwN60a/BOaFRR
 6tIalVVPpKcAf8iXVh7R9P1CE+kAhSL3lwOl4RoKGD4VMsSIIpxcv/BbcpycOIdzJGZq6J
 yey+i6DpOREXQYrW2UEaNeWzYLeG/xA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-h-La0gcyOJiZjkuBpUK-iA-1; Fri, 19 Mar 2021 08:02:57 -0400
X-MC-Unique: h-La0gcyOJiZjkuBpUK-iA-1
Received: by mail-ed1-f69.google.com with SMTP id bi17so22631045edb.6
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 05:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=IU+0HxYGst6qWisbI97eZfvBsZlJJJ+zARZ1nozpwK8=;
 b=h1PAZRSMjkxcgfzwdz0pBqxg9wY0ajHfCrRQeaGzvFe61vEhClDGwHc8N4Ybn7Y9NJ
 i4UQ54nyfkrboY3v7wq9emmbYCLONf2B6uPEFjwhQN2+6owSehw3fae0HNCqlcDNZn1e
 jpCEanwZQmFhVqQP7LxKFb3JzZrr+WBxrEHpgydw0KD/ukkzc2WnOlTsFFI5KqHW4aC1
 vvAr/7+whGTC0sSwLlzeHHejPQ4SeWXb9MAv+gc+VaVTNsJmig0KN+p4dY2axOkVcjZU
 GCSuL1vhwSrRmd0DUs5J626irdCRS0Ob6+N4oNdwb1u8MIgprAkdCtL9a6cJS3LZAkvo
 uZpQ==
X-Gm-Message-State: AOAM530XFdiql+WNUwSM6Ano7YxAoJzT3b8HEien9qEPTzITN8za30d5
 rvmRYy5j0x+pClTAJU3eGeXeehhxkZkTF2dYeKLdljWm41rf5t3icGiG0YRuFFj0wFtwYiM60Lw
 r4XDNjrzpkD4gyqQ=
X-Received: by 2002:a05:6402:1691:: with SMTP id
 a17mr9070134edv.336.1616155376790; 
 Fri, 19 Mar 2021 05:02:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxeuhvZpxHBol2LE/o/FIwqx+C9PQcgC1tFjxrCOosio6LXiKNmnFzg3HDWnug9LOIh3xvNQ==
X-Received: by 2002:a05:6402:1691:: with SMTP id
 a17mr9070106edv.336.1616155376574; 
 Fri, 19 Mar 2021 05:02:56 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id u24sm3518506ejr.34.2021.03.19.05.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 05:02:55 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 3/3] i386: Make sure kvm_arch_set_tsc_khz() succeeds on
 migration when 'hv-reenlightenment' was exposed
In-Reply-To: <7acdfa23-da34-c76e-1a44-cf611fe94917@redhat.com>
References: <20210318160249.1084178-1-vkuznets@redhat.com>
 <20210318160249.1084178-4-vkuznets@redhat.com>
 <2f377397-0427-95dc-6617-5dedf6533bc4@redhat.com>
 <87wnu45sev.fsf@vitty.brq.redhat.com>
 <104d7d27-48b9-d2f0-213f-54853270bcd6@redhat.com>
 <87mtuz5vkp.fsf@vitty.brq.redhat.com>
 <7acdfa23-da34-c76e-1a44-cf611fe94917@redhat.com>
Date: Fri, 19 Mar 2021 13:02:55 +0100
Message-ID: <87h7l7z6z4.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Dr
 . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 19/03/21 10:41, Vitaly Kuznetsov wrote:
>>> What I want to achieve is to forbid migration of VMs with
>>> reenlightenment, if they don't also specify tsc-khz to the frequency of
>>> the TSC on the source host.  We can't check it at the beginning of
>>> migration, but at least we can check it at the end.
>>>
>>> Maybe we're talking about two different things?
>> No, your suggestion basically extends mine and I'm just trying to
>> understand the benefit. With my suggestion, it is not required to
>> specify tsc-khz on the source, we just take 'native' tsc frequency as a
>> reference. Post-migration, we require that KVM_SET_TSC_KHZ succeeds (and
>> not just 'try' like kvm_arch_put_registers() does so we effectively
>> break migration when we are unable to set the desired TSC frequency
>> (also at the end).
>
> Oh, okay, I understand the confusion; I was thinking of checking for 
> user_tsc_khz in the post-load function for reenlightenment, not in the 
> command line processing.

Got it, yes, we can avoid this additional vmstate section and just add a
.post_load() hook to the existing vmstate_msr_hyperv_reenlightenment.
This will make 'tsc-frequency=' command line option mandatory for
successful migration with reenlightenment. Let me draft an alternative
patch.

-- 
Vitaly


