Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A92B52A50D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:37:40 +0200 (CEST)
Received: from localhost ([::1]:41744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyKR-000754-2F
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyA3-0001Jc-9L; Tue, 17 May 2022 10:26:56 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyA1-0007me-HN; Tue, 17 May 2022 10:26:54 -0400
Received: by mail-ej1-x632.google.com with SMTP id z2so35055939ejj.3;
 Tue, 17 May 2022 07:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N8Z65OnfFBov4gTEttHyfVFOm3b+6cL7EHaXnJ5CNAM=;
 b=GTbUnIiReUQLbG0RTCQdWcL3MheuH7GKGCXVO1wInqXclxTDc5GaIau525ydj7vyHj
 XavXglick5Pwozt8rRrKZ6qe2n0prXhyZxkAGNe+wQgNoNrRKwqrIv6LFRfkyJl/euuI
 UR6u54mCy11w4xK+2XpsxI201N2TTkPAIeXCQdbR7FolduEv15m4fWGZRBnAZGhcOTt7
 T9b8HwTL1KEqnE0MpBLXLQVOPxttLubSi79y1657VzirBE6kqBuCY5mdkF1TKUS/ht2v
 yuI6j3qy4qTyhRLV5e8hFgvC+IsUkfHM5FHo3L34FgLVbt4XGPCY5Hi+21Qy672bYrn7
 izZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N8Z65OnfFBov4gTEttHyfVFOm3b+6cL7EHaXnJ5CNAM=;
 b=UUy95giNUqQxqDPBMwvyTA0Q05/nFbA4JmNeo6hEun72H5cSzVKf60aNQejArEVggs
 zdWDUFKywJitgKRnOMKJZAkKk/xxJ5/5D2JZLmXhxm7BBIXjG7edmi+nn5s6rTsAjK3k
 gnNzuboJDwp6JUPtcPEMKobGVHBBGCoP73fpUi8saXVcZrle0rF5SF+ugz70igKnYDHl
 NRm3j1YhHVP63qJH0tP6XvVuPm8b7+sf0W6njtZNstMbKDw8ENS9DC/ZKG9QZl/BOXco
 Z+E5oMfHF0tgcrXZSII5GSc8NCz2SedQa3Yf7nNVlMlncM6oK5aGW2iHpPlaMMfV3XGs
 wtrw==
X-Gm-Message-State: AOAM533MyQnHaSY9C7wNKssos3ogxyrK2vj8IHmmOgcTe+jkr8vdXsM7
 FPGrS/HVf2tYriBuixMnRI0=
X-Google-Smtp-Source: ABdhPJzeqboJUWsf8FVqaGysaBLJ9talwqdd4NxtiwnOAftHnnhki6dSmXs7SMl1O5Bj7K4HWFtVRw==
X-Received: by 2002:a17:906:58cf:b0:6f4:4fe8:6092 with SMTP id
 e15-20020a17090658cf00b006f44fe86092mr19832774ejs.160.1652797611448; 
 Tue, 17 May 2022 07:26:51 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 u1-20020a056402110100b004278942f86asm6950669edv.7.2022.05.17.07.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:26:51 -0700 (PDT)
Message-ID: <960eefd6-1d6c-fb03-ce46-11a26eac3b85@redhat.com>
Date: Tue, 17 May 2022 16:26:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 12/18] block: Implement blk_pwrite_zeroes() using
 generated_co_wrapper
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113907.200001-1-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220517113907.200001-1-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
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
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             |  8 --------
>   include/sysemu/block-backend-io.h |  5 +++--
>   tests/unit/test-block-iothread.c  | 17 +++++++++++++++++
>   3 files changed, 20 insertions(+), 10 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


