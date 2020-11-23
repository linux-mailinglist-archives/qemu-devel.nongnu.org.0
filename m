Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E4C2C0A67
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 14:26:30 +0100 (CET)
Received: from localhost ([::1]:53434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khBrR-0003ck-NZ
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 08:26:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khBjj-0007fI-7O
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:18:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khBjf-00048e-Ak
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:18:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606137504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iFrual0+y43WzNcQQwXcEh2TCMH7ybN+AICOrQHBE3I=;
 b=HuCf3bLhz81mUbPT5HSN7u0mUbWerMwx/s9hCdKksCQa6BZ/dDYV5ezjRwMeyON1cq0CLP
 Kvp+r658GBMtzOHzXJC2TEIbZ5amsQ316e3Kcs4pVbDDQpHbutvOFfomebyMWJYdRWtUSd
 iLQZff12PRTixpZ6uUOo+UvJAUdHeVA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-o3kKTuQwO_up0NEproZPMQ-1; Mon, 23 Nov 2020 08:18:22 -0500
X-MC-Unique: o3kKTuQwO_up0NEproZPMQ-1
Received: by mail-ed1-f72.google.com with SMTP id b68so6582092edf.9
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 05:18:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iFrual0+y43WzNcQQwXcEh2TCMH7ybN+AICOrQHBE3I=;
 b=jZRy48mjdyuKuhia1CQsYR0Jg/QVtXBWMZssyQbn4eM+e3zaCqevAD+EDK/0fzUzHJ
 V2Qis47ZVNkIjSJEBjXFEp492HWnXP65i+S9GRUISpYPKLfzrsOXvntPSGvnRKkr3QmH
 wLNkMVkbi9Ha9eiVyiYVP/baEUwsybt54CgiK3VSwWSicOJ8XcMm6/9RFjTNK/0T6VEr
 gigVXgG2iUybupoMgkqY4nidAgeaFdcC/6aPNxhH/PS6dOItvLXp78frhm/HzUfL6p5f
 iAVFpuMZb8Nt9VuLIqqBRWKof6qUVCtTUy7Zn3af/dPMF0fm975OhpbhPLWyhPAHCdjT
 9PDg==
X-Gm-Message-State: AOAM531ZhooZmAN9Im86o3wjklfWlXYNv/xDgKkMUMIHyVlS08GPofoH
 vNGPdAZDmcrqbeIO41YO64xaf4EvMbXxm2djTEOv2QH1AUsco2rVbJG5rPP4jW25S5/YUMEjiZc
 eYmpziORxh9uVs0k=
X-Received: by 2002:a50:9e05:: with SMTP id z5mr45108795ede.231.1606137501018; 
 Mon, 23 Nov 2020 05:18:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxEibOMEJJnDJBWf1A7JO/WKPl04wQiMKJ0sB75BbJ7FAsCmAAV4kUBueMmqraLP0AYdAeJeQ==
X-Received: by 2002:a50:9e05:: with SMTP id z5mr45108777ede.231.1606137500791; 
 Mon, 23 Nov 2020 05:18:20 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm4557843edy.62.2020.11.23.05.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 05:18:19 -0800 (PST)
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
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bd5d6bd7-a4a0-9f38-94ca-14f39e538e70@redhat.com>
Date: Mon, 23 Nov 2020 14:18:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <3e8fac27-aea5-5f5d-5421-291df660a586@suse.de>
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

On 23/11/20 10:55, Claudio Fontana wrote:
> One idea that came to mind is, why not extend accel.h to user mode?
> 
> It already contains
> 
> #ifndef CONFIG_USER_ONLY
> 
> parts, so maybe it was meant to be used by both, and just happened to
> end up confined to include/softmmu ?
> 
> Basically I was thinking, we could have an AccelState and an
> AccelClass for user mode as well (without bringing in the whole
> machine thing), and from there we could use current_accel() to build
> up the right name for the chosen accelerator?

Yes, extending the accelerator class to usermode emulation is certainly 
a good idea.

Paolo


