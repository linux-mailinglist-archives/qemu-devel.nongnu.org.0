Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B086244A7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 15:49:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot8qL-0006a1-Gh; Thu, 10 Nov 2022 09:47:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ot8qJ-0006ZO-Pr
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 09:47:47 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ot8qI-0006jH-Al
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 09:47:47 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 h133-20020a1c218b000000b003cf4d389c41so3574433wmh.3
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 06:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0W29cDitWK+bBg+bMyVEyZTGFKSEy1ZMAX4DyGLzMDM=;
 b=kzErl8QLiLo9jZW+NFNcikFiJH1GeVK5BsoBbuKRzDMWnaNGHdVRyPLCRYj4OIj3BE
 HSdu0uK7/RDeRyqTxUy0eD7RrLUcE1U097lfX5BUJwpWxjPdGGo5G870KYlZPLzKR5f9
 tNOE8rW3M6rpAlORsfNhK4qrM6Us10BE7CTud1I6LWAY/gIHtjLhj48XrSzvx5RtQtZL
 fXIp0dMmIEM6XMEjodrNcsF+pceQhRnGzxS5pf9I1ezqMqJrZZIe5MAMBffgXMYfXNyO
 7kJl8+OTXIp4t2Oee3Yn0xKl8QEXxK1geCb9wC1uagzmkUTZ6BegpnthO3b1vMxZKPkm
 npgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0W29cDitWK+bBg+bMyVEyZTGFKSEy1ZMAX4DyGLzMDM=;
 b=pZZBCpG5LtmBYAkJSSacnWESso/15eSu4jp/QS1kh5QKGldYiGnkr/OVbwF9oz7c9F
 uOO4YnMxT83WsevdRmCfDf5TxWkP2yRmDgp+p+DUdz3I4ZK1UQ10qHqMAujiQ5J9aubu
 /+wbfNVtjKrmrhKV9uhJoB1RkOgbfkPJi6/1ewrf2XK465f/IBssqp0vmexlY5n9itP/
 +bj9vBHsjbY6RNw1qIno2uuCJ/N5BiKia3jy2wIhJ/m7dfO3iFFWC6V/WRhuiBSwf/5W
 vlTp5T3cKvv3L414VEfdxU49jZ+uXm5gCHRQ7EjgDSNe8Y7003MdsXNfmsyEZ2RqOkoT
 +ANQ==
X-Gm-Message-State: ACrzQf3eWXmMTSnUe/Ao4Jo0oiA9AiPM4UmRPGVyu/EJmifyMFYLELTF
 H7mkHjQIbwsCM/6OTaK2oYQU0w==
X-Google-Smtp-Source: AMsMyM6aPCX8d0HTmpTcn7AItAtgNcpc/32qwuwbWGkkmL5nylyyUAO2LR4vwlJFYhvhc7xRXpdLnw==
X-Received: by 2002:a05:600c:54e1:b0:3cf:8ec5:3c8f with SMTP id
 jb1-20020a05600c54e100b003cf8ec53c8fmr26567286wmb.165.1668091664056; 
 Thu, 10 Nov 2022 06:47:44 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bg42-20020a05600c3caa00b003cfa81e2eb4sm6215515wmb.38.2022.11.10.06.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 06:47:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B17A41FFB7;
 Thu, 10 Nov 2022 14:47:42 +0000 (GMT)
References: <20221110142901.3832318-1-peter.maydell@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH for-7.2] tests/avocado: Raise timeout for
 boot_linux.py:BootLinuxPPC64.test_pseries_tcg
Date: Thu, 10 Nov 2022 14:47:35 +0000
In-reply-to: <20221110142901.3832318-1-peter.maydell@linaro.org>
Message-ID: <87cz9ueui9.fsf@linaro.org>
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On my machine, a debug build of QEMU takes about 260 seconds to
> complete this test, so with the current timeout value of 180 seconds
> it always times out.  Double the timeout value to 360 so the test
> definitely has enough time to complete.

Queued to for-7.2/misc-fixes, thanks.


--=20
Alex Benn=C3=A9e

