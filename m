Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8182D7DFD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:23:55 +0100 (CET)
Received: from localhost ([::1]:32882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knn58-0000sn-Jm
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knmZ8-0004Vz-8y
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:50:50 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:39212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knmZ6-0000CV-II
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:50:50 -0500
Received: by mail-oi1-x241.google.com with SMTP id w124so7599620oia.6
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 09:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EqhuRUZhBLLCIuFJVTk6bzOsQEX8bcT4bJOBTe/2Ukw=;
 b=sQMUaXFfuMu2oatPL9SZ6sdSdiqNwMwRIURP4FpzQMgqpRizTdhw2VKjumU+8qfeG5
 vjDqujBLi3FWpcO0Pq2LIpE64p79qEV3o47Y0Zg3OHmOuDVGHqt9pxTznVM+YCT9+ztk
 pfFT4zxnG1siPXuuNHcICcTfu1lXqtKXJtNvS+o//TSp2UE7nUDLy9EdGhp3QnRFrKmr
 YAD3GBxR6RwacmRCO/JEDrtU/T7sgbDUTijTKswO5/xXstdhsu01iX98licZ3qA0i/qk
 gWuRU32Keg5utc6SN55YMuNJmsvbE7C3IvnHOEweBoiWcRbN7gLz05W5cPWPPkIeMty3
 fa1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EqhuRUZhBLLCIuFJVTk6bzOsQEX8bcT4bJOBTe/2Ukw=;
 b=EeU3xPuVLi4aMvY4X+ckviy5tldwhjE6Qmv5UrupjwGn6UQ9X6eRrBqlcEPOQCApLR
 jGjIx+BoGS2XXCggi4yRVkuFHWoeVNkd7VU4Yqih+aZIamAGjEgRZ3bu/PRSbNzay4Fl
 wi3tIKd0hBzvLsU2t1JQvFoHS/UCkxIts9LlRRnrWs/yVKeAzT11AiEcdghbVmVUqWWa
 KeJPf1o2txHZHceE9hnkcNBLF1ArC2V5YsuM3XFBAX+tHgYOontk5JQLmKcpAl7cOVcA
 BU9HNvKriXBmaRqNO6LOWciRpUDDjYLvnPebnJkyPs+MjLMRbkw185Wvsqz40GVOWznW
 Di0w==
X-Gm-Message-State: AOAM530MrcqIY/3b2aSCwVGcXyheS9e8rHzTByc5oRpWQ9wlervjp+Y+
 dREqALdxvexcaqqTA1j+Qb10BA==
X-Google-Smtp-Source: ABdhPJyKklGSnxMwn2fIpJGDrUEY+tWXt92mf5nb7ZDBERxBEXKrh2xee+P7MqEdBsfItliByhSmlQ==
X-Received: by 2002:aca:578d:: with SMTP id
 l135mr10102665oib.105.1607709047220; 
 Fri, 11 Dec 2020 09:50:47 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id j126sm1957515oib.13.2020.12.11.09.50.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 09:50:46 -0800 (PST)
Subject: Re: [PATCH v11 24/25] cpu: move cc->transaction_failed to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-25-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d5ae24dd-26c7-cbc1-d0e2-f2dc17939480@linaro.org>
Date: Fri, 11 Dec 2020 11:50:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-25-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:31 AM, Claudio Fontana wrote:
> @@ -848,7 +842,7 @@ static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
>  
>      cc->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
>  }
> -
> +#ifdef CONFIG_TCG
>  static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,

Keep the whitespace between functions.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

