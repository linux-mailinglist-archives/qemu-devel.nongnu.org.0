Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1641D544D3F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:14:35 +0200 (CEST)
Received: from localhost ([::1]:51456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHze-0000Yo-3R
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzG25-00025F-LV
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:08:57 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzG24-00014Y-61
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:08:57 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 o37-20020a05600c512500b0039c4ba4c64dso6748017wms.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=QnZqULlHV1bFVxHB7Feo2yV82MISzAxw0oCeS+yGpa4=;
 b=K3qJN3HluJz/JOGOirwcWyOADWWzcb80Tlo6ITgIzuxs/vcvWVxhvLSlmRYdnCs9XH
 JYCbPlhtjQ4mQaH59dDjvmTY9K7q1aTAblN/YeZuBrqJrTbwpj+bZhF1tZJtnE1sRiKr
 tMhx4RGaUaikCnlya82XDtdv0WYtSQvxV2qjEq4hoiC7My0g2NR/C1ez0OWfzaOTkP3u
 bbZdHm4Ctp8gSHoyhoJI/IeRG0SXkTK3n5EORhfAH/qE5Rhk/bXptYBjYpIERmgRcEx7
 Lmph2cPfXMu2MnFWvZI51SQtwzeebbaZfdpxo/rgK5rd2Sv0fCuBXlY2xn6/nmRyttFX
 yl7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=QnZqULlHV1bFVxHB7Feo2yV82MISzAxw0oCeS+yGpa4=;
 b=KxhYM/1S7Dzb+ZG/moXAn7/2bqpNN6Ti42uSdy4pfV+n8U09A4UAs44rLR+s+QkwAG
 bKflZJc6rzr/Y5sNN4JwZMRF/SzIrMf9OonFeC3A/c36kQAyy/8CTmbiQKER0xwkS3za
 Rbiz42Ut6fQZzyilVuVs1BctbvN+4UWEY2t7U8uh3UlpULfcPrCKK4KOAx7txet9RTsQ
 pZ3wNwJPa6rXTtHPpDXYmhw8pnSokRpk5WkccovqDGjKbf6vBIVsaG1gE5m/iTENw3/V
 ArxGhsmFS6EGjSnSdbwqZPvwZ3u5RIp2FE/bhoKR2thlO7/P6t4zhoWmBJi5bMwffhXJ
 gfbQ==
X-Gm-Message-State: AOAM5317KFX/gXRG7qBuGSD/4+B//fFJAkDkJ7fLtoRugYZI5LoLxjlz
 wKXelSoyn4vI/5fZP2g+nzIcLw==
X-Google-Smtp-Source: ABdhPJxI3zcJc7f2mWZDDw2RR8h+lqVNsiMqpBVCUVJ5pLZUUfG1x1fmH6J4/Wp8CF7AnHhaByOzfQ==
X-Received: by 2002:a05:600c:1d19:b0:39c:4aee:fe3a with SMTP id
 l25-20020a05600c1d1900b0039c4aeefe3amr2799107wms.89.1654772934279; 
 Thu, 09 Jun 2022 04:08:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003942a244f40sm33539233wmq.25.2022.06.09.04.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 04:08:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F08C01FFB7;
 Thu,  9 Jun 2022 12:08:51 +0100 (BST)
References: <20220608160651.248781-1-berrange@redhat.com>
User-agent: mu4e 1.7.26; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH] gitlab: compare CIRRUS_nn vars against 'null' not ""
Date: Thu, 09 Jun 2022 12:08:46 +0100
In-reply-to: <20220608160651.248781-1-berrange@redhat.com>
Message-ID: <87sfoert4s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> The GitLab variable comparisons don't have shell like semantics where
> an unset variable compares equal to empty string. We need to explicitly
> test against 'null' to detect an unset variable.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

