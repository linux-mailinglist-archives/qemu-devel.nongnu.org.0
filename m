Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862B5401D05
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 16:32:11 +0200 (CEST)
Received: from localhost ([::1]:41972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNFfO-0006gR-Jr
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 10:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNFdJ-0004qP-2c
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 10:30:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNFdH-0007R3-BG
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 10:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630938597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ht/tZqsdC29y/HxrX4tS0oibrwSbgIKnr+PkkAMmI1Q=;
 b=K4VGfiJJS7Iku+BZRJHuTQJvjuDfcdYSaaBerDDoqd2IUsDADFo1gqDtyH929xLsWqnxlw
 U8H77ETX4n2MAJqTix3GFWUYhnvdAbW1eu6abUK3l4RomsW5APZt0E49uzRz77KW0GY4Rm
 bwZ2XFCWQurdeiYiyeEu/V1A5Adj7IM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-mMNxIXx-PbeVUQHJlTC3Kw-1; Mon, 06 Sep 2021 10:29:56 -0400
X-MC-Unique: mMNxIXx-PbeVUQHJlTC3Kw-1
Received: by mail-ed1-f70.google.com with SMTP id
 bf22-20020a0564021a5600b003c86b59e291so3595339edb.18
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 07:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ht/tZqsdC29y/HxrX4tS0oibrwSbgIKnr+PkkAMmI1Q=;
 b=Teu8kd3vASUTB6BlH3kWbIqhHDqpw8zH/9PxGEu2pV6TF4La05Xg+mxL3Zrgd2dUEe
 MCy1g135eLedJePpPKoLtQy3rCUHCMGWSWkLrUmBlSl2/qcDBWHJlTfV+L7y85zM2SHw
 0eDiHJMDFhpV25Kbx5gl1CWE6i+Aqqt9Em38rdsdpJaczQGCSqqMjJ4gqADe6D9JpZ0k
 m0zdBqLt+WZQbiqbb7rZpalECu2k64HKbD5hAkUved+12rnx516cMEKjN2wGK+W6WEwf
 TE8IdbURwzcinYGD/mu7PelB4IfpSyiv9dIcqMg5m/cPg5ndCg9/JcOJDKlDGtaB0qZN
 tH/A==
X-Gm-Message-State: AOAM532NPApGZBYdOVvJgENPzaV4RbHrcos9gbNYUuOiqtOjl4iirhHp
 XfqJI/VVAPePK8ykjnFGUpo/Eiqh04hP4FAuws6U8nfJeQQkau0D5Y5nduQ7kcs3N3XpRnlIrLF
 fR4qFDaJd2gzPUSGTcn8U+SrV6fshP8d+kbtYhQgEZzowx3h99bvluu2mF1edu5vhULw=
X-Received: by 2002:a50:fd98:: with SMTP id o24mr1154800edt.129.1630938595536; 
 Mon, 06 Sep 2021 07:29:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi8pkSSZ/2c6byXduajpfeLshYzkBtcC2POuYAculxwu/kklLMP8q0UhrE1WgH+vEcTMX+Xg==
X-Received: by 2002:a50:fd98:: with SMTP id o24mr1154779edt.129.1630938595242; 
 Mon, 06 Sep 2021 07:29:55 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id se22sm4035525ejb.32.2021.09.06.07.29.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 07:29:54 -0700 (PDT)
Subject: Re: [PATCH] target/i386: add missing bits to CR4_RESERVED_MASK
To: "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210831175033.175584-1-berrange@redhat.com>
 <20210831175740.GZ26415@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <256b12ed-dfb9-8b18-05e3-f39dbf45f6e1@redhat.com>
Date: Mon, 6 Sep 2021 16:29:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831175740.GZ26415@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/08/21 19:57, Richard W.M. Jones wrote:
>> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
>> index 6c50d3ab4f..ce85f1a29d 100644
>> --- a/target/i386/cpu.h
>> +++ b/target/i386/cpu.h
>> @@ -257,6 +257,7 @@ typedef enum X86Seg {
>>                   | CR4_DE_MASK | CR4_PSE_MASK | CR4_PAE_MASK \
>>                   | CR4_MCE_MASK | CR4_PGE_MASK | CR4_PCE_MASK \
>>                   | CR4_OSFXSR_MASK | CR4_OSXMMEXCPT_MASK |CR4_UMIP_MASK \
>> +                | CR4_LA57_MASK | CR4_VMXE_MASK | CR4_SMXE_MASK \
>>                   | CR4_FSGSBASE_MASK | CR4_PCIDE_MASK | CR4_OSXSAVE_MASK \
>>                   | CR4_SMEP_MASK | CR4_SMAP_MASK | CR4_PKE_MASK | CR4_PKS_MASK))
> First thing to say is I tested this locally and it fixes the
> problem seen inhttps://bugzilla.redhat.com/show_bug.cgi?id=1999700.
> I will also add this patch to Fedora soon.  So:
> 
> Tested-by: Richard W.M. Jones<rjones@redhat.com>
> 
> But my question is, does this mean that every time a new CPU feature
> appears we must remember to update this code?

This is used only by TCG, which explains why VMXE/SMXE were not there; 
however, LA57 is missing indeed.

New features must be included both here and in cr4_reserved_bits, but 
only if TCG supports them, otherwise they can be left out.  Since 
VMXE/SMXE are not supported by TCG, they should be either added both 
here and in cr4_reserved_bits (keyed on env->features[FEAT_1_ECX] & 
CPUID_EXT_{VMX,SMX} respectively), or they should not be added to 
CR4_RESERVED_MASK either.  On the other hand LA57 is already handled by 
cr4_reserved_bits, so it is okay to just add it here.

Thanks,

Paolo


