Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AA349273C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:27:22 +0100 (CET)
Received: from localhost ([::1]:41060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9oW4-0004Mv-Oi
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:27:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9njp-0005C3-MK
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:37:25 -0500
Received: from [2a00:1450:4864:20::329] (port=44980
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9njo-0003e6-5n
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:37:25 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so3554707wms.3
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 04:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h6pzLsUAMb/qBaASv3koy93SgO9fXI3IyJ6aXduLksQ=;
 b=KRNjR52TPkfjC2vYlpqyN6vVrN7nar6xn5B5DVBjCLAEMEpFMXGiIPS9PEA/B/r4xs
 Omb4o98IOI1YGkXKt672paUILp4z+NQ8w0yVjchnzGBY3/60Kol1oaRU+0icyk0HTZH9
 TSxd5PHxB7lnlhUmYJDGXhWM7WvX0K0uryjgiXyHUC0zCYnwbU/a+6Dp6MsYdsUm+ard
 /vWfbvRF4ULAkQs8huP/mrujZLKlzwnjr+odQzvu6RY6Zd0n4KUNdrBVsvx1TrbLqC2o
 t4UilHjBWS98oiQciAO8FgbTA5WoJNEb0QeKzMMjZNDFitqReBe7ez3U/AAu9qtVk1A6
 ZrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h6pzLsUAMb/qBaASv3koy93SgO9fXI3IyJ6aXduLksQ=;
 b=qdacW5vsppse+Rqug7PthwP8H+FFptQ+MV7TzcIEZvQJ7oRHuLH9BZfJEu+/hfXsS/
 J/x2Da1iF08101IZMeLD7TuRPeCIYxg/gydglGwcGrpdrjii1l0BN8h0AoonxAf5pJz0
 We8QCDYvgsOZsKoPJ4U8XURDtZInRu/o38G2LMwRWXjBm9FU0C6IZoQ7KBr4tveUjQXv
 psbrdJ8tJYecv67aX1jl2xPE0HN2NrVoa/sKBQ3iWVl1lbvm2mCkg9qsA+sXd7ad43X9
 3mrCc4oBw9r2LWXsCxjsg2exTqKQ8aTjqc++Na9PMCZGJ6Pp1zTv21NnWrZAiQc3+Pqz
 7WoQ==
X-Gm-Message-State: AOAM5331ajhgw4VwEV+xktX6Yt9/3W3/12/eoumT7VxhJ+84Y9Z/wtiL
 vk/MqAxvxfoiYxcsQTqyD/s=
X-Google-Smtp-Source: ABdhPJwPoVAJJC8+4mY19kAhxe8aXmB0sz+uXav8SBgP7R5o2LQ7M1CgEkByY/JJMLTY9ZKWzSrkyA==
X-Received: by 2002:adf:d1ec:: with SMTP id g12mr16488632wrd.210.1642509443012; 
 Tue, 18 Jan 2022 04:37:23 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id 8sm17178591wrz.60.2022.01.18.04.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 04:37:22 -0800 (PST)
Message-ID: <3aaa1a42-e3b0-2d55-78fd-368c925af4af@redhat.com>
Date: Tue, 18 Jan 2022 13:37:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 1/7] x86: Fix the 64-byte boundary enumeration for
 extended state
Content-Language: en-US
To: Yang Zhong <yang.zhong@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-2-yang.zhong@intel.com>
 <BN9PR11MB5276BFF130081C9ED21F89238C509@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220111022218.GA10706@yangzhon-Virtual>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220111022218.GA10706@yangzhon-Virtual>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Christopherson, , Sean" <seanjc@google.com>, "Wang,
 Wei W" <wei.w.wang@intel.com>,
 "jing2.liu@linux.intel.com" <jing2.liu@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zeng,
 Guang" <guang.zeng@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/22 03:22, Yang Zhong wrote:
>    Thanks Kevin, I will update this in next version.

Also:

     The extended state subleaves (EAX=0Dh, ECX=n, n>1).ECX[1]
     indicate whether the extended state component locates
     on the next 64-byte boundary following the preceding state
     component when the compacted format of an XSAVE area is
     used.

     Right now, they are all zero because no supported component
     needed the bit to be set, but the upcoming AMX feature will
     use it.  Fix the subleaves value according to KVM's supported
     cpuid.

Paolo

