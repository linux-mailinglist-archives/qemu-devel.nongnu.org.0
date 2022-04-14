Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2945500FE3
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 16:20:28 +0200 (CEST)
Received: from localhost ([::1]:53032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf0Kf-00082M-U7
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 10:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0Ia-0006cU-13
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:18:16 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0IY-0001ft-Cr
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:18:15 -0400
Received: by mail-ej1-x62e.google.com with SMTP id k23so10354974ejd.3
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 07:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3kZjHi2nnHf54HJbnYv/7jVI8LcRJix5h/LP3sUEo/w=;
 b=y/9qj9NaHMSgn5iDTnIoX4oC8wby4dTAcn0jHdaFNONZq3uf45QU5KQWsouqfqztYR
 C/PzfdYucUJlFZdkY32cKZ137IBcjqPhnBXAOXDwIV3zOPDQFCKwQfRinY6Hu50D2vX9
 ASQGawOqfr3lfU2mKPdazujCPlBVefAZaZAcTLGmTWtl7HihSsHdBC0w8/kq/QM5YvTA
 Ne6EYCh9abJIXw6oVvCcY4J9J7u8qtbsHdWE+JYbZlydRL2JbzOzarRFFxFlINcSDhvr
 U2xJDF3XsD52n1RnEw+eyrY/SZHxGPVgIIaKZerYSxT64qV4dhTKIcYS2frXhrL3g4IR
 6upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3kZjHi2nnHf54HJbnYv/7jVI8LcRJix5h/LP3sUEo/w=;
 b=vim8yn8Ot17492fA5TBMHa39Bk7IHw7Rule1K2QcVID2NXWD3mrS0qVNTNrhl1LRL1
 QHnRyZWwclrIIp1jaBsTL9bEXj0KeAW1F4VzX0SpPb1IQeloVOu1PmbtDYX7Mixrd8F9
 /nlhW2dq5c3aqTcMfjzy7VF0Q0WT2wVuFW/l5N1JIpcr4/Dz9aX1BAqTR+jUstQV9tVy
 ZgvnJsAHLt+m8slvaBBRUpGT3rjseZIdMk6VguUl8Wg2HNerZRASFXoxYct+4qFlIOAV
 BB1Dn9s4sTlsEmcvAOy9Y17UNJ+iS+C1mtQcsipcIcOvY9vnEzZICKJnOHilfHk/6hyH
 Xekg==
X-Gm-Message-State: AOAM530dw8o9llOYWXtXNd84vePzIC6k5XAW788UY0/+cAbtlLe/E4D6
 NNIx8yyyu34kjjiQYK7ANeXRfg==
X-Google-Smtp-Source: ABdhPJxqMzqjXc2CialK7pkpxWuHgAIspkyvtF+F8G6BDZW+IjrtYo6XFU+h9BckuLbQ9W8OZAZe3Q==
X-Received: by 2002:a17:906:ae83:b0:6e8:7cd3:33d4 with SMTP id
 md3-20020a170906ae8300b006e87cd333d4mr2529680ejb.462.1649945892727; 
 Thu, 14 Apr 2022 07:18:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 g9-20020aa7c849000000b00412fc6bf26dsm1056135edt.80.2022.04.14.07.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 07:18:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 196C41FFB7;
 Thu, 14 Apr 2022 15:18:11 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-26-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 17/39] util/log: Drop return value from qemu_log
Date: Thu, 14 Apr 2022 15:18:07 +0100
In-reply-to: <20220326132534.543738-26-richard.henderson@linaro.org>
Message-ID: <87o813wxy4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
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

> The only user of this feature, tcg_dump_ops, has been
> converted to use fprintf directly.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

