Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319DB2B4EEC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:12:18 +0100 (CET)
Received: from localhost ([::1]:48586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keizB-00048D-7H
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1keix1-0002hp-Dn
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:10:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1keiwv-0007UH-7U
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:10:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GIFV53zQFLU+Cuk+mK8udHxZ0BakVben5sR1NOOPdzU=;
 b=M0CnI/3y149HQlviziFq2RqiIPrx+sJKiBUB5kn9aUBDdgtr7O7SSvObyuQyyhNd2XFSyu
 2a6RgGanshA27q+fPd3tA7ll4iCSw7wOUv6qernI05DM+inakBbo0XvdbmI5SDWCtANoQL
 0XRUNd8uHN+3PDA+Hdtg4bQ55723wsg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-yIu2GZS_MTaVdm7SEPxfSw-1; Mon, 16 Nov 2020 13:09:51 -0500
X-MC-Unique: yIu2GZS_MTaVdm7SEPxfSw-1
Received: by mail-wm1-f72.google.com with SMTP id h2so73671wmm.0
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 10:09:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GIFV53zQFLU+Cuk+mK8udHxZ0BakVben5sR1NOOPdzU=;
 b=paomjo2/OvGlxJ+71uJS2cmTq1B7apMjRgUmwiw888AGGVDxilwOG0+IiQudkWd0O5
 SU51Dj1ac0n1hey9sSqIPThjtrE/jm8RS9OOPzIFhzQkn45WUv4hgd/n814Ji0JLx15r
 JlUcEYC58jlSNf5uFJaTy+cknE6LeJAVrzZbtMNhEe2LlPj7Q3qCZHXQWR3kTbkrTJ4D
 wBdHuEmSehubYppubtiyH+VI22zqufce7ZgqNnr/9m6+E+AKTF/j56T76iBFA35CmTpz
 h3pPq3NHNLKi7CNpgn7KFOu3YOhl/vlPcPZCA1me4rC9ai+9/oRaCMXINs01COCVQRV6
 jQEw==
X-Gm-Message-State: AOAM531C9TRxJflj82NLe2K01D94y1uUQALmlT+CQ92roWP4DqU24or7
 p/pmPLbW9fivtVuwX0Tb/18mfYpBi/oEYcAnk2VuCGPmy3P7o4Kc7yKyP1AjZXA46kZv4a+V/cb
 8yNR/LTws6mvt4og=
X-Received: by 2002:a05:600c:2244:: with SMTP id
 a4mr143004wmm.144.1605550190762; 
 Mon, 16 Nov 2020 10:09:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8voa0U785E/TVlZInUE54gWinMnCsSO5znB4tr/qYHX2ypKNC8m+RmnHzV+KwIie+vPZwww==
X-Received: by 2002:a05:600c:2244:: with SMTP id
 a4mr142982wmm.144.1605550190525; 
 Mon, 16 Nov 2020 10:09:50 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m21sm928130wmi.3.2020.11.16.10.09.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 10:09:49 -0800 (PST)
Subject: Re: [PATCH] kvm/i386: Set proper nested state format for SVM
To: Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <fe53d00fe0d884e812960781284cd48ae9206acc.1605546140.git.thomas.lendacky@amd.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a29c92be-d32b-f7c3-ed00-4c3823f8c9a5@redhat.com>
Date: Mon, 16 Nov 2020 19:09:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <fe53d00fe0d884e812960781284cd48ae9206acc.1605546140.git.thomas.lendacky@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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

On 16/11/20 18:02, Tom Lendacky wrote:
> From: Tom Lendacky<thomas.lendacky@amd.com>
> 
> Currently, the nested state format is hardcoded to VMX. This will result
> in kvm_put_nested_state() returning an error because the KVM SVM support
> checks for the nested state to be KVM_STATE_NESTED_FORMAT_SVM. As a
> result, kvm_arch_put_registers() errors out early.
> 
> Update the setting of the format based on the virtualization feature:
>    VMX - KVM_STATE_NESTED_FORMAT_VMX
>    SVM - KVM_STATE_NESTED_FORMAT_SVM

Looks good, but what are the symptoms of this in practice?

Paolo


