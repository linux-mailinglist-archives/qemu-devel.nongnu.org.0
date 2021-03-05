Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4686632F030
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:39:16 +0100 (CET)
Received: from localhost ([::1]:51670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDTv-0006TN-Af
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:39:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIDR9-0005FD-Fl
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:36:23 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIDR7-0006Th-P8
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:36:23 -0500
Received: by mail-wm1-x332.google.com with SMTP id n22so1993333wmc.2
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 08:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=if9njK8iDD1fEqazXm5/IRPrNTYoxdUuUOqGM5g2p0Y=;
 b=XCDg2kHOUY3P+XtJoaYRshOIypYL3o8L2a0ol6Hh6Q7OaI1W4NPBu2QC8bVOCzZNJg
 j+rzQnAb8MwDkd4PYboqOfXdR/fB0Z8LqrAR5sgoldHr81yTMZGm7u2UfwOPZz5IAvf2
 PgKzdW6Q551l9ioEAJlzMnr34FkIZCImz9ESZmID24E3oQppDI2jLqYvl9jV/ik6I6PK
 67OC4qjx0eMQQgZntEY5yfgJYB3xjI6fY3LcAUpi1whHKtIBUgOV2VmK3Bk3a+83XZHB
 tLrs9/pOYcMeOgEtZNzG3zVcVEpyQgFs4P2dYZOFpfj/8qoJsK9dVmXgG0eoyobRvCpa
 zXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=if9njK8iDD1fEqazXm5/IRPrNTYoxdUuUOqGM5g2p0Y=;
 b=Kp/aD+efoWJvOLpPGr9IGIVVZjrKSnemJyEqogD5HjrYpshzfQjv/eEfenFlJaugvn
 vXjFjgGXNbGp4DLqGInDq1TyR22ig6J+gd1Z/vK5ZndI+fEFlFk873mj9gBIVip5BfzE
 Gl5adLFiWJmsu7D1k9N5LltyAZUVhWhBmER11HyomK0CN/OLneCE6+ViV1rAYjfRIz4R
 qX1h0m2i5rVGLhdKWeooA3805jJwbB6lEeiLs7TvhfrGc7pRnWbzfiRW2W3XgG/fyar5
 O3ggwAqUfzdwXgmRHX5vxX6C2CnE93yNad8f1j4vjN0kZ6h0KXTZJJB4jUxYgU8SBbSj
 u44w==
X-Gm-Message-State: AOAM532iPqdT4i/jM/7Th1yzg2or62KSj4ozyTEejH76kwHVYGJOJG/V
 TUWui/fKUARXJoc8hf9cptJyfw==
X-Google-Smtp-Source: ABdhPJx0ocnJm3HXnwxD0z+jvFr9Pm8GXWbYRXXEP1iba1i+vmss/YjI5WXDn5j9zhrVQiHStlJRgg==
X-Received: by 2002:a05:600c:35c2:: with SMTP id
 r2mr9572221wmq.54.1614962180153; 
 Fri, 05 Mar 2021 08:36:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r10sm5260422wmh.45.2021.03.05.08.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 08:36:19 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4C15E1FF7E;
 Fri,  5 Mar 2021 16:36:18 +0000 (GMT)
References: <20210208023752.270606-1-richard.henderson@linaro.org>
 <20210208023752.270606-6-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 05/70] tcg/tci: Remove tci_read_r8
Date: Fri, 05 Mar 2021 16:34:52 +0000
In-reply-to: <20210208023752.270606-6-richard.henderson@linaro.org>
Message-ID: <8735x9fth9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Use explicit casts for ext8u opcodes, and allow truncation
> to happen with the store for st8 opcodes.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

I got lost figuring out which access functions messed with tb_ptr and
which didn't but got there in the end...

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

