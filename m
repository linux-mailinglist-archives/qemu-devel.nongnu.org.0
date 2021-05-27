Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8DD39319D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:59:52 +0200 (CEST)
Received: from localhost ([::1]:60596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmHUF-0006Wq-Un
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmHS9-00041N-M6
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:57:41 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmHS5-0007aL-Hr
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:57:41 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 z137-20020a1c7e8f0000b02901774f2a7dc4so5284309wmc.0
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 07:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=TyIb0UlOUw4Sm4JEsaC2mXqJDze0g5G63Ze76J35lmM=;
 b=WPAe4frhBEBU3waIPNcfPvVABhQcHYNxqtKe7c1/NhwG44zJ8mQ6vO7nn+VC1qe/ST
 bNLkY/V+sfmrs9Emr5HQfLK81RRUaCnZ7PrsospikbX/04Gzn6RPRAXiUw9XZuRSK75r
 wovI1ySPzo3uWx6bwMgZTzAMgSb87n/h10cQ8wtEsRmHspsmJu3dhCw0gBCB/gHsoj13
 S87IQ6ZZWWGkhaONKzzVs3Edk1uSoMQWr4Y30lr8g+Q0bsQUsNEzgkGnFeina5GlUEzB
 DaWDr0WxUQA2EYooBh1bm06Hjt5ej5dMuwUVFf89bDSunovYXEYgNHNKz96iT9qRdrEH
 SRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=TyIb0UlOUw4Sm4JEsaC2mXqJDze0g5G63Ze76J35lmM=;
 b=uEjcuI9ydxjTwMgYx9YmrvwSCq2ZP4P0gS0B6vsaP7kb4qV4cX1ypp/K4pjEdHUdZN
 97rNcsXG6p6rNGPcG0A+4UW6Hg7OCH+hT165nhm574BC9BlwwzRjW7dneBc4ZUocwDf5
 rwWc6uw9gqnv8na1eqlIud0zQDP+X/zW45RHarlsZWTZ4bvIgd73aLb5CqRx9P9A45Wx
 l9c+xiJKI7aU1SOLTQiBy5FRR8J4tdZFwWpismwVrFbtSUyh/H/IxliV90m0Z+Qx7CyL
 DXSRfrGjALwRY2qRqctJDoeY+JN9lf72Ncea4DuzsK8BBCKX6GApck5Tbbefqjk5rgDP
 JiJg==
X-Gm-Message-State: AOAM532PvckRXtik8x6ycvsQUQuAKNIsa9XquUBKPeSmXqmMWxlpEd1/
 XQglOdTM+E1f1hdVELe/iFVS0A==
X-Google-Smtp-Source: ABdhPJxNTO7fMt5yd6a4uetyoZbbozIG415a2nidEnmMx2ewtUhNhTjvS2eNCAD+lHcZV7gmChMsAw==
X-Received: by 2002:a1c:dc0b:: with SMTP id t11mr4008885wmg.89.1622127455814; 
 Thu, 27 May 2021 07:57:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s1sm11611922wmj.8.2021.05.27.07.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 07:57:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D52A91FF7E;
 Thu, 27 May 2021 15:57:33 +0100 (BST)
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <87v9741djt.fsf@linaro.org>
 <CP2PR80MB36689194A6DF4B3848702C7FDA239@CP2PR80MB3668.lamprd80.prod.outlook.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Subject: Re: [PATCH 0/5] stop collection of instruction usage statistics
Date: Thu, 27 May 2021 15:56:02 +0100
In-reply-to: <CP2PR80MB36689194A6DF4B3848702C7FDA239@CP2PR80MB3668.lamprd80.prod.outlook.com>
Message-ID: <87sg281axu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: "farosas@linux.ibm.com" <farosas@linux.ibm.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Luis Fernando Fujita Pires <luis.pires@eldorado.org.br> writes:

> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> I have no particular comment to make about the PPC stuff but with the co=
mmon
>> translator loop we have hooks across all converted front ends to identif=
y the
>> start of each instruction. It's needed for the TCG plugin instrumentatio=
n and we
>> could in theory use it for more integrated stats across the board.
>>=20
>> Out of interest what was the main aim of this code - a view of total exe=
cuted
>> instructions or something more detailed like a breakdown of types and op=
s?
>
> The legacy instruction decoding logic in the PPC implementation uses a
> table that maps opcode patterns (based on different parts of the
> instructions) to handlers that actually implement each instruction.
> The code that is being removed would list how many times each specific ha=
ndler was invoked, so it had more information than just the total count of =
executed instructions.
>
> That being said, the code probably wasn't being used for a while now,
> as it didn't even compile.

Ahh OK. If you wanted to you could probably re-create that information
using the howvec plugin (see contrib/plugins/howvec) if the decode
tables where added for PPC.

--=20
Alex Benn=C3=A9e

