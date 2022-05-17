Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD7152A58F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 17:03:44 +0200 (CEST)
Received: from localhost ([::1]:36646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyje-0001vB-QF
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 11:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyBw-0004HG-SN; Tue, 17 May 2022 10:28:52 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:34813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyBv-0007zC-Do; Tue, 17 May 2022 10:28:52 -0400
Received: by mail-ej1-x635.google.com with SMTP id g6so35113415ejw.1;
 Tue, 17 May 2022 07:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b2D34sHzku0+rkjjWrKxFTEoxy5m7jo24FjCvQI3ANs=;
 b=W8r14Ybdk1YwdFmojHHBVWstam0SvzZLB/j+XgS3/dmcVqSrpBcb4c5GDfyy/K5dS1
 Chi23oA1UwSqnNNqH3aXZkMtKimdVTzgR7gy2yvAqGlLG8WuxYkKteDh7oZBMCNFrLOB
 ZZzU+M3XC9Oo1U5h8WcjQsBDremTZzJdjHlFFkHC9QdeowPnfl/B+XCbOmLWo8VzNq0t
 fsAv9MvGzyn5UVc73Hp9Ky3JPJUkddDPgP5M/BEJZBDMLQuFHwOiIBuNXFQJTy6X/Zex
 ePOxvyVGnzRm2KzWJHr0dvuiz9/q51+gSswuKnn8keQohvrmlCXTEMpss4YKoU7xMgOk
 3pWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b2D34sHzku0+rkjjWrKxFTEoxy5m7jo24FjCvQI3ANs=;
 b=dPs5sFE5wfi08SPjnrEA/tvw+EQgakNceli3fS6YBfoXCSykr8rYeBIVSJbQldKF1B
 IY0orLtx7zlFreSky6b1WCifObvAPA95M0eA449r9wGoRUmxZhRHL9kXBp7Sa0uga/rw
 FQUSCC0vxrlESLkS2m0LV9uEbqlkpsvbFcjWGriyt4IFgNLCPFFZWFN5QamrLMm8/QvY
 Z0O2AJqQqUmIoo3GcAgSe5xCwRLRI+IE90+q0gJEnuxv9NKqBh06Pga23StIbg9964bQ
 CyhfP0IEKS1biU4QqW90uOFkzb5YdBpCX1oc4w3KRKOhZUCAB+kMKOtugBuE0QgrwTuN
 89gA==
X-Gm-Message-State: AOAM532DDfqWfv4LQpghzPWGAnqrqWfVqoEWteDSmdzGEsFS1A0sP4q3
 BblUeVRE+vz+v0abvHsdXm+IG5r6/AgO9g==
X-Google-Smtp-Source: ABdhPJzPgB8Y4CL0VfXCXBIb6tL6/AG7Lg8HNpMwkjujqojaqnqbFBaHgYrLkkBJTIwIMZAUxW8i1Q==
X-Received: by 2002:a17:907:3da1:b0:6f4:2d69:75f6 with SMTP id
 he33-20020a1709073da100b006f42d6975f6mr20362343ejc.389.1652797729827; 
 Tue, 17 May 2022 07:28:49 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 ia7-20020a170907a06700b006f3ef214df5sm1123788ejc.91.2022.05.17.07.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:28:49 -0700 (PDT)
Message-ID: <15cf383a-9d54-d89d-aba0-659101b95665@redhat.com>
Date: Tue, 17 May 2022 16:28:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 16/18] block: Add blk_co_truncate()
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113907.200001-5-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220517113907.200001-5-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/17/22 13:39, Alberto Faria wrote:
> Also convert blk_truncate() into a generated_co_wrapper.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             |  7 ++++---
>   include/sysemu/block-backend-io.h |  8 ++++++--
>   tests/unit/test-block-iothread.c  | 14 ++++++++++++++
>   3 files changed, 24 insertions(+), 5 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


