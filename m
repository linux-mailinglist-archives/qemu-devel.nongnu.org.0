Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603A4426F81
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 19:21:59 +0200 (CEST)
Received: from localhost ([::1]:60912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYtZF-0002Nu-Uc
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 13:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYtWH-0008S0-Pz
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 13:18:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYtWE-00007w-Go
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 13:18:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633713529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cu1Xhus4UVzZ5OqRgELwx8CiaOVsgSCTi0ZTkyEwAaA=;
 b=Dy/v3XIq0MV/2cdsySFeCHSL5hZXCI39lTQYHxAhk38uj9o+jACcoLCETPlsHjrzP1wY1r
 f+mSlTKjrUjDAmOaqoEM6BW0b7d18QJ7wn8Qhu/z6sD9MR85lpfFioZ+dxx6W/PfkO/1E6
 FETBrcU2+4tSWLWZvjfjAEdZ9fZdApU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-h1SYVggiM9m8KQAgnbPTRA-1; Fri, 08 Oct 2021 13:18:48 -0400
X-MC-Unique: h1SYVggiM9m8KQAgnbPTRA-1
Received: by mail-ed1-f69.google.com with SMTP id
 x5-20020a50f185000000b003db0f796903so9806057edl.18
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 10:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cu1Xhus4UVzZ5OqRgELwx8CiaOVsgSCTi0ZTkyEwAaA=;
 b=v+Q6WqeoJzAdjCD7O8Q7VYnqmEZUMBZ7w355b5h5ldmvwilHgACkW6mnHhL7aKxmLZ
 LE5/NIAMjHkjc/IZoi/VcGJrDMmH+INyfxscVr+ykNx0MAx7faU2O4jvvCZ163piJpuU
 P4yj90GUtMVrYNGoh861l2U1Ttq97eMpXc8KW2WOGWp7XxfXkSSGv5R5rDU1Pj7F0Iy/
 rITfiGMkyOgCSKHlKCJfDezynpBZE7+MaxVMDM9fAX2fc6/gQmycozHLZyTiQmNAzL2E
 N8g8LwiSeKliAwT/LnexWv8aMoe0oK+SBzV+PcBACltfTa1+8rgMMmoI+Jq1w/RZq2Lj
 HRtA==
X-Gm-Message-State: AOAM533hjRVxbdK6zcroh9H7Xh24mcbzFoQO6vvXSLPs0Ee15mGqnkYy
 JOspqurNL//efBXUsmxG74ZdqZbpeA2eCnRjmn/4BwEdkukCavE4bykCN4aTt1fPeaOx6TtzApy
 BjtOZDvV14qkvdCY=
X-Received: by 2002:a05:6402:2550:: with SMTP id
 l16mr12835888edb.229.1633713526919; 
 Fri, 08 Oct 2021 10:18:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeUXxgg/eVCVVBdi9qMszxJUPJupS4P65kMu3ihD4+Uz8C3V6bsfhvz/C7N0GLBtGrJLsAxg==
X-Received: by 2002:a05:6402:2550:: with SMTP id
 l16mr12835872edb.229.1633713526725; 
 Fri, 08 Oct 2021 10:18:46 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id z4sm1148693ejw.46.2021.10.08.10.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 10:18:46 -0700 (PDT)
Message-ID: <c3317b7c-1210-23c6-1105-e1b4f76699c5@redhat.com>
Date: Fri, 8 Oct 2021 19:18:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hvf: Determine slot count from struct layout
To: Alexander Graf <agraf@csgraf.de>, QEMU Developers <qemu-devel@nongnu.org>
References: <20211008054616.43828-1-agraf@csgraf.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211008054616.43828-1-agraf@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/10/21 07:46, Alexander Graf wrote:
> We can handle up to a static amount of memory slots, capped by the size of
> an internal array.
> 
> Let's make sure that array size is the only source of truth for the number
> of elements in that array.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>   accel/hvf/hvf-accel-ops.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
> index 6cbd2c3f97..2b2c411076 100644
> --- a/accel/hvf/hvf-accel-ops.c
> +++ b/accel/hvf/hvf-accel-ops.c
> @@ -321,7 +321,7 @@ static int hvf_accel_init(MachineState *ms)
>   
>       s = g_new0(HVFState, 1);
>   
> -    s->num_slots = 32;
> +    s->num_slots = ARRAY_SIZE(s->slots);
>       for (x = 0; x < s->num_slots; ++x) {
>           s->slots[x].size = 0;
>           s->slots[x].slot_id = x;
> 

Queued, thanks.

Paolo


