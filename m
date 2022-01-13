Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D80B48D38D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 09:25:30 +0100 (CET)
Received: from localhost ([::1]:52030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7vQG-0008Kc-Sd
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 03:25:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7vOX-0007FS-8s
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 03:23:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7vOV-0005MX-OW
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 03:23:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642062219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ros0vUuRG+erahexHeC/FURw+HoekVLBuFY7I9WaZ4Y=;
 b=AEcYbUNWBFEmeVfCNFvPv7PNmVIcWb1tuRC0CPUelJoyxbO9hzHcBn+w0Ta4T3HerWIIlq
 vVg/c8xa8/gvLmWhsstOOhMwVLde8Xn4HJQgyiJR6AxHHnzuOJlXGiJ2poYe3Y2gzi7dbl
 Kcy2KnQgqpGorMhA6LibKX9yqXSdVTQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-s4O99ikbMBWB8mRWy9preg-1; Thu, 13 Jan 2022 03:23:38 -0500
X-MC-Unique: s4O99ikbMBWB8mRWy9preg-1
Received: by mail-ed1-f71.google.com with SMTP id
 z8-20020a056402274800b003f8580bfb99so4659272edd.11
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 00:23:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ros0vUuRG+erahexHeC/FURw+HoekVLBuFY7I9WaZ4Y=;
 b=FZPCd3rIfVy4Qj83Oen6ryHp9f79ZbKayWOxaTQpM+ApU83o8MR+dC+KMvMcHvmsmg
 6On119msUeC+MAUVI0fn8gciWFtCZ88zga2/qK/za74Yj1WXb3XHq+y36Ea9AIOqlajf
 YXsWBwzAAShQlzOr+yi9sEPq0D6iG2M4DaPeER2RVRicFvFOH8e/bU4wXApcIlScysDW
 NzeKOEwT8rZ2Yj+C3xUyWapYCgEJXixhraAYROH2e7box2a4veld+Q61sfflLOOAdZIT
 4PSUgW53XwtjPrqJ4/OzlggHWJVLv8izSYuC6CkPyvgujJDmTMsgonHqwDsVyYK4rWxT
 HFTg==
X-Gm-Message-State: AOAM5324JYTGaDWExqf9aX+QjXucJ0/BPwrSu27WbdPhkphetXGfbXfT
 kFwb1b34NznHzyh8TlKveRIX2E4Wdxe+PGUalpx0w/rr8m+lE1+HgwgHTFbaMkWclVvhBcWXGTe
 H6dvJitpqQpTOoWg=
X-Received: by 2002:a17:907:7fa0:: with SMTP id
 qk32mr2699153ejc.673.1642062217200; 
 Thu, 13 Jan 2022 00:23:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcwknQ2NxrtXUa01DInjS9hAtW2UtVjF7rrb1AorjeZU9ufL70dXLJe3ktMmB8CIaRWXXjXA==
X-Received: by 2002:a17:906:4796:: with SMTP id
 cw22mr2845582ejc.594.1642062206824; 
 Thu, 13 Jan 2022 00:23:26 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:e200:8511:ed0f:ac2c:42f7?
 (p200300cbc703e2008511ed0fac2c42f7.dip0.t-ipconnect.de.
 [2003:cb:c703:e200:8511:ed0f:ac2c:42f7])
 by smtp.gmail.com with ESMTPSA id kw22sm619236ejc.132.2022.01.13.00.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 00:23:26 -0800 (PST)
Message-ID: <c47dc3fe-00e0-7ef5-4e47-9a1f8da4912d@redhat.com>
Date: Thu, 13 Jan 2022 09:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 4/5] target/s390x: Fix shifting 32-bit values for more
 than 31 bits
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220112165016.226996-1-iii@linux.ibm.com>
 <20220112165016.226996-5-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220112165016.226996-5-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.01.22 17:50, Ilya Leoshkevich wrote:
> According to PoP, both 32- and 64-bit shifts use lowest 6 address
> bits. The current code special-cases 32-bit shifts to use only 5 bits,
> which is not correct. For example, shifting by 32 bits currently
> preserves the initial value, however, it's supposed zero it out
> instead.
> 
> Fix by merging sh32 and sh64 and adapting CC calculation to shift
> values greater than 31.
> 
> Fixes: cbe24bfa91d2 ("target-s390: Convert SHIFT, ROTATE SINGLE")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


