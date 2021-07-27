Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7A03D7A53
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 17:59:10 +0200 (CEST)
Received: from localhost ([::1]:54614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8PU5-0005bI-Ij
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 11:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8PSu-0003xU-Pe
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:57:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8PSs-0001aL-Gs
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627401472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vBWf+K9WmCYkmoNIKW5TjiYUq9mBkr5gxWxHlU2W67o=;
 b=LWfetoCAs6vjfT4MHA0cNFJ9v8wxVE3WHLZgW80K/3ZA/fwi0kMSTT6sZiPjeZIFD96bUS
 wmKZUN2khREl2ZxvTb941kTH8KZJO4OlPeL+hIbGKQwn5KBkRO9DFwF7yszhpp/kcNl8MF
 oUz0Aa2ezARH4kspmIwN9xttSvBQMT4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-cGtqClSEMNG5LxF_xzXr5w-1; Tue, 27 Jul 2021 11:57:50 -0400
X-MC-Unique: cGtqClSEMNG5LxF_xzXr5w-1
Received: by mail-wr1-f71.google.com with SMTP id
 f6-20020adfe9060000b0290153abe88c2dso1903060wrm.20
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 08:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vBWf+K9WmCYkmoNIKW5TjiYUq9mBkr5gxWxHlU2W67o=;
 b=BvGRM40NbHB0xhU64WAKH0LGvVPw5bWJOGS+2spKKN3GAOpZHUk+iiZc5T0CFUcLK8
 g0FFJrRWaemKhv9Z7Ag/hShi17yW2ki/lplk4c8B4AlO5ViutVslgiexTDz3n1LZ5s6j
 5tJTJwduPq+wlRsQg1xVj3eOTe0/wua8XTBmKB15MkZvugyDeo3eI8ZsUQvIG2qeoF0K
 RpeNwuFIC8gQ3SDt7fCNnsM7LhStkoKL1Evj5KWdpnT9UHKp4jLu1CdWXjfyKmRHDue3
 5XQ8wYR1Bjl2PYKl9Z+A7L425jncp6+o4hDb49IJiLuniq+N3lv7T44h+pvMOzgJ8UDY
 GrsQ==
X-Gm-Message-State: AOAM530//G6gXS3Cv3zTMEHgamz+oL1lxOlTfvs9VmD7v0/wWfc6OF7k
 3pYP2vOa6yWxGR6x6Od0fT8Iigz9wcQYOqYR6IIRZf50aoL09ZJ9Nhis8jlldsGfjTPRrKLLgre
 onmuU4nX/2/+BPGE=
X-Received: by 2002:adf:f081:: with SMTP id n1mr17399425wro.235.1627401469812; 
 Tue, 27 Jul 2021 08:57:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSjpxhx05ffWbVKDnHYX7jILxf62HtqnDMWdhLjGDts/VnLy9ZEk9pEdrHR0bI3p0V2PWxww==
X-Received: by 2002:adf:f081:: with SMTP id n1mr17399413wro.235.1627401469649; 
 Tue, 27 Jul 2021 08:57:49 -0700 (PDT)
Received: from thuth.remote.csb (pd9e8352f.dip0.t-ipconnect.de.
 [217.232.53.47])
 by smtp.gmail.com with ESMTPSA id u11sm3629374wrp.26.2021.07.27.08.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 08:57:49 -0700 (PDT)
Subject: Re: [PATCH-for-6.1 v5 0/4] gitlab-ci: Document custom CI/CD
 variables, fix 'when:' conditions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210727142431.1672530-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c970138a-7fb5-5243-910d-7f3a8d66cfcd@redhat.com>
Date: Tue, 27 Jul 2021 17:57:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210727142431.1672530-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/07/2021 16.24, Philippe Mathieu-Daudé wrote:
> Since v4:
> - Fixed typo, update link (thuth)
> 
> Since v3:
> - Unfortunately patch 4 v2 got merged as 0a9487d80af so
>    rebase & reword.
> 
> Philippe Mathieu-Daudé (4):
>    docs: Document GitLab custom CI/CD variables
>    gitlab-ci: Fix 'when:' condition in acceptance_test_job_template
>    gitlab-ci: Fix 'when:' condition in EDK2 jobs
>    gitlab-ci: Fix 'when:' condition in OpenSBI jobs
> 
>   docs/devel/ci.rst                   | 40 +++++++++++++++++++++++++++++
>   .gitlab-ci.d/buildtest-template.yml |  4 +--
>   .gitlab-ci.d/edk2.yml               |  6 ++---
>   .gitlab-ci.d/opensbi.yml            |  8 +++---
>   .gitlab-ci.yml                      | 19 ++------------
>   5 files changed, 51 insertions(+), 26 deletions(-)

Thanks, queued to my testing-next tree now:

https://gitlab.com/thuth/qemu/-/commits/testing-next/

  Thomas


