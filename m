Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C265E41B189
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 16:04:37 +0200 (CEST)
Received: from localhost ([::1]:40102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVDim-0007GP-Ml
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 10:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVDfe-0004kr-3n
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 10:01:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVDfb-0002f6-7c
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 10:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632837677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2xyBTgIERouwgHPPvJ5KEGNeDZmYaWeQHromD4/iCh8=;
 b=CFxfsZIAyIOK8ba4++hau2zHyKlSv5PPBEHWUU2qpStUQsqzNR8ULyNN+ErIszAKSwmDgL
 M1SI6VPDpc9/Q0eDe6/xn58Q15SlDwYvNRlLU34igORY+osqLtuWu3TTpXV+P6qmYp3A0M
 RVYbsYypIp2m1CRXLGU1Oo50Q1uB/6k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-CJhhQxI6MV6xEY4DIUlBbA-1; Tue, 28 Sep 2021 10:01:12 -0400
X-MC-Unique: CJhhQxI6MV6xEY4DIUlBbA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so2074459wma.4
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 07:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2xyBTgIERouwgHPPvJ5KEGNeDZmYaWeQHromD4/iCh8=;
 b=i+c/4/fcQhxTWB+gjwTTzU9bksfzIxKZesgu/+EvkxWGlmTjP6JUH/E5muHmX5UNva
 1t8qagFxUZsG+f2MNCoM+yyPtcrh2BosXJjCz8cNU9+zHpLLEyHmyLRgjNmY9ZsIkJjk
 +gyRmDk514wSKr02iMUlvMztsk2zx8ZF99qW3Cdur8ZlOmJjXb2z4UHLZ7aLdpawBt5o
 4gJDxLrVhwnOPoNArPmqfMYbcQj2K5/S3IweUH8IpZROKE/4pwyxdnXWXaPR0Djluw9J
 nVxk7cv8MLG24jAki82kSGXHORyEBMl/nYEzUBHg1riC+2ositb2MtjBDHCVfp9nzACw
 4slw==
X-Gm-Message-State: AOAM530nti5wHvHzqJG4zTdec1kp0wIYMjxcdK+3VNE00Dv1it4VQz9B
 DR2REJbXr4Yx/8sqNpy6OLEqUvpkWMlQYJpMb3kJRLO0cFuL/5mS2+A9QK4xPUab9TjSM4O1q1t
 VmK5rFafu9TNQJtA=
X-Received: by 2002:adf:e650:: with SMTP id b16mr119356wrn.393.1632837671047; 
 Tue, 28 Sep 2021 07:01:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziJ6Cxw0ghpGPLN8BVLFk6P8mwL4N/+HyaGIAGHD70p5DE1pcBjtyQX5qvY08DZv9on4nysw==
X-Received: by 2002:adf:e650:: with SMTP id b16mr119313wrn.393.1632837670817; 
 Tue, 28 Sep 2021 07:01:10 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23aaf.dip0.t-ipconnect.de. [79.242.58.175])
 by smtp.gmail.com with ESMTPSA id h7sm11598924wrx.14.2021.09.28.07.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 07:01:10 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] util/oslib-posix: Support MADV_POPULATE_WRITE for
 os_mem_prealloc()
To: qemu-devel@nongnu.org
References: <20210816094739.21970-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <69a0c6e3-faec-b221-e7b1-48129696bdab@redhat.com>
Date: Tue, 28 Sep 2021 16:01:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816094739.21970-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.08.21 11:47, David Hildenbrand wrote:
> #1 is a preparation for improved error reporting, #2 adds support for
> MADV_POPULATE_WRITE, #3 cleans up the code to avoid global variables and
> prepare for concurrency, #4 and #5 optimize thread handling, #6 makes
> os_mem_prealloc() safe to be called from multiple threads concurrently and
> #7 makes the SIGBUS handler coexist cleanly with the MCE SIGBUS handler
> under Linux.
> 
> Details regarding MADV_POPULATE_WRITE can be found in introducing upstream
> Linux commits 4ca9b3859dac ("mm/madvise: introduce
> MADV_POPULATE_(READ|WRITE) to prefault page tables") and eb2faa513c24
> ("mm/madvise: report SIGBUS as -EFAULT for MADV_POPULATE_(READ|WRITE)"),
> and in the man page proposal [1].

Gentle ping.


-- 
Thanks,

David / dhildenb


