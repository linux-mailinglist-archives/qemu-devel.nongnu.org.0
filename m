Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B38458D54C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 10:24:46 +0200 (CEST)
Received: from localhost ([::1]:36436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLKXd-0004x7-CY
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 04:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLKWA-0003ar-P7
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:23:14 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLKW9-000716-2w
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:23:14 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso8587648wma.2
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 01:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=nkBOLyxQQukN+Sc98sfxwHbEAtwyQxYfACF/YY1fGZU=;
 b=jEeedUj0EsaLvmgrfn3zeGfTI+jqubkcfdVewgrB6DdRwZXWa2XhF1G7K9WFtavCp2
 WsrM3V2ydFCg94oqKEseHwC+F7BQSCYlHgmc1LORoqSKigDCC2qpuq8+grD2nQks/ISR
 70Xn81wT1Owslk75KHQxAPL0ff/neNaaNA6ZHbGBVzn3J18IotVVolS+GbKy9aPNYu7g
 +wolF8/VN6HFzjUNVnKb+424AmCe0Ti78ROChl8Upoap7m6zDBwbkG6X/qq5XGLzddDo
 r199AF4JB8H6ShQjVWfidHuW8yYyLodYR7UygzcSihgMDrefilfzCnVURwR9axkED+rX
 XuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=nkBOLyxQQukN+Sc98sfxwHbEAtwyQxYfACF/YY1fGZU=;
 b=46394csF4TpFod+SF4GV/2beKVabYg6ZBY2rUjhHh/JPXB2pIm2lCSk3F85pHUiONS
 Z5QJ3JzkF+IQHqnZP5bdBVWJnqLcr6cohV6YhsJty/PYkZERhbSzr5Htk09Vtt1PMmV7
 hRSn5mKrYmlmI4LPEDQ6F9WOkDUu28IvnXUl3RRSm6FyEfzdFmiXQq+/Fa4v2GlbaKkd
 NYqBM0RmoKHgZCphN0iRtXgTN0NFgtvzxs2Tg4IGa9gk/WMMlUUt2yzBqdBy8vf//yei
 baW3uZbIn3DP4/iWNpDJQHoCYakiqHcFwElpqa+okKlGShQisgW9YGiYsi7e6M55n8H6
 X7qA==
X-Gm-Message-State: ACgBeo35Uk7ZXR/g/5sBqGbyH76uw/ynErr0o7/zBGqX5SL0B+5h62dT
 dkbUzkZq+aEmDD80TuFRKYW7+g==
X-Google-Smtp-Source: AA6agR7V9GAXUTKvh/a7D4t65R7gMPqn5e6d6zZlf97rs5b0DPJjzCYY6duiXEpNCdvuOLBiNHmN0Q==
X-Received: by 2002:a05:600c:4e94:b0:3a3:4448:62cc with SMTP id
 f20-20020a05600c4e9400b003a3444862ccmr14939999wmq.108.1660033391343; 
 Tue, 09 Aug 2022 01:23:11 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a7bc5c4000000b003a3253b705dsm15577971wmk.35.2022.08.09.01.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 01:23:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 078BA1FFB7;
 Tue,  9 Aug 2022 09:23:10 +0100 (BST)
References: <165943656662.362178.2086588841425038338.stgit@pasha-ThinkPad-X280>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, philmd@redhat.com,
 crosa@redhat.com, wrampazz@redhat.com
Subject: Re: [PATCH] tests/avocado: fix replay-linux test
Date: Tue, 09 Aug 2022 09:23:05 +0100
In-reply-to: <165943656662.362178.2086588841425038338.stgit@pasha-ThinkPad-X280>
Message-ID: <878rnxomfm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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


Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:

> Last line of the test is missing by accident.
> This patch fixes the script.
>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  tests/avocado/replay_linux.py |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/avocado/replay_linux.py b/tests/avocado/replay_linux.py
> index 40e4f6908e..e1f9981a34 100644
> --- a/tests/avocado/replay_linux.py
> +++ b/tests/avocado/replay_linux.py
> @@ -189,3 +189,4 @@ def test_virt_gicv3(self):
>=20=20
>          self.run_rr(shift=3D3,
>                      args=3D(*self.get_common_args(),
> +                          "-machine", "virt,gic-version=3D3"))

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

