Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FE33DED24
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 13:47:24 +0200 (CEST)
Received: from localhost ([::1]:54722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAstG-0003h7-Je
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 07:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mAsqw-0001jU-DF
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:44:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mAsqu-0007Gf-0z
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627991094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TIcl2slq4sOnWcrNx1qCm8Nbxu2Sr4Lp7IUga+wOIPM=;
 b=GoiPTf5YKyCowX1rT1fd1dR2as3WyaJ1IPtE9UJKp/yJlM91q8KCQaTufHNQLmRIdsHapW
 nrEUxU8tLNUkzg+LtkZ7rmramz68eBgNXceQsBfo3ppP/gvU+A3ocpU08LNI3UdBHQGKSY
 6RAm0ikU5ZnrN0fGkC4McoewAsa6OmI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-XexJ2CO2NQuS-0gl1ELxVg-1; Tue, 03 Aug 2021 07:44:53 -0400
X-MC-Unique: XexJ2CO2NQuS-0gl1ELxVg-1
Received: by mail-wr1-f70.google.com with SMTP id
 f6-20020adfe9060000b0290153abe88c2dso7486221wrm.20
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 04:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=TIcl2slq4sOnWcrNx1qCm8Nbxu2Sr4Lp7IUga+wOIPM=;
 b=EAeYhKzjplh+thacgPWb8Xlufd1AozWiGWV3Nw3q+tpGn7xaIKlGX30Oj8FTzAEX2q
 sZT1gHi3QGKZVhxAOWzpXoU3mXEbzsN+u6eiTDZ1XUQz02LLgquj02hwOB7AwZzqZ6YP
 o9C7QgCzarhr5qfsH31ZPLPnmKxSfi2Of5BjjiZv9R2tmw8IietvabvmncCmn/5Gj+CB
 zxB5DQ1Msw+yON6SaHE8rmE5zdnvsyEAjzcNDo9FZnbSscFCjA11d3sKH7xlVpmsqckt
 KaV8OesQhlg9pvc2drwIJH7UY9mhOC23Er0ossNNDBq53piN2tef5g/W5egukx6u2s0w
 henw==
X-Gm-Message-State: AOAM532VbMJU8Dr2nmj5G3G/INwka52eJotLlABD9BEDPuy4USll3LWZ
 iE9OK89SxvAWIraGKj2zK0BRc2d3zJ8xK9zfRyl4tW8vFNL0yA3ctMIAa/oSvH98ZMkeksQQnLZ
 2rIbNHVZ+5oXYARM=
X-Received: by 2002:adf:fc50:: with SMTP id e16mr23362285wrs.382.1627991092205; 
 Tue, 03 Aug 2021 04:44:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD1HwE1NUAqGWVFUlgzIbo3GawBt/Zp1BIoDP7+mSKSbkRRT/5sGTZWuRbrsD+tmM2RjTQBQ==
X-Received: by 2002:adf:fc50:: with SMTP id e16mr23362262wrs.382.1627991092015; 
 Tue, 03 Aug 2021 04:44:52 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23a79.dip0.t-ipconnect.de. [79.242.58.121])
 by smtp.gmail.com with ESMTPSA id t8sm15076956wmj.5.2021.08.03.04.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 04:44:51 -0700 (PDT)
Subject: Re: [PATCH v2 38/55] target/s390x: Use cpu_*_mmu instead of
 helper_*_mmu
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-39-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <b2cea948-0800-6b91-30d9-11d091427618@redhat.com>
Date: Tue, 3 Aug 2021 13:44:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803041443.55452-39-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.08.21 06:14, Richard Henderson wrote:
> The helper_*_mmu functions were the only thing available
> when this code was written.  This could have been adjusted
> when we added cpu_*_mmuidx_ra, but now we can most easily
> use the newest set of interfaces.
> 
> Cc: qemu-s390x@nongnu.org
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


