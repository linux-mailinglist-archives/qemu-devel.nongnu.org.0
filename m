Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B7F39A36B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:36:26 +0200 (CEST)
Received: from localhost ([::1]:54522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looSP-0000uU-63
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looQV-0005Jn-H1
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:34:27 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looQP-0004LR-FI
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:34:27 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso6028389wmi.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=EPuDXZ5yVCgZ0Z/bA2BS4rkc5ZlaiBzn/A7acbGabBlNW+5EuY1WMLY2F6wFZKj827
 b45MzCa4AoOfm7s3C104IC+JjlACxd4SjRUqIDEMxyYftl69zGvmqCLgf7oZxHEcnfD9
 lcERbB6VKf9AXEsXK3E0UQT47jL+MIANUBlVGjSX/SzuJ9ofE+vrA2pP+tlbXDiCFQ0h
 /6zfc6Z/KdBQGZNTROZhOcaUwjTwCnz+NWyzPX6+yxgCC4UzXfxAkWFxceoPTIWXcA1Y
 WX9StnoC+YqsxcgdtOaLqyRtDAZZXlCdJ/9wKnw6GcqN/fL2yPSQGqLmoTLLaoRcLbRw
 q1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=hxht+e2PRRFDdnMIO0z+9lBaUMAPFI1heQqYj6LpOgmjfOUAiCX92zlcOliUR1QemT
 XcNV1faklxZdiFHLwZTw4QGEYyd5KcI8chmYO7NvB92A7JapEwdV935rHIPEqYkCvjSW
 4Wtzd409vTM7jJyLCvaeXlyIEbO0gWw1/m8mHH4I946LXSJ2XATg9zI2SRZ2aukrEDYQ
 mOggeMHaVv66g1rb/dadhKcc753mlSK2pEplWzykDryEcEbf6F+ECUrDJcjnAYrpssgg
 AkanvGY4Oz6wVOIg5jW/oGjKW1rhL+R5K5Rr7k1x4/hH+WXY3kng88Yu2/giB7kDKC1p
 Y2iQ==
X-Gm-Message-State: AOAM531R1Sms4WyOSg/O5ChV9/sjI4hrjAgOs175UR9WS98tTxF5+9Ro
 sJhu/lBRuATx4hTHX6KfWcyywg==
X-Google-Smtp-Source: ABdhPJy/6NIJXxcCktkUoBZ+V8rrAHItXGaTLT8X91T8ZkA5TPXi4TwGSYKxSEOyI3vi6877liREoA==
X-Received: by 2002:a1c:c91a:: with SMTP id f26mr10466323wmb.15.1622730860086; 
 Thu, 03 Jun 2021 07:34:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z10sm3067278wmb.26.2021.06.03.07.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:34:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 230B41FF7E;
 Thu,  3 Jun 2021 15:34:18 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-24-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 23/28] softfloat: Convert floatx80 compare to FloatParts
Date: Thu, 03 Jun 2021 15:34:13 +0100
In-reply-to: <20210525150706.294968-24-richard.henderson@linaro.org>
Message-ID: <87eedj81at.fsf@linaro.org>
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

