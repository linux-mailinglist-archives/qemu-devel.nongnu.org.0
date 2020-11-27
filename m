Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9B22C66E9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 14:36:48 +0100 (CET)
Received: from localhost ([::1]:34852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kidvb-00054R-5N
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 08:36:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kidqX-0001fy-0B
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 08:31:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kidqR-0001Np-Dl
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 08:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606483886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VSoCQN9LBKnAq1K8c60N6ZFeYIVSzJRCltBojK0Rlbw=;
 b=PZEEKGQF3zZrvkmZBaoiLtVj/6ZF0/qOpRluN5vt3L7jaBSMNndb4rdUb3fktnsAfO3VPA
 YSc0iP2b/vj02QayoCm5+T3O/yExT/qkmGgXnNTAN3Vza4on0ROq6+7X2YGABU3BzWv49C
 +eKAH16waowrnMfDc9uLJpEYcW/wWjw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-If4Sc_QMPZeK_MmqkWLUiA-1; Fri, 27 Nov 2020 08:31:22 -0500
X-MC-Unique: If4Sc_QMPZeK_MmqkWLUiA-1
Received: by mail-ej1-f69.google.com with SMTP id t4so293105eju.0
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 05:31:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VSoCQN9LBKnAq1K8c60N6ZFeYIVSzJRCltBojK0Rlbw=;
 b=KIjKvwYmGgza2EDcZ7m8i25dharKF6K5rXnlPdo+15HtjgMOQauv4D9dPaeA+VthCA
 r90cD1Om5Sb+S/8FfrwWSy8cPYV5UvYiiHON/aCFvBv6tHoR9AeyoqBoYi7/lEAOoezz
 C/zXIXY9j1T8rnQCbNiPwfIgYgB1zlGTLOGax7okwL8kN6liaZqJiO5H6J5y7P5E2ovD
 3qPFpoeijSEP2LYk1vgsoiMS0h8ut6E1p94jyLEhfYorWFx+v6XuWCW6oeyJsa9OZzmN
 WLsfxOg1JWUF3s5M0wfZgb+iac6KnGr1roOVjSRNJgvnByNadyvWkA+6ZDz1huFkqLI7
 4hkw==
X-Gm-Message-State: AOAM531WhL4k3f3Xc4nA1ggoFKFgMOo7n1VZgAD672PK2hKSs160QhpG
 in/4h+QPCtMV8J9zLB6O0MQ+ujF6u8HI8ChiOZUfIZj/5ZBmbrwgeQ4X6IkteUnPyer1QX67FH7
 ns5aQk3M/vSj2VIw=
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr7811633edt.204.1606483881077; 
 Fri, 27 Nov 2020 05:31:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9apks/K8m6ghY4hoYgWtl5uXcJg/ZVaLUb0T7/qhG83UZ+0VRpgTMG5o7viaEtDDytOekMQ==
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr7811593edt.204.1606483880888; 
 Fri, 27 Nov 2020 05:31:20 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id eb14sm4848486edb.20.2020.11.27.05.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 05:31:20 -0800 (PST)
Subject: Re: [RFC v6 10/11] accel: introduce AccelCPUClass extending CPUClass
To: Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201126223218.31480-1-cfontana@suse.de>
 <20201126223218.31480-11-cfontana@suse.de>
 <6cbd508c-b24b-3219-3302-196dfefaa8f7@redhat.com>
 <d43db8fc-ae7f-0f5f-2e3c-5aad1930f732@suse.de>
 <b5da5096-da08-0856-a69a-12db19c40f67@suse.de>
 <925030fe-4a98-cfb2-ead6-b4b5dbe581ca@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5415cf3a-d25b-1a8f-6388-5b665f777237@redhat.com>
Date: Fri, 27 Nov 2020 14:31:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <925030fe-4a98-cfb2-ead6-b4b5dbe581ca@suse.de>
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
 "Emilio G . Cota" <cota@braap.org>, haxm-team@intel.com,
 Cameron Esfahani <dirty@apple.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/11/20 12:41, Claudio Fontana wrote:
> This seems to be due to "-machine none", is machine none supposed to
> have no default cpu_type? Is it expected that for machine none
> current_machine->cpu_type is NULL, or is it a bug?

"-machine none" has no CPU at all, so I think anything is acceptable. 
There's also the possibility of emulating big.LITTLE machines in the 
future with >1 cpu_type, so the cop out of doing it on the whole 
hierarchy is easiest.

Paolo


