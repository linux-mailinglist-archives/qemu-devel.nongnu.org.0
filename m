Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBC540B61F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 19:41:41 +0200 (CEST)
Received: from localhost ([::1]:46546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQCR9-0005Va-78
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 13:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQCON-00042Q-Ok
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:38:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQCOE-0003DO-Ft
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631641117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QoBH8XvNuDaYu7zg4kVb5gsPgXaXsaGfTWz6NMd2BBE=;
 b=I5YBt9jxTz+dufkN70uw3ahaSibwAE5bYxDEhiGw9QS+bPDKK0nVwrF6aCrRv4v9AXKuVL
 NX1xJwSZaxxqKNSKFMlXAIanfCIf1XAOwUQyUaYIlQ9YxZ9iZSu8sjA21MBoRNVHqfyzSk
 6m6nGNQmvTd/NwjL4UOf1DkibVqbBYo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-gylf_atoN0GSurwDXXULyQ-1; Tue, 14 Sep 2021 13:38:36 -0400
X-MC-Unique: gylf_atoN0GSurwDXXULyQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 g1-20020a5d64e1000000b0015e0b21ef04so2343891wri.17
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 10:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QoBH8XvNuDaYu7zg4kVb5gsPgXaXsaGfTWz6NMd2BBE=;
 b=0kg8jcq4EbVUfBSHfCQqH0Tlj70f62kM1y7MvgYvP+K+Ehl2gQDZjX6w/mWsE/PVki
 J/GSL6MYVCc46Jd48SLMazi3u9IvuyffFja/rWfF0cFLLC4A42mjOis+9iWgn55Ua+TC
 ZDsjoaa7gg0nPkYcYPWhIANkA3Qh32lZHcdZM4jDRSHMCubKXu+uLsNUO1NPlikO20Xx
 EYfoGZLWXkMR/OdrESHxxMe0o5CRUOEdX3xaZHptuQgEXj/kJ2gjkG7Vu8CUWUwMLWfl
 lhyhrwtBbxbkoUFDiKRw116Umbpj8wRHisxA6fmEyzuW7ruqwjE9AhoA8DmzGHsj1Ovh
 CTcQ==
X-Gm-Message-State: AOAM532Yspft9XTGKkOBoYJRiV3cr5IPisL0j5FEdbuVqlTNu1wNX91K
 1diugkPctmJK6vKJUAbInhWQ7CPkwANDs1wqGKOI/u5BjT+GFJdW+c2z7XKG91IIIsyoIXNVa6c
 Cdb2s+HHLwP6qVTFRu+X97O4wk5XJD66llO5JQS+lKJPYXn/l7L9cp/+Ty8PKfZw=
X-Received: by 2002:a7b:c005:: with SMTP id c5mr246948wmb.59.1631641115178;
 Tue, 14 Sep 2021 10:38:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWHObO8F4/DaKjbFZHFesTzxpdqCvV+DfwAfV+OKlOayPmVpZE00fN3aCQ++YDaIi7Sm0jrg==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr246929wmb.59.1631641114863;
 Tue, 14 Sep 2021 10:38:34 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6041.dip0.t-ipconnect.de. [91.12.96.65])
 by smtp.gmail.com with ESMTPSA id
 129sm1762169wmz.26.2021.09.14.10.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 10:38:34 -0700 (PDT)
Subject: Re: [PATCH v4 10/16] tcg/s390x: Implement TCG_TARGET_HAS_mul_vec
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
 <20210626050307.2408505-11-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <89160929-d044-c5fc-fbab-252bef8fef09@redhat.com>
Date: Tue, 14 Sep 2021 19:38:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210626050307.2408505-11-richard.henderson@linaro.org>
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/s390x/tcg-target.h     | 2 +-
>   tcg/s390x/tcg-target.c.inc | 7 +++++++
>   2 files changed, 8 insertions(+), 1 deletion(-)
> 


Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


