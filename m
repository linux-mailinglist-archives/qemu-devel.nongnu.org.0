Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293C06DD961
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 13:28:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmC9A-0006a2-Ct; Tue, 11 Apr 2023 07:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmC98-0006Zi-Gz
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 07:26:46 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmC95-000275-GV
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 07:26:45 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e22so7094400wra.6
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 04:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681212400; x=1683804400;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8/OhOkLCZRXQfg6MYRNvy+4SwrBtdRqq2xQukybeis4=;
 b=Y3YMSpHrk8wv3LGsgcwOFPe0WbhpEwYpkGFch7cFj5SynkGew2xOMoY8jhMIHfXooE
 tM/Yxhb2ld9KyRL0RyGIpPDX6YJ567NFgUoArF3ZJYLM+FbzSH+nEJ/TcXLRpIKyZ0ou
 Zn9wUaV8jcM+9nbgU9vd/+paBm/GjpUWJfz9jyCf1gNHM7cCqIuBwaC9jXLkNzaxadSe
 f5ZmDLUgtfttEZOvPggeImoDlfoa5bml7x0s4rkz6oKpt/j4d7JZ0pWPDtp5hr+EzPhr
 EXmcOt4sTydQSieoagPoMPlKSEnvatB0yqNAId8Q9Z9gtMkElBMmapfn7JrxRbp/+Jp4
 SzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681212400; x=1683804400;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8/OhOkLCZRXQfg6MYRNvy+4SwrBtdRqq2xQukybeis4=;
 b=JZZePCYVCR6ff6QqIGVgeJhH+WIoNrJdCSLT/Ish8qC7t8Lpy5Y7MbhmB5eILLoo+g
 RAWDXglHtpMykRxTQh07mlO+VDluhM3XkjtzvUjW3FGa6OOKiBM1EGY6DOGqGq0tgP6H
 FRjbd8ySp7mwvz54bC1IS993OfTkTBOH//+5a1CksK7+JqABDZa6xb2xdisRmyirXLPu
 mhLQvrno/zeYwf6kVSuYLDTEMhqALbEz5ei3tTvdeyihkP576BdSgpLNpGJOSEp82Rf6
 9k3yU6UYkWIiU9Nhyspu22SICQU8nGumZOXEy0A14Hlsay0m2ycejdumRMjY01Y/U+5u
 uyOQ==
X-Gm-Message-State: AAQBX9emuo9QhmFJUMzX68DhQ3SBvJn/dRsJY9S34NnSjD6eJyb11V5A
 YJVMNPRxXk7Lak5nfX05aODnEA==
X-Google-Smtp-Source: AKy350bf3bnNcmYUEs3x0e+10nzu3Qv34vc8YDE4lUA4tU9VP+G0SeGLEqGYDyViQS2aAItggrZpsA==
X-Received: by 2002:a5d:61c2:0:b0:2ee:c582:a67d with SMTP id
 q2-20020a5d61c2000000b002eec582a67dmr1761250wrv.31.1681212400048; 
 Tue, 11 Apr 2023 04:26:40 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a7bca53000000b003ede06f3178sm16620411wml.31.2023.04.11.04.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 04:26:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5FAB21FFB7;
 Tue, 11 Apr 2023 12:26:39 +0100 (BST)
References: <20230411105424.3994585-1-peter.maydell@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] docs/devel/kconfig.rst: Fix incorrect markup
Date: Tue, 11 Apr 2023 12:26:27 +0100
In-reply-to: <20230411105424.3994585-1-peter.maydell@linaro.org>
Message-ID: <875ya2r768.fsf@linaro.org>
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

> In rST markup syntax, the inline markup (*italics*, **bold** and
> ``monospaced``) must be separated from the surrending text by
> non-word characters, otherwise it is not interpreted as markup.
> To force interpretation as markup in the middle of a word,
> you need to use a backslash-escaped space (which will not
> appear as a space in the output).
>
> Fix a missing backslash-space in this file, which meant that the ``
> after "select" was output literally and the monospacing was
> incorrectly extended all the way to the end of the next monospaced
> word.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

