Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB6B3E2434
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 09:37:30 +0200 (CEST)
Received: from localhost ([::1]:53522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBuQ5-0002ut-3N
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 03:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBuOw-00027x-95
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:36:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBuOu-0002pB-Uz
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628235376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uFvDBip/wDMpU5g7kj7QAqX/WeXCG2tEfiHhbSkF+kI=;
 b=dRjhpCMJaW7qqHvBLC3EzUNBNB3sOxoJRBf0Ume350hnow0Jq0bJwkGCuxNAVaXpm2Z+TZ
 gRFulX8vUpXJfzpKoE1Ufm2tNjRYKJKiF9Hgybo0h17O5y2gupO7jKeHQXtVk+mTavfhzi
 SBB04xT7D2KF1ZWCtmDcVfjLp+kWCIM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-Q9-FVtYQOZah5XB8h6hXOQ-1; Fri, 06 Aug 2021 03:36:12 -0400
X-MC-Unique: Q9-FVtYQOZah5XB8h6hXOQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so1724178wmc.3
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 00:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uFvDBip/wDMpU5g7kj7QAqX/WeXCG2tEfiHhbSkF+kI=;
 b=qhlXwSMJiGPOeF8kwKsvlWIiWE0eq7zYYjaU5C4zQr6ZYqi1/B4wCDEu/M6o7U2zXS
 0dDjUuuHHUIfOqund1rBjPbmypXxbFaEMXr2g3f1rN0rUsQuRB6noxXmO7EnH0LHfQ5s
 3LGVleVZbl4/tZ+r+zsTiY/jGiHyfCVmuEELqBWpanscuncxyB2szB9+5bTcOts7ZzFp
 Hc6vXglJDfSTKehpHK60mOz/uz2NmAuPef+x06bMSZqXkp0QrsYaDA4RgJMvpBigz5D0
 2PkPbyfWQsitelUqZ6qM2DRkOUMorS17hvJuJcc1dhlUbHpQecO0HhWQ83xh9qXNvWga
 sQDw==
X-Gm-Message-State: AOAM531D7PPmqT81CuimXjaCbGZFd84weYeobs4NYBHKqX3MJ1mXEeq9
 VD0A6EMSHaH8kT5SQB1mjDAyN9xSxpfP15nWT3v5+4IEaPDM49ajYoH0hs9dmffRcTvvX30oJe1
 iII3iVQy9XrfaNQI=
X-Received: by 2002:adf:f7c4:: with SMTP id a4mr8961154wrq.130.1628235371037; 
 Fri, 06 Aug 2021 00:36:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx87b8vkMvKa7gKAN4AJG3s4d6e50YP5BcUsRThoA5B60BrNSVVJt1FqSTD0mb2Ag2YdalUIg==
X-Received: by 2002:adf:f7c4:: with SMTP id a4mr8961125wrq.130.1628235370860; 
 Fri, 06 Aug 2021 00:36:10 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id f2sm8516140wrq.69.2021.08.06.00.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 00:36:10 -0700 (PDT)
Subject: Re: [PATCH v1 05/12] s390x/mmu_helper: no need to pass access type to
 mmu_translate_asce()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-6-david@redhat.com>
 <3a4db6af-3f9a-634a-6ff3-2e6cc875b886@redhat.com>
 <fbc5ea20-14bb-e6ca-65f4-7fcfd8fcea04@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <17df3d6f-9eae-7275-86b2-86d4d40a7cc2@redhat.com>
Date: Fri, 6 Aug 2021 09:36:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <fbc5ea20-14bb-e6ca-65f4-7fcfd8fcea04@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/08/2021 09.34, David Hildenbrand wrote:
> On 06.08.21 09:30, Thomas Huth wrote:
>> Fixes: 81d7e3bc45 ("s390x/mmu: Inject DAT exceptions from a single place")
>>
>> Reviewed-by: Thomas Huth<thuth@redhat.com>
> 
> I'm usually a bit careful with Fixes tags if we're not fixing real BUGs. At 
> least in the kernel people will really complain if you do that (because it 
> might result in backports of patches that are absolutely not worth 
> backporting and makes actual bugfixes harder to track). But maybe QEMUs 
> policy is different, so I can add it.

Fair point. Maybe simply mention the commit id in the patch description?

  Thomas


