Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC13A6B25D1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 14:49:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paGcm-0001cM-B4; Thu, 09 Mar 2023 08:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1paGcj-0001bl-HB
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:48:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1paGch-0007OW-Sw
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:48:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678369679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pcuuo4bni2qgZ8dPcEK8FNm2IBm/gAbIx1CVMhte0wE=;
 b=WX67ma9MSJlNrVFfPghd3YfewsD71SCiZwewrBOUHrb+G57kP3yeUK0OeRF4yAUX2REzKd
 gzKsqn/auqzxDZcNKcCxpqKOEfW+Xy62xXv+KPos2i9CzCrc4+mIAU191rHZKDxofpaTNj
 UUztxKMk/w5pn5L5VQXVxcmAWoUZ6iA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-URqzdiMLOtyxeYgR1kfQsA-1; Thu, 09 Mar 2023 08:47:57 -0500
X-MC-Unique: URqzdiMLOtyxeYgR1kfQsA-1
Received: by mail-wm1-f69.google.com with SMTP id
 y16-20020a1c4b10000000b003dd1b5d2a36so1559943wma.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 05:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678369676;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pcuuo4bni2qgZ8dPcEK8FNm2IBm/gAbIx1CVMhte0wE=;
 b=snCrjAEwHMVtbwJuK4daQFO7FJ9vHcmulzlNkqjEBlmUN/QnTktnqC3UjcubB9cRN9
 CE08zaPU5GvZRgX7g4JjQVWMS7Mlwbh89dRbbVgGwBKy6FAn9MqSDppXdmj7nXpCsRlA
 0mH1rjDiB2z0ZMi9aYNSqhauCUcVY4VsPSrgu9X7d0TosUpUGr7WSlK8sHhmkZ5OugJD
 LFgAHsFJ/LfTS/eR7veErJnfD/Y6r2rG4KZunzmK+M/HscLerea0kuge+qWVr452v9w6
 gCGaGr5BAVba6f5HTwja5Areg3cIWvLEoBth74JmwpYZiwP18qDjuN4tCQfqQ1PopSvB
 LSpg==
X-Gm-Message-State: AO0yUKXyPAbJu9VZ9IVwris9xDyMIoTL1D+FWwkmT6hGB+au2r9GD9Nx
 PvxyTfbIsGd6GTWkNUSRxf6doBiVCpicL3rygiyAim1f6Gy7r0tQEKo76H1+lPkjG9CBjDVylQw
 +PhMtMefG21rojAI=
X-Received: by 2002:a5d:52cc:0:b0:2ca:2794:87e8 with SMTP id
 r12-20020a5d52cc000000b002ca279487e8mr13736517wrv.21.1678369676480; 
 Thu, 09 Mar 2023 05:47:56 -0800 (PST)
X-Google-Smtp-Source: AK7set8Z5LSVTWUUTlqC0knReSObwSwKl2rHMcW96KV42THHg+Hs9ykITW4nlhYp8g90AKsvBiakgg==
X-Received: by 2002:a5d:52cc:0:b0:2ca:2794:87e8 with SMTP id
 r12-20020a5d52cc000000b002ca279487e8mr13736509wrv.21.1678369676228; 
 Thu, 09 Mar 2023 05:47:56 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-140.web.vodafone.de.
 [109.43.178.140]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c458700b003eb966d39desm2986995wmo.2.2023.03.09.05.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 05:47:54 -0800 (PST)
Message-ID: <2e9087d2-3ea1-816f-40c6-c5cf879243f9@redhat.com>
Date: Thu, 9 Mar 2023 14:47:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/2] tests/tcg/s390x: Add C(G)HRL test
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-s390x@nongnu.org
References: <20230308210226.2847503-1-nsg@linux.ibm.com>
 <20230308210226.2847503-3-nsg@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230308210226.2847503-3-nsg@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 08/03/2023 22.02, Nina Schoetterl-Glausch wrote:
> Test COMPARE HALFWORD RELATIVE LONG instructions.
> Test that the bytes following the second operand do not affect the
> instruction.
> Test the sign extension performed on the second operand.
> 
> Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
> ---
> 
> 
> I don't know what the coding style is for inline asm.
> checkpatch.sh complains about the tabs inside the asm, which I find a
> bit surprising given they're inside a string.
> IMO emitting tabs makes sense in order to be consistent with gcc output.
> I left the tabs in for now, but can remove them.

I don't mind too much, but all the other files use spaces, not tabs, so I 
think it's maybe best to also use spaces here for consistency?

  Thomas


