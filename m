Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E2D39F598
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:50:49 +0200 (CEST)
Received: from localhost ([::1]:50626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqaFs-0007CG-BP
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqaER-0004ma-Vb
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:49:19 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqaEO-0006RN-0H
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:49:19 -0400
Received: by mail-wr1-x42f.google.com with SMTP id i94so16199591wri.4
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=x5ydK6scbIJ7/ckouCoA1Q1J1LDbJ2EaCcPltPlc7gI=;
 b=gO9W9CFGC0jbFp4uu5zDRjKe8gH6EfjU76f+f/EPtoBy+ZQKDfRD3MbU/FgiXqQNBk
 pFB6gk8k9RSmAp4uFDZeFgacYxPsuAg8tssSuDOunlbbkd2r7FzbjC4iJuI8u2ZWbJAz
 I9hE/DtaBGfgi4MSAkVez7UhgH6NmsyhJ4hIx+sakONyLEyaSVgTxJjeLblahXrsrDv3
 AXPvWjarfO0/6BSfgQa6Udg4z4aTarN/DftkTGVI5dJ+iq3c5UvQNyC2hV7U1ltknBTF
 pkRA5ChfThEu3ngWlO89IjljzAz5WopDM+3pME0huWPWeli/qhxQnjsqrK8dBsilH/5k
 rj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=x5ydK6scbIJ7/ckouCoA1Q1J1LDbJ2EaCcPltPlc7gI=;
 b=OkyXDJnVJgBJa4q0THTMj+bqottjXYpipu7kEKuUj7oBwysvP4mwsz5VJZBKzz1YMg
 paQJ/rDq1kP1+ShcZn5tJLU7lCRVnHR+qK1KnR9a4WyDkpf4DCk3V2PmiIBLQwXxdmqC
 Q/iOZquYzpUF17hoGdpFXYoZzf7YNytebW6S3tv3LEqPi42lVdBZ44IIzENjPyvPx7LF
 9gqj/3cKOw5w0sCJTHhp8q/U59P11r8/q0l2E+GFh/nhTUCI29F1pRykwVm4pYbibbhC
 TEiq05kb/LhHjy/Qb/z98+XeFsszI1zqXJp05nGoEGn0Rq7KI1ZLIy88TeXjJUfB9PQH
 QB7A==
X-Gm-Message-State: AOAM533bCz3kWgd2OT5IwirY/eau3KwIvMZ4f+PegJt+S1HVlmCoPOkW
 s4Z5CYZcsSVA11hkeCYJYSYMbg==
X-Google-Smtp-Source: ABdhPJwAN9aGhp9wfdQOwnoeSGVksEIzdRRBlTzWbsqIL7G+CdwxJN2o+4skWIKhkBH1cKztXQ/Wpw==
X-Received: by 2002:adf:d1c9:: with SMTP id b9mr11599614wrd.101.1623152954530; 
 Tue, 08 Jun 2021 04:49:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w23sm3051862wmi.0.2021.06.08.04.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:49:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F1A661FF7E;
 Tue,  8 Jun 2021 12:49:12 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-9-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 08/28] accel/tcg: Inline cpu_gen_init
Date: Tue, 08 Jun 2021 12:49:04 +0100
In-reply-to: <20210502231844.1977630-9-richard.henderson@linaro.org>
Message-ID: <8735tsmv9j.fsf@linaro.org>
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> It consists of one function call and has only one caller.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

