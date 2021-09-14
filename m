Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFF340B4A0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 18:29:13 +0200 (CEST)
Received: from localhost ([::1]:58878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQBJ2-0001dE-DV
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 12:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQBHo-0000HO-0K
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 12:27:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQBHj-0000wj-Au
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 12:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631636869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2tU0oBkVi78UIYEGXD7sW+CwgMDQ49DZDGQ3ikvKPI=;
 b=Di60kEjDfFc5F4V5hLb2C5iZkMX87SkXUz050CamaoQAKYZ5BJBdY0tS7kIwT0jzKAkM29
 dt1AU+ApFAFLUyloZ452ARirSFc486o4BC/un3TPQvaEkXmijrbpbUdMDWA1++D7oiy02n
 l0OoVjhKGwx8IuEbhJjGcubYoAJhYnQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-fiKXQPWbOWqLxDTgx9gtrA-1; Tue, 14 Sep 2021 12:27:48 -0400
X-MC-Unique: fiKXQPWbOWqLxDTgx9gtrA-1
Received: by mail-wm1-f69.google.com with SMTP id
 g13-20020a1c200d000000b00308ecd761e8so497542wmg.2
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 09:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=m2tU0oBkVi78UIYEGXD7sW+CwgMDQ49DZDGQ3ikvKPI=;
 b=q937ggXfwqp74/FT7ks9/jk0Y93gbKS99hy59oTjZw0RTlMe0v+JO2BWCboGSAoRmh
 yQAe35gb4wI4OCcVlz7hEV/S4JxK3A8TGwD27gurRSXtJLHJZVQh28ikfmEtfZoNJVkt
 BrhI6G60MJMS63SYkdax7EqToxx6CabIFoMMh9KCnYeEngo39u8P2A8cxGQCu+XoWIrK
 f0OksxB0xEiKvOz6sLN71cEY6OGVLvqPFH0CunqZVAWtLuiqJCiukGrb6QPA1uplIY0S
 S8P9LrpTNBH4k8Wtc9Ac0ONDn1OC1ArgfySNjxoV3TpEIyyZKodWyDENquQDETKQde3M
 +/CQ==
X-Gm-Message-State: AOAM532KpFbY4T50J070PtxzXK/XBY8+5zWnL52rOSJWLv3xoBoasiKj
 XuwJbiZdoGv20Ctb+qXARZWAZTbFLWy/8xiCWjeLZIcri0LoMafDwF4qErafQTBpvWir8vBElvk
 SPDyP08n8EIOUTSxSEbqdc/P4aL+jVg6cKCChrgeqn4SIRmMeHBZeiGIcBfOE57g=
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr7024wmr.168.1631636866917;
 Tue, 14 Sep 2021 09:27:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywbhEIhESRBJJBFqMq7/mrpDlYZk7aywk7HyinHQl8UJynNG1ZaCAsOUmxfHVwC8XCyK/Nqw==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr7004wmr.168.1631636866655;
 Tue, 14 Sep 2021 09:27:46 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6041.dip0.t-ipconnect.de. [91.12.96.65])
 by smtp.gmail.com with ESMTPSA id
 q7sm10801857wrc.55.2021.09.14.09.27.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 09:27:45 -0700 (PDT)
Subject: Re: [PATCH v4 04/16] tcg/s390x: Add host vector framework
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
 <20210626050307.2408505-5-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <90a54ef4-e0ba-8807-6cee-907cc1eab30d@redhat.com>
Date: Tue, 14 Sep 2021 18:27:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210626050307.2408505-5-richard.henderson@linaro.org>
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

On 26.06.21 07:02, Richard Henderson wrote:
> Add registers and function stubs.  The functionality
> is disabled via squashing s390_facilities[2] to 0.
> 
> We must still include results for the mandatory opcodes in
> tcg_target_op_def, as all opcodes are checked during tcg init.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


