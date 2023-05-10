Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D9C6FE0B9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 16:47:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwl5s-0008Jp-L5; Wed, 10 May 2023 10:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwl5p-0008JQ-3S
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:47:01 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwl5n-0005Wt-JO
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:47:00 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f4271185daso33795205e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 07:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683730017; x=1686322017;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cKUtcuBbbtCmYjFyk7LgdgDeS3EpAG88/1SfSisVPxg=;
 b=cRcH3t1JsuyjQA4RB6+Uitgk+abvPs/gtI8Vm4G2iDIyvfAQ6LyE7TmGCerCmucz8Z
 GfO9++Cm2fGlRgAL0pRwwcdl72SeAFBju6NqQ+jDGXjr1qMQW+2Bbgc+J59pqGzxLVn2
 jQ+Y+SyV+rHvkjiYbHDgaOnUESa0WylSCxPSjYu4Hrw7v18034gGLDnp9bsnVG1vKyBP
 CnAMQGFx/5dfqf8ZN+Mg0AXy+6qRuiTpTbnwEWW83Azg1Laudyp4q/0HzWhFMWVioOnQ
 L+5YunYofAy7vell+vuFL6pDu26BPRmd93qeJPILVANFJXE7IdJp+UkazgA8Dos03tN6
 HkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683730017; x=1686322017;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cKUtcuBbbtCmYjFyk7LgdgDeS3EpAG88/1SfSisVPxg=;
 b=Roe3GcufIiwek8yatxNR5/DJJL4M8cRUgd3rOhjVrpdg4vvfn3Q6jIC+y3GQpoAZUE
 HnIhwZrrJEch/m2I7HMaeiMADuNfaFb6QRRjog1Xm1ppqTGM7oaLsRhbc0SV7F3D4CsU
 +LnCJ6I3YqVJLvIU8Vi1r2m614+WotaZ/ZBE/lqSLghPcTxtOowHtOCN3Pt810tv3P/v
 hyZQeYgDHUqXCyz37R02/8wNjG8ZGsqr/ztefDH76Xi5haSwREClUqJQK64KHFG/cEN1
 V95iyhQ9kORaPc+FJGnsFLxUrmh9n0rahJ9VulTPgiqJTw+6uJtQXL/uXkoHofyijAy3
 9/nw==
X-Gm-Message-State: AC+VfDwhaILkzq2mrHxTm13cjlTvlgVi3BXzeGdxh6QJm7GgWCDLm4Fp
 e9SV3SUbuV+17N8qfK5r3Hgx3A==
X-Google-Smtp-Source: ACHHUZ5IiLD3brjv0oqaZ3LyJknCqejLwaO8ONRPUTfqIMRUQIIQvZ+OINB09AyYj8iUVY0/JXgLSA==
X-Received: by 2002:a1c:ed13:0:b0:3f0:b095:15d9 with SMTP id
 l19-20020a1ced13000000b003f0b09515d9mr11116290wmh.40.1683730017437; 
 Wed, 10 May 2023 07:46:57 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm22963879wmq.26.2023.05.10.07.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 07:46:57 -0700 (PDT)
Message-ID: <73622292-1ed3-a497-64b7-d4ab86125eb1@linaro.org>
Date: Wed, 10 May 2023 15:46:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/10] Migration 20230509 patches
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dave@treblig.org>,
 Leonardo Bras <leobras@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20230509191724.86159-1-quintela@redhat.com>
 <19eff026-1a50-b0f3-15a5-b0251ab443dd@linaro.org>
 <87ild08jjq.fsf@secure.mitica>
 <fbe67cac-5135-219f-6c15-7e63e58ce10a@linaro.org>
 <87a5yc8ejg.fsf@secure.mitica>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87a5yc8ejg.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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

On 5/10/23 15:08, Juan Quintela wrote:
> grep " uint;" on my system includes.  I know that there are more
> creative ways to define it.
> 
> /usr/include/ffi-x86_64.h\0278:  ffi_arg   uint;

Thankfully only a structure member.  :-)

> /usr/include/sys/types.h\0150:typedef unsigned int uint;

Oof.

> /usr/include/nspr4/obsolete/protypes.h\052:typedef PRUintn uint;
> /usr/include/mysql/server/my_global.h\0465:typedef unsigned int uint;
> /usr/include/boost/iostreams/filter/zlib.hpp\047:typedef uint32_t uint;
> /usr/include/qt5/QtCore/qglobal.h\0275:typedef unsigned int uint;
> 
> in qt it is defined for everything.

Ok.

> ../../../../mnt/code/qemu/full/linux-user/syscall.c:317:32: error: unknown type name ‘uint’; did you mean ‘guint’?
>    317 | _syscall3(int, sys_getdents64, uint, fd, struct linux_dirent64 *, dirp, uint, count);
>        |                                ^~~~

Fixable.

> I will post an RFC with my findings.

Thanks.


r~


