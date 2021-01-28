Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EEF307B18
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:39:48 +0100 (CET)
Received: from localhost ([::1]:42584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5AKi-0002Lt-13
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:39:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5AJR-0001UA-S3
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:38:29 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5AJO-0001i3-8Y
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:38:29 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d16so6018101wro.11
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 08:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=k/JKk2n/sA7y9xKxNCBdS83wmRsheUMcJ7YtNFUqNnfpYpsGe8MHAXTZbNACpuC7C8
 yhxd+wEs99Jh7TR7rsEEpuU3t9B6kMu/DdfvKI9qKu/ZWh+Vb228Uqn5AO+RyrYXgLXP
 7gTzrFJ1MsVr3gtsdtp0BcG4o1MqfgINv21wX0QVQcRUO+1K1E8WqDyhdkBb9NRvKAGR
 RatafFRI9QdpgG6P2GgSvDBv+p+AOjKaILvvC3+BAcLkCuTSUHLoWi0Kk/dxvB/PZbdC
 qIFaz2L+DGczIOXpZOR6O6c7XfUkCcRDm0Gyl/IR1ADr8oWSD2vYv/AiFZ0D1hhGvYgt
 C9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=NWI57R0dghLW4EQWULSQoLhmfz4MIblQ2hWquLd/DKqsu7JWP10J9jJF0JMhXVJwwu
 xuxwn/paU2sN4G8AiXU/a9KEPB3sXgcgm849mL+GgPXkrqVeHXRx/33z+zBekgBQNxD7
 BawV2E9bBQuhatUOaiv8zDOtClJBqLq/Nn7IOhszTSeMfkHsZAhmiresZYwfvaAatNqd
 WKJEFhtYN1prU0jeV1UPXM31rQYtMNQHyaN98nOuJixI6XY3oHFeYec00YBi1+zxrxvA
 BM43TcTPXhKBH2BwkImtKazLfQ8u9ByAgYmDoBaaZnE6ls8If9JMjJv4T55Fw2uZHth2
 vidg==
X-Gm-Message-State: AOAM530HZQ763oBHkJY9xqTrEUZf8u9yX6/zAwfhyEnM1AhTMgz1UqoZ
 gGVxagFLc43cGSUp7nmmto2O7boyaLvPS0xr
X-Google-Smtp-Source: ABdhPJyjFZ5L3jzbwwKBxX/HJPYtr9Y6dHZh08fFq18koiW1nuKMYHv0yWLQnnmSX0mVpvoT15JXqA==
X-Received: by 2002:a5d:4d08:: with SMTP id z8mr3929068wrt.240.1611851905118; 
 Thu, 28 Jan 2021 08:38:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w25sm6670726wmc.42.2021.01.28.08.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 08:38:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7E0351FF7E;
 Thu, 28 Jan 2021 16:38:23 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-20-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 19/23] tcg/tci: Merge INDEX_op_{st_i32,st32_i64}
Date: Thu, 28 Jan 2021 16:38:19 +0000
In-reply-to: <20210128082331.196801-20-richard.henderson@linaro.org>
Message-ID: <87im7ht3sw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

