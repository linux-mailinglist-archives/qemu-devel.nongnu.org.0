Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334FE5BC4F8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 11:06:36 +0200 (CEST)
Received: from localhost ([::1]:54886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaCja-0002XZ-KR
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 05:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oaCKX-0007xh-Ep
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 04:40:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oaCKU-0004By-D5
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 04:40:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663576837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xcrVwk+lpTFySOKvbGbgiIKCvBa26c9m7Bv091OA2x0=;
 b=ZI+Zsj2rEL1NQfwsTE3Jz3kfeXkybjFqPx7jYinR075Ge9G281pqpzVQqEmWurEZpmE1Nv
 1Nh/9q0oepg/MwH9dJG69RgafP4uhAVwfzFxeUxfGwMl6P6B7e9CQMe1BaKJe7E26WX6r/
 RT7/Xz/kosYaLzjpX5AUboNMDm4S4Fk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-vBISVdZfPLWYXPaHnt2MTg-1; Mon, 19 Sep 2022 04:40:36 -0400
X-MC-Unique: vBISVdZfPLWYXPaHnt2MTg-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay21-20020a05600c1e1500b003b45fd14b53so2848041wmb.1
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 01:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=xcrVwk+lpTFySOKvbGbgiIKCvBa26c9m7Bv091OA2x0=;
 b=hZa4hiSSlW9Qy7z8S6yUNTsh+uGN2kV0Js8KxzB9iOU3Bu/NWoj07G/3J6pGGgp4oN
 zm6bzcR/gKnLnQ5Q6CBik/HfaMNmEmkBhXJTqH91gv32z1CpdoHeyK0Rf8kJobMBUfCR
 cvY6E+f56gb3kQqIqGQ1ChUundGIP1KELiKcg/mr/bVmB8mMXUYIMkVeoDJE17KZmjd0
 7rVw5dCKmdZxeiBiRC0D0ryqnGT1sxjRLRneNw/S8cLTVyHYeJD1dgENJeAxPqtw7iZ0
 rOAm76ldXfIdToxi8Rn3w5PhHvTIPILV5mfQwbmHs5rmqEpArguWjTP4ZwdLbaGsZ9yb
 ulHA==
X-Gm-Message-State: ACrzQf2upFbcnK4sCiPHptyA5gxzr6dPKIaaT0Fksi1+d6Nw9ASRBt2P
 YAgZQfdSir0of3Ths4Zx/Ng0omN57ptW3DGeFwKy+E0N0fp55mLuS1sXexhF+yvr2QLuNEXMC2L
 E3KASSiFTfS0z7+8=
X-Received: by 2002:a5d:6da2:0:b0:228:64ca:3978 with SMTP id
 u2-20020a5d6da2000000b0022864ca3978mr9879202wrs.542.1663576834845; 
 Mon, 19 Sep 2022 01:40:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6hB6dzLXlnojLl3E3c+LzJeLvVHwtl6ud8gPHFVoeLs4S5VBYpEeKiAYdRdG9g6RuyX8dQGA==
X-Received: by 2002:a5d:6da2:0:b0:228:64ca:3978 with SMTP id
 u2-20020a5d6da2000000b0022864ca3978mr9879178wrs.542.1663576834530; 
 Mon, 19 Sep 2022 01:40:34 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:c100:c136:f914:345f:f5f3?
 (p200300cbc703c100c136f914345ff5f3.dip0.t-ipconnect.de.
 [2003:cb:c703:c100:c136:f914:345f:f5f3])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a05600c34d200b003b2878b9e0dsm13914460wmq.20.2022.09.19.01.40.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 01:40:33 -0700 (PDT)
Message-ID: <a008d39d-7f6e-668a-96dc-46dad21f9106@redhat.com>
Date: Mon, 19 Sep 2022 10:40:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/1] s390x/tcg: Fix opcode for lzrf
Content-Language: en-US
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Nathan Chancellor <nathan@kernel.org>
References: <20220914105750.767697-1-borntraeger@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220914105750.767697-1-borntraeger@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.657, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.09.22 12:57, Christian Borntraeger wrote:
> Fix the opcode for Load and Zero Rightmost Byte (32).
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


