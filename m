Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973A4462130
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 20:58:23 +0100 (CET)
Received: from localhost ([::1]:53522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrmn8-0002X2-9n
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 14:58:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1mrmkT-0008FI-I7
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:55:38 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:39170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1mrmkP-0006tM-Lq
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:55:37 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8A16D1FD2F;
 Mon, 29 Nov 2021 19:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638215728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=va/BV8h3MsNvE3GVoY40i40lWbA2Kf3kvQ5eAx1XH4o=;
 b=ypvwzCy2yibqGNTYBb8XfQH+9y0PCuaC0P3A2nNzF57aNEuvqTWKp/s1G3sDId1Q8AyWJL
 6ZD9wjanBC+6t0I4EuGm8/g8mmiD/elCci7LkEIyfjmPPmY63MD49zjNc8avazk78f9UZ+
 BHa7DI4yR7J5j2IwqglcIyFqHJXUabI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638215728;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=va/BV8h3MsNvE3GVoY40i40lWbA2Kf3kvQ5eAx1XH4o=;
 b=InDUlg8kMYvaYYH3yNVOg65HHHlKVt3gsoQ6wBiFmuZH15BjRYVYUeH1cuJlQynqzv6JYL
 hQtdWAwy7RbcAVAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4151F13BC9;
 Mon, 29 Nov 2021 19:55:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8bbzDTAwpWHHGQAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 29 Nov 2021 19:55:28 +0000
Subject: Re: [PATCH for-6.1 v2] i386: do not call cpudef-only models functions
 for max, host, base
To: David Woodhouse <dwmw2@infradead.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
References: <20210723112921.12637-1-cfontana@suse.de>
 <1102c315addf2f2fffc49222ab5be118e7ae9b0f.camel@amazon.co.uk>
 <f5910284-14ca-8796-4e64-38fef246bd19@suse.de>
 <e57e2119df69ac190cdd763b7ac8d5894b110839.camel@infradead.org>
 <b613015e-3285-8d30-292f-6bf9816b1912@suse.de>
 <d579bf46d0babc9eece1dc3e8ec63c43b311b022.camel@infradead.org>
 <483ebe21-2972-90c0-bc9a-ce922518632d@suse.de>
 <bdd861f68aa1533b2ea752c6509c03ca7b9f0279.camel@infradead.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <93efa230-fb6b-fdc7-a696-c555676da2b4@suse.de>
Date: Mon, 29 Nov 2021 20:55:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <bdd861f68aa1533b2ea752c6509c03ca7b9f0279.camel@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alxndr@bu.edu" <alxndr@bu.edu>, "philmd@redhat.com" <philmd@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "lovemrd@gmail.com" <lovemrd@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/21 8:19 PM, David Woodhouse wrote:
> On Mon, 2021-11-29 at 20:10 +0100, Claudio Fontana wrote:
>>
>> Hmm I thought what you actually care for, for cpu "host", is just the kvm_enable_x2apic() call, not the kvm_default_props.
>>
>>
>>
>> Do you also expect the kvm_default_prop "kvm-msi-ext-dest-id" to be switch to "on" and applied?
> 
> It's already on today. It just isn't *true* because QEMU never called
> kvm_enable_x2apic().


property should be on, but not by setting in kvm_default_prop / applied via kvm_default_prop, that mechanism is for the versioned cpu models,
which use X86CPUModel / X86CPUDefinition , and "host" isn't one of them.

Out of curiosity, does my previous snippet actually work? Not that I am sure it is the best solution,
just for my understanding. It would be surprising to me that the need to actually manually apply "kvm-msi-ext-dest-id" to "on" there.
 
> 
> So what I care about (in case ∃ APIC IDs >= 255) is two things:
> 
>  1. Qemu needs to call kvm_enable_x2apic().
>  2. If that *fails* qemu needs to *stop* advertising X2APIC and ext-dest-id.
> 
> 
> That last patch snippet in pc_machine_done() should suffice to achieve
> that, I think. Because if kvm_enable_x2apic() fails and qemu has been
> asked for that many CPUs, it aborts completely. Which seems right.
> 

seems right to abort if requesting > 255 APIC IDs cannot be satisfied, I agree.

So I think in the end, we want to:

1) make sure that when accel=kvm and smp > 255 for i386, using cpu "host", kvm_enable_x2apic() is called and successful.

2) in addressing requirement 1), we do not break something else (other machines, other cpu classes/models, TCG, ...).

3) as a plus we might want to cleanup and determine once and for all where kvm_enable_x2apic() should be called:
   we have calls in intel_iommu.c and in the kvm cpu class instance initialization here in kvm-cpu.c today:
   before adding a third call we should really ask ourselves where the proper initialization of this should happen.

Let me know about the previous snippet, and I'd really look for other comments from Eduardo or Paolo at this point, regarding the "what should be" question.


Ciao,

Claudio

