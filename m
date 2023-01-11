Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2DF66604F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 17:23:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFdsU-0006hR-JU; Wed, 11 Jan 2023 11:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFdsS-0006gr-0B
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:23:00 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFdsQ-0004XH-CE
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:22:59 -0500
Received: by mail-wr1-x431.google.com with SMTP id co23so15608488wrb.4
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7VjXTY7frC5Wdz5aVyipGKSTso5yl/gBzj4eH/LvTSo=;
 b=RwYjirdTomvXL/DbBoWqGUoaZ9lg/pwEJT+dm60d/RBpsY/oWoXJlXDdXhxG05eJTE
 RmlRp/afFQa/A2TQ6dm2mXiPrAiy3JLViTI3vnZX4bbpDYm0SRWWBn8c8i+TAImuauWm
 qeotX//7nTy+F5XqhYzf2AOzup3m+x60nP1DjhcJ0FW2gSh4DQOJSIECTsl+UNHwQTL0
 OdVAYv4XRGXNCxZwNF7KSfVMw5Wyjb2AOsHrG8fTLaRU6TEG9RFJUKZEGCkPyXBlJtuH
 IWp0lACYhcu8H0W+Sp0IOWb680kQJ7WYx7GhJrExmjG19d4oEzSWBTTI/VIiTJKbh6zv
 HxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7VjXTY7frC5Wdz5aVyipGKSTso5yl/gBzj4eH/LvTSo=;
 b=yn9raZ34SPAW/cUV4pegmu1GosorUjw5LbLNVSmFgXgsxbXPrGkifFdi2sziwZ7gbc
 m0DmSu7Puuw1BlVyqAdu9UCn9iT77ACxPpXv+/TTm+yZyhsHA89C5m6l5gJjsxx0DZKd
 OwtCbQMoi2sLEU8H9DL/UjB+KMiiK25jPV0EbOdpD+5NiNm8GjBnd4vp/zQMKQyT8Vix
 2FU/9bp/6qECwUBHvD8YNqgti9AtTvpE7IS3Z42M2vr5MuscnRbKU/hmbn+491om53ZF
 bjeuT14dMQyeNRcwQiref11kH+uehCbcvC7Q05yBdmTlzqInQNvYUdTC3Q+dpp2FaMUa
 2IDA==
X-Gm-Message-State: AFqh2koM58g/NQtz9gkwrgBWEi59huhl+mxgGpE3PbHBZ2k3LroYLPpv
 nQBt20q/LmOr+x1+OP3CrA+LjQ==
X-Google-Smtp-Source: AMrXdXsf6FOheMp3swQxib70n4ESjENeF/CBrzqVV6hXIpew+BmCFSLuDhl1KvTjiCcsxsFr1wLw1A==
X-Received: by 2002:a5d:534e:0:b0:2bb:6d44:5d1 with SMTP id
 t14-20020a5d534e000000b002bb6d4405d1mr10650217wrv.28.1673454176751; 
 Wed, 11 Jan 2023 08:22:56 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m13-20020adfe94d000000b002714b3d2348sm14207669wrn.25.2023.01.11.08.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 08:22:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E7FF61FFB7;
 Wed, 11 Jan 2023 16:22:54 +0000 (GMT)
References: <20230111014705.2275040-1-iii@linux.ibm.com>
 <20230111014705.2275040-2-iii@linux.ibm.com>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/3] linux-user: Clean up when exiting due to a signal
Date: Wed, 11 Jan 2023 16:22:49 +0000
In-reply-to: <20230111014705.2275040-2-iii@linux.ibm.com>
Message-ID: <871qo1niqp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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


Ilya Leoshkevich <iii@linux.ibm.com> writes:

> When exiting due to an exit() syscall, qemu-user calls
> preexit_cleanup(), but this is currently not the case when exiting due
> to a signal. This leads to various buffers not being flushed (e.g.,
> for gprof, for gcov, and for the upcoming perf support).
>
> Add the missing call.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

