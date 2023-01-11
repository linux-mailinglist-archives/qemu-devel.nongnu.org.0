Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936746658B6
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 11:13:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFY6B-0000rk-Aj; Wed, 11 Jan 2023 05:12:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFY69-0000rR-Ek
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:12:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFY67-00040v-MQ
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:12:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673431963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F7bIe4yWU6tt8CSl6bCFAOy1ZIhulTijzFOZvZrn1Sg=;
 b=a2J0ACoJ5Rfm86/Y/Um2Q2Ub+SE8uuja9ge3fFQLR/TEdpH7n8iy31dgH/hf91U+RYNfUl
 gadzQUhtlQS8FlTT3oEFdQ4OAeBQiXEq54tLljU7LpCgGLReyhmP4AOiAntUXjF0UL31Ba
 yP65fkjiJb1OYXGt/epUlYc9MmOHne0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-297-W79EVyL6Ny2y9sga2Idj0A-1; Wed, 11 Jan 2023 05:12:41 -0500
X-MC-Unique: W79EVyL6Ny2y9sga2Idj0A-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi18-20020a05600c3d9200b003d991844dbcso10476753wmb.4
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 02:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F7bIe4yWU6tt8CSl6bCFAOy1ZIhulTijzFOZvZrn1Sg=;
 b=KuQTzmU2moR7n8k4M0kwz2+jPshXgENR38RzH87dZgs3V0bIzz2GD12802lwg59r5Q
 JK0aOq9Ulu03UukgVVV76XIL2UKQtGpUo7FH+lxd0KegjLBhWYRs+6XCLcyexAbc1UgL
 g50I6uZamNKT8FlDGpWI/VWi2D8sv1QiMwmKj8RYyeIicWL69hMan8LxjkEU3UHJzIh+
 0Pmd29E/RdiXiMVMYJnf5hMyWgVXzPugBdr6Yt2sOk7bI8dsJbalI00gdauvUheY5CJi
 v22vsq3IfkqoJSDJTNjNXITl7PoeSAVom/UgQidjNPimdmM9rDUi+Th+0iT97pDCuDG8
 m9Wg==
X-Gm-Message-State: AFqh2kpdSe3Cun9z4kWRiay47CZMSXsuqPr8bglfA3XhcbLvoYjV131q
 EfY7wT4HlNLDP2dzQMVoGGipoqN1Vc8kRA4CmSKxPYnkxy7iOAhVeavgNFj+nlnc1A41tZxm6dM
 F4I+XzPE4VEuLRmY=
X-Received: by 2002:a05:600c:3209:b0:3cf:5fd2:87a0 with SMTP id
 r9-20020a05600c320900b003cf5fd287a0mr51220297wmp.40.1673431960637; 
 Wed, 11 Jan 2023 02:12:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuoN2zxITj4MZwlCu/eJ71mknKRMAtN1+gfjC6NRwFM/4DqeuApinDvLR9+V/9p4CEQgsuWEw==
X-Received: by 2002:a05:600c:3209:b0:3cf:5fd2:87a0 with SMTP id
 r9-20020a05600c320900b003cf5fd287a0mr51220286wmp.40.1673431960415; 
 Wed, 11 Jan 2023 02:12:40 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:5b00:5b3c:db46:8eb5:ee24?
 (p200300cbc7045b005b3cdb468eb5ee24.dip0.t-ipconnect.de.
 [2003:cb:c704:5b00:5b3c:db46:8eb5:ee24])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c0a0600b003d96efd09b7sm26218790wmp.19.2023.01.11.02.12.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:12:40 -0800 (PST)
Message-ID: <91c198fb-65cc-be1d-628a-3d6fd31419a6@redhat.com>
Date: Wed, 11 Jan 2023 11:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/7] target/s390x: Fix s390_probe_access for user-only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230109201856.3916639-1-richard.henderson@linaro.org>
 <20230109201856.3916639-2-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230109201856.3916639-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09.01.23 21:18, Richard Henderson wrote:
> In db9aab5783a2 we broke the contract of s390_probe_access, in that it
> no longer returned an exception code, nor set __excp_addr.  Fix both.
> 
> Reported-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Should we add a Fixes tag?

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


