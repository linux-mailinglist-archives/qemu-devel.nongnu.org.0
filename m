Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837DD3023CC
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 11:44:51 +0100 (CET)
Received: from localhost ([::1]:59754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3zMY-000155-K0
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 05:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3zKe-0008CL-46
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 05:42:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3zKa-0003WX-RV
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 05:42:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611571368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HtjG1qDETI5JxP2U1i394yqrMggrziS64LWT1csfUZc=;
 b=XfWAL4I+PcHTleNBx3hGCWaEyogCCeg9FRIH6kC3k8a1tuQRs+3WKiwttjjn/K2ZQaOSB6
 jpEzT9Jbgkomr0M65kyO74cYxjvjai5W2r5pzwRXkmMKIl1U/5EIggMyJsw0Nz69Yyzx8F
 XkVQM4TB4VoO6xmhc/ea+wp1VLs6byw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-XbM03-EGPhK2isyBpftQsA-1; Mon, 25 Jan 2021 05:42:46 -0500
X-MC-Unique: XbM03-EGPhK2isyBpftQsA-1
Received: by mail-ed1-f69.google.com with SMTP id j11so6359940edy.20
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 02:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HtjG1qDETI5JxP2U1i394yqrMggrziS64LWT1csfUZc=;
 b=Dnq+bUtP+bX4/PPT5yC1w/AI6AgP5zvH8tqcyv8KrrsLRwebJKBXq0y/ZZA+dh0UIk
 lgj2XVYAVqbJY6ryZ1usX9cu4atPOnE8D4PLaEA/QMCxThIJvRW9J+jzWk573h+Bbwoe
 QdI6ZAniwyPPY2VcBvr4JeAAOyZmdr+Gitpz+X/LYqbSb8ngAgbrV3AghDrUacKhlH4l
 LM9iUR+Z7Tym3frWHn1nm+Cb/LqcczcTS0gPnfIsK7l1nzqS9xKj4CQSkDpoIAFFZrU7
 TqYUD1xRZao8mmMTxPxtZos7y/Q/J/BHnxZ4zDtVu3Czzz368q72xPeKnPwuibQdMNds
 WBzg==
X-Gm-Message-State: AOAM530JIunW0AsO9Pe3HZ34BMoIKbeEvC5f7oVhUlb6JtrUbtm+K6Fb
 c6LRHF5C6sVPmLkTRruZh9yO1vJAOdTf7bmWmpyTL2XuH4rv5YIz1I8yeyEj+xXzpykNmdXP5VR
 hYpusmi8MHDvBfToTgc7aDa76UtVcrLVxCycQVDt5sdWiEFH6e6u21Ha8c3sF78r0hEk=
X-Received: by 2002:a17:907:7289:: with SMTP id
 dt9mr560229ejc.446.1611571365257; 
 Mon, 25 Jan 2021 02:42:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxSxPazMOFWw+9mBlgvps4pVuX6vUiaSk87BnGllJdYIwrTJdQdp/M+3o3x07mduBiAbMu5w==
X-Received: by 2002:a17:907:7289:: with SMTP id
 dt9mr560217ejc.446.1611571365022; 
 Mon, 25 Jan 2021 02:42:45 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cw7sm7723988ejc.13.2021.01.25.02.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 02:42:44 -0800 (PST)
Subject: Re: [Qemu-devel][PATCH] x86/cpu: Use max host physical address if
 -cpu max option is applied
To: Nathan Chancellor <natechancellor@gmail.com>,
 Yang Weijiang <weijiang.yang@intel.com>
References: <20210113090430.26394-1-weijiang.yang@intel.com>
 <20210124210829.GA2238365@ubuntu-m3-large-x86>
 <20210125054150.GA4969@local-michael-cet-test.sh.intel.com>
 <20210125071052.GA307708@ubuntu-m3-large-x86>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7a1d69e7-a3e0-e4e8-b09b-3e904466cd97@redhat.com>
Date: Mon, 25 Jan 2021 11:42:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210125071052.GA307708@ubuntu-m3-large-x86>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: seanjc@google.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/01/21 08:10, Nathan Chancellor wrote:
>>> This patch as commit 5a140b255d ("x86/cpu: Use max host physical address
>>> if -cpu max option is applied") prevents me from using '-cpu host' while
>>> booting an i386_defconfig kernel.
>>>
>>> $ qemu-system-i386 \
>>> -append console=ttyS0 \
>>> -cpu host \
>>> -display none \
>>> -enable-kvm \
>>> -initrd rootfs.cpio \
>>> -kernel bzImage \
>>> -serial mon:stdio
>>> qemu-system-i386: phys-bits should be between 32 and 36  (but is 48)
>>>
>>> Am I expected to pass "-cpu host,host-phys-bits=false" now or did this
>>> do something unexpected?

Yes, it's setting the LM bit for a 32-bit guest.

Does this work for you?

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 72a79e6019..70df57337f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5081,6 +5081,11 @@ static uint64_t 
x86_cpu_get_supported_feature_word(FeatureWord w,
      } else {
          return ~0;
      }
+#ifdef TARGET_I386
+    if (wi->cpuid.eax = 0x80000001) {
+        r &= ~CPUID_EXT2_LM;
+    }
+#endif
      if (migratable_only) {
          r &= x86_cpu_get_migratable_flags(w);
      }


Paolo

>> Hi, Nathan,
>> Could you try Paolo's latest patch?
>>
>> [PULL 03/31] x86/cpu: Use max host physical address if -cpu max option is applied
> 
> Hi Yang,
> 
> That is the version of the patch I tried, which has been pulled into the
> master branch.
> 
> Cheers,
> Nathan
> 


