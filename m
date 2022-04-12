Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9484FE97D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 22:36:30 +0200 (CEST)
Received: from localhost ([::1]:39080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neNFV-0005Oo-78
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 16:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1neNDe-0004fi-2e
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 16:34:34 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1neNDc-0000HT-Mu
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 16:34:33 -0400
Received: by mail-ej1-x62f.google.com with SMTP id g18so14673227ejc.10
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 13:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=d2H8TdXUQtIBh8cKdq7st2cI3IacUohi+1UxYG8hDlM=;
 b=C/yvR299MTl9OGTqKjUIzrTH2WNUBag3U9cpv8wLox/ca0Zmol4Ia/zqkAM3zEAI2u
 6d4RNauvVaR7qcR4cCZsymGvK1dAD/V6hl+S8oUafHfTUa58IiDHmneHa3lO9BxW97ZT
 Bx8G0ZcdjmgZ7gT9Qb8m+9N0GC4y0de/L5tTKwKVY8/oJiOpNv5P2Dvmp+GZqE52X9Gm
 XqsrXnfZCM5tCXw9fSJVHB3XBKX8NJpUtmnoDkD282VZ8ADMgozesU3oy8PlJzWAF8D6
 7zIMcWhuSKqzfn3bCUnRajKmQHSSTVZudgtsr1oiJ6Cb3EZwVRSbFUM9GHoprVxoaGbs
 iuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=d2H8TdXUQtIBh8cKdq7st2cI3IacUohi+1UxYG8hDlM=;
 b=yyeSiaPr0iiNmYWZpCfkkoemkXH+PdHKxnWQWMHf0JBQEyW4xd5njv7BmG3LLEM8vr
 7Ms6H/jUNxWcXstuNAcWQftvf6XUCjICYuZSECCoRo/WFaLvf5nyl4A1C1n6d0hXmrlv
 QcE6nkj63mUF4ZpX/Cr6S7dLHgujJN6y74J+ZIKFYoQU244LGdgGWZgJWF9TUTVSVyhb
 MezFG+LnGjw//O1rpDaEj+cGln20ctWUOtCvK7wGrmy3D7oiVFRK5impRwdXhdP51c7O
 k7J5Ww25MhtiasKCFrAwXNTYyb2coPyVdhIPcRP0q6q2Fm3FxHIjnoyjne5ogqOvKYrJ
 I1uw==
X-Gm-Message-State: AOAM5334Q4abfNmkXt6CQh46GoIRO50d2RACYsre8sQOnfsiTwEr4V2Q
 J7EybRBqK+86qTgDbmrzHzB7jQ==
X-Google-Smtp-Source: ABdhPJwdehzQhnwLJtmgRZ/d+pIBtprwpixwJY1MWFSTQ7x/SHZ/E1LndX3oD5LLPynjKh5Q2riT1g==
X-Received: by 2002:a17:907:97cc:b0:6da:a8fb:d1db with SMTP id
 js12-20020a17090797cc00b006daa8fbd1dbmr36608322ejc.267.1649795671078; 
 Tue, 12 Apr 2022 13:34:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a17090638d300b006d6e4fc047bsm13695324ejd.11.2022.04.12.13.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 13:34:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4297C1FFB7;
 Tue, 12 Apr 2022 21:34:29 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-7-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 03/39] util/log: Return bool from qemu_set_log_filename
Date: Tue, 12 Apr 2022 21:34:24 +0100
In-reply-to: <20220326132534.543738-7-richard.henderson@linaro.org>
Message-ID: <87bkx6yrai.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Per the recommendations in qapi/error.h, return false on failure.
>
> Use the return value in the monitor, the only place we aren't
> already passing error_fatal or error_abort.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

