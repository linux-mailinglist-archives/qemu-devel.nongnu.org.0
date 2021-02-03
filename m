Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A8030DE41
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 16:36:01 +0100 (CET)
Received: from localhost ([::1]:58106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KCG-0001kO-Ua
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 10:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7KBE-00018X-LU
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:34:56 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7KBC-0007mW-I4
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:34:56 -0500
Received: by mail-wr1-x432.google.com with SMTP id p15so24799629wrq.8
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 07:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4gvX2rQNdcnXRr9Ip3F3qD1tMIii4cAzmjkHsfU+o/8=;
 b=iaU4+7fHWzhtDuNQUwujGgYgjYDteSt2zKWTKtJioTfaARnoKN1hYrThJikFE6RO2x
 83hItaJhgivRR/ISN8N2Xf9FzP1WY6fi4zUMNvZTX3Z+Od7QMqPsKIwI1y5a0SJuMZlU
 IoMSkybuBXouSc+qFN9+bUKXE68pZ51sX4Dy8E/1l1XTKLjQ8gcJ54hdQj4NFPA5ne4/
 OuxAZsnR3ZVDW18TYguuX9PoK+9C1HrMp1zcd7AJIYcoX5vu31fVDMF3AujF5vHO+6Qg
 8bKZPHN2O9XHkZUzt9x2JiwdrDha7KPS/kWlk2zhSYDlCiyOCGSBSzcbx9rXDLEk4kQp
 gizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4gvX2rQNdcnXRr9Ip3F3qD1tMIii4cAzmjkHsfU+o/8=;
 b=SB3KAY4f+xUgICGwBnLtURQsj567nb1BW8k1SZCJcw7vZUwnCYpOJT48veopKGK3z2
 V2+f1v6awttKKWUW1vLIxmn4+5TU1ZkVBseQNMoIXklwMNJ+1EDOC6OM17h2R1Wu07gZ
 4m+7k/iLDnDk8NF05zr9e9oiCZG/sTIZTyfy1G/PsgkLIlOucpfUc5IF/jpDx7Qwfx7f
 BTVbHjpfRyXUPvBSV93NJJclrbfh6oJ1oUQ3p9EXukFQvpNFqTkmNTYjKEq+1niddUtU
 bwkA7v2XTjJegCIwVcXf2rw4XUJ6iUajQ8q0l90d1CBMlZ9PcGJeFJ7J3glN/5f5FUwP
 6KFg==
X-Gm-Message-State: AOAM532kMSy1b28VH64rBfzhVqg81ZK2ll6fgfPFxVNMwVaD+i44T7Dy
 Qf1Mk0nhQHr0PAn6qY4rMZ7miQ==
X-Google-Smtp-Source: ABdhPJw6v+rdogsq76v80DPbKX1efri2ZdA9APlC8zMjGGgX7kbqIQ8GoEmuwNiTFC8jqNQNiNoafQ==
X-Received: by 2002:adf:b64f:: with SMTP id i15mr4040108wre.279.1612366492805; 
 Wed, 03 Feb 2021 07:34:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u6sm4528041wro.75.2021.02.03.07.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 07:34:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 513EE1FF7E;
 Wed,  3 Feb 2021 15:34:50 +0000 (GMT)
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-2-richard.henderson@linaro.org>
 <CAFEAcA8r5+ciCFb0kPC1bAi-kU53iJBiLf7Jiso-gr2cOBtxeQ@mail.gmail.com>
 <ededd9b5-5836-b1c4-9fc8-e732bf1c2204@linaro.org>
 <2aaedf0e-3594-13a7-7576-8e0566464224@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 01/23] tcg: Introduce target-specific page data for
 user-only
Date: Wed, 03 Feb 2021 15:33:12 +0000
In-reply-to: <2aaedf0e-3594-13a7-7576-8e0566464224@linaro.org>
Message-ID: <87bld1rwpx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 2/2/21 4:40 PM, Richard Henderson wrote:
>> Well, here's the thing: this appears to be v3, reposted.
>>=20
>> All of the work I did for v4 has gone missing.  I went to go fix the sin=
gle use
>> of current_cpu, and it wasn't where I expected it to be, and that's when=
 I
>> noticed.  I'm grepping blobs now, but I must have made some horrible git=
 error.
>>  :-(
>
> It's not quite that bad.  About half of the changes are here.
> But e.g. patch 11 had been split into at least 4, and those are all missi=
ng.  I
> presume all of the r-b that I collected before that point got lost at the=
 same
> time.

b4 is a great tool for finding tags from the archive automatically. You
can either use it to build your next branch iteration or use something
like the tooling I recently posted for emacs to pull the tags and apply
to the commit. This only works if you track the message-ids from your
last post.

--=20
Alex Benn=C3=A9e

