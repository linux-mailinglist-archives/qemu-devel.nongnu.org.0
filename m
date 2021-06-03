Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CF139A365
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:35:43 +0200 (CEST)
Received: from localhost ([::1]:51548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looRi-0007EA-Hd
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looQD-0004Kj-Jb
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:34:09 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looQC-0004CN-1N
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:34:09 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so6048383wmk.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=sW/KvNGSqPNgs2FeF7rYdKRJO6Nc2jBkPQL2Gg8ScOvPPE9UsammUsc3XDC4oasFzW
 eWN/nyTerfQ/kML3Gk9zQdgRqcwEe0l4bnoJqIGJByQNyVfY6e5cYjSiUrqvlVmd9+2J
 img0dE9EUJyivRAjRp92fwM83R/S68FaQrK0nQbcnjTDQAuheYELfzaI1UKX1PP+zKWn
 81LnrvLUPHbegZpghXy1fZpYJRL7CGh25eOfua6QItGTkuwhv07KDLhkg164FIZ9Y2p1
 E5QFhTtpRKJDeZ1FKSGM/PHMKZzjsRgpxelnqzHLkS5KOAJVORxzr9/A77fJ+Obx0Xe8
 s50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=DBGAcwxgu4Rn4rBIShcpl9DuJ02wkuOQJW0ewFnO/iFoB/gaxtgnsp3FDH7s6z0f55
 D13c3Fphtie43QdeZB1TEzZfl+qVZw3QZB66pWoDYdZfIZEDWePp404JjmZkdKZ5D+BN
 kK91rOncgyEpgxhyFdhQmIBXSI0xDydSnCHO4qavY3Jwlqvd/WBtTpt93pCvcXOTEq2+
 5DJ3E8BPwSkXf+QFdWcoGmarWQDN6cLWPB2TdQpx79ksRsiJw8RzQzhA8NvZFKj5pDpM
 oMgBuCo7BITvySOpIdKHa3Owr1/90X36U5bY6BAwu3cwosQBYVpWkC4cZLhhIvZUy7Zn
 FYEg==
X-Gm-Message-State: AOAM532e8dIsj1UFp4R5frKy0BNTjrtemrfqt0D8/ANVftuvF4szlijO
 GFW9MGIkTJh4j07xFyEFH8vE3Q==
X-Google-Smtp-Source: ABdhPJz8HLpDjpPxM4Nk+z4PTMx70BnEAhcvpfUt2lfoq43b26MEbimGihJMjGwr1yfr6fJhl0r3jw==
X-Received: by 2002:a7b:cbc2:: with SMTP id n2mr37370816wmi.69.1622730846466; 
 Thu, 03 Jun 2021 07:34:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n6sm2893640wmq.34.2021.06.03.07.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:34:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8032A1FF7E;
 Thu,  3 Jun 2021 15:34:04 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-23-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 22/28] softfloat: Convert floatx80_scalbn to FloatParts
Date: Thu, 03 Jun 2021 15:34:00 +0100
In-reply-to: <20210525150706.294968-23-richard.henderson@linaro.org>
Message-ID: <87h7if81b7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

