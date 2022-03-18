Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0287D4DE001
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:32:42 +0100 (CET)
Received: from localhost ([::1]:34980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVGSt-0001pq-3Q
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:32:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nVGRi-0000kj-R9
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:31:26 -0400
Received: from [2607:f8b0:4864:20::42a] (port=42542
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nVGRf-0001wc-RV
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:31:26 -0400
Received: by mail-pf1-x42a.google.com with SMTP id g19so10018210pfc.9
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 10:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2MkPp5rz5yZTi1j0z10QZloHTdL88Uou16AjDa3o5sY=;
 b=SDQEBNki5gKAYc9bZ170XzbgZxvrP3s/hPC6jgXzN+LL3CWOhXRJQlo8PLKbrcXXTC
 EvbihEAiNZRsj9rerE4kUD7dDyvwepEMudAaCakGnF6PB44UcalJ61c9NCxk1pdspwwN
 kgtrDPIu98m8SnYdNgjshWljc5qdWkrkS6O093/NxOWw4SSoYXxiEtiZGAg7psb6u+3b
 VhvQtWPVKgshdDWBBgY/4c43pLNvHumXf5mWzwhwUiBYuhzQm/BQPa3rrRF9VASJQfwX
 0RHIMe8hiaPNPcoOIgMKD2l1Gz1xnwJgdzxbiVjp+QBU5/E8piKn8VzdlPFAG1frWPrB
 qV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2MkPp5rz5yZTi1j0z10QZloHTdL88Uou16AjDa3o5sY=;
 b=qJ9ZxB40jjDjeeMWEE9WQb49nQi1C2TAKLLDRxo5r6UrQ8vba+ZjvwRtIXKDLBf1tX
 k6RVH+2bXIujUNT2T8a7FvRQ3vz/04gYsNlLpZ2RM1no7IQczk7LQIOcBzJuVXIv11bJ
 VnOZeysODS/OdfMnOrTCfqyizgi60NMsiUgqeXP1pt7LL6NjJvOPUprfVQFD2khc3MbN
 6GytnMqyUExgqobVV8tZk3VLc1FUrelZ6m9Bw2RwU+da094d1vTbtymREDug5nRCOe1A
 MhtcORGPf9Et+iGsKWhWpGnamj0S4horX6l1Zq59dQ88NxlDJM2eMxbJmYHXxgrpvKRn
 Z41A==
X-Gm-Message-State: AOAM531fNAnEOnSY2oXtj0OatP/bqy+/HpxkkL5iyXLA8lvPrEiRV3Ct
 dWipq6DdjV0yObxnz9P7hKc=
X-Google-Smtp-Source: ABdhPJz7Liou2+xomDe/pZPrfIFcOCXmxO8o0BS6BktnOwY8LmTCcN9/V2UBfZPHusPo7Fn3nyk/YQ==
X-Received: by 2002:a05:6a00:2816:b0:4fa:6ca4:1e70 with SMTP id
 bl22-20020a056a00281600b004fa6ca41e70mr5175192pfb.85.1647624682417; 
 Fri, 18 Mar 2022 10:31:22 -0700 (PDT)
Received: from localhost ([192.55.54.52]) by smtp.gmail.com with ESMTPSA id
 hk1-20020a17090b224100b001b8cff17f89sm8796649pjb.12.2022.03.18.10.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 10:31:22 -0700 (PDT)
Date: Fri, 18 Mar 2022 10:31:20 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH v3 33/36] i386/tdx: Only configure MSR_IA32_UCODE_REV
 in kvm_init_msrs() for TDs
Message-ID: <20220318173120.GB4050087@ls.amr.corp.intel.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-34-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317135913.2166202-34-xiaoyao.li@intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 "Daniel P. Berrang???" <berrange@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daud??? <f4bug@amsat.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, seanjc@google.com, erdemaktas@google.com,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 09:59:10PM +0800,
Xiaoyao Li <xiaoyao.li@intel.com> wrote:

> For TDs, only MSR_IA32_UCODE_REV in kvm_init_msrs() can be configured
> by VMM, while the features enumerated/controlled by other MSRs except
> MSR_IA32_UCODE_REV in kvm_init_msrs() are not under control of VMM.
> 
> Only configure MSR_IA32_UCODE_REV for TDs.

non-TDs?
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

