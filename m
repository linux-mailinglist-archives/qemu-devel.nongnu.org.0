Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184E72B514F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 20:38:55 +0100 (CET)
Received: from localhost ([::1]:39532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kekKz-00050U-W6
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 14:38:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kek7V-000787-1n
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:24:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kek7R-0006vJ-R1
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:24:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605554692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mQSvuYRvFqxv79hOPPNIGHgoFAvmVSa2KGCGh14XvX0=;
 b=Ol8pZpoWaI+H2hPhNku8pVaOnXoD6q4ogB3nycQuroIkpo4D1PrVa6ACl7En8E2GLcWVk9
 WfiYOMmj/tH0+Inis8jQVgUI3B6lf4PwvKWxCXqoaSVOe6CgzcQ9WzRsVc2gJRbSGZmmDO
 2SZoggaUX1Gz9lk0BxFG40EYByb+pXk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-U_m05L4UM1-gar4PyCUeWg-1; Mon, 16 Nov 2020 14:24:47 -0500
X-MC-Unique: U_m05L4UM1-gar4PyCUeWg-1
Received: by mail-wr1-f69.google.com with SMTP id n4so10663296wrt.8
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 11:24:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mQSvuYRvFqxv79hOPPNIGHgoFAvmVSa2KGCGh14XvX0=;
 b=DXz6K9xp/+Laqjb21zSfmuD1fR46KMCc3SYGIMwDvmLtBYfD3qhaChYYxXqEqJfNft
 9EO2QkwzX6jG0OUB/c4akYLD1QGQWnLWMIIvZFLPpaHWm5RyGBMcBUp19oTgjQOmR8SO
 T1TyWazuzRGS4oa4XvKkkwh2+ar4Q9Ggk4j4yfLQMu5oKCKiqtbbjagZKKKNXK7i/n5v
 d/jA68Xs5wUI4iGP1Q/D9av+HQKILvL/AJPPww9OdZRn/zlt2Ii1bMkHQpi936LY19JI
 GL99OcRXx52Dy1cudmB/7sSN80yskH6HgmxfpvLu/ZuUMBvqBTr8nr7nsyIbsP0NlDBI
 GHAw==
X-Gm-Message-State: AOAM533SR+SJ22ziT7qYGqTTYGqPmNLmtXMVbJuB5gQaEqJvWmnfsgK4
 EGkpFjbln15PamDaJ7s1rheDS5XfTN5PVfwutlWbzl898uPyDGYqEmzuQg2u/Cn/xkgn9M3qLD+
 MMGvLwu2UnkEHfAU=
X-Received: by 2002:a5d:6550:: with SMTP id z16mr21224442wrv.266.1605554686173; 
 Mon, 16 Nov 2020 11:24:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnSUOlYF2Jq5az6RhTrY9TqlYaubHiAMiJS9+yWuJqSgfh9MnDb2jScNGTXjzVqknfEqQ9xA==
X-Received: by 2002:a5d:6550:: with SMTP id z16mr21224424wrv.266.1605554685953; 
 Mon, 16 Nov 2020 11:24:45 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n11sm23295666wru.38.2020.11.16.11.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 11:24:45 -0800 (PST)
Subject: Re: [PATCH] kvm/i386: Set proper nested state format for SVM
To: Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <fe53d00fe0d884e812960781284cd48ae9206acc.1605546140.git.thomas.lendacky@amd.com>
 <a29c92be-d32b-f7c3-ed00-4c3823f8c9a5@redhat.com>
 <f58c08c7-0c80-efe8-b976-ffb85b488723@amd.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0b978bd3-ffa4-f06e-3654-e851b7e1c1e2@redhat.com>
Date: Mon, 16 Nov 2020 20:24:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <f58c08c7-0c80-efe8-b976-ffb85b488723@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/20 19:25, Tom Lendacky wrote:
> On 11/16/20 12:09 PM, Paolo Bonzini wrote:
>> On 16/11/20 18:02, Tom Lendacky wrote:
>>> From: Tom Lendacky<thomas.lendacky@amd.com>
>>>
>>> Currently, the nested state format is hardcoded to VMX. This will result
>>> in kvm_put_nested_state() returning an error because the KVM SVM support
>>> checks for the nested state to be KVM_STATE_NESTED_FORMAT_SVM. As a
>>> result, kvm_arch_put_registers() errors out early.
>>>
>>> Update the setting of the format based on the virtualization feature:
>>>     VMX - KVM_STATE_NESTED_FORMAT_VMX
>>>     SVM - KVM_STATE_NESTED_FORMAT_SVM
>>
>> Looks good, but what are the symptoms of this in practice?
> 
> I discovered this while testing my SEV-ES patches. When I specified the
> '+svm' feature, the new SEV-ES reset address for the APs wasn't getting
> set because kvm_arch_put_registers() erred out before it could call
> kvm_getput_regs(). This resulted in the guest crashing when OVMF tried to
> start the APs.
> 
> For a non-SEV-ES guest, I'm not sure if other updates could be missed,
> potentially.

Ok, thanks.  It's certainly a potential source of bugs, I've queued the 
patch.

Paolo


