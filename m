Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4A16960DD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 11:35:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRsdX-0006sk-E8; Tue, 14 Feb 2023 05:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRsdV-0006sA-2Q
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:34:09 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRsdS-00038v-KG
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:34:08 -0500
Received: by mail-pl1-x632.google.com with SMTP id b5so16602494plz.5
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 02:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L8YKpfOCppAXISjaS8Fnc7QWroAeCS8nvtNV12KFC5w=;
 b=bfCz+It6h0Rfqj9WykYw1FO2/D7CyZ3aifsfD7k72a2KgQvKGidQJeNT2DR6WW2nSF
 di92P157ETGvjH0TrXxp+0LwG7NSorUgmzWmZhMs9rFZ5xD4W/nYDYVhE0YQ8c7dhC33
 AX7/exlCVNXp7L/deiOKm/unIHsf9G6ELg60e60tkIVYhtf4TyAkZTobH3RHuqKJ7Ayv
 6eLjA5oWT/CUnkToh+w7FYIISQCCxl4jQboqjt/KDMcvkkl4a7OrftDeNukRlAbeG82Y
 +p9CaDmDolwKEChTgvpKh2nj4T6B/AhlHfg35M1sb4/d6SGiZUkH0R0y6k8gjkq1HbXT
 Iahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L8YKpfOCppAXISjaS8Fnc7QWroAeCS8nvtNV12KFC5w=;
 b=FyvvBbBc3TcH944VS7QoBa2bVheUMv7QQnKsmuX9sm2UCNW1xUuanxEvonFpWsHvs3
 ddry16vp1yc/TYbxbbZIl3NZaEmkO2GK/Pvrx6KNHN5ESBh3dPMm5Q86UYfQMrtGdukV
 ZWf+NnheZwh/poEC6HrTFlJmhOVbKdBpC9/SITr9FU08MJ66KvLshcG1Vnc4//qYNhil
 +VP4sRxzRuWkbvherNPDanYzZtHcuJzUBa/wjui8lY30nvpHoth0Qn0yeDMfZWAMYezc
 SlKBJ/R4yQnuws/pWbpIGQmrNdxRhGNKNPsdKSWLsdw+M++pb3yeGh1zcvAQgoxgEDKj
 PQng==
X-Gm-Message-State: AO0yUKVAzM0UN7fpLRHfQxood3Qqk+fZPT3Tz8umB3MCi742A8EekPjZ
 ZsvETYrM9Ji78ktVOx2kVELyv9/AZ07n5oZqeaLGBQ==
X-Google-Smtp-Source: AK7set/sAhalw0DI28swc0MfhBJY7WJLqiz/R4ueeCp9UokrgPm5prleyaM0MluCw4uPAt9Uavw/K40io2OTYpRn404=
X-Received: by 2002:a17:902:d2c1:b0:19a:8a3c:c6ea with SMTP id
 n1-20020a170902d2c100b0019a8a3cc6eamr541689plc.33.1676370844981; Tue, 14 Feb
 2023 02:34:04 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com> <87cz6cpue3.fsf@pond.sub.org>
In-Reply-To: <87cz6cpue3.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Feb 2023 10:33:53 +0000
Message-ID: <CAFEAcA9sAk1XbcOpETN-rD+iQgm2F2=bMm6ic=HBgP6+qVd2TA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 14 Feb 2023 at 07:40, Markus Armbruster <armbru@redhat.com> wrote:
> I read this on Friday, and decided to let it sit until after the
> weekend.  Well, it's now Tuesday, and to be frank, it's still as
> offensively flippant as it was on Friday.  It shows either ignorance of
> or cavalier disregard for the sheer amount of work some of us have had
> to put into keeping old versions of Python viable.

From my point of view it is definitely ignorance. I simply
didn't expect that a serious major scripting language
would be making it this hard to write code that is
backwards compatible with older but not ancient versions.

thanks
-- PMM

