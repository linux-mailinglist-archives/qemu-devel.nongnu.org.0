Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D74536445
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 16:36:31 +0200 (CEST)
Received: from localhost ([::1]:34742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nub4o-0005bu-8r
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 10:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nub0o-0002xP-1t
 for qemu-devel@nongnu.org; Fri, 27 May 2022 10:32:22 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nub0m-0007Sb-B0
 for qemu-devel@nongnu.org; Fri, 27 May 2022 10:32:21 -0400
Received: by mail-wr1-x429.google.com with SMTP id d26so523566wrb.13
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 07:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=enh6a7a5eA1SQdqJCg4PaDtML93ORRsuCOegQAlsVVQ=;
 b=cmnOq62AJH2jK7qHGyHwbNOjSvrRE6O7N5Nm/j4cW7addSVEFdOvc/J0wYPA1uvYA2
 YtyIlzi4+JBOnLL8HGqnSg0hTx9j2c/Hp30zrH/C4pe89VlnEoUNJB3iQ/TwpSf9ithM
 Ym8XQdt78F/goureS/1qwTUhp3fQ0gCIf0yfjEAv6biBsz+ETbZ1fLN4cFhw4YXlGLUE
 jB+Fn6iAzYO+iKv63Jwguy0Q2eMlt2SOHRdCBleAOWwiJx9ANVtoZBDvct8bdRg5b9kt
 yimy70nK+hMY/R5I6Ny+Fzq4T+i9h9JgLnX8qNCbkFEqPauIfBIb/+Vzq6zd2Od5HoeF
 COTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=enh6a7a5eA1SQdqJCg4PaDtML93ORRsuCOegQAlsVVQ=;
 b=YfLLpPzwUood09jtu8bFyMzaykYT2cfvsSIAectPn3E2bjDTR48wgqFyvNk07ziw2P
 Gyfz3b0OHnBSrGRX9zCg6bP9wtkYgExKWm9tvfo+VMHoRa1XJBNHF1dJqwKk1ivuuS2i
 FEtxWzm3fHAAQnECmb0P4amau5jCi3bZrdC7p+6/h8W4+o1E6M/e6jsE/a2D/PCQr9Um
 LMhTogRM9sbLNMMLQiibVvN3Iis33c0/5b8Uyb83xNbahciA424aNTwOyRg0h/0taJY1
 celWCTDgXqP46XgP43+s7uxaSrleNGI6nD1No/jSHiriDVVvFc9WuEVUBKPSVb2Tiih2
 swUg==
X-Gm-Message-State: AOAM530ooh23CkQqTNpml/sGBBJTaFYPCVGsSOoMJZZshZ1a2Ibg3rnv
 LODmBCrivOAGSpA+QBjXUL08dw==
X-Google-Smtp-Source: ABdhPJz2MkIC74yNgHxG+nXlR1Pd21M6W2L8oRzxVJAotJrBGQdv+Tva+YGbM2T8WD2BfhlUlsAVTA==
X-Received: by 2002:a05:6000:1e02:b0:20e:65d6:792c with SMTP id
 bj2-20020a0560001e0200b0020e65d6792cmr35110779wrb.523.1653661938532; 
 Fri, 27 May 2022 07:32:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 128-20020a1c1986000000b003972c672859sm2346163wmz.21.2022.05.27.07.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 07:32:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 893CA1FFB7;
 Fri, 27 May 2022 15:32:16 +0100 (BST)
References: <875ylrytap.fsf@linaro.org>
User-agent: mu4e 1.7.23; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Wainer dos Santos
 Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, =?utf-8?Q?Daniel?=
 =?utf-8?Q?_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2] gitlab-ci: Switch the container of the
 'check-patch' & 'check-dco' jobs
Date: Fri, 27 May 2022 15:32:01 +0100
In-reply-to: <875ylrytap.fsf@linaro.org>
Message-ID: <871qwfyrkf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Thomas Huth <thuth@redhat.com> writes:
>
>> The 'check-patch' and 'check-dco' jobs only need Python and git for
>> checking the patches, so it's not really necessary to use a container
>> here that has all the other build dependencies installed. By using a
>> lightweight Alpine container, we can improve the runtime here quite a
>> bit, cutting it down from ca. 1:30 minutes to ca. 45 seconds.
>>
>> Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>
> Queued to testing/next, thanks.

And it didn't apply because it was already merged - sorry about that ;-)

--=20
Alex Benn=C3=A9e

