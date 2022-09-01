Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F3E5A9B0E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 17:00:42 +0200 (CEST)
Received: from localhost ([::1]:59330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTlgP-0004D9-7m
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 11:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oTlbu-00050L-Fe
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:56:02 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:52614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oTlbs-0002e2-H8
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:56:02 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F115122675;
 Thu,  1 Sep 2022 14:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662044157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tB56p3j1BY/z2s6+t+ncGm95Cx02S/7xpeAXAlovp1Y=;
 b=Zy+14pGvDa+IEV66Lk9hf+9Os7t/uZIbRCu1YX1NZ3BRZPa1E6ced1yGqyDusIZ6FaHv8D
 zQvNNrorGL9lWwkq1hzcRrMTZEJSJ9nKywmcgVgiNY9b8vyKBLw+8IRvkXbkwn82YQZesl
 fgtdJz7PJD59a2GdqhdBo6wD6N1I8F4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662044158;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tB56p3j1BY/z2s6+t+ncGm95Cx02S/7xpeAXAlovp1Y=;
 b=GFJ9aD3YfH8SPhlgoT5zJB7zkXXCWGg+E7tb5w6IQL1Gzc+sKJYlGtjS4d7j6TKa76pkF8
 trBolLXprkVAjrCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E33C13A79;
 Thu,  1 Sep 2022 14:55:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FN+rF/3HEGOBagAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 01 Sep 2022 14:55:57 +0000
Message-ID: <cd14d1d5-3484-f1db-9473-9db7929789f3@suse.de>
Date: Thu, 1 Sep 2022 16:55:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/2] expose host-phys-bits to guest
Content-Language: en-US
To: Xiaoyao Li <xiaoyao.li@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>
References: <20220831125059.170032-1-kraxel@redhat.com>
 <957f0cc5-6887-3861-2b80-69a8c7cdd098@intel.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <957f0cc5-6887-3861-2b80-69a8c7cdd098@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/1/22 08:07, Xiaoyao Li wrote:
> On 8/31/2022 8:50 PM, Gerd Hoffmann wrote:
>> When the guest (firmware specifically) knows how big
>> the address space actually is it can be used better.
>>
>> Some more background:
>>    https://bugzilla.redhat.com/show_bug.cgi?id=2084533
> 
> QEMU enables host-phys-bits for "-cpu host/max" in 
> host_cpu_max_instance_init();

No, in host_cpu_max_instance_init the default for host-phys-bits is set to on.

You can still get the phys bits adjusted if you set the property to on manually for other cpu models.

> 
> I think the problem is for all the named CPU model, that they don't have 
> phys_bits defined. Thus they all have "cpu->phys-bits == 0", which leads 
> to cpu->phys_bits = TCG_PHYS_ADDR_BITS (36 for 32-bits build and 40 for 
> 64-bits build)
> 
> Anyway, IMO, guest including guest firmware, should always consult from 
> CPUID leaf 0x80000008 for physical address length. Tt is the duty of 
> userspace VMM, here QEMU, to ensure VM's host physical address length 
> not exceeding host's. If userspace VMM cannot ensure this, guest is 
> likely hitting problem.
> 
>> This is a RfC series exposes the information via cpuid.
>>
>> take care,
>>    Gerd
>>
>> Gerd Hoffmann (2):
>>    [hack] reserve bit KVM_HINTS_HOST_PHYS_BITS
>>    [RfC] expose host-phys-bits to guest
>>
>>   include/standard-headers/asm-x86/kvm_para.h | 3 ++-
>>   target/i386/cpu.h                           | 3 ---
>>   hw/i386/microvm.c                           | 6 +++++-
>>   target/i386/cpu.c                           | 3 +--
>>   target/i386/host-cpu.c                      | 4 +++-
>>   target/i386/kvm/kvm.c                       | 1 +
>>   6 files changed, 12 insertions(+), 8 deletions(-)
>>
> 
> 


