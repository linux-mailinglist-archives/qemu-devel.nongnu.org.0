Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CAA39F5A6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:53:38 +0200 (CEST)
Received: from localhost ([::1]:60626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqaIb-0005Sv-O5
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqaGO-0001zg-1Q
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:51:20 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqaGM-0007tW-7y
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:51:19 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so1656133wmq.3
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9Cl0y/vHDokJoqDYvSIDBTpe4UpYWgrTeiYNR/7ObQs=;
 b=XBxVaq1Tc+IpyiqQFhnSjsiKWiuBA30PSfCtp4BjCeCmBv7CwtVHn9DCvbKfGzweSj
 vofuCPBtexfcAzA3HMh40QoO0+GROnpps7JIxqPqWqJAuh284dt91xIhLMRQa9whQMQl
 PH1E6bHYO6HuAQ0lcW4pOyCWFSa/KIssE7W6gKHs/44K1O5kwLhlbJr62bT2ledtTcwV
 WNqy4Uw5PbF+OR/aZq0rRRoJ3UDXK6pnQ2f8vkSuF4wKe0qaQUxHvGY/nNQR6s57CN6H
 OUPuoAgcukTfOBKc1VbRPz7OrCAVpSzTvsGHmRCss9912udUg3WXLggju+5TcYvaSOhP
 CYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9Cl0y/vHDokJoqDYvSIDBTpe4UpYWgrTeiYNR/7ObQs=;
 b=UyF4qqJ+8tQnX/FG2kwXFOrAGFGEFiVPtWTBlhDtKp8faifHnexxubygEW2uij5Kl3
 68kom9QLCY/Dskk4vTeK5ZFGUEvRK99Xl7ywRn2iVgboauPci38ixeemhSXQMsRaxULd
 yWIsf9i0awvOyZhpZGzDw1J3/Zjj0x3GMGFSfHdsELNabqaZgzZBla+0SNdxuoeiWsBK
 YRO2Q3cOABYpHbVOVFNL4Nox8ZHcDTs1HYPixhMeO+DrcAq9SlgWnzq/YDG3EMXLKLBE
 oJH7iwRz1qHuCVvvFOWyVy5AUUgKBC7KT5YWUe9HHUkbBiRiLJ4nH8Wi5olHR+f+3ldi
 C/yQ==
X-Gm-Message-State: AOAM530N17cB0l7aPF8dQ6l8wWFy2APaxSZXOB+6Fk5JXTK5L2NoFo2E
 25FqJJHuXMnE/8wa0ZZUTNHegA==
X-Google-Smtp-Source: ABdhPJxy3L+twUc4fyqcLwi6Fq/9P19f9Sv61pr+s5qJDcF/ukGzoAtQRPMms/pjC9qnUZ7uGIaFgQ==
X-Received: by 2002:a05:600c:3ba0:: with SMTP id
 n32mr3828798wms.107.1623153076578; 
 Tue, 08 Jun 2021 04:51:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v15sm2507264wmj.39.2021.06.08.04.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:51:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2EC6C1FF7E;
 Tue,  8 Jun 2021 12:51:15 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-11-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 10/28] accel/tcg: Rename tcg_init to tcg_init_machine
Date: Tue, 08 Jun 2021 12:51:01 +0100
In-reply-to: <20210502231844.1977630-11-richard.henderson@linaro.org>
Message-ID: <87wnr4lglo.fsf@linaro.org>
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We shortly want to use tcg_init for something else.
> Since the hook is called init_machine, match that.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

