Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4226619836
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 14:35:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqwpw-0002mZ-JE; Fri, 04 Nov 2022 09:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oqwpe-0002l3-0n
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 09:34:07 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oqwpS-0001gV-1Q
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 09:34:01 -0400
Received: by mail-wr1-x435.google.com with SMTP id y16so7044666wrt.12
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 06:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N39sLJ8Gc6W23e2IJBzehriFG8FOViMFTpNLJGywSRQ=;
 b=bM+Mo6k8HWjO+yeub+KwVzKzVNgQk8QKg7JCnhpQ+ckmkGkKJ3WEUnu8aYUvcE55ov
 Z6BUHCKev/GWvcVEGTcUwGknMmG7vEksm5ZI1/p2FeMAwJ9+gxQZBdOuFMU1wDnfVCfH
 o1n+wa4vEOgYctZi698a2CGhXUeLCy7On9bNT+rAPsxoALO+hJjtojyLnfjsIpz0Rn2H
 w/O24v0oRJ7ymbrHJwtlNjWAvkfQiD0QQtU+aEszFfLUJ0SZGFGTpaarm+auDJrjAV2U
 dPOi4nDn4zLFCFeUOGvoDcOg2Jk4Uvc2iiuKbexEQ/ni3kMDKtAEm5rzWIr0iGQLEYSJ
 Lv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=N39sLJ8Gc6W23e2IJBzehriFG8FOViMFTpNLJGywSRQ=;
 b=g9DHmVTHLKPnOyDG77irMRaQ5j10ZDlykWyIgpRKMkDe+lkwL1viwLbf7PQI143Pt5
 3izbRyOaOSfo8I2XfKW7ixycZU0n8pIAjauXQOB9IRr+AaUowFBKf7naPFdsohzLGOpl
 k0vnCZMtM5ZKJtptFfXo1uoHkUvSBXLgAMO/eeCl4KF5ZBKP9s0FeDqoZYcH96cwkhDb
 q8gDBAsUUiXcarTO2DW7JJ5BqDgkwTxMnwc1dIsk/huFJMqc6Yv/ncB7MZnAGn/9V2jh
 oyPkByvUKY/s3r7MLew3JGbFelvi5Y3nqIfvrVZOGlG2+2CfOdr0kzjW7Q0ixXHLS2Xg
 4nag==
X-Gm-Message-State: ACrzQf0Mhv/IxXiArULaIhfgA6+mrWMoq19Y6qeRRc3CgD2BwGVScbzn
 Vsh6j3gg/c3pt2Ku5HJ7OW5DaQ==
X-Google-Smtp-Source: AMsMyM7gFOrm/ZxUz3eFTAU6RARX8mkQ5J9aHEo4Mm1XePDHgH2Et9+TfvYHOc8M9FRUvg2geWhdEw==
X-Received: by 2002:a5d:480d:0:b0:236:5817:2299 with SMTP id
 l13-20020a5d480d000000b0023658172299mr23069406wrq.371.1667568827479; 
 Fri, 04 Nov 2022 06:33:47 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k25-20020a5d5259000000b00225307f43fbsm3376289wrc.44.2022.11.04.06.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 06:33:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A59BE1FFB7;
 Fri,  4 Nov 2022 13:33:45 +0000 (GMT)
References: <20221103212321.387738-1-stefanha@redhat.com>
 <599dd8d8-33d0-1bd7-dfe3-01bb2712f2bc@redhat.com>
 <7a67e04a-d723-95e6-0575-1a5a8786d54e@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] gitlab-ci: split clang-user to avoid timeout
Date: Fri, 04 Nov 2022 13:33:02 +0000
In-reply-to: <7a67e04a-d723-95e6-0575-1a5a8786d54e@linaro.org>
Message-ID: <87fseykfnq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 4/11/22 07:27, Thomas Huth wrote:
>> On 03/11/2022 22.23, Stefan Hajnoczi wrote:
>>> GitLab CI times out when the clang-user job takes over 1 hour.
>> Oh, that's new to me ... is that a regression? Has something become
>> slower? Or did we just add more stuff to the user builds recently?
>
> We added more TCG tests:
>
> $ git diff --stat v7.1.0.. -- tests/tcg/
>  tests/tcg/Makefile.target                              |   36 +-
<snip>

but are any of them particularly slow? tcg tests are generally quick (or
at least should be).

>
> Also more s390x tests are going to be merged soon.
>
>> Anyway, if it's just taking a little bit longer than 1h, it's likely
>> better to bump the timeout by 10 minutes (to 70 minutes), I guess
>> that will still take less CI minutes to run than to have two jobs.
>>  =C2=A0Thomas
>>=20


--=20
Alex Benn=C3=A9e

