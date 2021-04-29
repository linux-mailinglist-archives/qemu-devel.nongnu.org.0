Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D1636E61A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:36:09 +0200 (CEST)
Received: from localhost ([::1]:41022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc1DU-0006BT-KN
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc1Am-0002rD-QY
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:33:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc1Al-0006wp-8C
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619681598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+wRLJ0jLR1UbTQc3On0+ikRkCnSN8SRnsRGvJg6kktU=;
 b=MCwwgBUBhTC+qZfJ57CzXvWK1asL9pioKkoSr1qk4TbJzdzHt98iPKbzkutR9OZoHyG1nx
 xHlEgSLB9cGiPzVOURn3pXd9I1zEpG4utEimucpOBYFVUpyph4+Mh2hNYdUtLXu+QAFIRY
 GYMXtOMKrjzYKhgd/c1nouromp8fgVM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-Pm7fDJUsMqeXNdQz8uGD7w-1; Thu, 29 Apr 2021 03:33:14 -0400
X-MC-Unique: Pm7fDJUsMqeXNdQz8uGD7w-1
Received: by mail-ej1-f72.google.com with SMTP id
 s23-20020a1709069617b02903907023c7c0so2806941ejx.0
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+wRLJ0jLR1UbTQc3On0+ikRkCnSN8SRnsRGvJg6kktU=;
 b=pF7XsVqs/WmuuoGmC1iiOWkfjDs6pzYxCl/ydR993jPmZkF/VCqlzGBDi5dLmJwlsv
 +piJUhe7VS492X0hR3rs2RMFZ15G58FZN7eGkdJJuoRbckntahoE92XvDeXiN56V5RWX
 0gI4b+rEoJBErUL6P8Pj8AnlvhjlC6+kXkDsamderdwqZx5bI8oPVMcNB2ZhWc3/Eghl
 qEHlwUNZ/AlC1PizEz7v+gRGCeYs/3BRiDWDgZqEXRD4jP0mwom0Y5HXNOS+I4OMYP1L
 FLpXbv4f++YDm/XjqT1HDVy4h/SLqWPw5HqDob5/qVahJEgg5WbBX7JEWnEga5a7+XeC
 VNeg==
X-Gm-Message-State: AOAM531q4SwCC0YrudKkW+sHjFGYHLoumSQa186efTK/nMKj7t0a0xyK
 3wO0qI+91K1OA8SkDgCJU26yde5SZDwP16atRXR7eYBxmq1M46ehRtoHt3h1awBCTDDbSkUVOp+
 m6c5bw4ztRJeyzeA=
X-Received: by 2002:a17:906:3153:: with SMTP id
 e19mr33606657eje.351.1619681593626; 
 Thu, 29 Apr 2021 00:33:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUl/mWpXSDsIP6vwJzbTP4qgWafY9H54huZLBbHfGtFaBWQ7NlwWNixlXFQaovow8zE69zXA==
X-Received: by 2002:a17:906:3153:: with SMTP id
 e19mr33606640eje.351.1619681593481; 
 Thu, 29 Apr 2021 00:33:13 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6158.dip0.t-ipconnect.de. [91.12.97.88])
 by smtp.gmail.com with ESMTPSA id
 k19sm1241189ejk.117.2021.04.29.00.33.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:33:13 -0700 (PDT)
Subject: Re: [PATCH v2 00/15] linux-user/s390x: some signal fixes
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428193408.233706-1-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <cab6f3d8-191f-4bd6-1aeb-c60196284d80@redhat.com>
Date: Thu, 29 Apr 2021 09:33:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428193408.233706-1-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.04.21 21:33, Richard Henderson wrote:
> Version 2 splits lazy do-it-all patch.

Yap, that helped a lot :)


-- 
Thanks,

David / dhildenb


