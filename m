Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755D06D7DA3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 15:23:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk36p-0001KM-OF; Wed, 05 Apr 2023 09:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pk36m-00018V-Pf
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 09:23:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pk36h-00088J-6d
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 09:23:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680701001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s2utHGa2AJkfXRxgHzk9a9Zf75RNHyeR0aSkmM9Co6I=;
 b=NRH1EzzYWlmu9vtWMiHHf0DfDNkfYFpc1xyF03XaeSBEtcGb94QR9OlLVfQSZka8lP4Dqe
 CjpiCi51Z7LA+3mT/t4X/6xJHEk6pEObmw67bPgPudg3ASLVfx+b0arpmKse3nSVUT4Y2K
 G+Z344dgTpZDTZLsXUU55fbz/9muHxI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-LeiPI0a3PnG1OOLL22dxwQ-1; Wed, 05 Apr 2023 09:23:19 -0400
X-MC-Unique: LeiPI0a3PnG1OOLL22dxwQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 c3-20020adfa303000000b002d5737d3835so4433551wrb.21
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 06:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680700998;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s2utHGa2AJkfXRxgHzk9a9Zf75RNHyeR0aSkmM9Co6I=;
 b=ruXUhubgZ9J8Emh/kfed4pnJWDU7Lc1+3NLFNEQDzfwYdYXSAgrORrs0g9nqj0L4ME
 5rZMbBKvgAP1pBeDMgh9rAkppYkTKRCHDRNYiQboxLCNcAgZCWpMCvfIYLUSKhKiKQHv
 uTqfzCJe1b/JLg826nmFHtPE4aXPNSQhFpSxHntQe1oF3om3T2p5QdO4wHU7Kg2/ErtG
 8Q1dHt1nCs4G461zAGT/vPf4FHuu2B0Uq850Qzp5PdQfbmp2FhAGehtN0fc3iCuuNa9U
 pRjMSnXQC0fQHeNGOVZ8ys5KNiDk9I3tghxTd/Pi7phJL3bjLkjD4tTx6RTyL98Yj4ap
 x7PQ==
X-Gm-Message-State: AAQBX9do8tO6B6QXEVWNcBxOKwuTgogacZsG2WLsSmAamGqnePM+P7zI
 ZBUC0i6/xIeerjOu6l811hU1JcICBuVafrf6fwGVV3p+XbHfBC9Pc5hoTIl7JbRngJT9LIyNn8o
 pdmEyJPHtBfl0nG0=
X-Received: by 2002:a05:600c:252:b0:3ed:320a:3721 with SMTP id
 18-20020a05600c025200b003ed320a3721mr5029536wmj.22.1680700998623; 
 Wed, 05 Apr 2023 06:23:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350b4R4Ee1MwMMECNE6jEkYXFGct4FQMKF9rJMg15vVAPTKgFwOJiRG60JUYJfofwgxaplvTRiw==
X-Received: by 2002:a05:600c:252:b0:3ed:320a:3721 with SMTP id
 18-20020a05600c025200b003ed320a3721mr5029516wmj.22.1680700998284; 
 Wed, 05 Apr 2023 06:23:18 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:d00:ca74:d9ea:11e0:dfb?
 (p200300cbc7030d00ca74d9ea11e00dfb.dip0.t-ipconnect.de.
 [2003:cb:c703:d00:ca74:d9ea:11e0:dfb])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a7bcb87000000b003edcc2223c6sm2188054wmi.28.2023.04.05.06.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 06:23:17 -0700 (PDT)
Message-ID: <81993f24-41fd-d52d-baa0-0328d414cf20@redhat.com>
Date: Wed, 5 Apr 2023 15:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH RFC 1/1] memory: Address space map listener
Content-Language: en-US
To: Antonio Caggiano <quic_acaggian@quicinc.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230405125756.63290-1-quic_acaggian@quicinc.com>
 <20230405125756.63290-2-quic_acaggian@quicinc.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230405125756.63290-2-quic_acaggian@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.355, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 05.04.23 14:57, Antonio Caggiano wrote:
> Introduce a MemoryListener callback for address space map events.
> 

Why?

-- 
Thanks,

David / dhildenb


