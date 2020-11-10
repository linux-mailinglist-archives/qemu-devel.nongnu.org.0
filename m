Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8622AE0D4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 21:41:21 +0100 (CET)
Received: from localhost ([::1]:34422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcaS6-0006Si-05
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 15:41:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcaQe-0005pX-NS
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 15:39:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcaQc-0000iS-K6
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 15:39:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605040785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JcZAR2d895Z2fmsfSPTk5RAAkqR5b4U0jWw+76x75tU=;
 b=TktzaZ3RSsLZ7y3UCfiddMgxutH9dc/STxv7M0i9SK7JmGCI6L+s4EVRaB4ZaOd7WcyqqN
 Vm3+B21aHLepddMbNwetMv3o4NBY1U1Re+S7XolaL8KdtPmD3MIV0he507XlG97mDUUpSn
 FBo68+ei7rg3hlNI7skXwTtAudhh2oE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-wSlhZBAqOjucoaBFIz9k9A-1; Tue, 10 Nov 2020 15:39:42 -0500
X-MC-Unique: wSlhZBAqOjucoaBFIz9k9A-1
Received: by mail-wm1-f70.google.com with SMTP id s3so1757305wmj.6
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 12:39:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JcZAR2d895Z2fmsfSPTk5RAAkqR5b4U0jWw+76x75tU=;
 b=ea3lv0QtsaHwlBQ9uVWBQLCDqWku3LISdHxcdnhemG2Ly84KEgxhlTUcOQ3Zyg9XKo
 5ZSQlDMP8WHLrgSnLxTIPk7KCR76qZ8aN532xrJbSRgIcyMxm8GvhPQeJxzsN2e/WtPu
 kBuXOhEIlYlAdE32ZDLVP7OT670Gpq2v/0/kyeuLRZiYoXmXR07I8+1ZvXxKRWnF02/i
 Wd9YjT/lf97d0tOh3HfAvPJxHsXVk68kh186PrDs7+suk83vNsidMmBa9bOwhGmVNURw
 ikWTBtxLqKriApKCTTyBjsEGVAoH3E+rEyAKZ1LgvBT598pJjhB6hrE2yYmm5BhAfaB0
 QSjQ==
X-Gm-Message-State: AOAM530OsYuZA0HxVTmcaG8+J2lfSC6/cJcEots4DiHBzdIze82QDPEu
 IZEY0wKNSmuXrnqbx+RK+3fjFainFAxe7qvS9Z4GH3fsMWGQwS7Re5dWUZqk84skwkKkqm+wQBi
 etSRObvXJNZuDcBE=
X-Received: by 2002:adf:ed04:: with SMTP id a4mr27382010wro.172.1605040780668; 
 Tue, 10 Nov 2020 12:39:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPcLAvvrrDnK3nVXPgKVAAVkfWTi2OigBZfQ4NuESIk+eWvqTuHQWMxRhBKiS7KRXYA5auGw==
X-Received: by 2002:adf:ed04:: with SMTP id a4mr27381973wro.172.1605040780435; 
 Tue, 10 Nov 2020 12:39:40 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id y2sm18683809wrh.0.2020.11.10.12.39.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 12:39:39 -0800 (PST)
Subject: Re: [RFC v1 09/10] i386: split cpu.c and defer x86 models registration
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201109172755.16500-1-cfontana@suse.de>
 <20201109172755.16500-10-cfontana@suse.de>
 <20201109180302.GB814975@redhat.com>
 <971cfde9-d24e-a3dc-6389-8a7c9e477f63@suse.de>
 <20201110100438.GF866671@redhat.com>
 <c4c56c06-7530-5705-9ce8-5eff8cf1a0d3@redhat.com>
 <20201110152314.GF5733@habkost.net>
 <8bc35f55-159f-5037-3355-12bf4fd48e74@redhat.com>
 <20201110175520.GI5733@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ce84dd58-a924-f022-905a-5b392e26fa46@redhat.com>
Date: Tue, 10 Nov 2020 21:39:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201110175520.GI5733@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
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
Cc: Laurent Vivier <lvivier@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Bruce Rogers <brogers@suse.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/20 18:55, Eduardo Habkost wrote:
>> I think we should not try yo implement interfaces conditionally (i.e. have
>> TYPE_X86_ACCEL implemented only on qemu-system-{i386,x86_64} and not
>> qemu-system-arm), even if technically the accel/ objects are per-target
>> (specific_ss) rather than common.
> If the accel objects are already per target, it seems appropriate
> to have a QOM type hierarchy that reflects that.
> 
> `qemu-system-x86_64 -accel kvm` would create a kvm-x86_64-accel
> object, but `qemu-system-arm -accel kvm` would create a
> kvm-arm-accel.

... and fall back to kvm-accel?  So accel_find would be the only place 
to change.

Paolo

> *-x86_64-accel and *-i386-accel would all implement
> INTERFACE_X86_ACCEL.


