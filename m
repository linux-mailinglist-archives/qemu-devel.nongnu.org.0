Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23BD42A86A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 17:39:42 +0200 (CEST)
Received: from localhost ([::1]:56500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maJsT-0006LQ-6x
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 11:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maJrP-0005Ts-4Q
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 11:38:35 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maJrN-0001TH-Aj
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 11:38:34 -0400
Received: by mail-pj1-x102e.google.com with SMTP id ls18so15960791pjb.3
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 08:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ib1tya9M8db2jxQzWjUPlEaelwKWU/CeSN4Nfs9yNtk=;
 b=zwrD/s/WRbxNQi/9PF74YZSicjblPY6gmp3hIsdSNnY0Y1ikVK/3GGYtamaGym+DWK
 hEBUXsivIPNUUg6VGa6Xq6CvZrY2v2T7/NlnwsO3bPYK+PQg8SQPstsRRiKRNjW6dc3Z
 1whoe7PpF2wzLsuCGlNH23wQMbGc6r1wusSazT8Npjn2SD1l2cQmkGyuKaBQcUoGErFI
 Wt8XGhZesOt1z9iZb/43iSXsMGdpxwyF917oCdLLbK+TvoIoXJw9Sa2Ecq7WCQervm4z
 iL3VAAf/p0uHOFhqKC+Us9o7cZY2SxHd4lJl+YL1Bwk8aanL8IMTYz0Gse8iC63EhEYr
 SYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ib1tya9M8db2jxQzWjUPlEaelwKWU/CeSN4Nfs9yNtk=;
 b=m8LPhagqdlDv1ov70krqjCb7c08A3oI199NSBid57PDg7/og9rRKO8duAl8Z6fVLz7
 TX2fbxTvLdZlkD+8U8klD+RsC4Lvq332aEkqgehu34tFfsXvsCELoFlv4tOcwgijjLz0
 aJZ16lxeHJhClJaG1vobDE7HajROkju8uA57sf3nVk+l1XDeZk5Fxqeubh5mcNsZsgvP
 7DnLpYRjoaq7yq075nkaWquOu/hsFM1I4hh0bT5J9MD9MxFvaefNyVQ6g3hxGMIg46A7
 D+cwoJ/xZpYFaclUFSbD1pRAGntzha7aTLrX1wxj2zJg1MGhMuzT2OSTd5EomGlZd60W
 TAlQ==
X-Gm-Message-State: AOAM532MDQSPCN6qcJRe9xcMFa53nLnkHomB2jy/XaPnvVeCwfqwl7SO
 mKZFK5nvA0xWnQqHxpqGpYIpQQ==
X-Google-Smtp-Source: ABdhPJzcRXoj89RbamwZBTRoIcSk6XBqRY6TPLQkGce9PzTXbeYq8IDPc90MoDu7Dmp6bdY9cjzW5w==
X-Received: by 2002:a17:90b:1c0e:: with SMTP id
 oc14mr6763006pjb.159.1634053111775; 
 Tue, 12 Oct 2021 08:38:31 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b142sm11767261pfb.17.2021.10.12.08.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 08:38:31 -0700 (PDT)
Subject: Re: [RFC PATCH] target/s390x: don't double ld_code() when reading
 instructions
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211012093128.3909859-1-alex.bennee@linaro.org>
 <b512ff29-4db2-5574-7e2b-b806db624d0e@linaro.org> <87lf2ywap4.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <615facec-1751-778d-2187-b6a93afff9eb@linaro.org>
Date: Tue, 12 Oct 2021 08:38:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87lf2ywap4.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 7:52 AM, Alex Bennée wrote:
>> I think the plugin stuff could be more clever, knowing where the read
>> occurs within the sequence.  Otherwise, we should simplify the
>> interface so that it is not possible to make this mistake.
> 
> It's plugin_insn_append which is doing the tracking here so we could
> extend the interface to include the current pc of the load and make the
> appropriate adjustments. That said it's a bunch hoops to jump every
> instruction when we could just as easily add an assert and fix up any
> cases where we do. I guess it comes down to how prevalent double dipping
> in the instruction stream is when constructing a translation?

Yes, which is why I suggested simplifying the interface to translate_ld*.  It currently 
takes the DisasContextBase; it could potentially read from pc_next, and increment it.  It 
would completely eliminate the problem you're encountering.

> What happens if the protection of the code area changes half way through
> a translation? Could a mapping change in flight?

No, we hold mmap_lock.

r~

