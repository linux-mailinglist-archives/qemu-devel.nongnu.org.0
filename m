Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F44557FA58
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 09:37:33 +0200 (CEST)
Received: from localhost ([::1]:44204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFseh-0003Wy-Me
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 03:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oFsc1-0001lx-Uy
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 03:34:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oFsby-0002Yb-CX
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 03:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658734481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EMT0Zz6PlCvWfFiPiUgbyQcC0K6CUegRDOtjEwHjdtE=;
 b=iUnnTUcIRKqdh2JlsIwFyweiZ/zcmQNpSR10nrxs5csnNfGQ12uaxkCNkn54fYvz7QpWJ2
 PZJvP456ERcOL4GOJy5Ew0gmvyO3k44QZdrRQom/xYP8aoIaxRZFQF7Ek4wdZkJA2XYrbN
 eajBWU//RzF35L5aymfr7ZiW/rqcZ2I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-85-_88QxPFS5c8NIm9O-VQ-1; Mon, 25 Jul 2022 03:34:37 -0400
X-MC-Unique: 85-_88QxPFS5c8NIm9O-VQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 h6-20020adfaa86000000b0021e47bcbc6dso1396174wrc.16
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 00:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EMT0Zz6PlCvWfFiPiUgbyQcC0K6CUegRDOtjEwHjdtE=;
 b=fmlzUybN6f3b9AUlor9arlaXorSaDEfjAm/QETGFJ322f93JJ+XZ9zo9YL5859NS2P
 Mm7U/mivrjlH5+EJZUMaFYvr/hugLyMHZyEo6wMZl3tHBPb5Ef+XjW1nTH+e+ewUg20+
 OQb9YmXLwcCMbdocMY8E+9dGgPyhvFl6Yg8l8KrEx46RW97i6CGTCS8D2oqMMZGKaphI
 g5pJdwtJOkyrXli+k4VcpuTLgwoKP0552AHtUAr9UAcndwFnwBnhvZx4EVgJ7N2hq7w9
 mgzIR3vPI5Fq4u0mY+5IM+1tmTcqRkrObkOzjHvw64ewNmpXSskFbMVLeO149WzYkHV0
 +fYw==
X-Gm-Message-State: AJIora/42dUr4Bmg+/BZaAJZOCQEhgrlwvXEoUdf/FVkNK7Gd8MeY1Dt
 YLLmOyPv7TSBElwrOP7qnqjHpjw/k1U/tM2UvaukG0xRLjtqXzFVMK0s7t8fKgmqPJk2RpKX1j8
 AFwaaHtHCpBFuisY=
X-Received: by 2002:a5d:498f:0:b0:21e:4074:8c49 with SMTP id
 r15-20020a5d498f000000b0021e40748c49mr7006346wrq.70.1658734476238; 
 Mon, 25 Jul 2022 00:34:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tI6hWj5b/Db1+V7DaSAAsqO+QUZTYYeBfm/HWX+Ix+58FqOm6Jsje7bovQz5zJaHY8VQ/tFg==
X-Received: by 2002:a5d:498f:0:b0:21e:4074:8c49 with SMTP id
 r15-20020a5d498f000000b0021e40748c49mr7006321wrq.70.1658734475858; 
 Mon, 25 Jul 2022 00:34:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:8c00:eee4:63f0:cef2:5ac0?
 (p200300cbc7048c00eee463f0cef25ac0.dip0.t-ipconnect.de.
 [2003:cb:c704:8c00:eee4:63f0:cef2:5ac0])
 by smtp.gmail.com with ESMTPSA id
 v6-20020adfebc6000000b0021e8d205705sm1721886wrn.51.2022.07.25.00.34.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 00:34:35 -0700 (PDT)
Message-ID: <e84b8ac6-fb3e-ec47-87f4-25281b00304a@redhat.com>
Date: Mon, 25 Jul 2022 09:34:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] qapi: Add exit-failure PanicAction
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220722233614.7254-1-iii@linux.ibm.com>
 <20220722233614.7254-2-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220722233614.7254-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 23.07.22 01:36, Ilya Leoshkevich wrote:
> Currently QEMU exits with code 0 on both panic an shutdown. For tests
> it is useful to return 1 on panic, so that it counts as a test
> failure.
> 
> Introduce a new exit-failure PanicAction that makes main() return
> EXIT_FAILURE. Tests can use -action panic=exit-failure option to
> activate this behavior.

Roughly what I proposed, nice.

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


