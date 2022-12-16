Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3032A64EB2E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 13:05:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p69RW-0005Zi-7m; Fri, 16 Dec 2022 07:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p69R5-0005TT-Kg
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:03:34 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p69R0-0000Ks-9p
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:03:27 -0500
Received: by mail-wr1-x42e.google.com with SMTP id m14so2262117wrh.7
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 04:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g5qa/5YN94dP082stz9OZmC3UnPJ4LIGBJsKcLdZWJY=;
 b=yKKPuGSMWmg9svm66qitoaOGuwexONhg/yFms0/GNvBSvcl0J8ZyZQJUXdfOcsd50F
 SL789b7jmxiDqz/eOCQ7eNb+OKuLpVfSf/gA6Z7RkrzF8rQ/4r1YuLgXIvKwE6EpK99U
 5NhMDwmTvqpZ0j4PQYsl9kzXO4thc2UFM7o59yfyJ39lSadtkdiiTvmjkYcpdR2I6Yxk
 I14vjVasJ/Cm8Uv6zShwXFhcl46PsMcPx3mqHewbPesx8Jy8BfK1GdGDAiVg3brQUBMx
 DgLl+j2fOOp+OcdgzsZy1DSgLEyu5u7Ev2sWQbC0lRZPWwZcGXu4CljLJmYAcZVchKLh
 NJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=g5qa/5YN94dP082stz9OZmC3UnPJ4LIGBJsKcLdZWJY=;
 b=IH0D7RmWokrpT6v3/Pymp0oA80GuZ3ZmVSAiVqCL8mrDINFGu1tqlmuq4skT8ZH/YP
 VR9OQOlT5eCQn8AzFKEyvBCb4U9Q251dWNVk8TVDb3MWg917qre/kOZ2o02AP4uPZhPL
 RW463P4jFhEeHqcXIg7kuvneoyYZt7T+PsI5ROAR2UHhucI3mzotM+6AnO3VpBQ0jXn0
 SnGy/eP6eg+M12Y6AGXy3xqCYHV0DiRPqsJi9XV6tJJfmoYdmz5jo7vJN/71GSheJzz3
 23t7iyVc5eAnARibmdBfotAFUJgx3FKRHZ7UBkaZsyJXRQa2BtLvhzVRhTefsTOsIbKj
 WESA==
X-Gm-Message-State: ANoB5pk2wXTyvQNC080wVFYdpDxarLPXnS0KR6QZx5m3BsthT+r0mQ85
 Bl0zMZ5rEYAwmoL1Ebv8/fla+Q==
X-Google-Smtp-Source: AA0mqf7rBsZsQhhYhXg26LmXFD23MG5Rk2x4wpp0GrQOIdv16P0dNDXo76+M+1KnbXVHDRuHODz+zQ==
X-Received: by 2002:adf:ee85:0:b0:242:23ea:6b10 with SMTP id
 b5-20020adfee85000000b0024223ea6b10mr20859292wro.15.1671192204150; 
 Fri, 16 Dec 2022 04:03:24 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a5d4d0f000000b0023677e1157fsm2077809wrt.56.2022.12.16.04.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 04:03:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 38ADF1FFB7;
 Fri, 16 Dec 2022 12:03:23 +0000 (GMT)
References: <20221209051914.398215-1-richard.henderson@linaro.org>
 <20221209051914.398215-7-richard.henderson@linaro.org>
 <5bf64a38-0750-dbdc-f51e-f24289395f80@linaro.org>
User-agent: mu4e 1.9.6; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 laurent@vivier.eu
Subject: Re: [PATCH v3 6/8] accel/tcg: Use interval tree for user-only page
 tracking
Date: Fri, 16 Dec 2022 12:03:04 +0000
In-reply-to: <5bf64a38-0750-dbdc-f51e-f24289395f80@linaro.org>
Message-ID: <875yebimic.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 9/12/22 06:19, Richard Henderson wrote:
>> Finish weaning user-only away from PageDesc.
>> Using an interval tree to track page permissions means that
>> we can represent very large regions efficiently.
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/290
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/967
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1214
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/internal.h           |   4 +-
>>   accel/tcg/tb-maint.c           |  20 +-
>>   accel/tcg/user-exec.c          | 615 ++++++++++++++++++++++-----------
>>   tests/tcg/multiarch/test-vma.c |  22 ++
>>   4 files changed, 451 insertions(+), 210 deletions(-)
>>   create mode 100644 tests/tcg/multiarch/test-vma.c
>
>
>>   int page_check_range(target_ulong start, target_ulong len, int flags)
>>   {
>> -    PageDesc *p;
>> -    target_ulong end;
>> -    target_ulong addr;
>> -
>> -    /*
>> -     * This function should never be called with addresses outside the
>> -     * guest address space.  If this assert fires, it probably indicates
>> -     * a missing call to h2g_valid.
>> -     */
>> -    if (TARGET_ABI_BITS > L1_MAP_ADDR_SPACE_BITS) {
>> -        assert(start < ((target_ulong)1 << L1_MAP_ADDR_SPACE_BITS));
>> -    }
>
> This removes the use of L1_MAP_ADDR_SPACE_BITS in user-only, maybe
> remove the definition from "accel/tcg/internal.h"?

It gets cleaned up in a following patch. Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

