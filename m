Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EA440F6AD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 13:25:04 +0200 (CEST)
Received: from localhost ([::1]:59124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRBzK-0003NX-E9
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 07:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRBxh-0001jR-6U
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:23:21 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRBxf-000163-Mv
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:23:20 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 b21-20020a1c8015000000b003049690d882so9672012wmd.5
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 04:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=R2gGIPD34EH/Q0Y+qX06NkRrXd7vPR0qs6epvML/8ls=;
 b=LZxHmKv5qYtFPGP38bSPSy6/b3xu9SRbZkRWllQ/TO9rApYs03RKXzFdRzoeBCWviw
 2YaAMFxZyb7ex23YL7OE5/c1vZFRujVUwCPf0csdfeZWk73kyx+C84Zq5rWSKDckEvca
 SMN+yrCMG+whgYhww2SRWWP3R5jHnDXXcHGNgWpaBQJbQYYtqe0tPEtJqg5y1+MZjtz+
 O6pnsOCafFURNkQTQBdOka/2Fd4fgdqPO46kdAcvM+MmTFGAyGtw7FyJwB6OXVajqnCK
 KOucqejWf1ioqtsJH50jk99H1OfhUpI1umhEgPXBNHhGJScFLq6rNNiPnoYWdFMerwf/
 dcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=R2gGIPD34EH/Q0Y+qX06NkRrXd7vPR0qs6epvML/8ls=;
 b=HErYWg+ubFXl5KexkRIG7qMkJr7wcQWnsTqtIykByRRI65tWGv1KohSlZfiLQ9Dcjd
 IyNB2X4o98kDlkLO+elgDr32OkS4ZmsQAxNCP1JyHo9jZj3S4bZsVm2OZsQaJuzxqa1e
 yomx5abdnZOdh8PrPk6f+1azrpNsPmJL1gUxGfutZdiAR5opJH2pEem9NF0095mE35cY
 RmJTEzBoUaY+0ez4DA0J1qOj9sfeF1XTQwsFp4eZcJlw0OxziQ7FKeMaKDlqIi09WKeT
 aIpg9cNUAA10M3uEMm0bhwtEH1yE8Hip/YDZ5ZbosvHoa8fWPvaIsMkRbLcUT2L/+gA6
 Xinw==
X-Gm-Message-State: AOAM532UaeemEVMSqCsS/XDyYd8N8G5Q492cl689Q4flNpmTXiNsN7aF
 tD6QDtuqppwLPxSdIhapvdcFSg==
X-Google-Smtp-Source: ABdhPJwS1hYL4W2h+KBlSgCL0JO2YiP4kpcJ8cALr3upyVUsAVY55fuQ0vzQGR4uNThfpJDEjuPX9g==
X-Received: by 2002:a05:600c:154f:: with SMTP id
 f15mr9878455wmg.21.1631877797929; 
 Fri, 17 Sep 2021 04:23:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i67sm1498157wmi.41.2021.09.17.04.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 04:23:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 778211FF96;
 Fri, 17 Sep 2021 12:23:16 +0100 (BST)
References: <20210915125452.1704899-1-berrange@redhat.com>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 0/2] gitlab: some minor CI tweaks
Date: Fri, 17 Sep 2021 12:23:11 +0100
In-reply-to: <20210915125452.1704899-1-berrange@redhat.com>
Message-ID: <877dfftpi3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> Addressing a few issues raised by Peter on IRC yesterday

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

