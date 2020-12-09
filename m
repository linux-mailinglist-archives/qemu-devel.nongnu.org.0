Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C87A2D3ED2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:33:44 +0100 (CET)
Received: from localhost ([::1]:42916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmvqx-000765-NT
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmvp4-0006N8-Ue
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:31:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmvp3-0001Mq-7C
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:31:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607506304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iS1BqaIEZiIjrvvDXbaEexlgZAlxmxOB/DV0tuwokfI=;
 b=En1GtDtNbhA5mLkZXkGHT8BP30UhJTBhmfztAMIEEu3OFg4nAv4+FamPYWftKrP67jxcbB
 f+vJbBLyZfoh73HKSryDGbhGppWJSXelYnduKLpOE/6euN5AhNUKFFRWxpsxRdEK0j8FnG
 +eLJXzVCY2L6PSFVLAGGSjHBjVRYitM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-IBV7yVlENpyQ_rierSZvIw-1; Wed, 09 Dec 2020 04:31:40 -0500
X-MC-Unique: IBV7yVlENpyQ_rierSZvIw-1
Received: by mail-wm1-f71.google.com with SMTP id a205so156442wme.9
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 01:31:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iS1BqaIEZiIjrvvDXbaEexlgZAlxmxOB/DV0tuwokfI=;
 b=N/Gj4+HYK8A/1N3870DYl2OYc+8bhOs93OQMkdCUvR7iarKSDllPGICQlYALiI7Zgh
 9/40T/3tFd5nXoeyUpSPwQAGCxbbZf6yk7Cnn75kCtYEy+lvNiqEPsJCi0eOOPeub4dm
 TDMJ6mmGASkZzxYd92VyTWgTuZAnGkwRMg8K7DQvt6W9osmJaPLsenfMMPZH+UqjNZ+f
 zS+1FQ4euc2qzME/1gtOWyBlEwiTgYKgsNguMdheSvRP5ObEoQkW2ovTKTfJWlP8a1QV
 uYc2AV2sRfc6U/XlU1+Z0ad5sIYYBgveGXgEzcN/AoD3MLB8IPHavSRyhx9NliZDdWiv
 anyg==
X-Gm-Message-State: AOAM5338iK8FhicjTRPr504ArHUiJ1gTwghTpMk0p/lig/U6yukXEdD4
 1GClN7lm5/9rOSQY3RwnaOFLY0aEC0jvaMkNBmrSuD7OJcVbHSZ6xKzZg5n/pZ7yQBL0HGuRw3A
 7Wm05ZZd/jZowghQ=
X-Received: by 2002:a1c:7710:: with SMTP id t16mr1707622wmi.11.1607506299651; 
 Wed, 09 Dec 2020 01:31:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0Wkw/RbwMG3o5WA9fjnrALcFY1JuFD0Wl+eMg0jJwStVXGzmkcIGrc091A+rLhdyKeI5+sg==
X-Received: by 2002:a1c:7710:: with SMTP id t16mr1707601wmi.11.1607506299522; 
 Wed, 09 Dec 2020 01:31:39 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id r128sm2371999wma.5.2020.12.09.01.31.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 01:31:38 -0800 (PST)
Subject: Re: [RFC v9 24/32] cpu: move cc->transaction_failed to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-25-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <18ac9b63-4e35-cfc2-24f6-b61ee5d201b4@redhat.com>
Date: Wed, 9 Dec 2020 10:31:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201208194839.31305-25-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
...
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index 6b9b72e785..0cc0927738 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h

Missing (for MemTxAttrs/MemTxResult):

  #include "exec/memattrs.h"

> @@ -40,6 +40,15 @@ typedef struct TcgCpuOperations {
>      /** @do_interrupt: Callback for interrupt handling. */
>      void (*do_interrupt)(CPUState *cpu);
>  
> +    /**
> +     * @do_transaction_failed: Callback for handling failed memory transactions
> +     * (ie bus faults or external aborts; not MMU faults)
> +     */
> +    void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
> +                                  unsigned size, MMUAccessType access_type,
> +                                  int mmu_idx, MemTxAttrs attrs,
> +                                  MemTxResult response, uintptr_t retaddr);
> +
...


