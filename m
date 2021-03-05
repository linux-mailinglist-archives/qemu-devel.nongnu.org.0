Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F1732F31D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:47:19 +0100 (CET)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFTq-0007WC-1H
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:47:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEcM-0000gd-7t
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:52:02 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEcK-000232-Lo
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:52:01 -0500
Received: by mail-wm1-x32e.google.com with SMTP id u187so2192554wmg.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=meOi/poj+paKAuk7sar6SH+ef+i5obJ479yNO+7uFWY=;
 b=Y1MsdeEcKhaj+n1HG9RQ7VmEEJS4O+HW48XxbdzBc3yG8RLjJlmR0kWB/6LTKTkwhy
 B5mR4RMRLxB/koyYrcnKNYplcavJqtU+WIurD6nN0UbZW4m7nMY8fNOkXkcqX/P+PYnA
 kIHB3LTTSvhzOF9lfNcDBvI514aQCygicLlvWKKUB1k2rFB5bzLjRFgyT3IIlcHIDSSZ
 qzQ0pc8waC5R8wAz25Lp8ZCWE3bNUhXb+oPVwIRGwvLQCL6Neo7BP3x3VGdyPQ71+x7S
 b50nAt1O8ytDv0wgHDwYKLfcqks1tcOPd7HR6zawrBcD8QlROq9Rh04vh0cj6uI596q8
 LkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=meOi/poj+paKAuk7sar6SH+ef+i5obJ479yNO+7uFWY=;
 b=D2wIZ19A3ZsYb+8mJRqsg/Mw5dgogNBEEWzYxUNB42TngBdpsGjt9pcag3q6ylSpvn
 nGitXxx0DBMqEXzzTfUUTN80Lz6dO0OfZ/SMvX6wadYREng+rY7PYNvnX9DG0FyLxK82
 nPJALsDZ4cOKXQ6qsBpB/c3M28BZfLaiGpiddmizjAlRVBQwgyg2yJ4/r9lMpGJUiTCi
 TQOyeEmLhnm0H8zQzzLKA3n5XEsXTvYvmMaBR3/8Jh4nsexeuTZ8CRFtGVjFwQyY/bfq
 QHdC9sCbE1+FS/CqLvl2k/SHmM/TIfc0qhlmsp53xet+BGaIHj2zD7ZGdcDHpmIw6soh
 Xgxg==
X-Gm-Message-State: AOAM530yXeTfRLftGcQHQbKOQRP0DLhbneOuxYzsiWfqvu/f5PwQ/IcX
 IOBhn8grkZOUTS1dzkWycJPqSg==
X-Google-Smtp-Source: ABdhPJwWU2euZHC8AW6uswpJemqgyx2UYlbRoztx6lbacVsI8xUwmb7vX0FvV43l/IOURnQhxS470w==
X-Received: by 2002:a7b:cb99:: with SMTP id m25mr10209921wmi.64.1614966719395; 
 Fri, 05 Mar 2021 09:51:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t188sm1610162wma.25.2021.03.05.09.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:51:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6715D1FF91;
 Fri,  5 Mar 2021 17:51:44 +0000 (GMT)
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
 <20210302175741.1079851-17-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 16/27] tcg/tci: Remove tci_read_r32
Date: Fri, 05 Mar 2021 17:51:39 +0000
In-reply-to: <20210302175741.1079851-17-richard.henderson@linaro.org>
Message-ID: <871rctebf3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Use explicit casts for ext32u opcodes, and allow truncation
> to happen for other users.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

