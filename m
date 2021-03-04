Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A4F32D421
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 14:28:37 +0100 (CET)
Received: from localhost ([::1]:38554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHo1q-0003Tu-RK
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 08:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHnzZ-0002m8-IB
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 08:26:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHnzX-0003sm-W4
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 08:26:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614864371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=epVabmFghWRYjAezRywLsA7F665VoAppwPqPKAd51DQ=;
 b=ffFc/Db/ZmkzR190hlHEPPE24RqsWOZE5VBAj3cTK+z7ntiUC3RqozKPQzbf4yJrBqaYPI
 HUmi4iSCafZTSxrwWBCqjd+oCCEhx31mu/lbo6vSRExY1Dj8k4SFKAbFWOGoCpb4G7M9Ko
 cj76mWn9TEjsMiN5vTb+6scbG2I3lQg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-eWc-O8yDPS-jJ7M3ipfqzw-1; Thu, 04 Mar 2021 08:26:08 -0500
X-MC-Unique: eWc-O8yDPS-jJ7M3ipfqzw-1
Received: by mail-wr1-f72.google.com with SMTP id z17so6189489wrv.23
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 05:26:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=epVabmFghWRYjAezRywLsA7F665VoAppwPqPKAd51DQ=;
 b=azNMCrnkxgmQFbcCgR3gFtXV3r5dfkG0Mu+Ix3Jup/ZIVJrV3WSwzUzehnLJsifYu/
 ABjdWN2dgH6nzuAESyp7v0NHfAtyX6VOPJkzs36Z8sei43qjLtTflfxh0h1IxIe8bRUo
 BBZXeHsb4+KIqWrod0NtSr2ybMZYWk89lX4km57J948Y4zNulmXCIsOueGxmC3Y+YMbJ
 nKUi8oDjB49SISbxrL0jdyi4DySLGkJQNFC/co0ueg5pmAPEAoSZLTnKmajLMJu7t1KZ
 p60qrJy68d7VdNQBCK7woKAosbTMSK9apc8UaXKyV9OMY4pbJwjT+ghRAEJVp13VGBJh
 NI+A==
X-Gm-Message-State: AOAM5334o4qA6x+zLGNjk6F9gUwBgJo06K+3mUcxPXlylUy+68Flymyk
 MoOfhtvSGaL1ELq6D0QvhKF9ryyHWRNzq4iDgBjc1MTwb/ffze0p6ekbZEo/+QCgc/u72AWM2Mq
 TnGVQ4N/pYTeuK7Y=
X-Received: by 2002:adf:9148:: with SMTP id j66mr4187989wrj.124.1614864366780; 
 Thu, 04 Mar 2021 05:26:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6E/KhoVFWABDvp7oRh4xY4g/xgOk4pjLukA9kWhjiqDC3l2ucy7xQysr1rX+UMEREr0a4CA==
X-Received: by 2002:adf:9148:: with SMTP id j66mr4187941wrj.124.1614864366510; 
 Thu, 04 Mar 2021 05:26:06 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g11sm24741248wrw.89.2021.03.04.05.26.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 05:26:06 -0800 (PST)
Subject: Re: [PATCH 04/19] cpu: Croup accelerator-specific fields altogether
To: qemu-devel@nongnu.org
References: <20210303182219.1631042-1-philmd@redhat.com>
 <20210303182219.1631042-5-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <be8823b0-3d58-e7d1-d2a9-447d78bdb50e@redhat.com>
Date: Thu, 4 Mar 2021 14:26:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303182219.1631042-5-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 7:22 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/core/cpu.h | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Typo in patch subject "Group" ;)

> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index c005d3dc2d8..074199ce73c 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -393,10 +393,6 @@ struct CPUState {
>       */
>      uintptr_t mem_io_pc;
>  
> -    int kvm_fd;
> -    struct KVMState *kvm_state;
> -    struct kvm_run *kvm_run;
> -
>      /* Used for events with 'vcpu' and *without* the 'disabled' properties */
>      DECLARE_BITMAP(trace_dstate_delayed, CPU_TRACE_DSTATE_MAX_EVENTS);
>      DECLARE_BITMAP(trace_dstate, CPU_TRACE_DSTATE_MAX_EVENTS);
> @@ -416,6 +412,12 @@ struct CPUState {
>      uint32_t can_do_io;
>      int32_t exception_index;
>  
> +    /* Accelerator-specific fields. */
> +    int kvm_fd;
> +    struct KVMState *kvm_state;
> +    struct kvm_run *kvm_run;
> +    struct hax_vcpu_state *hax_vcpu;
> +    int hvf_fd;
>      /* shared by kvm, hax and hvf */
>      bool vcpu_dirty;
>  
> @@ -426,10 +428,6 @@ struct CPUState {
>  
>      bool ignore_memory_transaction_failures;
>  
> -    struct hax_vcpu_state *hax_vcpu;
> -
> -    int hvf_fd;
> -
>      /* track IOMMUs whose translations we've cached in the TCG TLB */
>      GArray *iommu_notifiers;
>  };
> 


