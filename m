Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B59B5E5429
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 22:06:28 +0200 (CEST)
Received: from localhost ([::1]:46974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob5zH-0007Mr-A9
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 16:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob5xY-0005jC-CD
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 16:04:41 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob5xW-0004Gp-Nr
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 16:04:40 -0400
Received: by mail-wr1-x433.google.com with SMTP id n12so11850117wrx.9
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 13:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=YqsJOHn/ZSIPG/okKuHQuQJyCR5O8N5pbjBtPVDBMsk=;
 b=y3WC6AmLk8J9pA0s+t+3fCSbLivTcbQQobccKF/MxoPkw9a+Mf3y6m5X9oi+eM/ES+
 QnYCn5AIhzahI1MbeOAWQszR3kyjQDRqLddYOp9s1YAJVblNaWJCPY+0bi/6P+cx8Hiu
 bh8HYnhk9GyHOQyV918C+GVSraclqCsYojuMrMwklkQNgdnsIROKNp1GpvZnW0FLwKVU
 cBk3AKfMXK1T2EV9u540KNDYO++3MGGmTGVcB8tfFRy0Kjjy7K2O9mQMpD9obXVhDFvu
 61R2i3flGdObwxiMkQ/C2YicYfqXR+oqjT+2VO4HoTm/gcL25EkjbzJOAZjegaStdSmH
 m8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=YqsJOHn/ZSIPG/okKuHQuQJyCR5O8N5pbjBtPVDBMsk=;
 b=6I3syfemp9Mmedgv0VxFqGT+N1UXjRd2Kgw7OHSIrdaRTZRhDff1qKje4VRtS4c+Uh
 fOm3zvVYUQuWxORllzqdedEw9SAmF2t3dRpm3vzbHx+zvY65INUPxGcAb3VvbdRc9HBh
 3VtppfQogERpP0FKJyEoAmQImCys8D4CZRWx6Y31B+6zuv/ec7B2bFjsHUp/5dI3C28J
 1Cnn6NxEQBgzvmMAVLuBWPaZEXNQaAH9UYlBIo3xt/lDT86nrjrePdUAcYulDRl3iLCl
 jO1gzd0I5EMT8TJMX1aicgwPgiftOu6w35rrWrs5ZBuyPGVZQS2GZVUpHE07/fdftRw8
 jtzQ==
X-Gm-Message-State: ACrzQf2HBrnXGpApJ2eTdMkdlYV24nUizqQXIb0LY2QYBhfVQOlm5aXr
 6nRPcFCNOL7EbjjXiErV4HiX7g==
X-Google-Smtp-Source: AMsMyM5svX+Kv7yVKackOFinFMHwgkvWGKjttdJLQdVtsQG5SfJKPXwYt9Xcz4xGCM6w3030nbr2WA==
X-Received: by 2002:a5d:6d03:0:b0:22a:4509:2143 with SMTP id
 e3-20020a5d6d03000000b0022a45092143mr18006399wrq.185.1663790676813; 
 Wed, 21 Sep 2022 13:04:36 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a1cc90f000000b003b2878b9e0dsm3761908wmb.20.2022.09.21.13.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 13:04:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A9E591FFB7;
 Wed, 21 Sep 2022 21:04:35 +0100 (BST)
References: <20220906091126.298041-1-richard.henderson@linaro.org>
 <20220906091126.298041-2-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 1/7] accel/tcg: Use bool for page_find_alloc
Date: Wed, 21 Sep 2022 21:04:30 +0100
In-reply-to: <20220906091126.298041-2-richard.henderson@linaro.org>
Message-ID: <87illg5wa4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Bool is more appropriate type for the alloc parameter.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

