Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3846E965D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:54:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUhO-0000KS-Fm; Thu, 20 Apr 2023 09:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppUhJ-0008KP-Rr
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:51:42 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppUhH-00038P-Lx
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:51:41 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 e13-20020a05600c4e4d00b003f18e479d9aso364441wmq.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 06:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681998698; x=1684590698;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KXIcVgoejr8J6uvR+tTw5sflHYn7Flt6y4A5+zWzhAk=;
 b=uNS6D+ZSbVJpeSQd2j2IPW0McUT4joNgd8HkTL51TPZdwyM4mQ6iZAMLPW5nRHjbS8
 PY/INEP0I5MaYwR5DV//2s2owg4XWs18buWhgur++GRJiIJSVMKvxqg6xdL6t2uXQbMN
 vm+FOdR4cpEx3pgt4fDIF0dRZsy0e0zDVPNLucaRSx8i1ay2xTl85UaFSjNzoPt09vQx
 +yRr6ukXEGPkgNuRIunuNuYslXZZPYt2LKn8iSs+RqDo1mkmqjp4xN+QDxha8SZHh/xy
 RBNJhBppaZuLpPpQNqqpZuZzz33dJ8MUTFe54ohO/CaYf3W8SignnNdjcjJmHwpM1FLd
 o4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681998698; x=1684590698;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KXIcVgoejr8J6uvR+tTw5sflHYn7Flt6y4A5+zWzhAk=;
 b=Tun+beuCESeuajwZ8E1xb/YTRHr682lhHMoBKXdaqRfmFPaEq8zawuLifmZ3zFE4eH
 4phmwbMd4Q42d1heB8pwFf/6mJlSqLNkJJeL8wJo2aJvZ19zO84TqTS5KZ2DjslFKIg2
 HCwYqCugdxsVeixu/uUJTz1Z7QgEyEXfiguhpnnS3u5lye7pp1JwzFe5b9CSiteXr3FK
 DTdQKwEEEfvRmkKUstDWnWffwe5mgKpFRrzLiWnJQ0kXJ6nzmaXWnEOdy5x5HRgbsKbj
 idAtF6JLQ8bh6SstIGWTx8tNqyNRPKyKFN5sVxyY3nZCRFNBnoXI/BO5UQ8ddwOCs7nO
 O2hA==
X-Gm-Message-State: AAQBX9e0Zj4pcIYlRAPWffoFFx86XfrQ+zbyu+K8xV+FRqDiem1ENUqC
 hT4a65czu/9bOP7OvnybtdDgCA==
X-Google-Smtp-Source: AKy350aOC4xHawuQszn+WB15j+CA3nXKJRZ78NOjDQnrQTpi3vkV6Yc01aEeVmL3KlN+SNO3SYkc0Q==
X-Received: by 2002:a7b:c8d8:0:b0:3f1:72f8:6a9c with SMTP id
 f24-20020a7bc8d8000000b003f172f86a9cmr1220244wml.6.1681998698345; 
 Thu, 20 Apr 2023 06:51:38 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a05600c00d300b003f17eaae2c9sm2133738wmm.1.2023.04.20.06.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 06:51:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 94C0A1FFB7;
 Thu, 20 Apr 2023 14:51:37 +0100 (BST)
References: <20230420122256.1023709-1-peter.maydell@linaro.org>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] docs/about/deprecated.rst: Add "since 7.1" tag to
 dtb-kaslr-seed deprecation
Date: Thu, 20 Apr 2023 14:51:32 +0100
In-reply-to: <20230420122256.1023709-1-peter.maydell@linaro.org>
Message-ID: <87jzy6d5li.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> In commit 5242876f37ca we deprecated the dtb-kaslr-seed property of
> the virt board, but forgot the "since n.n" tag in the documentation
> of this in deprecated.rst.
>
> This deprecation note first appeared in the 7.1 release, so
> retrospectively add the correct "since 7.1" annotation to it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

