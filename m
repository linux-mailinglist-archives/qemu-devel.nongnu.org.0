Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCDC4DD7D1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 11:17:00 +0100 (CET)
Received: from localhost ([::1]:56140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV9fH-0004ZS-7Q
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 06:16:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nV9cX-0003fh-UF
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 06:14:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nV9cS-0002Ov-7L
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 06:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647598440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sHCTA+kAYPMwYwE7TkPpwor9XEWwUxVal8HnS825Bu0=;
 b=grcOVZYQZ+qYZNQMznHHxlqFWU2aeGk1HVh6C0X7VepD+0PB5NADo+nxwd4PP/ZzQrL/2h
 ed8i2HSMwCyoLRCSIu2P+HaXA0hwy/KcVJgAg41+2dtcJ/Sn884Bwl7bQA6O2HxSb9rkfW
 +HKffQ3yEG6mxsbfUSZDlwN9mIkaFZQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-s6hOetPSN1qae4zURGyJqg-1; Fri, 18 Mar 2022 06:13:59 -0400
X-MC-Unique: s6hOetPSN1qae4zURGyJqg-1
Received: by mail-ej1-f72.google.com with SMTP id
 de35-20020a1709069be300b006df795e2326so4325034ejc.2
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 03:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sHCTA+kAYPMwYwE7TkPpwor9XEWwUxVal8HnS825Bu0=;
 b=tLEcRzWG7C8bgadqTgFuOcINMMq78kqyaY+TUbzszeVu1Kb99QE8Bz5kjVtEMzo8aG
 pfk1Uz5QaU7zCMjD7/3/RWedD5bOdYdsZozmGWFQoFGO4fiT31tUPdkThuNnvgYckaM/
 hTGduwlM/DMKt0OyfsySx/1sakXHdngjAN8yhrHj7GOf1tVmXvaM2T8YCE/pZ799U19m
 IiJdRqIUGUKem3XondXKBnXFzrXf3tYBKhEdt+8tlt17IdAaE5soswopSJR0s+de08UI
 Gu/Usv1g5GicuZSBnX6FHpOF8mX1lNUzDBVuHdTzHuUJLbwHKnwYffhnnZ8bz2rqMQqV
 IRmA==
X-Gm-Message-State: AOAM533ceyQ2icSZCemaWzvK+lIlKxhK+KoJNI1VlTkC4DHjnnbB5Unk
 8YS2mtI/vLyCJShUTmdqfmiDOR7YQJAVqKhyOSUBGB/Wa8DUGd/Wf0vYAan5BIvTljBhBsfo2mE
 TXiGM41weX1t3QTw=
X-Received: by 2002:a05:6402:2065:b0:407:eb07:740 with SMTP id
 bd5-20020a056402206500b00407eb070740mr8660548edb.406.1647598438113; 
 Fri, 18 Mar 2022 03:13:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzkl9eb4fmjd29pU5wdw9ipfMSk7x2fJtz5l15tMKYgBvrR8ni8IE4tvNZ2SwVvYwApE9UKQ==
X-Received: by 2002:a05:6402:2065:b0:407:eb07:740 with SMTP id
 bd5-20020a056402206500b00407eb070740mr8660524edb.406.1647598437832; 
 Fri, 18 Mar 2022 03:13:57 -0700 (PDT)
Received: from [10.43.2.152] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a1709062a0700b006bc28a6b8f1sm3509842eje.222.2022.03.18.03.13.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 03:13:57 -0700 (PDT)
Message-ID: <50ab6e2a-7cdf-14e2-29da-6780ad4a43d2@redhat.com>
Date: Fri, 18 Mar 2022 11:13:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PULL 15/22] x86: Grant AMX permission for guest
To: Peter Krempa <pkrempa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
 <20220308113445.859669-16-pbonzini@redhat.com>
 <YjII86LKWTe0mVED@angien.pipo.sk>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <YjII86LKWTe0mVED@angien.pipo.sk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org,
 Jing Liu <jing2.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/22 16:57, Peter Krempa wrote:
> On Tue, Mar 08, 2022 at 12:34:38 +0100, Paolo Bonzini wrote:
>> From: Yang Zhong <yang.zhong@intel.com>
>>
>> Kernel allocates 4K xstate buffer by default. For XSAVE features
>> which require large state component (e.g. AMX), Linux kernel
>> dynamically expands the xstate buffer only after the process has
>> acquired the necessary permissions. Those are called dynamically-
>> enabled XSAVE features (or dynamic xfeatures).
>>
>> There are separate permissions for native tasks and guests.
>>
>> Qemu should request the guest permissions for dynamic xfeatures
>> which will be exposed to the guest. This only needs to be done
>> once before the first vcpu is created.
>>
>> KVM implemented one new ARCH_GET_XCOMP_SUPP system attribute API to
>> get host side supported_xcr0 and Qemu can decide if it can request
>> dynamically enabled XSAVE features permission.
>> https://lore.kernel.org/all/20220126152210.3044876-1-pbonzini@redhat.com/
>>
>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
>> Signed-off-by: Jing Liu <jing2.liu@intel.com>
>> Message-Id: <20220217060434.52460-4-yang.zhong@intel.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  target/i386/cpu.c          |  7 +++++
>>  target/i386/cpu.h          |  4 +++
>>  target/i386/kvm/kvm-cpu.c  | 12 ++++----
>>  target/i386/kvm/kvm.c      | 57 ++++++++++++++++++++++++++++++++++++++
>>  target/i386/kvm/kvm_i386.h |  1 +
>>  5 files changed, 75 insertions(+), 6 deletions(-)
> 
> With this commit qemu crashes for me when invoking the following
> QMP command:
> 
> $ ~pipo/git/qemu.git/build/qemu-system-x86_64 -S -no-user-config -nodefaults -nographic -machine none,accel=kvm -qmp stdio
> {"QMP": {"version": {"qemu": {"micro": 90, "minor": 2, "major": 6}, "package": "v7.0.0-rc0-8-g1d60bb4b14"}, "capabilities": ["oob"]}}
> {'execute':'qmp_capabilities'}
> {"return": {}}
> {"execute":"qom-list-properties","arguments":{"typename":"max-x86_64-cpu"},"id":"libvirt-41"}
> qemu-system-x86_64: ../target/i386/kvm/kvm-cpu.c:105: kvm_cpu_xsave_init: Assertion `esa->size == eax' failed.
> Aborted (core dumped)
> 
> Note that the above is on a box with an 'AMD Ryzen 9 3900X'.
> 
> Curiously on a laptop with an Intel chip (Intel(R) Core(TM) i7-10610U)
> it seems to work.
> 
> 

Not trying to beat a dead horse here, but I've just found another
problem with this patch. On my laptop (Linux maggie
5.15.26-gentoo-x86_64 #1 SMP Thu Mar 10 08:55:28 CET 2022 x86_64
Intel(R) Core(TM) i7-10610U CPU @ 1.80GHz GenuineIntel GNU/Linux), when
I start a guest it no longer sees AVX instructions:

  qemu.git $ ./build/qemu-system-x86_64 -accel kvm -cpu host ...

Michal


