Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BE543B771
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:41:24 +0200 (CEST)
Received: from localhost ([::1]:45276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPVr-0007Hz-Nc
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfPR2-0000rH-35
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:36:27 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:36503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfPQz-0004jZ-Dd
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:36:23 -0400
Received: by mail-lj1-x22b.google.com with SMTP id q16so17076202ljg.3
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 09:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=8XOnCvGHn4zmaWoQoqjXaKDR3NbwTDVxauX5KnbleSc=;
 b=EQbCRYFbSTJJG1mWrjnP8KqvCIfojCh/1qgGHVI3Xuhq4fWueLWFrulaNYKnYHP38V
 MtEWj3o9z/EHuU2TQYwwMRBSzvoCknuYPoZAqmsg5ZpH72bVV4gdjGJRB4++pNFZJ724
 5s8BQOWGyCayqqu7Oy+LQLPa5VYPDfrya4JVy8MbwbK6zLG0gr+S+UqYSJE5DGi+M4L/
 QD1gDnOdP9C8TuFjjOeDbdjm4HGWhIHKg0phLYXFKr+7RJROP1vAzG94u0p6XQPFBla1
 Ua1XrTe2ySi5jLO3apsuQ74KCSb3SViASmFr4AlHe4crj77v1lu8TSnYO2Dzq/MAL5er
 BEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=8XOnCvGHn4zmaWoQoqjXaKDR3NbwTDVxauX5KnbleSc=;
 b=jgb/3vBZBeMCB9YtJXf4Y/NEqPISYqx4yLs/DXEsy2skMKgKj2Lr3/KISN83PLv4Na
 J7J7kHU/SYAO3OpWDzuAot1r0USJDwEyo82DzpTz/ntKAPbvEUzavQheBEU+pvAH2NFc
 cTz3P4lFMKeXm6TaUmjGeYK1Who6889crYv/NribEiF0nGadAXHODeODvxVenw6PT0Os
 qC5qGEOa4ULmhMbjsYn411x7xfZ776VVigbqLdYfkQdiru6FQIHAwm9ygM6ePqQlFG3q
 OL9LN9jsMJCPGb+AR0cKblSlayE/WatAEJRqGWDMTG+lofL2Q+1pSVWJ75+eDyWJiqgD
 Oaaw==
X-Gm-Message-State: AOAM533gl/U3VXhp5Z6f4qDFu+r3nIybwwFjbawoV4CkVgW3Uk3dg8se
 rko3JkkvSQfITtLdZ5VHJpamlTrUToEDMg==
X-Google-Smtp-Source: ABdhPJymGXq+nYu6L1QAjeHLWxH5byd5u1sqAis/VQtluUeO+WzgiuHq2U+c7jPj8H+UPkvDsXDHXw==
X-Received: by 2002:a2e:a914:: with SMTP id j20mr26491011ljq.122.1635266179706; 
 Tue, 26 Oct 2021 09:36:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p16sm1976091lfa.266.2021.10.26.09.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 09:36:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1AA811FF96;
 Tue, 26 Oct 2021 17:36:17 +0100 (BST)
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-47-richard.henderson@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 46/48] tcg/optimize: Propagate sign info for setcond
Date: Tue, 26 Oct 2021 17:36:12 +0100
In-reply-to: <20211021210539.825582-47-richard.henderson@linaro.org>
Message-ID: <877ddzzqta.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: luis.pires@eldorado.org.br, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The result is either 0 or 1, which means that we have
> a 2 bit signed result, and thus 62 bits of sign.
> For clarity, use the smask_from_zmask function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

