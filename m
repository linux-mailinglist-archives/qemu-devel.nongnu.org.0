Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E984E32F2CC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:38:16 +0100 (CET)
Received: from localhost ([::1]:33212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFL5-0003oW-RV
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:38:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEhM-0007Z9-Jv
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:57:12 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEhK-0003X9-Sq
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:57:12 -0500
Received: by mail-wr1-x430.google.com with SMTP id 7so3054027wrz.0
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=k8jLhJ561/fCa7jO6LswApqEgyQ1WK1jnR6m/iu6zoU=;
 b=cjPioqGENJoYyUeIynKKpRHPyGVnmDGgylh7i7LWpp8HdSmmSKFIKsc3QbMDiz1cMs
 4OyB8JdXHp3/8dvzma1wfrgMm5r1VUx1LviK9MCE/r7exOc4t3fDPATvuMyn7xZKNA1x
 RqhILvgVyAorWipJDREaage+o03KGpLRR1xoNbOjeaZgjHNgSnpAlUrKGYL8jW0IcP1v
 rwpUQq+rsI4deQOMUsP1xyXI+K9BAD5Wh858E5fxGFMbR2T5pqbQXcJ5UtGY479c78RM
 amlp15IUdLBgZ01o25HOgGPcoUwLzI8PgPPl16xUb7lo8ChNy2Af30MqUzFSdZW1BVCu
 DRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=k8jLhJ561/fCa7jO6LswApqEgyQ1WK1jnR6m/iu6zoU=;
 b=kPjXkWYrd8OmSmw9tGrsQxY3kWdMglXKrljW0JNdaCAIvqy+9xkHRRKArEYcd3sPf2
 gTJjaRHDVKwbu03V/fF66cYR3YtjrWJdxEsF//f0T5RDk7LTNpdChWqNKXoPZQdpEvWo
 nA9StUb5z5BV8fJIvkYqbhMmfOQ5LZMyy+j3Aa0hopXXd0SfXp1OkOzA2sKU012r4FvB
 gA3jRGETaSe2QLNnzKkOaQZc61msP4oRHK5VQYUpL0v8zuXy8dtt+8ddMmME3o/moPkA
 ZuCXs8xVy8hLtGSb+RMHIVEXoZ0Fh7vFFVYIITTlQrKIXT8WbCR6f9Ee7Ayv3Y23gH26
 dtaw==
X-Gm-Message-State: AOAM530BxEiNlGZJzejnU5500xuHV+D5FM7NPxeUTQcehQ2KiYKlx3VM
 WKHEQAsrGGiUBEcPSnoslgjaY0TZlk2bKw==
X-Google-Smtp-Source: ABdhPJwPDPeF7IhCX4YUF5ZiO4+wbEsxXhqBOlmtoNktbkvpHaqrRgKrN3ZIs1Xn/B9yaMATsHhD8w==
X-Received: by 2002:adf:f0cb:: with SMTP id x11mr10325500wro.206.1614967029525; 
 Fri, 05 Mar 2021 09:57:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 4sm6298152wma.0.2021.03.05.09.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:57:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4DBF01FF7E;
 Fri,  5 Mar 2021 17:50:57 +0000 (GMT)
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
 <20210302175741.1079851-14-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 13/27] tcg/tci: Remove tci_read_r8s
Date: Fri, 05 Mar 2021 17:50:51 +0000
In-reply-to: <20210302175741.1079851-14-richard.henderson@linaro.org>
Message-ID: <87a6rhebge.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Use explicit casts for ext8s opcodes.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

