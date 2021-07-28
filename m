Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACAA3D88E9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 09:36:32 +0200 (CEST)
Received: from localhost ([::1]:48616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8e7D-0006Pq-3e
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 03:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m8e5S-0004Zr-HL
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 03:34:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m8e5P-0003j7-R8
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 03:34:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627457678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YF9T9NJXxJVXAkJX2wFDG5NvkFDZC+5XD9DYe5bqamY=;
 b=SmhWtuLQOW+AR3ycfQe0e6+1SoBWgLM5LJZCiioPsW7UknMO8HmGS7K1ChXVZXDJhVfm2G
 5bh3YKAoPhajPITdtrVrziT9hDWzwhO5O/hE67EpzVZlG/pXb2YnPvN2k7J4IfhU3Fed2t
 ZHsDhUPRwDvBr2yOM/+g7/lnFBSVQpM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-LXfWoYV9MpO1rse08dRJuw-1; Wed, 28 Jul 2021 03:34:34 -0400
X-MC-Unique: LXfWoYV9MpO1rse08dRJuw-1
Received: by mail-ej1-f69.google.com with SMTP id
 g7-20020a1709068687b029041c273a883dso511594ejx.3
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 00:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YF9T9NJXxJVXAkJX2wFDG5NvkFDZC+5XD9DYe5bqamY=;
 b=Nx05k6Y+byRk1c/9sHYDPRCBpk0O5w0xE/1GK5YNJHqkkUeGsMTpoVjnBDY0IJRQ1T
 exciOc6SZ+NUHpSM8J7Eo7KcUlhE6/yMCTp2XJ6jM0OCppV1Vx9lGpAYx2dvsB8veAHN
 rsG37p4g5THCliM7kPWvPNJMi5R4C1zqLdPMDbIWrtcvljzOHrQQReWLSt2SFgD2K0pS
 sloMv2wPi5/HK/e28VFFdlxSB3eKqLVXQJymHk2qjBlDBI6mzpqfAIQWyKHTKI5Qh9d4
 x/bmQ+KgSHfu7HPyKbunDS5paQ79LgaQNExhGP0LLHc64bxCeOYAxjmNgwCyOSAiWzLl
 zNOg==
X-Gm-Message-State: AOAM533p5dMivG4Udulx6ywweA/oRlIz+8KhVxcMHW7sqCnmjGUgsZmp
 8A0KkCeuBMyVFmko74WnHlEUbf9Flx34/lVp1r3mKz5RPEXcwy2z8lr/eWh4kTwgJ9YemuMBwhE
 Xc9jMRycbqrPYkOQ=
X-Received: by 2002:a17:906:6d85:: with SMTP id
 h5mr1934773ejt.305.1627457673649; 
 Wed, 28 Jul 2021 00:34:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBcbAXYaYY78eub6wr9krsYOlP5GdWuSTHbr15+VoXvAMw8uEpgLrBUL/quVBPZk+7428rCw==
X-Received: by 2002:a17:906:6d85:: with SMTP id
 h5mr1934769ejt.305.1627457673506; 
 Wed, 28 Jul 2021 00:34:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id e14sm530461edr.59.2021.07.28.00.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 00:34:33 -0700 (PDT)
Subject: Re: [PATCH 0/3] docs: Convert barrier.txt to rST
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210727204112.12579-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1842c22c-45d2-385f-2fee-4e639c09a07b@redhat.com>
Date: Wed, 28 Jul 2021 09:34:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727204112.12579-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/07/21 22:41, Peter Maydell wrote:
> This patchset converts docs/barrier.txt to rST, putting
> it in the appropriate places:
>   * the protocol info lives in interop/
>   * the "how to use this" info lives in system/
>   * TODO remarks live in the .c file :-)
> 
> thanks
> -- PMM
> 
> Peter Maydell (3):
>    docs: Move the protocol part of barrier.txt into interop
>    ui/input-barrier: Move TODOs from barrier.txt to a comment
>    docs: Move user-facing barrier docs into system manual
> 
>   docs/barrier.txt         | 370 ----------------------------------
>   docs/interop/barrier.rst | 426 +++++++++++++++++++++++++++++++++++++++
>   docs/interop/index.rst   |   1 +
>   docs/system/barrier.rst  |  44 ++++
>   docs/system/index.rst    |   1 +
>   ui/input-barrier.c       |   5 +
>   6 files changed, 477 insertions(+), 370 deletions(-)
>   delete mode 100644 docs/barrier.txt
>   create mode 100644 docs/interop/barrier.rst
>   create mode 100644 docs/system/barrier.rst
> 

Apart from the two typos in patch 3,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


