Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39836EAB60
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:17:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqcs-0001px-Sp; Fri, 21 Apr 2023 09:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppqco-0001pD-TU
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:16:30 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppqcm-00019q-WB
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:16:30 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2fa47de5b04so1681027f8f.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 06:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682082986; x=1684674986;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DzPChkf84jFbfrRtyWFREOFWYl6ur94FcmbGf9QXDhI=;
 b=ZZI0Q8UmknemZnlS1XGisq1i8jENZ8rL2kjq1wJzBKjgV+xqXglz1FgsSNZw6vvDAC
 NrQO5oNFodTT88GM/1WnN/UpKk7XSgvwtX4pDAmd8YUaWBLZqKT6vwSY4VnEvbk/1WJf
 9P3hSrVZ8tB5kapx57bKP6ju5usWL1al8LofoX4+zgJYGjKyHRtpf4+EDkvKDUXbi+AP
 VyFkcOvtlfmywu59uxIKKiNlIMyTuNey7EBn/Q3ECZuoBV1tP1rlUfvKf/YSr+/NQD1y
 t1Suj9faj1ivjwuFbBCZHiiGknY/zEss75KNUQkOW1bg0/s86eSNNtmrGWB+sseCvtKx
 g/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682082986; x=1684674986;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DzPChkf84jFbfrRtyWFREOFWYl6ur94FcmbGf9QXDhI=;
 b=DlkYYPRPrLdCapG2nFNVqyvbL76WtbnR9tn4cTIDHsAIqBhOKAuaiMyu7MHETE79QM
 yPG1RmujcwtMoOFyb3ieUzmP0GrK1FSBzbC0l+ZUDHQz/z98lc4xqzL24dG2lS1C0oyI
 JkzdnDACX78pJ6nm9eL8JFVIAG7NonejBiKsdPLnVSqAt1Hq+fcewlG/tsTdXLA9AnsH
 UTT3egJIrg/YmmaTsjI4IepjRI5oHg4aAiQOD7/QGtDugaENzCtb0di9kZl6buBD7I/m
 2mXFzn07voUIy5NZcslrXkQHGgxRbakf7moOO3gXq3rjOT+S6Xahh1rOdgr1B1l6ypSp
 XATQ==
X-Gm-Message-State: AAQBX9dwu/219B5X0mcOFmU+eJffmfW21I1bhITQbHH/FBOpiAQSYZ+g
 MmNCILcgy/YvXkqs4Bn9dpCCEg==
X-Google-Smtp-Source: AKy350bLsiUFv82u2wuhddKke/ULKibCAhgfSrMLsyuHDfa94S6myCVcwNHtjxy+h76RfbGkW7+HHQ==
X-Received: by 2002:a05:6000:1806:b0:2ce:a6be:2bd with SMTP id
 m6-20020a056000180600b002cea6be02bdmr4062838wrh.1.1682082986306; 
 Fri, 21 Apr 2023 06:16:26 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a5d4c51000000b002d6f285c0a2sm4427526wrt.42.2023.04.21.06.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:16:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8B8821FFB7;
 Fri, 21 Apr 2023 14:16:25 +0100 (BST)
References: <20230421110345.1294131-1-thuth@redhat.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Andrew Jeffery <andrew@aj.id.au>, Joel
 Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/3] tests/avocado/machine_aspeed: Fix the broken
 ast2[56]00_evb_sdk tests
Date: Fri, 21 Apr 2023 14:16:20 +0100
In-reply-to: <20230421110345.1294131-1-thuth@redhat.com>
Message-ID: <87ttx9bck6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Thomas Huth <thuth@redhat.com> writes:

> Fix the broken ast2500_evb_sdk and ast2600_evb_sdk avocado tests.
> See the patch description of the second patch for details.
> Also add the test to the MAINTAINERS file (third patch).
>
> Thomas Huth (3):
>   tests/avocado: Make ssh_command_output_contains() globally available
>   tests/avocado/machine_aspeed: Fix the broken ast2[56]00_evb_sdk tests
>   MAINTAINERS: Cover tests/avocado/machine_aspeed.py
>
>  MAINTAINERS                            |  2 +-
>  tests/avocado/avocado_qemu/__init__.py |  8 +++++++
>  tests/avocado/linux_ssh_mips_malta.py  |  8 -------
>  tests/avocado/machine_aspeed.py        | 31 +++++++++++++++-----------
>  4 files changed, 27 insertions(+), 22 deletions(-)

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

