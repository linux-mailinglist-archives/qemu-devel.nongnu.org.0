Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA37240D44F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 10:11:32 +0200 (CEST)
Received: from localhost ([::1]:52630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQmUU-0001ay-Oh
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 04:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQmSp-0000uc-VF
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:09:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQmSl-00029y-FB
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631779782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KZnipUXt1a4NpiioxK/T8P8d+zBkcnnQeyECwwg3I9Y=;
 b=Vl7NaA5Op+oqC6sKpSe55rRVtocWyHwV5IfNbDitPT1AHDCTeZG6JdEELnNgR5mVA8Aaoz
 CmOuyADJ66pEvPOAWwKe8CwERl3hSx1LkxGYzSKGfT+66eYAw3JHWdlR7AByaZfMTcayJ9
 BCwmlwZQx3T63iMSr687fugISJHC8kw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-dZVTD3grNiaAIn_uZH41kg-1; Thu, 16 Sep 2021 04:09:40 -0400
X-MC-Unique: dZVTD3grNiaAIn_uZH41kg-1
Received: by mail-wr1-f70.google.com with SMTP id
 h5-20020a5d6885000000b0015e21e37523so2109942wru.10
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 01:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KZnipUXt1a4NpiioxK/T8P8d+zBkcnnQeyECwwg3I9Y=;
 b=gz/UaIx0Ge8rqf0akmzXIikoiQUhwSXTtXFVy4oOYzANZufvFWd1UxuRmyluucpTEF
 +spGamwDbRzZk5GKWv2t+vFkXD8HUQCjr6w410FflgcfUE9IzsvGoV/7YRgRj42oDK3f
 aakrA/Pl1Za9Q7B4oBAj3oujTEV3FO/Eitz6wx3BQVG3UQ9O+WWczs1VZftrNoW9AZZ9
 nODcAv2hg9lPJwWzqwwvl5KD1rQ4BLUyUxm+2AOxOQhiEKVlKVDqcQE7FseE4yvwc9sx
 rEBIr22UAbKxYaIshyDetlVQmoxzV6dmR/5IW0cocpL7akvV6Y8tQF4zsJvbqdMl5BSN
 9H2w==
X-Gm-Message-State: AOAM5326q9yHKs+o8CGGBMg7pIB49xH/8bj/8xQL9QcGbgPxZayhg/tt
 pRyKX1x8oUVeOtC8yEI1apdFcRCrKYzgv1w66apLYLfFU92l9NYp3MJwXYN2yzuKLyq8xZ7DVq9
 NFlWQ6Plxg6CLp8Mv71Ej4YAMpKfqtkAxWKISY7EL1aDVVI4V2DqJu4d0SRo+6hk=
X-Received: by 2002:a05:6000:160c:: with SMTP id
 u12mr4568102wrb.100.1631779779705; 
 Thu, 16 Sep 2021 01:09:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwALvJwFHxIercW8cOKX4HrzAQ47xGjX7nL/Wrgol0FZ3oNSONa2cH9LNwdJ5dIZfF/pJ1K3Q==
X-Received: by 2002:a05:6000:160c:: with SMTP id
 u12mr4568086wrb.100.1631779779474; 
 Thu, 16 Sep 2021 01:09:39 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23828.dip0.t-ipconnect.de. [79.242.56.40])
 by smtp.gmail.com with ESMTPSA id
 d9sm3175669wrb.36.2021.09.16.01.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 01:09:39 -0700 (PDT)
Subject: Re: [PATCH v5 06/16] tcg/s390x: Implement tcg_out_ld/st for vector
 types
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210915213114.1923776-1-richard.henderson@linaro.org>
 <20210915213114.1923776-7-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <01edeec4-a541-599f-d632-96ff04c8ea14@redhat.com>
Date: Thu, 16 Sep 2021 10:09:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210915213114.1923776-7-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 15.09.21 23:31, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/s390x/tcg-target.c.inc | 132 +++++++++++++++++++++++++++++++++----
>   1 file changed, 120 insertions(+), 12 deletions(-)
> 

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


