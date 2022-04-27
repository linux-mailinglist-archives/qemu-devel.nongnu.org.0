Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B7E511535
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 13:06:17 +0200 (CEST)
Received: from localhost ([::1]:48892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njfUu-0002Ka-5k
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 07:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1njfRa-0001HO-RQ
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:02:58 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1njfRX-0004Iq-Ka
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:02:50 -0400
Received: by mail-wr1-x430.google.com with SMTP id w4so1934143wrg.12
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 04:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FFBpQ2W5WR840STNiBda+q96+NHoxFlQMShJWOOHf1k=;
 b=EMBefTMZHwf3d3W5lXfOt5zqMI7u3FgNHmPuk7yK8+w5XGp3LNNr47JUtBBvZrjjoe
 vPMqFNFMVkyDbN3sOafGUQsQQoCExNG5jLS/0AP84jreiXjFyNXkjeP31cwOwQY2KfFe
 RXLGMAwjj8KgW4mfYVzdzzL+0IxRhfdoE9FeptQOdTBB9YBRS+EyKjb2nG4oD8rwdxDo
 b5XKvi7i7t15D0yrTbcASxo3NeRJruKrGatzDOYi77l0ZP3TPJgj1543/tmdg8ExgWJM
 wZiaEh6lRHE3ovOGHNHIGgiqIbRuplDWFu8Rqcd10rYBfHm5kxyCVJn9TiVOgUIWcxmp
 Ao4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FFBpQ2W5WR840STNiBda+q96+NHoxFlQMShJWOOHf1k=;
 b=TJdNbpe9Z73IBVhq38GDSKO+foNO6xG9BIQ2NG0zdd81J1hg3RWgM9uLVC/mwgxBMh
 szBwWGqsVGiA0v/BRJZeDiccYirjpak8CE8VOt5/iXo7cm/fOAc+ViNymeC83XKQNmgM
 sNXxIbohLGj8CKmzuU8fVHFdH5rGXw3tPrQ1j42ybAJKUrnwIG40mI6gR4IbxqUSWyHD
 Kj9ITxH/F3mPew4YF0Ed++BSXjo1WAykxOj0CAHmhKZ3oN+xW1sRQX6Fcu08WBANq2a1
 H96lr5mb2G59ztWq9f7tousEbzjI5toAGpBhMhkxHdwq6QpinZ6sRKGl+XtMqoJlflWp
 tAtQ==
X-Gm-Message-State: AOAM532mF4dMU5knJpgnAjGqbiBF2VYI8nQxz8Z6QcpZHGx0DYzCltfn
 SZ00jph0WaG4S5LTf0KE4ow37A==
X-Google-Smtp-Source: ABdhPJyHVoNizAcnTa0DSzhat3yLeYN6ifiN00rkvX8tVhNOyQhBi0a92nIQN0IezXimBy2B/BoKrA==
X-Received: by 2002:a5d:47c1:0:b0:20a:9f14:c128 with SMTP id
 o1-20020a5d47c1000000b0020a9f14c128mr21662975wrc.507.1651057364254; 
 Wed, 27 Apr 2022 04:02:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a5d598f000000b0020aea5d4085sm2843374wri.20.2022.04.27.04.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 04:02:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E447A1FFB7;
 Wed, 27 Apr 2022 12:02:41 +0100 (BST)
References: <YmZ8WpmZfdX5CsA/@stefanha-x1.localdomain>
 <8735i17278.fsf@linaro.org> <YmaunCsOBmTZyt2Z@redhat.com>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: Signing QEMU up for GitLab for Open Source?
Date: Wed, 27 Apr 2022 12:02:27 +0100
In-reply-to: <YmaunCsOBmTZyt2Z@redhat.com>
Message-ID: <87o80m4wmm.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Apr 25, 2022 at 01:53:28PM +0100, Alex Benn=C3=A9e wrote:
>>=20
>> Stefan Hajnoczi <stefanha@redhat.com> writes:
>>=20
>> > [[PGP Signed Part:Undecided]]
>> > Hi,
>> > QEMU needs to enroll in GitLab for Open Source before July 1st to
>> > receive 50,000 CI/CD pipeline minutes and GitLab Ultimate features:
>> >
>> > https://about.gitlab.com/blog/2022/02/04/ultimate-perks-for-open-sourc=
e-projects/
>> > https://about.gitlab.com/solutions/open-source/
>> >
>> > CI/CD minutes also become available to personal forks for open source
>> > repos so contributors can run CI pipelines without hitting CI limits as
>> > easily.
>> >
>> > Alex, Paolo, Peter, and I are qemu-project owners on GitLab. Has anyone
>> > already submitted an application?
>>=20
>> No but if we are happy with the terms we should go ahead. I don't recall
>> SFLC having any major objections and GitLab seem to be pretty engaged in
>> ensuring open source projects are well treated.
>
> Yep, they've been pretty receptive to feedback myself & other maintainers
> been giving about the usage & needs of QEMU/libvirt and other major OSS
> projects.
>
> FWIW, I've applied on behalf of the libvirt group today.

OK I'll push the button for the QEMU project.

--=20
Alex Benn=C3=A9e

