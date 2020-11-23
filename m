Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446122C0E88
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 16:16:34 +0100 (CET)
Received: from localhost ([::1]:44020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khDZx-0002LI-79
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 10:16:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khDXx-00015x-79
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:14:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khDXs-0004SI-Nu
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:14:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606144462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fG5SDKsbH6cROg0Ek+YeXAW7acFgX4ZdoLzY4ITFJ4E=;
 b=Re0tGxOmVbVwZPBGTYcKY0dEex30ao7xSPKHBZ8YjxfyDgf11Z5fcRrLIrR6pKuEQ9WzxC
 5u8VBVdLbE+fcKaVgl0XMpvrZ5EJ5SLLROg5oYkdhmNpcXBKunQF08ttLMBT2Zznl4+wYU
 LsbRjtud5OHbSVwDTWX8NQk3WHTvJow=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-rqiijNjhMyGE7iAoDUNtjw-1; Mon, 23 Nov 2020 10:14:19 -0500
X-MC-Unique: rqiijNjhMyGE7iAoDUNtjw-1
Received: by mail-ej1-f69.google.com with SMTP id p6so5766230ejj.5
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 07:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fG5SDKsbH6cROg0Ek+YeXAW7acFgX4ZdoLzY4ITFJ4E=;
 b=l0wF4PSFH5FUvk9pCkV9LAigOPRPQCI94UyXZwQxDqGiz1+gNYn6P7uNOHmZNHsrFk
 QpXR2k04A8Uq004rDgNCGkQbwU4TO7WbjrJ+WYqviMUjGHkgaYsXkz27nRiJNafo2EK4
 gQL/FiBy2tmVil0SNm6wg0eK3J1vV0JQypm36PY2OzDFJuILkTfrl2CbLKdzliLb5Uot
 YUwg6LlDPd/objwfYZoeUbh9FlJa6+3Isewesrly219oqEL0fmBaZmXglyG1bUp4qtBG
 CAfpexnE+ZovbangX3qkUj2qGxvkN5zM8aovYBne4Bdn2yA2KNF4YY2x8ZQ81Q1vFuh2
 lzJw==
X-Gm-Message-State: AOAM531sUG960HPGaJsqZyJuu+Nd3owrSjc+pgtbOTFCQBEDD/y9d3Mf
 R0q5wGFNRo5YV/v86XDgfwi8q1wQr7LdL+6hJgQIszNXpH1cKzyh05nGlBNAyptuA/4eINpXnvK
 T5KZkbxrMRowXUCA=
X-Received: by 2002:aa7:c886:: with SMTP id p6mr46086236eds.352.1606144457608; 
 Mon, 23 Nov 2020 07:14:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOh8Nmpy/NR8hUailfbyT+mAAMZeF4ujh9zs7FYpgpL9o6tQWEPDSf4FYmgdVU64cfkMsxZA==
X-Received: by 2002:aa7:c886:: with SMTP id p6mr46086215eds.352.1606144457423; 
 Mon, 23 Nov 2020 07:14:17 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k23sm5107996ejs.100.2020.11.23.07.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 07:14:16 -0800 (PST)
Subject: Re: [RFC v3 8/9] module: introduce MODULE_INIT_ACCEL_CPU
To: Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>
References: <20201118152552.GG1509407@habkost.net>
 <CABgObfYL-TNAMmqkUh6cjcytaAFEtXPfw8toO6gXEuyokdyLhA@mail.gmail.com>
 <20201118161119.GJ1509407@habkost.net>
 <CABgObfb2Fim=7j3z7ApTuW=R0dWam2F_JRuOoxhP=XZXdsWe7g@mail.gmail.com>
 <20201118173055.GM1509407@habkost.net>
 <e7b70933-acd1-668c-62cd-89f480945f0f@redhat.com>
 <20201118220750.GP1509407@habkost.net>
 <2984625a-15ee-f638-b1bb-050a4514bade@suse.de>
 <20201120171942.GA2271382@habkost.net>
 <f780a9e5-2142-3bf4-b3fb-1bdeeed61945@suse.de>
 <20201120180936.GD2271382@habkost.net>
 <a32dbea4-8381-d247-3443-441b484d39e3@suse.de>
 <3e8fac27-aea5-5f5d-5421-291df660a586@suse.de>
 <bd5d6bd7-a4a0-9f38-94ca-14f39e538e70@redhat.com>
 <de219743-6605-8514-b54d-9e70f24a09c8@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ebe6f182-79da-1889-8d80-51f5f7ed85c8@redhat.com>
Date: Mon, 23 Nov 2020 16:14:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <de219743-6605-8514-b54d-9e70f24a09c8@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Bruce Rogers <brogers@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Wenchao Wang <wenchao.wang@intel.com>,
 haxm-team@intel.com, Cameron Esfahani <dirty@apple.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Dario Faggioli <dfaggioli@suse.com>,
 Olaf Hering <ohering@suse.de>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/11/20 16:02, Claudio Fontana wrote:
> Thanks, I'll work on this option.
> 
> Btw considering that CpusAccel for tcg is actually three different interfaces (for mttcg, for icount, and plain RR),
> it will be tough to, in the stated objective, "remove all conditionals", even after removing the tcg_enabled().

I'm not sure removing all conditionals is a goal in and of itself, but 
of course keeping the conditionals more local should be a good.

Paolo

> I wonder how you see this issue (patches for 3 TCG split are in Richard's queue atm).
> 
> static void tcg_accel_cpu_init(void)
> {
>      if (tcg_enabled()) {
>          TCGState *s = TCG_STATE(current_accel());
> 
>          if (s->mttcg_enabled) {
>              cpus_register_accel(&tcg_cpus_mttcg);
>          } else if (icount_enabled()) {
>              cpus_register_accel(&tcg_cpus_icount);
>          } else {
>              cpus_register_accel(&tcg_cpus_rr);
>          }
>      }


