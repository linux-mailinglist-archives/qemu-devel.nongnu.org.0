Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6910C31B60B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 09:55:28 +0100 (CET)
Received: from localhost ([::1]:57672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBZfC-0007iG-Si
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 03:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lBZdo-00070L-Rj
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 03:54:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lBZdl-0008H1-RV
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 03:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613379235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2W7Fb09dJUkXXdFX+wfbJ9HpMvUwVDUkj5N2pSkcoRA=;
 b=QR8P9XJEW28tEjQchUBMoqo0NJeeoGViIqCcsseLpgCtN6IYjpiOjeTWb8GpgMBnkd9QrQ
 8Y6bVQ5B8iAjETspu0EMMY4d4SYzm6JrxK/LqcxAlX/aQgF4/AvtDdo+kiJZlBd9vmn3Fu
 LGQzG2Z0ih8kWAbGpRxLt88dNYaHOKU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-4Mnp14i1M1mSgcCfltCBlg-1; Mon, 15 Feb 2021 03:53:53 -0500
X-MC-Unique: 4Mnp14i1M1mSgcCfltCBlg-1
Received: by mail-wr1-f71.google.com with SMTP id v1so3153136wru.2
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 00:53:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=2W7Fb09dJUkXXdFX+wfbJ9HpMvUwVDUkj5N2pSkcoRA=;
 b=NW+KulEYDyM1VoBVNZ3oE1C9cyOaFfRxtfI9qknBMBJTZAN2p1eBld9wXxArNMybQm
 bXZpsxh4UxixY2j0Gb415Pb189KcG9eYjvUc5bDBB/ptnfuHbO0wd/GkuzdbCnzppTZ/
 G92IFpWlqOOgAE+3HavNyZjFuFfQNbt7DdMzpx6J5As0YlCbP+DpKRex34xSoH/1Jswm
 HuUjMgX3L9Rk9uMHVky/mnM5UkxZzDKWtHtGA4bGxk6jt2OmqxwwtyOvNvx0qpbIgyfY
 Hny/pCys2Cb9sqQ6Ug/a+hbMj19KFVf/C9ocNrJ1OO96tYCLjmCR3b9PqFRCYC0nIwHA
 dibQ==
X-Gm-Message-State: AOAM531BQ90bcVsEsQdbur0MO574tIvqK6l4/CbIOlWMt0WHs3EM66vu
 JOUmMlWb1mNYZIMyPPH6XqUmhIqSq/AhjL1xkrdXvXwNgzH9ecs45CgD2aVUZRH0ZzLtbKLaPvE
 3nN8F/cVN1jCQJFA=
X-Received: by 2002:a1c:7c17:: with SMTP id x23mr13681305wmc.65.1613379232281; 
 Mon, 15 Feb 2021 00:53:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwO0RCl3wpPoIn2dfCXQwflAitMg++/ylrPLyiS4gRN0fWO+1f6e0L2ueMhBFyPTANIFfsIAw==
X-Received: by 2002:a1c:7c17:: with SMTP id x23mr13681272wmc.65.1613379231889; 
 Mon, 15 Feb 2021 00:53:51 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id u14sm23243441wro.10.2021.02.15.00.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 00:53:51 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
In-Reply-To: <20210212170113.30a902b2@redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-17-vkuznets@redhat.com>
 <20210211183555.2136b5c8@redhat.com> <87tuqhllmn.fsf@vitty.brq.redhat.com>
 <20210212151259.3db7406f@redhat.com> <87k0rdl3er.fsf@vitty.brq.redhat.com>
 <20210212170113.30a902b2@redhat.com>
Date: Mon, 15 Feb 2021 09:53:50 +0100
Message-ID: <87eehhlnj5.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, drjones@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

>> >
>> > Please try reusing scratch CPU approach, see
>> >   kvm_arm_get_host_cpu_features()
>> > for an example. You will very likely end up with simpler series,
>> > compared to reinventing wheel.  
>> 
>> Even if I do that (and I serioulsy doubt it's going to be easier than
>> just adding two 'u64's, kvm_arm_get_host_cpu_features() alone is 200
> it does a lot more then what you need, kvm_arm_create_scratch_host_vcpu()
> which it uses will do the job and even that could be made smaller
> for hv usecase.
>
>> lines long) this is not going to give us what we need to distinguish
>> between
>> 
>> 'hv-passthrough,hv-evmcs'
>> 
>> and 
>> 
>> 'hv-passthrough'
>> 
>> when 'hv-evmcs' *is* supported by the host. When guest CPU lacks VMX we
>> don't want to enable it unless it was requested explicitly (former but
>> not the later).
> could you elaborate more on it, i.e. why do we need to distinguish and why
> do we need evmcs without VMX if user asked for it (will it be usable)
>

We need to distinguish because that would be sane.

Enlightened VMCS is an extension to VMX, it can't be used without
it. Genuine Hyper-V doesn't have a knob for enabling and disabling it,
it comes with nesting (-ExposeVirtualizationExtensions $true). When we
create a default set of Hyper-V enlightenments (either 'hv-default' or
'hv-passthrough') we should be as close as possible to genuine Hyper-V
to not create unsupported Frankenstiens which can break with any Windows
update (because nobody tested these configurations). That bein said, if
guest CPU lacks VMX it is counter-productive to expose EVMCS. However,
there is a problem with explicit enablement: what should

'hv-passthrough,hv-evmcs' option do? Just silently drop EVMCS? Doesn't
sound sane to me.

>> Moreover, instead of just adding two 'u64's we're now doing an ioctl
>> which can fail, be subject to limits,... Creating and destroying a CPU
>> is also slow. Sorry, I hardly see how this is better, maybe just from
>> 'code purity' point of view.
> readable and easy to maintain code is not a thing to neglect.

Of couse, but 'scratch CPU' idea is not a good design decision, it is an
ugly hack we should get rid of in ARM land, not try bringing it to other
architectures. Generally, KVM should allow to query all its capabilities
without the need to create a vCPU or, if not possible, we should create
'real' QEMU VCPUs and use one/all of the to query capabilities, avoiding
'scratch' because:
- Creating and destroying a vCPU makes VM startup slower, much
slower. E.g. for a single-CPU VM you're doubling the time required to
create vCPUs!
- vCPUs in KVM are quite memory consuming. Just 'struct kvm_vcpu_arch'
was something like 12kb last time I looked at it. 

I have no clue why scratch vCPUs were implemented on ARM, however, I'd
very much want us to avoid doing the same on x86. We do have use-cases
where startup time and consumed memory is important. There is a point in
limiting ioctls for security reasons (e.g. if I'm creating a single vCPU
VM I may want to limit userspace process to one and only one
KVM_CREATE_VCPU call).

Now to the code you complain about. The 'hard to read and maintain' code
is literaly this:

+static void x86_hv_feature_set(Object *obj, bool value, int feature)
+{
+    X86CPU *cpu = X86_CPU(obj);
+
+    if (value) {
+        cpu->hyperv_features |= BIT(feature);
+        cpu->hyperv_features_on |= BIT(feature);
+        cpu->hyperv_features_off &= ~BIT(feature);
+    } else {
+        cpu->hyperv_features &= ~BIT(feature);
+        cpu->hyperv_features_on &= ~BIT(feature);
+        cpu->hyperv_features_off |= BIT(feature);
+    }
+}

I can add as many comments here as needed, however, I don't see what
requires additional explanaition. We just want to know two things:
- What's the 'effective' setting of the control
- Was it explicitly enabled or disabled on the command line.

Custom parsers are not new in QEMU and they're not going anywhere I
believe. There are options with simple enablent and there are some with
additional considerations. Trying to make CPU objects somewhat 'special'
by forcing all options to be of type-1 (and thus crippling user
experience) is not the way to go IMHO. I'd very much like us to go in
another direction, make our option parser better so my very simple
use-case is covered 'out-of-the-box'.

-- 
Vitaly


