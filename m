Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC50667A7B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 17:15:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG0Db-0007V0-EP; Thu, 12 Jan 2023 11:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pG0DX-0006gF-6W
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:14:15 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pG0DV-0004e3-JG
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:14:14 -0500
Received: by mail-wm1-x32a.google.com with SMTP id m3so13576683wmq.0
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 08:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MWGcz3OPudYdjW3Wy/h5U2IXMYcV+rWQGh5XUdGlxEM=;
 b=fLx5yg/HCX5BzkBOEotV6iBiAInP5jNYZJVMKXu+Wvm204GNK27VKf2U78hzwSGRw6
 oniQ8irfMFpcbh52YJPGpjBJ7fEK+wOVepY7RvorS03K106Ybt3CdWGM7ueJo9bGU0vw
 VOfitgjZL7E6clwBvTCp7tEb6JZhJgRIsLm7KXXNqpSS7JkV92nFAezvjQ/5794cPZC2
 EkIXA0qRVfURLDlXVwk37EUQVasjPULzzgNsZJqTGlep6gHJsrumOCDH5RHkQ7iMLMNx
 1rxQf1le7VtMF02VA554CVBAXjJisUVPrFHlSrlNTkvLDKQ6YM7+uLvPgl6R5ztstTwJ
 Pr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MWGcz3OPudYdjW3Wy/h5U2IXMYcV+rWQGh5XUdGlxEM=;
 b=zwZplwIExNxGofe/W4tpkVpFUW80Bq39kOsnWUtH0KpOQbzbWKILSmU1cYolBNVdx7
 qSX8gjXda7HsEAbPMrpckeFrkYmgHJbJV1KChb/RMmq9WwW1z78Ge35Zp4lKc/4VS3Ew
 CU0/U091C/RVKCKmaHgRlUHGGc/nzm95v02qvOECuh4vIMD9bhjaWkydUvilJrjA3OMV
 Xb/VrNsNRj4Mjawsb4kRO/NZGCXj9dJNhal6x5bcGvu9Jfypar0HLmiw5NIBXpD7/cOp
 SGXay3ffW7xsKIhThtAmPEgd/ZSCWTVitEu+0lYnwYGPzrYk16nZfyTEhrq7i89HIwCj
 /35g==
X-Gm-Message-State: AFqh2koztYO1NycqzQOFyy4G/b8cIhQ1m+XCkSxzivL6e5xD2rEctB7c
 xqSkFmP3LbrkNqeGhXfqKQPxng==
X-Google-Smtp-Source: AMrXdXsrJxt56HbIRb34hO+1WB8JG5ibGwoHnt3rqtYMvmFaRHaIAXnINLTMivJek5LiB/3Ambm9XQ==
X-Received: by 2002:a05:600c:358f:b0:3d9:7847:96e2 with SMTP id
 p15-20020a05600c358f00b003d9784796e2mr46170377wmq.2.1673540052172; 
 Thu, 12 Jan 2023 08:14:12 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b003c70191f267sm29115886wmo.39.2023.01.12.08.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 08:14:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4E22F1FFB7;
 Thu, 12 Jan 2023 16:14:11 +0000 (GMT)
References: <20230112155643.7408-1-philmd@linaro.org>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Anton Johansson <anjo@rev.ng>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] tests/docker: Install flex in debian-tricore-cross
Date: Thu, 12 Jan 2023 16:14:04 +0000
In-reply-to: <20230112155643.7408-1-philmd@linaro.org>
Message-ID: <87bkn3n31o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> When flex is not available, binutils sources default to the
> 'missing' script, but the current script available is not in
> the format expected by the 'configure' script:

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

