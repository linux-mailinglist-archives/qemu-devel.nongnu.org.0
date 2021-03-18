Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A42340D05
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:32:01 +0100 (CET)
Received: from localhost ([::1]:59534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMxRA-0004Xo-8y
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMx9Q-0007vZ-Hv
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:13:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMx9M-0001DS-VC
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616091214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5zE9hSt0ZCyNVw3dZcbX72kVT1wWC5JOAhrLPf/rT8k=;
 b=AwXnEDMLIc8v9gLWwqiFz06AZf9Q7P+nWEhybMylBo8WBbz1w0kMfweYCmmDlZzOIAkk71
 HY0qBe4O+oMkTqzs3jubOQZtWPk0ALQHNSdd4zKTk86l2EpZejUNJMDB+mBiZxgb1vWgTp
 84B0J8OOJzfm29oMIigKcXWnkC2nGdI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-449csP09MVWP_5mAPZdu_A-1; Thu, 18 Mar 2021 14:13:31 -0400
X-MC-Unique: 449csP09MVWP_5mAPZdu_A-1
Received: by mail-wr1-f69.google.com with SMTP id n16so19427458wro.1
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 11:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5zE9hSt0ZCyNVw3dZcbX72kVT1wWC5JOAhrLPf/rT8k=;
 b=FQD7IBqSLLywbX9plYRu6wMO1ggRSGEVhZcN2F/XYB0dzhYjtauTerGaeqlqhkGgp0
 xnF/37yd7uY4PccFDSnsXM8KSQDee8MKwf4jKeyVoB7f6IIhK0kE9EqG2Vnx7rRxLonD
 gu6AVper1V1r2LCFSS4qcZWJ+ggs6CozOyith3FaCbt3mhPUoUXD2EpxB1vTa26Qwkvz
 lLW1/uxp6NATv1hY5P2IRCM6E+OL7xpXBRIAyltdAQ8khifBzzyV3mBkqnCVRWf0Wu4h
 GfV5E+/+tkYzcd/8FR5j+DaWxXoiB8Qgctx9FxzHCCXNIT3diQ2P/KT2F7G20ThMXVm4
 kmGA==
X-Gm-Message-State: AOAM5329MZU3sZtigaDbVhV51kYKBW54GL6R2mv3IHtc2EX49a/B350I
 XnyK+vAvTikQViuMnIxfNrDB2gT8i1fRzHEgmEwFHpp4BEerfqFWxFEHAHuqHmTLPIDKdfmGbfG
 NQ5Rijs/nsUtJkGw=
X-Received: by 2002:a1c:bc56:: with SMTP id m83mr404984wmf.174.1616091209841; 
 Thu, 18 Mar 2021 11:13:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbMAEhJf1YndmP+NeF+D4IMEf5BuXkXCQBnXgcrX4WYKj8ho+BFzNBlENjT4VFNusSaC5d2w==
X-Received: by 2002:a1c:bc56:: with SMTP id m83mr404976wmf.174.1616091209661; 
 Thu, 18 Mar 2021 11:13:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w132sm3117474wmg.39.2021.03.18.11.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 11:13:29 -0700 (PDT)
Subject: Re: [PATCH v2 0/6] esp: fix asserts/segfaults discovered by fuzzer
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu, laurent@vivier.eu
References: <20210317230223.24854-1-mark.cave-ayland@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dffedca1-d7e1-206b-3260-6b9d88ac7d54@redhat.com>
Date: Thu, 18 Mar 2021 19:13:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210317230223.24854-1-mark.cave-ayland@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/21 00:02, Mark Cave-Ayland wrote:
> Recently there have been a number of issues raised on Launchpad as a result of
> fuzzing the am53c974 (ESP) device. I spent some time over the past couple of
> days checking to see if anything had improved since my last patchset: from
> what I can tell the issues are still present, but the cmdfifo related failures
> now assert rather than corrupting memory.
> 
> This patchset applied to master passes my local tests using the qtest fuzz test
> cases added by Alexander for the following Launchpad bugs:
> 
>    https://bugs.launchpad.net/qemu/+bug/1919035
>    https://bugs.launchpad.net/qemu/+bug/1919036
>    https://bugs.launchpad.net/qemu/+bug/1910723
>    https://bugs.launchpad.net/qemu/+bug/1909247
>    
> I'm posting this now just before soft freeze since I see that some of the issues
> have recently been allocated CVEs and so it could be argued that even though
> they have existed for some time, it is worth fixing them for 6.0.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> v2:
> - Add Alexander's R-B tag for patch 2 and Phil's R-B for patch 3
> - Add patch 4 for additional testcase provided in Alexander's patch 1 comment
> - Move current_req NULL checks forward in DMA functions (fixes ASAN bug reported
>    at https://bugs.launchpad.net/qemu/+bug/1909247/comments/6) in patch 3
> - Add qtest for am53c974 containing a basic set of regression tests using the
>    automatic test cases generated by the fuzzer as requested by Paolo
> 
> 
> Mark Cave-Ayland (6):
>    esp: don't underflow cmdfifo if no message out/command data is present
>    esp: don't overflow cmdfifo if TC is larger than the cmdfifo size
>    esp: ensure cmdfifo is not empty and current_dev is non-NULL
>    esp: don't underflow fifo when writing to the device
>    esp: always check current_req is not NULL before use in DMA callbacks
>    tests/qtest: add tests for am53c974 device
> 
>   hw/scsi/esp.c               |  73 +++++++++++++--------
>   tests/qtest/am53c974-test.c | 122 ++++++++++++++++++++++++++++++++++++
>   tests/qtest/meson.build     |   1 +
>   3 files changed, 171 insertions(+), 25 deletions(-)
>   create mode 100644 tests/qtest/am53c974-test.c
> 

Queued, thanks.

Paolo


