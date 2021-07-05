Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 419603BBDA5
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:44:50 +0200 (CEST)
Received: from localhost ([::1]:49520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Ou1-0001Et-45
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Oqo-0002Cr-8P
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:41:31 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Oqk-0001j0-AE
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:41:29 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i94so22172971wri.4
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4s9UUzjLvPagDrGvn4yvmibyzEYwfyvlXd24adG1de8=;
 b=D3QM7SZ6Z6uoxP5g0cIU4N3unf5RVCEqfC/TgIrq5YN5uh3EWIJhXSYoAGbuBFUDoy
 lJydNfLQSapH7CS67hCQC9gIRAhAoZYNjzHYiNQf9fsftknRjb1Pr8XQodZMd8OjXXBQ
 FQ+54kF9EggHtBFyxzfaKVHjHix4QdRrDVu0PD3VvRKtAaCgE/kLd1EMl5pBNFl9B+Ji
 hPwI+3wOHewRGBXJsH7k4OW8RgWtnHgeCxElzmPjWD9pRXAo6HjZhUbWxsi+Ec3yQl5+
 EXXcLolXkD4OiNshmE7SQUYRDU9QL9YrAgUPEffdVZLDq2brXPhjl2U3FtLxPorkneIM
 We5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4s9UUzjLvPagDrGvn4yvmibyzEYwfyvlXd24adG1de8=;
 b=uEntg90fN6BX0nU5rDwOTJXcVnPvxjIq7v8ps5pl9NwEW/EwrNzIVNDXhvyInqX0cH
 oW/3qVbq57GRDF4XP25nwNjDd03aB69UYTbMFcRDnIWV6nhBoqhhEB+jjKHs/ROPk8fs
 SF/znF2Eje3mzb+k+hke+UW4UcolRFRTg+ucGxLo6jNYbeRPYfG4KanuUJ64Uu/LSyjn
 h7FmiG39jLcUmBg0AlRqFG4aEGSmIVzG6w5y3fb0xM1X020rFTwWr8WBpgj8eIT9KE4P
 K5RxuTG2ACD534H4OGSLQpIGdT3tJWoJr9XNcipdUqvfhdRMX8YJZvSPpmf6t1+n2T1J
 NlfQ==
X-Gm-Message-State: AOAM530hYH78yebcISO0qVFATfErn5zt0Sl8kONFEStS45GGC5ZCwxCK
 eA3H2fWZTGXxxQ1pXgYQbZvILQ==
X-Google-Smtp-Source: ABdhPJxyTFAUho09otaMTbDEJ9d9T+IU5POUtHK9RQREl9m8dyc6pDi7FW2W0xpPvQdaPaHu6zQSUg==
X-Received: by 2002:adf:f54e:: with SMTP id j14mr15744925wrp.373.1625492484968; 
 Mon, 05 Jul 2021 06:41:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x17sm16283284wrn.62.2021.07.05.06.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 06:41:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B20731FF7E;
 Mon,  5 Jul 2021 14:41:23 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-14-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 13/22] tests/docker: expand ubuntu1804 package list
Date: Mon, 05 Jul 2021 14:41:18 +0100
In-reply-to: <20210623142245.307776-14-berrange@redhat.com>
Message-ID: <875yxo514s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

