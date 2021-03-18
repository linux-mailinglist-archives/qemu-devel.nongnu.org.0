Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590AF340BFB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:39:31 +0100 (CET)
Received: from localhost ([::1]:60076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwcM-00083v-Ea
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMwZh-00079r-Hn
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:36:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMwZN-00034c-EV
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:36:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616088984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ABlisHjZqdoZnrnYrlSjQPZOS8HqHrk+q+rn2Uj6VTs=;
 b=Vv0gMbkIvnrXUlzC7XeAjklESPl10953/sjOFcLmuxuqe1Zja0bsgdq3hC0kOkfzefAnAD
 xFVA8AOhg6Sp2yGR4KPXpqZrcJO9WXrWBYmqPJPNFnZa+8va4TM0nw0oRUIFcgVNNGdp3G
 530NntgzS7QhVXorCn9R1x7Hc+mdXII=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-fccJqO0SN3WBOlHkssVuJQ-1; Thu, 18 Mar 2021 13:36:22 -0400
X-MC-Unique: fccJqO0SN3WBOlHkssVuJQ-1
Received: by mail-wm1-f72.google.com with SMTP id v5so12137438wml.9
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 10:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ABlisHjZqdoZnrnYrlSjQPZOS8HqHrk+q+rn2Uj6VTs=;
 b=qGP1DFhqdaR9mIrZ0iDUdhVtZJf/LLSI7Q9JU1PyTHaFcjn+92rZWddsCq6TLUL7Xg
 bnTkuM9c+sh7FRC6nJ8nMEbi4EaSuscK6Qk0xIZ7yWitZ5Wj/+Ap9JrV9Y2LItQylPfK
 zOQRMvvi1sv7qf3VwtqrW07eBLhipqWuieo/LSDOJachXl0aN7sM9oOPMBIfM9/bXJLc
 1BNt+++njMMSdU+whlnrTAe3Lz5z7yHH55YwSYgNXMdJtvcJWLFzEqFiRDJAxTpNoSRl
 NjgsjR9Q1Se45vQeASHHO8ddKBMDkT1HCnnLxuU59056W/r2rtt+fzY5IjXoMTPLSZ/g
 ZoTA==
X-Gm-Message-State: AOAM530VUx4qGjiVEwMlhD6qYkoWUa/YoAYk0cFR9X4YUxG9lsSweA8u
 n64HELac9bXT3Qbs1daSe9CGp4NbUJHubTlXowPfM5RRMnL8N3zNDBosNbun3j8vtSB+o55Fh6S
 5OZzYOFnqrw/AIPI=
X-Received: by 2002:adf:fe01:: with SMTP id n1mr361617wrr.341.1616088981687;
 Thu, 18 Mar 2021 10:36:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXbCYZXHtQFsEd/V8DhDM4wV2OBNBefoQ6jqVSb/ghHrJjlkFY/RiqrtVhUlvv5DM6BBBDrQ==
X-Received: by 2002:adf:fe01:: with SMTP id n1mr361597wrr.341.1616088981465;
 Thu, 18 Mar 2021 10:36:21 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p6sm3742062wru.2.2021.03.18.10.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 10:36:20 -0700 (PDT)
Subject: Re: [PATCH 3/3] i386: Make sure kvm_arch_set_tsc_khz() succeeds on
 migration when 'hv-reenlightenment' was exposed
To: Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org
References: <20210318160249.1084178-1-vkuznets@redhat.com>
 <20210318160249.1084178-4-vkuznets@redhat.com>
 <2f377397-0427-95dc-6617-5dedf6533bc4@redhat.com>
 <87wnu45sev.fsf@vitty.brq.redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <104d7d27-48b9-d2f0-213f-54853270bcd6@redhat.com>
Date: Thu, 18 Mar 2021 18:36:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87wnu45sev.fsf@vitty.brq.redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/21 17:38, Vitaly Kuznetsov wrote:
>> Could we instead fail to load the reenlightenment section if
>> user_tsc_khz was not set?  This seems to be user (well, management)
>> error really, since reenlightenment has to be enabled manually (or with
>> hv-passthrough which blocks migration too).
>
> Yes, we certainly could do that but what's the added value of
> user_tsc_khz which upper layer will have to set explicitly (probably to
> the tsc frequency of the source host anyway)? In case we just want to
> avoid calling KVM_SET_TSC_KHZ twice, we can probably achieve that by
> adding a CPU flag or something.

What I want to achieve is to forbid migration of VMs with 
reenlightenment, if they don't also specify tsc-khz to the frequency of 
the TSC on the source host.  We can't check it at the beginning of 
migration, but at least we can check it at the end.

Maybe we're talking about two different things?

Paolo


