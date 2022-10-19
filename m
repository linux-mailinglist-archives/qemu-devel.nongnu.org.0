Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B46BC604785
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:41:24 +0200 (CEST)
Received: from localhost ([::1]:52940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol9Jx-00070C-DS
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ol8dg-0008Ta-RZ
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:57:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ol8dc-0003Fb-KB
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666184255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VYZE/jI3tWND2DSVVKiNqz/oFvPDvCCQd78vRQoYbWQ=;
 b=BeRsKvFVZOzgYR3JJyForQY+KjngqKzSCE469IBl3mbb81nkov4NBtzGiJjzmRbpdW99gt
 wWuIK8Kgb5NV6Q1Wn/emh6w48PIssXAd07+7zsC8mqABO01+0z6Ck+p74NzamzKw1Ve+og
 6xICAGGYtBj/GCZsbG6zkPM8bLQsY0w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-197-vHzFqVPUOnG9fAOoIClAaw-1; Wed, 19 Oct 2022 08:57:34 -0400
X-MC-Unique: vHzFqVPUOnG9fAOoIClAaw-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay12-20020a05600c1e0c00b003c6e18d9aa8so10742048wmb.8
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 05:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VYZE/jI3tWND2DSVVKiNqz/oFvPDvCCQd78vRQoYbWQ=;
 b=UJQ+w/C+yoFCFLq5jjFcwtBkyMJRmpBuRR/by4VXkLa6IliE21E3oyT2jwqvnYhbDC
 SQKT8PFgvJeaXpXNEpAwsshLMwuiJz0Nk7HG8N/ymeUZvIUIgQGQKUinxQ1j6a14gSIZ
 BhsMfVf9xU/BJ8Cq6/pjtDcLdlEbrJIKDTUwht3wFErGk6/IJBnoFFDPq84gIrvN2ss5
 H9I0hrNrclWrW6A7rba6V+pcYE3uWrg5zhDzMpvFdl5R7SYD9CKSZRN0nZuhiXVwryow
 74DB+HlzrpKbzNDLta6bXJMcYiPDA2B0vi43RJ/IfF9b9KPlKNqOg1OVBgZ28oYVQNJA
 +/lA==
X-Gm-Message-State: ACrzQf0SVtMEHpWpp1JZ0RGMA0Clz5KyNc+sMI1yg4rbL9iGiz8JEaSt
 ztM3p5MjHLoz1DQgE6evWZdfgkRngvbW4329qxMmIhJZNoa/BdYuYO6Q5S+km6gS+souvAuXfWq
 JHo20Y5K+JAYBZTo=
X-Received: by 2002:adf:fad0:0:b0:22e:4998:fd5d with SMTP id
 a16-20020adffad0000000b0022e4998fd5dmr5028772wrs.267.1666184252878; 
 Wed, 19 Oct 2022 05:57:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6EfsedQ4qtw0wwhbX/p2LJUWYu1x3PGnwSmFCa7oQxkFTz0ANFs1VsKMoETDIVZNXvXKX7gA==
X-Received: by 2002:adf:fad0:0:b0:22e:4998:fd5d with SMTP id
 a16-20020adffad0000000b0022e4998fd5dmr5028752wrs.267.1666184252547; 
 Wed, 19 Oct 2022 05:57:32 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:2c00:d4ac:d2c:4aee:dac1?
 (p200300cbc7072c00d4ac0d2c4aeedac1.dip0.t-ipconnect.de.
 [2003:cb:c707:2c00:d4ac:d2c:4aee:dac1])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c35d200b003b3307fb98fsm14151512wmq.24.2022.10.19.05.57.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 05:57:32 -0700 (PDT)
Message-ID: <e27ddef2-66ab-3dbd-ff9d-5d7b1ad1a384@redhat.com>
Date: Wed, 19 Oct 2022 14:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] MAINTAINERS: target/s390x/: add Ilya as reviewer
Content-Language: en-US
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20221019125640.3014143-1-borntraeger@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221019125640.3014143-1-borntraeger@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 19.10.22 14:56, Christian Borntraeger wrote:
> Ilya has volunteered to review TCG patches for s390x.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e3d5b7e09c46..ae5e8c8ecbb6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -305,6 +305,7 @@ F: target/rx/
>   S390 TCG CPUs
>   M: Richard Henderson <richard.henderson@linaro.org>
>   M: David Hildenbrand <david@redhat.com>
> +R: Ilya Leoshkevich <iii@linux.ibm.com>
>   S: Maintained
>   F: target/s390x/
>   F: target/s390x/tcg

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


