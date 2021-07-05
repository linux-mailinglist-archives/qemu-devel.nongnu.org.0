Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434BF3BBDA2
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:44:08 +0200 (CEST)
Received: from localhost ([::1]:45296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0OtL-0006su-As
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Ork-0004Bf-Ec
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:42:28 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Ori-0002TF-R5
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:42:28 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v5so22157034wrt.3
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4s9UUzjLvPagDrGvn4yvmibyzEYwfyvlXd24adG1de8=;
 b=jrrS/yJj9RSKiaHxNuRoO4kNFRoUdLTTEKcz4BRGbm5azqb2fNS3AzAT/HnZRIZNE3
 iBco3hb+/fevdu1tws92tyH9iKD+c/zVX6Xly+cnWuLU9OujSjmcZy9d9iXSUek9jGAd
 hmLlM2RYf4zXIgUnKymw2bEYP2MyanLmGFohGuToikjOwaUIei/B0zKH0IfGQOnPAcx+
 0IGSZPDgBX/553FvzksbxiX8CY1M4QT8Dw+tDdGQN5czF3VLFQP6/vrjjqLH+QZolxC+
 WKGV97zb+C4gKadE+HpTrhLWhMu2rhps1bitTF8uK3Jpoq6gvpVmAY7r4/pP+mWBBLgp
 PoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4s9UUzjLvPagDrGvn4yvmibyzEYwfyvlXd24adG1de8=;
 b=jF9ZDak7yzWEMXgli+cLgxvaZ2f1M/x/QEFrX2/Euq2+UlDf7IJZ7GgBHe2J5QZOl1
 xMQ0P+8YsSqvb97b+/Zp7QxHE2B3uBX/wPDxDKYQ3/s5MGrOE24ifbIaKbVlBcq8BVeQ
 ROFvi+u5GyVbzc3J/LNl5iYrfBiEhw8N9m1824QrcGJFqnedYAoYcXweVYBXFK+eJmjW
 ElMTzkf46iNI6ULc5HXY3GjiwhsufN6OTXBEnaNPKq99JRvBlvY/kQvlAiQsS8+Hzz9C
 J74cZJYPIMgTza5DMqZ0wq8Q2MxEbZ4qGgkw8TMeAaRKcm8CjzvQBF+4S6LoqxE60C85
 0QYg==
X-Gm-Message-State: AOAM530E0xp2xx1qzr8xsbpMxFdQK087ovQGdzEiINl36pHK9NcVJ3Wr
 kcDGfQ0xs26rSB3B9pmbrOnNSQ==
X-Google-Smtp-Source: ABdhPJzv60nk/zh3s70VPO85BeJHX36aE5KTsuPiw4iJptaUXfCuef4+LW5aTNMCQaCe9xg03X7jGw==
X-Received: by 2002:a5d:5609:: with SMTP id l9mr15804256wrv.123.1625492545416; 
 Mon, 05 Jul 2021 06:42:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x4sm6563710wmi.22.2021.07.05.06.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 06:42:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E00FF1FF7E;
 Mon,  5 Jul 2021 14:42:23 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-16-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 15/22] tests/docker: expand opensuse-leap package list
Date: Mon, 05 Jul 2021 14:42:19 +0100
In-reply-to: <20210623142245.307776-16-berrange@redhat.com>
Message-ID: <87zgv03mio.fsf@linaro.org>
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> This is the fully expanded list of build pre-requisites QEMU can
> conceivably use in any scenario.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

