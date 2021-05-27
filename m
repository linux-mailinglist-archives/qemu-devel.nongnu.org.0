Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9D0392884
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 09:28:11 +0200 (CEST)
Received: from localhost ([::1]:46958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmAR8-0003sY-I1
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 03:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lmAQ9-0002bx-7T
 for qemu-devel@nongnu.org; Thu, 27 May 2021 03:27:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lmAQ7-0006GU-7A
 for qemu-devel@nongnu.org; Thu, 27 May 2021 03:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622100425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EzFMRyPBB80hr1Elge7cKYL8o5ri52O1LEbXr9QSlQQ=;
 b=F8fuwmDlnMJS+v5U4Wsf8V7/8Dg1ZfAuh/B+N6yB0jWnowlPTceNPS05zg0G890nrMrxhh
 eGhWQ8RPOfx8+WFBL3s7vB6TcNPV9idLPBjbh3QylSyos3VAHIyr+eATzezsnMq3r/4XHm
 VzAwbrStJ8w7jw2ZZ/tLbw0vF1VBeh4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-ipm51yYAOFS58ugXwBJWVQ-1; Thu, 27 May 2021 03:27:04 -0400
X-MC-Unique: ipm51yYAOFS58ugXwBJWVQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 k12-20020adfd84c0000b0290114b4a42a0fso273840wrl.19
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 00:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=EzFMRyPBB80hr1Elge7cKYL8o5ri52O1LEbXr9QSlQQ=;
 b=OBrXWWl2GudFZqKgCmsrC8vxN1t4CxxJHa2Msnp0lMGoMQKlVc2AhLS/eqCcMoCXN1
 Kmyr2eb0qeseN3bTfnixt6XZAUwyhhD5oKEzJynNAR1XPub2U2lblk+kZinEyqHc8m40
 t1VwkB027wJrEh/e6AgmKy20cxMyOyMWKuqQxhFOFy3svts64fG03uL3dPZakvo7KRYo
 x+4uYSjvtmHEXTOhAzubk6ocuSS3UIgTtnzIvrZzoTNeYD9YREWm9zkqrnUs8VaMNQSK
 AA+0DTANXJC2OqdX48YCeultGyz9W1jwwQRCrOnCqK4TmxfMq/AERT/Uh8Ryf2u8X9ko
 lKeg==
X-Gm-Message-State: AOAM531ixifiUkp4MyFQa7qyCNrTlA7lQ6+DSiP82RtMkopoO+Dk8E86
 NM5vYWvjam24ehC/xlZx6CLAdVatPW2YSFJWKop4d0GRF05cR/NbXTmxV48KiLs3psYhHzoQW9y
 D8YStauwJpxVeF24=
X-Received: by 2002:a05:600c:896:: with SMTP id
 l22mr2009833wmp.164.1622100422923; 
 Thu, 27 May 2021 00:27:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy81k+faTizDq4F5Gu6ag4W8/A4z9C9MNRuhlVhqV7dPbEClfLxrwPs0dGcsr7BvF9jfiTJWA==
X-Received: by 2002:a05:600c:896:: with SMTP id
 l22mr2009815wmp.164.1622100422690; 
 Thu, 27 May 2021 00:27:02 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id v18sm2017344wro.18.2021.05.27.00.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 00:27:02 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v6 10/19] i386: move eVMCS enablement to hyperv_init_vcpu()
In-Reply-To: <20210526163514.izh52clpynbte747@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-11-vkuznets@redhat.com>
 <20210521212021.lsf2pzfu647ocqj3@habkost.net>
 <87mtsk734q.fsf@vitty.brq.redhat.com>
 <20210526163514.izh52clpynbte747@habkost.net>
Date: Thu, 27 May 2021 09:27:01 +0200
Message-ID: <87pmxc7i2i.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Mon, May 24, 2021 at 02:00:37PM +0200, Vitaly Kuznetsov wrote:
> [...]
>> >> @@ -1455,6 +1454,21 @@ static int hyperv_init_vcpu(X86CPU *cpu)
>> >>          }
>> >>      }
>> >>  
>> >> +    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
>> >> +        uint16_t evmcs_version;
>> >> +
>> >> +        ret = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
>> >> +                                  (uintptr_t)&evmcs_version);
>> >> +
>> >> +        if (ret < 0) {
>> >> +            fprintf(stderr, "Hyper-V %s is not supported by kernel\n",
>> >> +                    kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
>> >> +            return ret;
>> >> +        }
>> >> +
>> >> +        cpu->hyperv_nested[0] = evmcs_version;
>> >
>> > Wait, won't this break guest ABI?  Do we want to make
>> > HYPERV_FEAT_EVMCS a migration blocker until this is fixed?
>> >
>> 
>> Could you please elaborate on the issue? I read the above is: when 
>> evmcs' feature was requested, make an attempt to enable
>> KVM_CAP_HYPERV_ENLIGHTENED_VMCS, and bail out if this fails. Propagate
>> the the acquired evmcs version to 'cpu->hyperv_nested[]' otherwise.
>
> This will be visible to the guest at CPUID[0x4000000A].EAX,
> correct?  You are initializing CPUID data with a value that
> change depending on the host.
>
> What is supposed to happen if live migrating to to a host with a
> different evmcs_version?

(Note: 'evmcs_version' here is the 'maximum supported evmcs version',
not 'used evmcs version').

This is a purely theoretical question at this moment as there's only one
existing (and supported) eVMCS version: 1.

In future, when (and if) e.g. EVMCSv2 appears, we'll have to introduce a
different QEMU option for it most likely (or something like
'hv-evmcs=1', 'hv-evmcs=2' ... ) as how else would we prevent migration
to a host which doesn't support certain eVMCS version (e.g. EVMCSv2 ->
EVMCSv1)?

I'd be fine with hardcoding '1' and just checking that the returned
version is >= 1 for now. Migration blocker seems to be an overkill (as
there's no real problem, we're just trying to make the code future
proof). 

-- 
Vitaly


