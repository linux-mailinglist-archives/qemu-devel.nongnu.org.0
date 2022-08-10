Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4971F58ECDD
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:15:05 +0200 (CEST)
Received: from localhost ([::1]:41936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlY8-0001R6-C9
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlOt-0001QL-NZ
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:05:34 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:41598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlOs-0002E4-Ax
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:05:31 -0400
Received: by mail-ed1-x529.google.com with SMTP id r4so18956753edi.8
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=jHt+4Bl1mcQp3RqvtXkZokAlxCs2MpW8IAt961TV1kzd2YPnKISlnhNaiARutaPu30
 42Yc8Dqf/uSwZXC0yPm91IVw4rtB2VksiObpSl9H+jHXFrj7Lk31MK/M0orsXooV5Koe
 fFtpWlWMktHtojTRekDV2Pe7+Rc+dKA1mMfdKA2cjITCsp1GGHKetB6AvXmMzn8Ofrr6
 RwiCYIKkqxnzTVWItJg2+1z1HyFLgtmZZ1NG30Lnnq63xv1+ADHIZuYLXk0F2h13KNeN
 47MU2mDgeyxTKwGFvlT7q6kvIdv7vUDSvtYQaGvwjFe3b7Gil55fCAb3ic7moWhJ8iu2
 pT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=KIiMvFORbEfwYP0kS3bpSW4u7eZWWCdClNcTMwtVgo1zpQ6a9mI+u/3Xma8uCu6EFG
 5TitAJUMyvhzKuxqZKghLBqXRo3lfCLCtlcf8E7MwqJk/+ElqycjWHg7xRyDKC3DRWb7
 Cxgs4xdXr+yxtuOajpQSxyhHlgcUZafj+AQFVP8+3AMm+16EzBGW0LC0pNZtVBwj8T7l
 WsU2HqgeEyr9WSVAOzT7IrP8IEJywouxVINI0xG56CKBEnB/iecyoKbN5ZXJJ6f3n2zI
 3WjhREUQo8MMlLLL71jRyOrArJngGg5m8DmQyfB1zO8dpIYtURlKUjM0w4i2FA8febXs
 0Zuw==
X-Gm-Message-State: ACgBeo3XArGOS/xJfH4fzyIFetNt+1w1iTJRZMnYO9KaMrahGZ2pOZSh
 5U5lCwYIX1sQhbf+1PzDDYTCMpW0FLRgPQ==
X-Google-Smtp-Source: AA6agR4WMLuwkaIW68gxnrA8rI3ONdb7aeDU7+CXifZrTCjSzwkYPhwk2ZtcAs3NMkPqz9ftkvO+jw==
X-Received: by 2002:a05:6402:3210:b0:43d:20bc:5e4 with SMTP id
 g16-20020a056402321000b0043d20bc05e4mr25449711eda.276.1660136728956; 
 Wed, 10 Aug 2022 06:05:28 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a17090694c400b007313a25e56esm2278576ejy.29.2022.08.10.06.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:05:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 195FE1FFB7;
 Wed, 10 Aug 2022 14:05:28 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-13-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 12/62] target/arm: Use GetPhysAddrResult in
 get_phys_addr_v5
Date: Wed, 10 Aug 2022 14:05:24 +0100
In-reply-to: <20220703082419.770989-13-richard.henderson@linaro.org>
Message-ID: <87mtccmep3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

