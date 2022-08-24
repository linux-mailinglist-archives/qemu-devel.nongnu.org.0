Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9638359F47B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 09:41:31 +0200 (CEST)
Received: from localhost ([::1]:34720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQl10-0002ae-4N
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 03:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oQkti-0004y9-AV
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 03:33:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oQkte-00075P-CO
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 03:33:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661326433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JrFRMUIhVyhELzVX0RFci6BGHhJHej/Z8yGt1hc41Ws=;
 b=SAlTBRXVVZJibvRzQk622Cpmuhip/oSuI36Ovve5wezsaZs+uNTG6kHM4VRWhDo34pCPPp
 6zl/59hCigGQKuZf3aDJBiF3ivtDb23CXu1ssZGnbsXvu1yEgAAojUuGFKiv029uusKcdt
 kFrdVuB2QVs6vwUpa19LA18i/vf6QQM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-398-X4LQJaVSNqaguDjOcPqrUg-1; Wed, 24 Aug 2022 03:33:51 -0400
X-MC-Unique: X4LQJaVSNqaguDjOcPqrUg-1
Received: by mail-wm1-f70.google.com with SMTP id
 c66-20020a1c3545000000b003a5f6dd6a25so455790wma.1
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 00:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=JrFRMUIhVyhELzVX0RFci6BGHhJHej/Z8yGt1hc41Ws=;
 b=wNUrL9UB1qDLLg/4jm5OJFzQD4VSWwqDQ2N3Y4VjtF+N+JvjkHmL5c3kiflyusa5Eq
 d4NOjwgccUAxax05jhXK2wnAK9tiF7xgEMB4Y9zQVK9bCocME3HsHbUwT4Kk3DAvhs3z
 zJQYPSszxkHIAIELmy+zk4D3BNx4Woy9xFqQhWl5ZR2KURmsBA0Xf7RK1KSXMjPlA7mZ
 g38bUGqxwBhl3EPSWYG7KVNfNbyn3Uf1NbMuCHFP5JuQ2TaKoZ0zHcRNWzfjGaah7ii8
 o8/ii6gIXy78ClNG41LorEIvPwFrc1Ry2kOE7fxg8T0RKr2O3lSwMxfhhJEwB7PXKIBO
 rGeg==
X-Gm-Message-State: ACgBeo2ULKLvWEGXZWxQNyy22JHPpxC4MFggZ2lDeYL94uB8i+82x97l
 +NGGYUKi5u/yWfeNSBoXhVC6B6dkJ7m/Jb2KlxxqPbFqpInHGMh9BOCUGB/tgIkCwjcJ9xpmghf
 0Fuc0fI+cHlZMGvk=
X-Received: by 2002:a1c:c91a:0:b0:3a6:38bf:2c36 with SMTP id
 f26-20020a1cc91a000000b003a638bf2c36mr4384437wmb.38.1661326430358; 
 Wed, 24 Aug 2022 00:33:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6sREHcIjyijxMpGhxVfXgoi8QoDsmL3mQRT5PNzlgzzUH/2blYmK14sPcPjHowzhEH4+hnKQ==
X-Received: by 2002:a1c:c91a:0:b0:3a6:38bf:2c36 with SMTP id
 f26-20020a1cc91a000000b003a638bf2c36mr4384418wmb.38.1661326430094; 
 Wed, 24 Aug 2022 00:33:50 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:c500:5445:cf40:2e32:6e73?
 (p200300cbc707c5005445cf402e326e73.dip0.t-ipconnect.de.
 [2003:cb:c707:c500:5445:cf40:2e32:6e73])
 by smtp.gmail.com with ESMTPSA id
 y3-20020adfee03000000b0021efc75914esm15779075wrn.79.2022.08.24.00.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 00:33:49 -0700 (PDT)
Message-ID: <d6808634-945d-ee6d-a06c-a6dcfa2fd6d0@redhat.com>
Date: Wed, 24 Aug 2022 09:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/2] target/s390x: s390_probe_access fixes
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20220823213805.1970804-1-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220823213805.1970804-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.08.22 23:38, Richard Henderson wrote:
> First, as pointed out by David; second by inspection.
> 
> I really wish there were a better way to structure this,
> but alas, I don't see any alternatives that aren't just
> different but similar amounts of ugly.
> 

The only feasible way would be having a arch-specific callback from
inside the probe code that would, similarly to tlb_fill code for !USER
store these values in the cpu environment -- then we could similarly
just look them up after the probe access.

-- 
Thanks,

David / dhildenb


