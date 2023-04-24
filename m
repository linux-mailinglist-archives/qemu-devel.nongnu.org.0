Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9756ECC3A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 14:42:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqvVt-00004z-AK; Mon, 24 Apr 2023 08:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqvVm-0008WA-JR
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 08:41:42 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqvVk-00071D-W0
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 08:41:42 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3023a56048bso3709171f8f.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 05:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682340099; x=1684932099;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dB7wQ/Y/QdXsGj6AOL6lVcaP8Pjv6m4+9Jqt8sAZOPY=;
 b=ZmqDaZ3GnvyIU0kJ8F2pcBmC98a8/ZRWqLRRM5rHlz+yYLQP4lxM9+/gSMsq1aUsxi
 48uHsbN0+Tf5KZyccN8elPXbELMb6HaGlb4XCvoZEgFAAbWywYu8Pdb/7QGbpvmFGn18
 JelOsgSMFTfewJEfYiSLKGYbdkzD3YOdvW2DjkS60MDSE/mlORSQtJWX6dNNBvLNAOVK
 TtXHTHpm6y8yK9NzKqOto3Rxn+71n+jHIU+ETwWA5OLHQ9jp0l71XW5TkFd0rMf/hjcw
 HxubtoRteyRNh6i4duc2J+2+0jte9WnXr6Z9iX9jtGgUBU08ddjU+BQPv0vmIGvDY78r
 AWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682340099; x=1684932099;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dB7wQ/Y/QdXsGj6AOL6lVcaP8Pjv6m4+9Jqt8sAZOPY=;
 b=SwGvRp+oHMDOPxC8UO/nATOH21IRCFbBmf0smZ24TiGSWZL5bPWjpv3B6mjUpZzAYP
 wCvW7NZDXU60wHDE3O59NPxcCAUtcTlb3CIfWV/1blVSXGCeyjsbijXmQdeBel5yfiPe
 4kW+lN8lLHR9cgKPwLTXAMMBZTeAQ9T1smMEPNwvCRoMGyXN0K8TViB+ELKG7qUoCAxJ
 /sNMEITObcvSle/HcOzJ0hqQyb+NSa2BXo1N6jZ5wHkZdTtZ+X/C5J4Q/3b/SxIGMcI4
 kWxTBx6HuZfiMFHGbP2isnOt+F8h14wtUIQX6i4H2iJ3hA8giSD+yvFe3ww8E+8+UiQ/
 LAQg==
X-Gm-Message-State: AAQBX9eLqx1Bm/h0SllQfHJIh8ZDJ2Y0yDg16Hzosxf92IHGxYYxDpxJ
 +N2Qr0ipmGc1vh0LxC4fxdALVw==
X-Google-Smtp-Source: AKy350Y9dX6y3ZpPGqNor6Icnd9pFVrRl1SsesYAnqi+a+Qq0gyTxyxZHdnEThd9E5Uuci/GlopW8w==
X-Received: by 2002:a5d:638e:0:b0:2f1:57c5:7a26 with SMTP id
 p14-20020a5d638e000000b002f157c57a26mr10096872wru.62.1682340099183; 
 Mon, 24 Apr 2023 05:41:39 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f28de9f73bsm10697082wrp.55.2023.04.24.05.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 05:41:38 -0700 (PDT)
Message-ID: <5a9e4a38-f062-f136-1d37-b434e549f163@linaro.org>
Date: Mon, 24 Apr 2023 13:41:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/17] Migration 20230420 patches
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230424110119.68520-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230424110119.68520-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/24/23 12:01, Juan Quintela wrote:
> The following changes since commit 327ec8d6c2a2223b78d311153a471036e474c5c5:
> 
>    Merge tag 'pull-tcg-20230423' ofhttps://gitlab.com/rth7680/qemu  into staging (2023-04-23 11:20:37 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/juan.quintela/qemu.git  tags/migration-20230420-pull-request
> 
> for you to fetch changes up to b02c7fc9ef447787414e6fa67eff75e7b7b30180:
> 
>    migration: Pass migrate_caps_check() the old and new caps (2023-04-24 11:29:02 +0200)
> 
> ----------------------------------------------------------------
> Migration Pull request (take 2)
> 
> Remove the two atomic patches that broke mips32.
> 
> Please, apply.
> 
> ----------------------------------------------------------------
> 
> Eric Blake (1):
>    migration: Handle block device inactivation failures better
> 
> Juan Quintela (12):
>    migration: Merge ram_counters and ram_atomic_counters
>    migration: Update atomic stats out of the mutex
>    migration: Make multifd_bytes atomic
>    migration: Make dirty_sync_missed_zero_copy atomic
>    migration: Make precopy_bytes atomic
>    migration: Make downtime_bytes atomic
>    migration: Make dirty_sync_count atomic
>    migration: Make postcopy_requests atomic
>    migration: Rename duplicate to zero_pages
>    migration: Rename normal to normal_pages
>    migration: rename enabled_capabilities to capabilities
>    migration: Pass migrate_caps_check() the old and new caps
> 
> Peter Xu (3):
>    util/mmap-alloc: qemu_fd_getfs()
>    vl.c: Create late backends before migration object
>    migration/postcopy: Detect file system on dest host
> 
> 李皆俊 (1):
>    migration: remove extra whitespace character for code style

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


