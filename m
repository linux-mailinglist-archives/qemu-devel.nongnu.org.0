Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA8E554071
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 04:15:52 +0200 (CEST)
Received: from localhost ([::1]:45270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3puJ-0001iQ-Dk
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 22:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3psj-0000u1-MR
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 22:14:13 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:46732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3psh-0003zx-Tj
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 22:14:13 -0400
Received: by mail-pg1-x52e.google.com with SMTP id l4so14769867pgh.13
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 19:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0xQJTo9KkzIicemKCzafNMJ0fqHld8s6eBA9gHPg3pE=;
 b=xzetnbuZFJZLXX1//QqCMZIfPjLVD3E6mmbO38Xrk4i0t5l98HzwBdTmRz67ZY30l/
 oIRlzJjm8xCOozhierQsOENW32mRcICVrUB+B+BrThYS6GT9DKYupcMeb9jWyQrV/hsK
 Ysyi79SP6hA9Wzm8jGgjAbm0JV0jT+xbzdo/rnENA7zSE7Fne7KYbUY+82i+DkSwAT7V
 9BokFhhtCpnmC9L+lQ7PAkcajS/4NFaasWRYSJFulQ6TIr8VLDSc3jOYCsZyTvxZ9xuu
 lW/xDV/jNAfcx1UaMeJrea6wDYQqjqcJQQIF8TFbYPp2U+POHr9H4wzOC5w4/gZjeW5b
 kjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0xQJTo9KkzIicemKCzafNMJ0fqHld8s6eBA9gHPg3pE=;
 b=G6YxqGadVWn2iCcIMGVl+a0IpDJ8bFkxkkGC1cBMyHoCCguFppNEjtbC4iYal5yEOr
 h3a0e8N3kQCmEKUfH+ib6kHcNU9o8LDQCcOCDExrdrgQ1He/s/00mRA0r7QfupIonIYj
 4q+QKX+aHWy6ihfLB8AWR7KI9rf4DcF6jk8Tf3Po1hBWAwe+dk55XoSY4jPU9DKxbSM7
 U8W14f+mqXrO+JWoPM532m99maMfidjAEOx5VYl9QnhpBgkjNSdCkSwcrUJcjTmXYzpc
 wS6plhl3a0k7DKmnqSNJ3oR1yKNvoA1OulSId5BiWLJaJpbshUxlWtPV3MxM0N8qKFc/
 Ataw==
X-Gm-Message-State: AJIora+eq9UUwqW2umejvL3KQsETtcx+Bu9jTkxwbVT5ZPmYv3wv7Aku
 vTNiggzHCrocSQRKtwiRUkFXzA==
X-Google-Smtp-Source: AGRyM1vqrN6EVZvWriBJXKVbPOnwna3fzkwcNvZvgFGR1kVHWZBj5HQGGr+CQuLBCKgHZT8hfH1zAA==
X-Received: by 2002:a05:6a00:1a56:b0:51b:f1af:c2e8 with SMTP id
 h22-20020a056a001a5600b0051bf1afc2e8mr32705332pfv.48.1655864049711; 
 Tue, 21 Jun 2022 19:14:09 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:8adc:a144:6ec2:4d71?
 ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a17090a409200b001eb162ffaa3sm9847528pjg.25.2022.06.21.19.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 19:14:09 -0700 (PDT)
Message-ID: <e3bb7c52-8c01-2a8c-765b-bd5eb49039a1@linaro.org>
Date: Tue, 21 Jun 2022 19:14:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/25] Migration 20220621 patches
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake
 <eblake@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20220622002547.64784-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220622002547.64784-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/22 17:25, Juan Quintela wrote:
> The following changes since commit c8b2d413761af732a0798d8df45ce968732083fe:
> 
>    Merge tag 'bsd-user-syscall-2022q2-pull-request' of ssh://github.com/qemu-bsd-user/qemu-bsd-user into staging (2022-06-19 13:56:13 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/juan.quintela/qemu.git tags/migration-20220621-pull-request
> 
> for you to fetch changes up to 720eceaa316f2a75a7930085bb305850831a065f:
> 
>    migration: remove the QEMUFileOps abstraction (2022-06-21 18:06:55 +0200)
> 
> ----------------------------------------------------------------
> Migration Pull request
> 
> Hi
> 
> In this today migration PULL request:
> - dainiel Berrangé qemufileops cleanup
> - Leonardo Brass cleanups for zero copy
> - RDMA cleanups (me)

Build failures:

https://gitlab.com/qemu-project/qemu/-/jobs/2622407867
https://gitlab.com/qemu-project/qemu/-/jobs/2622407794
https://gitlab.com/qemu-project/qemu/-/jobs/2622407791

../migration/migration.c:166:5: error: 'MIGRATION_CAPABILITY_ZERO_COPY_SEND' undeclared 
here (not in a function); did you mean 'MIGRATION_CAPABILITY_ZERO_BLOCKS'?
   166 |     MIGRATION_CAPABILITY_ZERO_COPY_SEND);
       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../migration/migration.c:145:35: note: in definition of macro 'INITIALIZE_MIGRATE_CAPS_SET'
   145 |         .size = sizeof((int []) { __VA_ARGS__ }) / sizeof(int), \
       |                                   ^~~~~~~~~~~
[1118/1665] Compiling C object libcommon.fa.p/migration_multifd.c.obj


https://gitlab.com/qemu-project/qemu/-/jobs/2622407863
https://gitlab.com/qemu-project/qemu/-/jobs/2622407862
https://gitlab.com/qemu-project/qemu/-/jobs/2622407860
https://gitlab.com/qemu-project/qemu/-/jobs/2622407811

../io/channel-socket.c:589:9: error: implicit declaration of function 
'g_assert_unreachable' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
         g_assert_unreachable();
         ^


r~

