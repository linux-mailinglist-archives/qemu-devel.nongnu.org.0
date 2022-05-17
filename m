Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB64752A57A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:58:08 +0200 (CEST)
Received: from localhost ([::1]:33440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyeG-0006vh-2Y
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyBj-0003bD-O8; Tue, 17 May 2022 10:28:39 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:43890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyBi-0007wA-4b; Tue, 17 May 2022 10:28:39 -0400
Received: by mail-ej1-x636.google.com with SMTP id m20so35008011ejj.10;
 Tue, 17 May 2022 07:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lTI91jEY/btyedNPVQQ4kHBMUq2u43qrOGv1rAtbFRY=;
 b=N+rIVhuxE8jJ9jnINXgilzck2uIlc9/JOK69vLK+iRxYxkLIVWHGrUbmR0uH5+UsZJ
 yIlxOJATk+jStUq1gYZ2eFlQGSJqPDjAoyHVzkfcbcLi7zuUux2U7y0LXPY8bApK/RHl
 pDxM2E5TJWzuJTo9pjO9KB7otP4ix7/qZ+E5VBuWFz6GTBdEWOkY5+g4yh0dAD9vhrvv
 65KtHpA4EMXrLV6HocH96/X++f1nqBL46If0Qs3SnN2TLdnpR83Xm2ITjxpRW/uKom2d
 4OJihpUh9aAsUdmS+4HxXFSJPE7Z7XCc+rKRLjv3B+rrLyj2umw0wiQ1UrQsxhNTqnX4
 kNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lTI91jEY/btyedNPVQQ4kHBMUq2u43qrOGv1rAtbFRY=;
 b=RyrVRcYwfybrijmzIvz98lmFGA09FwrrBllBDzWLc+7T3LJCwrdM27wVbIZMeueHZ9
 qgxC86oMuts81kK73pM3RNCO7abE6BZKXbl/uw9+4taV5EljtNEfwzAg6aMrQhnIdp/A
 W/eWuxFCoFvjvlfzrSTS7TJfWbqVuPTiBFEzZ1YW2+C6I4BK/V7Jxkf8TWkJsUsh9ZfL
 taYTU1eH+fPt9SpqVuyWfMlq1zW4LJGdVHQOk+3PuXlIApf5EIYWeumIOErxtxhZpvUO
 MErx+Lz3V03O/85FHBGoMwAr7uUoA7UR0G7pIZM20K79Se5/eD74pSvbg2l3Au40oHht
 k8Lg==
X-Gm-Message-State: AOAM533+a4BC2uXhd1jmAm0qC3HzNib3WHGy+l1g08fAOCRu2tLBivsf
 Nu2l9AdHCz/5g6eMSlBWSci1nd1PZZXWkg==
X-Google-Smtp-Source: ABdhPJzFGJ+M3mGxlzG5Zv5WuyhU8nMgwhWUQ/vv/ZSf7Wg5Za7xPNAdHZ6trXwZSiIGs/PK2LCwAw==
X-Received: by 2002:a17:906:d288:b0:6f3:cb6f:428f with SMTP id
 ay8-20020a170906d28800b006f3cb6f428fmr19960195ejb.332.1652797715553; 
 Tue, 17 May 2022 07:28:35 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 ia17-20020a170907a07100b006f3ef214dfesm1123378ejc.100.2022.05.17.07.28.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:28:35 -0700 (PDT)
Message-ID: <3ea0ee07-c2c8-9f28-8cf4-9570649bb8f1@redhat.com>
Date: Tue, 17 May 2022 16:28:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 15/18] block: Add blk_co_ioctl()
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113907.200001-4-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220517113907.200001-4-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
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
> Also convert blk_ioctl() into a generated_co_wrapper.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             | 7 ++++---
>   block/coroutines.h                | 6 ------
>   include/sysemu/block-backend-io.h | 5 ++++-
>   3 files changed, 8 insertions(+), 10 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

