Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D6242F1A2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 15:02:24 +0200 (CEST)
Received: from localhost ([::1]:34780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbMqt-0007a7-Ow
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 09:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mbMnu-00064A-Qr
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 08:59:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mbMns-0007C3-0G
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 08:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634302754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a+rpklgjyjEz5Rq74Wfj8rR56UN+C5sx+P+HnccqDbo=;
 b=Jd0VpxxYCSw5F3A44Whj72KXhpErb2ReoPNuC9iktgz0GP8JJlGKO6KqFPn2j1O/Mw53zb
 gId6NJXGZlFx6e4th/lww1pj1IFHHEAl9J1m4dfjw2WtHP0+fpxocWzFV/9a6+rQDswGa/
 efWMt9JtgM5DoPnjaOtSD/asQmJMu2U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-WoE7srQMPqOa5A8gYGWpPQ-1; Fri, 15 Oct 2021 08:59:13 -0400
X-MC-Unique: WoE7srQMPqOa5A8gYGWpPQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 s26-20020a7bc39a000000b0030d9db6c428so645056wmj.6
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 05:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=a+rpklgjyjEz5Rq74Wfj8rR56UN+C5sx+P+HnccqDbo=;
 b=3ajjb4v9iIf5Tw0FQSOcewKmefb/aAbtXTpKQ5NWSROR7iCFqcYQ5I9jf03GxAcgeh
 plI/gJVKVSIpEiAyKWloakcTgQF41o34LUQYvGl4e6VXSKrqqazcpRs6U8H/KjH2+LPT
 //mTF1zqlxgS/nxTBRji5x6+KJDbw/56wiqWHMlwx+BiwI4RnmuCtjWIBEWe+UP++jys
 DyWQ63kwFE5e0RCiOxVCJ21vizuCY3ysRMpveKsrWAV2r3rZqEfL5AI4szYprRPUYSGe
 x2gah0z4pj/A4PSn+WFo7QZ+MrR7vBoVosZUBR8NjYZuwkCsPeq3JItC5tZ9P/4DVCDZ
 2RYg==
X-Gm-Message-State: AOAM532E1PTdj2Oczaye1tTMm3AxF3oVTQX9wSWLgebvIVYYoRHVTmPp
 6dxch4tTKPTAhqboZ+umfiYGWeoxebQCiMrnlQV8JO70yMku4AhQDvzFh1mioPjcFx9Kp9AvXXY
 wZrYu24g7pTPKuNE=
X-Received: by 2002:a5d:6e8d:: with SMTP id k13mr14275106wrz.295.1634302752163; 
 Fri, 15 Oct 2021 05:59:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdgIMMfVsn1f0uWvYx/91V+xtTajmj4TLHh2eIK7ZhHHTfi+iljDWf4P2C5rfM69EQ+yJS8A==
X-Received: by 2002:a5d:6e8d:: with SMTP id k13mr14275086wrz.295.1634302751965; 
 Fri, 15 Oct 2021 05:59:11 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6a01.dip0.t-ipconnect.de. [91.12.106.1])
 by smtp.gmail.com with ESMTPSA id
 p3sm4778960wrs.10.2021.10.15.05.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 05:59:11 -0700 (PDT)
Message-ID: <853fc01f-ab5a-232a-8cb7-2908e30b0411@redhat.com>
Date: Fri, 15 Oct 2021 14:59:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] target/s390x/cpu.h: Remove unused SIGP_MODE defines
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
References: <20211015124219.1330830-1-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211015124219.1330830-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.10.21 14:42, Thomas Huth wrote:
> These are unused since commit 075e52b816648f21 ("s390x/cpumodel:
> we are always in zarchitecture mode") and it's unlikely that we
> will ever need them again. So let's simply remove them now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/s390x/cpu.h | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 3153d053e9..ca3845d023 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -674,11 +674,6 @@ QEMU_BUILD_BUG_ON(sizeof(SysIB) != 4096);
>  #define SIGP_STAT_INVALID_ORDER     0x00000002UL
>  #define SIGP_STAT_RECEIVER_CHECK    0x00000001UL
>  
> -/* SIGP SET ARCHITECTURE modes */
> -#define SIGP_MODE_ESA_S390 0
> -#define SIGP_MODE_Z_ARCH_TRANS_ALL_PSW 1
> -#define SIGP_MODE_Z_ARCH_TRANS_CUR_PSW 2
> -
>  /* SIGP order code mask corresponding to bit positions 56-63 */
>  #define SIGP_ORDER_MASK 0x000000ff
>  
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


