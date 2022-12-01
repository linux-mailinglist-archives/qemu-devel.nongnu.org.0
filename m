Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D9F63F7FE
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 20:16:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0p1l-0005X4-S3; Thu, 01 Dec 2022 14:15:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0p1c-0005VS-Gq
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 14:15:13 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0p1Z-0006Zj-Mb
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 14:15:12 -0500
Received: by mail-wr1-x433.google.com with SMTP id y16so4407010wrm.2
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 11:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=61X92j13gAX5hmqwyxw9Jc9UlH6gIPlYPHmNzI2UF0E=;
 b=XfMpG1hNRStUT8ECCdIBbztN6ODTX2NwRBcGceO2CtdqmbVsTZFF6OkScEXhT45U5d
 xYB1n+v21wZZ1hXQyMNEazITUK8ZXHtPYNGtJg8aWKXvXwGwzn38qjGrPtF6EnxJrEkv
 s1714p9+9phfO/i1K9S7kg1Y6B5HJ16gdo3FMaUCqstmeG3bxAgGYsS2FlO7i+AEZmqn
 BkPo42PvKDah3Uj97TVpl+2MeUfnIKzTElLWSDjqRFwMnSc7tWoEpqlkPhCQgoscTmym
 gumLUfpi5YWbazwaQE5dVSoVVITC/zLjHvBUis0+h+Kh6V8JYUmtLe8AevuAaOokWhDb
 foZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=61X92j13gAX5hmqwyxw9Jc9UlH6gIPlYPHmNzI2UF0E=;
 b=nSEHa3mb1Zv/4furiu1o2Pfqm6lijhPMfZKj0sS0R+NY03Vi9UYBsY6ho9wx9FLN0L
 E6XKwhAuB76dIVr72cMHUDI5tFpAaHDv5CnWQVuNdgSrwxPv/SqGSy+qXNwHFO5Wum+F
 BxdxS0S3zie8iUAi1c9B4FYAsmF5WmTYXsHnOA5UK18Dakgj+NCx+nzpseSDEX8vUCg0
 hhB4x3/D6KgNswzB77QYX45oJGyuaLThyceYF3hlDMuBN0vRfPYx4cke83abv4Y5koZE
 3N2OImclPT0MfoXsVDDl1s3q21GMYWgypqvkfByquCNCbCmsu3koZHgfSzlfQt3oIQpp
 V4xQ==
X-Gm-Message-State: ANoB5pnMy0L0DCdabi0ntszaV4+lG7rcVwwvG4W9ftA/JD5h450fHRhu
 EW9qKMgaYmP2VSubx6bMNaRl4w==
X-Google-Smtp-Source: AA0mqf5yI/IrM/gvaNBDY3Rgfl3ImbUKWh5iMMNjGYpX5bVr8v53bE11d6AG0bcqDnWB5/Yz93iw0Q==
X-Received: by 2002:a5d:4886:0:b0:236:6e67:84a4 with SMTP id
 g6-20020a5d4886000000b002366e6784a4mr41834757wrq.181.1669922105958; 
 Thu, 01 Dec 2022 11:15:05 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a056000118b00b00225307f43fbsm5320416wrx.44.2022.12.01.11.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 11:15:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1A15F1FFB7;
 Thu,  1 Dec 2022 19:15:05 +0000 (GMT)
References: <20221201133756.77216-1-thuth@redhat.com>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, John
 Snow <jsnow@redhat.com>
Subject: Re: [PATCH] .gitlab/issue_templates: Move suggestions into comments
Date: Thu, 01 Dec 2022 19:15:01 +0000
In-reply-to: <20221201133756.77216-1-thuth@redhat.com>
Message-ID: <87ilivaqbq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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


Thomas Huth <thuth@redhat.com> writes:

> Many users forget to remove the suggestions from the bug template
> when creating a new issue. So when searching for strings like "s390x"
> or "Windows", you get a lot of unrelated issues in the results.
> Thus let's move the suggestions into HTML comments - so they will
> still show up in the markdown when editing the bug, while being
> hidden/ignored in the final text or in the search queries.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

