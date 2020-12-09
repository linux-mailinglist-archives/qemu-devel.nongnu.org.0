Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5DE2D3EC4
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:31:33 +0100 (CET)
Received: from localhost ([::1]:40124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmvoq-0005pR-CC
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:31:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmvmL-0004aI-9p
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:28:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmvmJ-0000Ll-Dt
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:28:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607506134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ITFK4ZWZ6LrHTTbHOby8mbyj25z/6uyJhEN2D2FVTfM=;
 b=Weqj2F40mSIOAmdX9yaY65cwO/Tz9sX1lCQ8oruaxL282D+Uc4ZiaHNYInenss7LGz1/EN
 dGUIvYnUrUDCI9z7kDqRj0rTN/wxfycNTzW1EcrwlNojri031pqnKq4sXB12LgliJ6FcWM
 oGowD3FKpg3LMmjuFtnl1sN1qTuE1Mw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-P9mbe6eRMUmRnuuFOulHZA-1; Wed, 09 Dec 2020 04:28:53 -0500
X-MC-Unique: P9mbe6eRMUmRnuuFOulHZA-1
Received: by mail-wr1-f69.google.com with SMTP id w8so420082wrv.18
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 01:28:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ITFK4ZWZ6LrHTTbHOby8mbyj25z/6uyJhEN2D2FVTfM=;
 b=BoLEDaAF9kyHSy5sHBaeUoZdsEpJ/4WmNEq4RDhmEcY2zgJrYhjK/0Gl0vDHUwri8y
 pjtDNUIY4ta13hLrSJj2NmWLSiO7TJdY1Q1XFazEujJYq7lhr92jaB/jt4dDG2omch14
 K2+of5uWOPYyAa2PBXW1It3QOchL594ebdAksAuqupXwiZfwjJV9XDwXMMKudnkjvLhW
 zi+3E+VpM4jjjQRyHqLwnOsiXKFCNbSGp1vli9/Ue8GdqmLauQ+ycGUYb+9j9wjYSybw
 pkQVyH0YeTG8BW8yC2KAfEPl2Laiv+9reEGfpPACsYB1uAUsfrjDsu15wcpwNKf3L4Dr
 xgvA==
X-Gm-Message-State: AOAM530e6LsdeJ8XNc52pMjlhc4W5iPbukvaV/6l1RSEW0hJibp3sAln
 iT2cyDLR2MnpIPL5HcnbyijgLpvJTLm7sLBdHY7h8xMwyD3dG/vCOfLOgNfLjts5VKtm7csS/y1
 0U8Wkgi2HZyXfQJ8=
X-Received: by 2002:a5d:4c4d:: with SMTP id n13mr1620582wrt.356.1607506132071; 
 Wed, 09 Dec 2020 01:28:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOANPADmWR+qcX7eZaLiZMg+Cs2YzMgYwmCigdb9vbv1euesb5/hnLgqx1Bsjy98tuuApr4w==
X-Received: by 2002:a5d:4c4d:: with SMTP id n13mr1620560wrt.356.1607506131951; 
 Wed, 09 Dec 2020 01:28:51 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n126sm2214537wmn.21.2020.12.09.01.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 01:28:51 -0800 (PST)
Subject: Re: [RFC v9 19/32] cpu: Move cpu_exec_* to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-20-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e6a0a0b9-da4e-60fa-050b-62ee7da9628f@redhat.com>
Date: Wed, 9 Dec 2020 10:28:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201208194839.31305-20-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 8:48 PM, Claudio Fontana wrote:
> From: Eduardo Habkost <ehabkost@redhat.com>
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> [claudio: wrapped in CONFIG_TCG]
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
...

> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index 109291ac52..e12f32919b 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -10,6 +10,9 @@
>  #ifndef TCG_CPU_OPS_H
>  #define TCG_CPU_OPS_H
>  
> +/**
> + * struct TcgCpuOperations: TCG operations specific to a CPU class
> + */

Oh, added back ;)

>  typedef struct TcgCpuOperations {
>      /**
>       * @initialize: Initalize TCG state
> @@ -28,6 +31,12 @@ typedef struct TcgCpuOperations {
>       * @set_pc(tb->pc).
>       */
>      void (*synchronize_from_tb)(CPUState *cpu, struct TranslationBlock *tb);
> +    /** @cpu_exec_enter: Callback for cpu_exec preparation */
> +    void (*cpu_exec_enter)(CPUState *cpu);
> +    /** @cpu_exec_exit: Callback for cpu_exec cleanup */
> +    void (*cpu_exec_exit)(CPUState *cpu);
> +    /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
> +    bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
>  } TcgCpuOperations;


