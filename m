Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332736172AB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 00:31:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqNBd-0006O6-HO; Wed, 02 Nov 2022 19:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oqNBb-0006Nl-0Y
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 19:30:19 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oqNBV-0001DL-Vn
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 19:30:18 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so2281972wms.0
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 16:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RkAfd54H70l+/qbguMZN0aCoppTfObMksAHTnOIMCxg=;
 b=aKqxhJ+hpqX8hb6+jj8+oPmK5cCHj5POo6vqdMvQg5g9/zVzNAH6BT4WzhgfLXSPdl
 /esSFTVJzg2gv3fJqCLzPl1OfoeXs5nSaf4Q9ZZC8z9bmrBGznqAviP4vesejXu71PW1
 GxKL82UnpEwpci02F5NCvzj1zOpSGutIe+qoBhW+w+j+SvjLafB8XywvE6FSog0psbAL
 oR5UFq/ikD7HU/IHcDYsbZbMb59++r6x/5eJzobxNaK1oLXir8DNpoXih9pYEwfniQCr
 n80Nq6z7Uf4xamVEolGhvkgf+lS9QYTLZOblksq4SaAw/lG9MZo393fsfyYyQXVEC5wN
 Xcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RkAfd54H70l+/qbguMZN0aCoppTfObMksAHTnOIMCxg=;
 b=INga33doNK896NvYo1YkycHvfaRTpVeMCDXw6YUChU7Np7ziIqtmULaQ4OAONeXNbF
 sbdYGdI99wDB66WX9iGrdFqrBIxHCnV5/EJtsYp9enNAD5N0j2To0JE5wUufpNu2Sf25
 mCULcUTPEalodFF3JpTmSA5XRtIb4Atb59VVACUvF1GklyuwtncnsU4FM/G79FsSgzO9
 uVwU6VVJPtAkcdTwP0P8MDhJQUV8J3faimVRX4g54zPMKSbTji1wvy9jTOV6MR98iQtH
 Mylo/0rVrqly/VO497c7PgSQfL2790o0oHDUZZig9Ne7ba06dV7UPT4XF78jPhNoKiVX
 vrIw==
X-Gm-Message-State: ACrzQf0SKkUCAkezDfRNkmft+FV6FaaGhnpNzL7LoNjhOfrAAbhzVTkN
 mlnDD5FCcRQDp44SusSUKgEjk5oE5dkP7Q==
X-Google-Smtp-Source: AMsMyM41RBIF3zS/FbcUWxgVPus8A3At3d0vIQKlpNIC+toRIf++rLsXIlr1q5IxMJWqPR4UoC3poQ==
X-Received: by 2002:a05:600c:689b:b0:3c2:fd6e:1fe5 with SMTP id
 fn27-20020a05600c689b00b003c2fd6e1fe5mr17223931wmb.99.1667431811945; 
 Wed, 02 Nov 2022 16:30:11 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m123-20020a1c2681000000b003c6edc05159sm3576881wmm.1.2022.11.02.16.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 16:30:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 38E0D1FFB7;
 Wed,  2 Nov 2022 23:30:10 +0000 (GMT)
References: <20221030083510.310584-1-sw@weilnetz.de>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] Run docker probe only if docker or podman are available
Date: Wed, 02 Nov 2022 23:30:04 +0000
In-reply-to: <20221030083510.310584-1-sw@weilnetz.de>
Message-ID: <871qqlkk8t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Stefan Weil <sw@weilnetz.de> writes:

> The docker probe uses "sudo -n" which can cause an e-mail with a security=
 warning
> each time when configure is run. Therefore run docker probe only if eithe=
r docker
> or podman are available.
>
> That avoids the problematic "sudo -n" on build environments which have ne=
ither
> docker nor podman installed.

Queued to for-7.2/misc-fixes, thanks.

--=20
Alex Benn=C3=A9e

