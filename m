Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4776C10AC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 12:21:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peDYo-0005OQ-TP; Mon, 20 Mar 2023 07:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1peDYk-0005NU-1O
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 07:20:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1peDYh-0004DV-Q6
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 07:20:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679311210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=toJaONG2WkJxw+2UWyEm9jhMxor5tOoNyF08m8MOKNY=;
 b=Y8osddGnHXl3E9phBC9PNXb7PxkHrXnCwMDQENbDw4SjxgJukUl0iH3WJSVa4krwh2vrSO
 h0U5XZN4GFi3VNjTWRVgrifUsiEHxE13GrEQXk7OBVNsu/QPHGAUZZOpzbFKEoxEdFyxHw
 fuhl6XLYm1nqQgUBEvzXg0X2gF8JjKA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-nXr113oOPw60hnC3Gm7cWA-1; Mon, 20 Mar 2023 07:20:06 -0400
X-MC-Unique: nXr113oOPw60hnC3Gm7cWA-1
Received: by mail-wm1-f69.google.com with SMTP id
 e5-20020a05600c4e4500b003edc5824521so2835288wmq.0
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 04:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679311205;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=toJaONG2WkJxw+2UWyEm9jhMxor5tOoNyF08m8MOKNY=;
 b=b/u3L0GiSnFRFalXJpB+3daO+pn3uO28DlJ9wZkEOEdHu6I5RKWMBu+pU7sqksWsqx
 7ZljQ/in2Gtzgpis0JokU83uZrDJXYDP5W45/pQr+Z9qdohBnbRULJrOj6Jte/EdPVPd
 ZbCEIBumg0SDE6xswqe4RqCXbjEtuUJOZ6CP6t1LbFQjLg0LpTgGIFg/kakRFZqphdq0
 fYE+Q3CBwmOUsqEsf3QfYimEmkp9fNHZfV9xbqkLGtW9LikLeR1z4mAKUSbGMUfhkPVI
 8caWNnqM9/3VaCPNd/G7a4uWjlnmt8QR7mEFq/CHXV7ssNZ1301srd/CaIu3/MiCGZLc
 xulw==
X-Gm-Message-State: AO0yUKVgh+6l3GRIQSnfLY5fBCNyAdAbKY9IUA3dlBzZSgfy+Vcpqqh5
 ykv172e/5Uv++zSem7jYE/aiAEAP05Ipw9CyYYKj/FkvgnMBYljPYNoLObmap4KneHCYpn1m4IX
 /qIFf0rmM32K3fa4=
X-Received: by 2002:a1c:e901:0:b0:3ed:7700:eb88 with SMTP id
 q1-20020a1ce901000000b003ed7700eb88mr10342801wmc.13.1679311204968; 
 Mon, 20 Mar 2023 04:20:04 -0700 (PDT)
X-Google-Smtp-Source: AK7set+Wn/hhKtO4xLTXtc83Ek886krk2SYIe7tmVvdqGhQ8d8sEXXu4ciDpR7f49r3Z5Hw0CSAk1A==
X-Received: by 2002:a1c:e901:0:b0:3ed:7700:eb88 with SMTP id
 q1-20020a1ce901000000b003ed7700eb88mr10342778wmc.13.1679311204659; 
 Mon, 20 Mar 2023 04:20:04 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:4100:a064:1ded:25ec:cf2f?
 (p200300cbc7024100a0641ded25eccf2f.dip0.t-ipconnect.de.
 [2003:cb:c702:4100:a064:1ded:25ec:cf2f])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c358900b003edd2ae9acfsm5002652wmq.35.2023.03.20.04.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 04:20:04 -0700 (PDT)
Message-ID: <276a8dd2-64d6-182e-e9ef-7ec45953b62c@redhat.com>
Date: Mon, 20 Mar 2023 12:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] target/s390x/tcg/mem_helper: Remove bad assert() statement
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230317135737.597570-1-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230317135737.597570-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17.03.23 14:57, Thomas Huth wrote:
> The "assert(!nonfault)" statement can be triggered by running the
> "mvpg" s390x kvm-unit-test with TCG. According to Richard: "... the
> assert looks backward. We should only arrive there if nonfault was
> true for the probe (otherwise the probe would have raised the
> exception directly).  I would think we could just remove the assert."
> 
> Fixes: 4049431478 ("target/s390x: Fix s390_probe_access for user-only")
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


