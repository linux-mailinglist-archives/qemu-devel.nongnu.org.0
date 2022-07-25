Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EB257FF2D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 14:44:27 +0200 (CEST)
Received: from localhost ([::1]:60592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFxRg-0003MW-N1
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 08:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFxCb-0003Fn-HD
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:28:49 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFxCZ-0007HK-Oi
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:28:48 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h9so15776170wrm.0
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 05:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=SYIyWLQ4j2xVj6z2wPyqTARF/7/XtzLd3Ia0EMaDD0c=;
 b=wB4Jj9SpDbkg82D9bw2OssqVkAKDed4olYG45cV2FOkNZ6cB8thmTbQ3iIAmPI7Wjj
 DinuL+KUEDRxymoUuOBhYrx1LZy7a0CCIBJVM2i2bswnXU7RuVX1vmVkUrNLTToyyqsK
 lKpGDhQUq0xNNsWxfkmZ3EFnGzTmp92Ez53AuDG3CJxnxxHEd15nK2AP6E3VZglENy90
 tcMa6NtxgsuEd0ldcrKugn+aK9rzrPKl7QZriTnTRejwzXJGTpXVptJSf/dvpQJOLwwm
 uA1th1gXWV+MJPwUeQYbrCOt1XiWROUfWDQATtcd35azVqQblZqxQuqAR81JJRFWqgxc
 5SPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=SYIyWLQ4j2xVj6z2wPyqTARF/7/XtzLd3Ia0EMaDD0c=;
 b=ta9/3MR9qX4bESj7HfOlVbucU90CJItSsNAE4c0lLoyktA4Kag/IUA9wiCv29DpQuI
 cjOKQMi2cJSIqB1dgW1IB+Oaa7P4XQwJFWI44uq0g13E/4YwmY5pilpJEY9QI4TVtmLF
 KOJV6g5eTZJDtJlT7tNxXFLD1VapjpHtILfdsm0wF5dWmULKDiBnA0LP6tIWFcndcnO5
 C5YG1D+0olVmJ+vchsbMx4b0vrogh7pIar7V9JVR58r6r3Qfx5+Cx3WN1MQ4N8usx31C
 rz5YH+CXv3vzgCVawfnSwt2ql7hCk1CBkm40lr7GvMK0tXrAsqcaSfJE3bSoVZviLmIr
 ftTw==
X-Gm-Message-State: AJIora9TusHiX+NQwFnr4qaIpfWHtrRe9vzCSzKYnrfjHe8gehIOeGZG
 sRShPfq+HI3rF7OgPq67Z7+Z15HiX1n4vA==
X-Google-Smtp-Source: AGRyM1vPYxqbmBDp1Wu3uwz6zYwVws953+ybVhQSeUzDq3X/Pgx86x+4nh/iII5A9qGynqme5NnD8A==
X-Received: by 2002:adf:d1cf:0:b0:21d:a2cd:522d with SMTP id
 b15-20020adfd1cf000000b0021da2cd522dmr7532048wrd.383.1658752125820; 
 Mon, 25 Jul 2022 05:28:45 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r17-20020adfe691000000b0020d07d90b71sm11998775wrm.66.2022.07.25.05.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 05:28:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2775F1FFB7;
 Mon, 25 Jul 2022 13:28:44 +0100 (BST)
References: <20220719121110.225657-1-peter.maydell@linaro.org>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/4] semihosting: fix various coverity issues
Date: Mon, 25 Jul 2022 13:28:39 +0100
In-reply-to: <20220719121110.225657-1-peter.maydell@linaro.org>
Message-ID: <87leshidfn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> This patchset fixes a handful of bugs in the semihosting code
> noticed by Coverity.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

