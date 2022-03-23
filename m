Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CE04E577D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:29:11 +0100 (CET)
Received: from localhost ([::1]:50440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4nG-0005af-If
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:29:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX4km-0002hH-Vu
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:26:37 -0400
Received: from [2a00:1450:4864:20::635] (port=34358
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX4kk-0000sW-Ng
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:26:36 -0400
Received: by mail-ej1-x635.google.com with SMTP id o10so4296648ejd.1
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Xk/TUN9irrkMqAph6HJQhaW0CKcZafmrdjU8NrcW5+E=;
 b=CRBX5SITHhTu7uFsN+LdOB3cNdvX8+iz1ACksrxak5/fatAlgWEVKt1hRN5I1SCJJk
 rJk0xsCDL/M6ybDcLiN6SxuiuxT4GLuwFLwvgaOf8kL+kG1Au3tkZY4DSFI/ysF7gZNI
 rHwItp5Ye8ulCCHSqg3GJD/MH4PTLkf5DJYbazHSJWcnpTKMJua3w9BUisPB4lcMUZuw
 vgjlPKJxtcbQ0o9B6XooqHAStxJh7l0csDwFVmpqr06qYECqEPdPQyfMTSS+dfDmYBZp
 /GBVhfnMlMLjif//vADkXYHqP3JVdqUzNRfhuamQo5dblXE9itnacYJo/WkOQJwNDvgB
 qKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Xk/TUN9irrkMqAph6HJQhaW0CKcZafmrdjU8NrcW5+E=;
 b=48zUbHY/3yEMJJkcXItyrDkF67S8LXvbF7TWHv6DbgaUo6oOpanDOA3oeXLXQ/BISe
 QmmccjKT5nssYIk4r3WTqo9Lo6V3C3m8LOR/H/rNec9QyEbLU3sHaaBdmf6A8o9QzmWr
 MR3CdAlR70fX0arGj4lyf+ScfJp9cMWfnVXK7YiZn+oaO3iNnpj2KQNDmkJC7hy/Zm1W
 01jre8bHyvBfdB+S0WQ5EDzLwSRE/WjUCD1EcBVJrebxG/xLULon9AoE/8C+pylCVuoi
 oeVdj0jpMBkvDtxy7izwUsSye1xsjpNbwBkZT6ZEIEs7gL7Pd9oujGq8ZCAE4teCVy/K
 2f4Q==
X-Gm-Message-State: AOAM5331IK/tcMa1lYPK++IHVWWmclSM3ImjNkBA0oOq0GAw3RjciBrF
 Q/oa+2BLoy9Z6TdEHhyowAkFqw==
X-Google-Smtp-Source: ABdhPJyrAdfWagF6kmA2N8MyJzBxrxbL1FS1uxKgiLr0vZ+LRBPn343TIqOtFq9b9WgSSRVnqsjnPg==
X-Received: by 2002:a17:906:3109:b0:6cc:7a1:8db0 with SMTP id
 9-20020a170906310900b006cc07a18db0mr1236129ejx.266.1648056393153; 
 Wed, 23 Mar 2022 10:26:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a056402440e00b00416046b623csm289715eda.2.2022.03.23.10.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:26:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 023CE1FFB7;
 Wed, 23 Mar 2022 17:26:31 +0000 (GMT)
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-9-richard.henderson@linaro.org>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL for-7.1 08/36] *: Use fprintf between qemu_log_lock/unlock
Date: Wed, 23 Mar 2022 17:22:41 +0000
In-reply-to: <20220320171135.2704502-9-richard.henderson@linaro.org>
Message-ID: <87a6dg4m2h.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Inside qemu_log, we perform qemu_log_lock/unlock, which need
> not be done if we have already performed the lock beforehand.
>
> Always check the result of qemu_log_lock -- only checking
> qemu_loglevel_mask races with the acquisition of the lock
> on the logfile.

I'm not sure I like introducing all these raw fprintfs over introducing
a function like qemu_log__locked().

--=20
Alex Benn=C3=A9e

