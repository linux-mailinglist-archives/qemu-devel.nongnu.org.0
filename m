Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A12E5E64A3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 16:04:35 +0200 (CEST)
Received: from localhost ([::1]:33562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obMob-0001rw-Vs
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 10:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obLxV-0001qk-9t
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:09:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obLxR-0008Vt-LU
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:09:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663852176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJQYi3mGz3p8EkvJBVlXoG1moNT0+A817UE4iJjym7Q=;
 b=grN7Ii6kAuSljYRfL1zmYwYQgC8svjXlajpO9fubs2ifLY/2DcXsBxzv9eAXe3t3j2JR1l
 Plr32IVBT8UC07Fr6cYPulDx0K6rh9/nArHnPw22CuE9mEW2zQcJETcD6U7RfuBlliZzWf
 cQXEhYJKGFxd6JlHvP4pqWmjn/kw3u8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-326-gcExeLa0NviksysF-oRvrA-1; Thu, 22 Sep 2022 09:09:35 -0400
X-MC-Unique: gcExeLa0NviksysF-oRvrA-1
Received: by mail-wr1-f71.google.com with SMTP id
 x1-20020adfbb41000000b0022b113add45so3101885wrg.10
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 06:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=XJQYi3mGz3p8EkvJBVlXoG1moNT0+A817UE4iJjym7Q=;
 b=PXi/GpnTxj0EZCJTKpGjwBFwGJvZtxMrbUbsgBpWIVbhEsLBNPmGLAlMEiS5OjcHl2
 XpTZHBqvoVu75I21y+GVckGHy1lTtNtIap3rc3U9nbjCsfpa3/wVCulztivAoyJhShL1
 /zipe6OwJxk3miGRHOhxJagCZvP6O3ocd8xr/yLD6KZgnulnxB/6fTLP1iweTE2PmImd
 VlE1VFs81ii2C2fp66LFGoSGe7FmyFTZLM6DteYayiY2GhxOF0AqQj3DL64cNnRDZLxK
 0GcaoZH/5r8vSc2Nm5FwobDM6NaRzkaF9bDbPMiDiBaSDwbEoVUvFlCMIX2YA+8IwcW3
 OJNA==
X-Gm-Message-State: ACrzQf0QZDWx85Yb9rXxuc+RxOpoZGCEfV1S3eGGXfQnbVGP9fyh9wOp
 rVDgmU08tbFQvGfgznWJGB+oUBZE2UWKD1WXWVugBXJ+cXQfZ/06OdAYASH+rcP1JRwS4sG6Zl8
 QIAMQo8Qf6fKSTSU=
X-Received: by 2002:a05:6000:168e:b0:22a:4e45:7469 with SMTP id
 y14-20020a056000168e00b0022a4e457469mr1882373wrd.681.1663852174586; 
 Thu, 22 Sep 2022 06:09:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7KoF7IftDdpw6Ael88hksCUrlJhnede1v2LRSHIX4NkDw/V88ZimpNcv8CmVNl3QwA3gP61Q==
X-Received: by 2002:a05:6000:168e:b0:22a:4e45:7469 with SMTP id
 y14-20020a056000168e00b0022a4e457469mr1882360wrd.681.1663852174383; 
 Thu, 22 Sep 2022 06:09:34 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:2200:d595:cc20:2e3a:fc5f?
 (p200300cbc7082200d595cc202e3afc5f.dip0.t-ipconnect.de.
 [2003:cb:c708:2200:d595:cc20:2e3a:fc5f])
 by smtp.gmail.com with ESMTPSA id
 id21-20020a05600ca19500b003b27f644488sm5717642wmb.29.2022.09.22.06.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 06:09:33 -0700 (PDT)
Message-ID: <529a31a8-5d48-ac31-21d7-079182667d2b@redhat.com>
Date: Thu, 22 Sep 2022 15:09:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v8 2/2] target/s390x: support PRNO_TRNG instruction
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <20220921100729.2942008-2-Jason@zx2c4.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220921100729.2942008-2-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.893, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 21.09.22 12:07, Jason A. Donenfeld wrote:
> In order for hosts running inside of TCG to initialize the kernel's
> random number generator, we should support the PRNO_TRNG instruction,
> backed in the usual way with the qemu_guest_getrandom helper. This is
> confirmed working on Linux 5.19.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Harald Freudenberger <freude@linux.ibm.com>
> Cc: Holger Dengler <dengler@linux.ibm.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Thanks!

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


