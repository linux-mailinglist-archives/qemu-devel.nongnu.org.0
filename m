Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E70C2C31D0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 21:17:05 +0100 (CET)
Received: from localhost ([::1]:44818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khekK-0005Jl-4f
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 15:17:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kheiL-0004ks-8A
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 15:15:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kheiH-0002ev-6Z
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 15:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606248895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+s6RknyoCHCesGi1XF6lZ6AoTEY4+QJYFoigZEvaD6Y=;
 b=aSRNFNwNMada0DykYKWqjSdBvRovTci3UpxF9QC71p3FOtQ+H3suFy9f9ltMWZZ2Gt/slh
 DvIqZKaBvHurp55Vip0etC58nso30MnnSzM2BIfJpvSJfPDvrxzf8l7UyZ62yEVz6+1a+X
 ffbdpkclow9zJgRTft9EApK7Wik9t5w=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-n1Yav5-rO4O_mL1-qHzPrA-1; Tue, 24 Nov 2020 15:14:53 -0500
X-MC-Unique: n1Yav5-rO4O_mL1-qHzPrA-1
Received: by mail-ed1-f71.google.com with SMTP id i89so55926edd.15
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 12:14:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+s6RknyoCHCesGi1XF6lZ6AoTEY4+QJYFoigZEvaD6Y=;
 b=LAQpuBna7NdFu9YJVdDDN0MC+3gdkgZYAxxDlA56UItQ0qLYdmbZvf52AjfsoDnRTo
 iv3ZlPrpBbqpdvrC5PVW+X+Frt4TLB3e44qqa+QKjthmPu9CIitXSNKy4evvVFFviVT7
 bJ+Gxxk0+L2o9D08LO8dSa6hjbZFrBewiKDZ5c+XFHmiprASil5Lvb4lEEheXQWCus4g
 MHEv3GQ2GXYhnxFEtm/cml9M+EeoNFG0hcPUg2ya4a2+ru0fSXM7ki643S6y7wJbGxVc
 7c5YcWdUaM0U13qyUEj3O++I3/2zleX0m9nvf3bSniXTdAziuTLhB5ER2FZU1HPOfJ6n
 8M0w==
X-Gm-Message-State: AOAM5323xxfmI+jZbiugYyj82mktQkEqcx3Fa4au0Fp9lrtE3BJU5d1p
 2V/lJAriPTO7PankF7PK3lCszU7vqAo2u2zsjLlO8v+BPvEjLdmIev/q/XmGXoCog9Y+ozv0b/m
 Djk3kM/QtASCJrcg=
X-Received: by 2002:aa7:c889:: with SMTP id p9mr230778eds.110.1606248891989;
 Tue, 24 Nov 2020 12:14:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsi57rpS4LVFQDOT/qB+/RPcOnxclcknab4pXXLmlAygyz5hsjVAMLYyRTpZKOw0agK0AARw==
X-Received: by 2002:aa7:c889:: with SMTP id p9mr230748eds.110.1606248891826;
 Tue, 24 Nov 2020 12:14:51 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j9sm19755ejf.105.2020.11.24.12.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 12:14:51 -0800 (PST)
Subject: Re: [RFC v5 00/12] i386 cleanup
To: Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Emilio G . Cota" <cota@braap.org>
References: <20201124162210.8796-1-cfontana@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e34b0655-e1cd-c581-1362-62a4920d7046@redhat.com>
Date: Tue, 24 Nov 2020 21:14:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124162210.8796-1-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/11/20 17:21, Claudio Fontana wrote:
> In this version I basically QOMified X86CPUAccel, taking the
> suggestions from Eduardo as the starting point,
> but stopping just short of making it an actual QOM interface,
> using a plain abstract class, and then subclasses for the
> actual objects.
> 
> Initialization is still using the existing qemu initialization
> framework (module_call_init), which is I still think is better
> than the alternatives proposed, in the current state.
> 
> Possibly some improvements could be developed in the future here.
> In this case, effort should be put in keeping things extendible,
> in order not to be blocked once accelerators also become modules.

It's certainly getting there.  Thanks for persisting!

Paolo


