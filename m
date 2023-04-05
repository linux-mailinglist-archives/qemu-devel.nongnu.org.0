Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ED66D8177
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 17:17:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk4s1-0006Q0-H6; Wed, 05 Apr 2023 11:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pk4rt-0006Mh-Gt
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:16:15 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pk4rq-0003Ro-6G
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:16:13 -0400
Received: by mail-ed1-x52d.google.com with SMTP id i5so142142953eda.0
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 08:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680707768;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+3gZuuCe/oVz2tejpPvTLKXqHkEu6xCbMcDpRGcCK5g=;
 b=l9Cb6tGk44y8jMdYCSa4gequZ6y98xnahzTbRGddcJmnMYM32rKDXEax2VG8tUXEpC
 KzouY0oBNa0bF1g+04yDXETypikxNNw/a5UMHZ2Rp9eV+lXTb2xbmBJSunPmDV4VSrwe
 0xXk4I02PxZMy6qqle7BCRUOkFwWdqvuE80aTxkjiIxv936udYE/YojBIBuRGQKLwvds
 Pz6Qdf16EHvEj/LtwJ4FC4EOmgF5DFaagYWhHI248CQIbkc1jwzmHcH8Q3IB4/kxAJlD
 It2P/up3JRLRP35+MjvJFhTyLsggC07p+6xNxLlyl+WHDFjRrayLzO3yfJ5PXdjdh17s
 YpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680707768;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+3gZuuCe/oVz2tejpPvTLKXqHkEu6xCbMcDpRGcCK5g=;
 b=b36KSBd81oK2W5DCcGHAIchR9ZxH75MkJ1jJAy3NCbQ/anpUAsSQhwdtIGXo2GWmW7
 MtRd1SyCCaJ5d3N0UfdOp0zRrVr0NZPVElgko2OC1uLInXL/PZZpxNAlefzOxkgvqDu1
 hbh9OsJ/8ZIMu7xME1fsGVtpNmqdgiQwI+/+oxJ4vE30L7WfrpWUGNZqbEvHAULsM14y
 lSYQVJxhdrXyMZdswdQqtvc01FmdPWYBUHlFXtTitAkzGpvjE9ovbZvzOMfoxF2DQbf5
 /nkbYqDYppFfkQ9ZlNjwT0ZMPcd+tCbHkD8uJuR2gTpuq7EMJgEZ1GFgUm7UXeo2IgZ5
 AdGw==
X-Gm-Message-State: AAQBX9fzZxE8MZjwXvEKOd2RRcnmcSVTW248qxSpqpmpdfLP++aXYn3d
 NIP3UQBw5C0i7F0CMeG+iwa1yFWowUbpk/cebJ2TC9sTo9i3QIYU3GQ=
X-Google-Smtp-Source: AKy350akRboWv9RIhaioGZDT7bOL9K8+UHh0Ej6n4bj3Prg7JERvimc9Dpb1oA+pY9k/94Je9JuhREpG8YPL5nwYiZM=
X-Received: by 2002:a17:906:71db:b0:930:90ce:a1a6 with SMTP id
 i27-20020a17090671db00b0093090cea1a6mr1791161ejk.6.1680707768342; Wed, 05 Apr
 2023 08:16:08 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Apr 2023 16:15:58 +0100
Message-ID: <CAFEAcA_7+5tK+rM6dBgozNJmMmL7fU3MHLuvzJtb7-zWK4rMTQ@mail.gmail.com>
Subject: s390 private runner CI job timing out
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

The s390 private runner CI job ubuntu-20.04-s390x-all seems to have
started timing out a lot recently. Here's an example where it passed,
but with only 53 seconds left on the clock before it would have been
killed:

https://gitlab.com/qemu-project/qemu/-/jobs/4066136770

It looks like 'make check' was about 30 minutes of the 75 minutes
total, and compilation was 45 minutes.

Any suggestions for how we can trim this down? (Presumably we
could also raise the time limit given that this is a private
runner job...)

thanks
-- PMM

