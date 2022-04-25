Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E0550E0DB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 14:56:22 +0200 (CEST)
Received: from localhost ([::1]:58340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niyGL-0000sN-R3
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 08:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1niyEz-0008B3-Ny
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 08:54:57 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1niyEx-0005US-Sx
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 08:54:57 -0400
Received: by mail-ed1-x52f.google.com with SMTP id k27so3094302edk.4
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 05:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=15ApG6xvRlty4bFNuWCE8vH1JW28OT8ZBz25cr9ZVLg=;
 b=PeiIl+jshiaa/eJddo0FnCh1am8AbDk2rhrZvO804cAsVTO2JoFgDUkxh7RkTdSki0
 c/v7KoJu/ABM7aX1JcJ0lOF4vGd5sIxAaQH1S34T/tFT/SNxIV6zWT8Thg+73/eW1nOj
 I16T+W/bBM0aWk+IMFE8S4zgvJ5ckDymi5LEjEe3kIjDJMQXOHlLp5AFJ9VAyioRm5NV
 WJ3714vVf1o1ewcqBP+NkYrdNwoBxc/O7ZvMNCwZeQ1REhZDAUaqUxIZ23e2GPGSSLUS
 t3bJ22pRTHELGzC92q1ss1Tf1/Kpo24YxVvcLk3LUoe7E16MtEBF+RfFovt7+fW55pAi
 MAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=15ApG6xvRlty4bFNuWCE8vH1JW28OT8ZBz25cr9ZVLg=;
 b=oGg1+oX2RG7H5SmSvC3VSkOa1qJ5FfWiioWq5FrufLf7cdCuUIQdHqz/DFpGl6q6pV
 /Dwhk7fKuPxD3rJ+HjoOoteDlSnKGS3jR59J9rTw1QbAZrTxmOrVKT9KMkh03cguh0YA
 xFmOyNDb9TBADmlmcV9CcZVqhCjtDz0yk8WmFij5GnoS9nJjwwqZy7QFmUkZCci9IiSq
 fKV2SLCXLa5pO5ARMTRm6xv41aX7CRwRMxY2HOlgwqJBrtO2DdSl9U287y+OnDEzZQaJ
 EUh6unWT3jmul5GVwTMOE8QoL/esr6an2LOspcWtWpBjvqMd0RRk+EcfUNEblPieSEw5
 1dDw==
X-Gm-Message-State: AOAM5313uD3mCvgzKMh+PfkpKN8zMivoC3+RCqMWZRkP4/WV4o1GSUyI
 Skx11cESv5UjXVWqeQ4d1uhl2g==
X-Google-Smtp-Source: ABdhPJwyz54hbUbhVqqgSGzpFywSnR/AIHoHyI9BT41EkxCjTZ2Uk4YYhA6xb0bsPNEwXyAtVte0PA==
X-Received: by 2002:a05:6402:c98:b0:425:d806:7e9d with SMTP id
 cm24-20020a0564020c9800b00425d8067e9dmr9487408edb.337.1650891293770; 
 Mon, 25 Apr 2022 05:54:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 mf1-20020a170906cb8100b006f378365a5esm2351589ejb.116.2022.04.25.05.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 05:54:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 20A711FFB7;
 Mon, 25 Apr 2022 13:54:52 +0100 (BST)
References: <YmZ8WpmZfdX5CsA/@stefanha-x1.localdomain>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: Signing QEMU up for GitLab for Open Source?
Date: Mon, 25 Apr 2022 13:53:28 +0100
In-reply-to: <YmZ8WpmZfdX5CsA/@stefanha-x1.localdomain>
Message-ID: <8735i17278.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
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
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@redhat.com> writes:

> [[PGP Signed Part:Undecided]]
> Hi,
> QEMU needs to enroll in GitLab for Open Source before July 1st to
> receive 50,000 CI/CD pipeline minutes and GitLab Ultimate features:
>
> https://about.gitlab.com/blog/2022/02/04/ultimate-perks-for-open-source-p=
rojects/
> https://about.gitlab.com/solutions/open-source/
>
> CI/CD minutes also become available to personal forks for open source
> repos so contributors can run CI pipelines without hitting CI limits as
> easily.
>
> Alex, Paolo, Peter, and I are qemu-project owners on GitLab. Has anyone
> already submitted an application?

No but if we are happy with the terms we should go ahead. I don't recall
SFLC having any major objections and GitLab seem to be pretty engaged in
ensuring open source projects are well treated.

>
> Stefan
>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e

