Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACDB40B623
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 19:44:45 +0200 (CEST)
Received: from localhost ([::1]:49386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQCU3-0007Uk-LZ
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 13:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQCQY-0005j5-Pf
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:41:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQCQX-00058E-8M
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631641260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EX4Ok8yH0XYOSqGACzgeAG+JdY3wf5cpRuuUBVUyt5o=;
 b=hz2MdKoefzFk4jvw1p8LtmSGd9Jd9EbJTPSqIjOmSiXvMyR7jXeOzO2r3xxXSA7XKRgumg
 oHndnePicg0cYAGT3TDw6y5LJURI6i7gqfFyQ059lv3HvCkBBT5HenBw8wujya9yjBxREJ
 hTEY0/vo2DBpsOVyIgqXfhiftiAEPtU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461--izbr99VMdqdjRnCTMAETQ-1; Tue, 14 Sep 2021 13:40:59 -0400
X-MC-Unique: -izbr99VMdqdjRnCTMAETQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so65123wmc.9
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 10:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=EX4Ok8yH0XYOSqGACzgeAG+JdY3wf5cpRuuUBVUyt5o=;
 b=L/E3vk5ZGDHBHMY4miu1QhZykxaZvLbhxdhck/ABi7bm0YPyfPV7RDwHyU43r4De3S
 4UcVJt4Ys99uJjPcL/w4Kllp1h3DDPiWMaahaPi8z91nLO9crsG05y4frblgsvRTCyxl
 uer3SWmKMc2RmaznkD/WIRzqMruS+U2/ut78pKfeR2iHK0HXqt+Dhb0ZgHAPrzlGLIv3
 8IjFBjKK9L0a5nw6afJJ1zCYNNfMZTptqn575O3J0kwo7G8I6ut4Xt2VKfLo80LcBUZe
 TvYcJAiMk6zSRdPdHoZJCRiYpjI/zWz7rJZntZtAWCdNm/oAIr4e5ujUCM5zUunkS2eo
 iZzA==
X-Gm-Message-State: AOAM531OlfVK3tCJ+A2/fWiI9+c/8KikBY3+HsjXjugkKEbfyDkUVrSF
 5x4HDGuCndsM3Jd6CkJgVd3TF/pF0nXZjBnNQWgAPwrP9LZJeKAp2RwxbxoTpiIDi41hzcH/Xv0
 0wCgp/uppCNbVLgTEkU+srqCddSbZwGrKkB6riokGgH9+GqSSsoEHtOP1PRgCYPU=
X-Received: by 2002:a1c:7ec9:: with SMTP id z192mr364858wmc.152.1631641258166; 
 Tue, 14 Sep 2021 10:40:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX3P47kD2OVqxo5IL+jGP5WTdtNMw10VQQu6BoaXyz5UyqcQSoQ6pDD3N3JhtjY3NS5fj4WQ==
X-Received: by 2002:a1c:7ec9:: with SMTP id z192mr364839wmc.152.1631641257931; 
 Tue, 14 Sep 2021 10:40:57 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6041.dip0.t-ipconnect.de. [91.12.96.65])
 by smtp.gmail.com with ESMTPSA id
 l2sm2418869wmi.1.2021.09.14.10.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 10:40:57 -0700 (PDT)
Subject: Re: [PATCH v4 11/16] tcg/s390x: Implement vector shift operations
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
 <20210626050307.2408505-12-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <4a8ae48c-33e0-196c-0725-d215e780a4e7@redhat.com>
Date: Tue, 14 Sep 2021 19:40:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210626050307.2408505-12-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.06.21 07:03, Richard Henderson wrote:
> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   tcg/s390x/tcg-target-con-set.h |  1 +
>   tcg/s390x/tcg-target.h         | 12 ++---
>   tcg/s390x/tcg-target.c.inc     | 93 +++++++++++++++++++++++++++++++++-
>   3 files changed, 99 insertions(+), 7 deletions(-)

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


