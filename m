Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA487694B2D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 16:29:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRal0-0000aT-1s; Mon, 13 Feb 2023 10:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1pRaky-0000Zz-LP; Mon, 13 Feb 2023 10:28:40 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1pRakx-0005lG-4h; Mon, 13 Feb 2023 10:28:40 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-52f1b1d08c2so42895127b3.5; 
 Mon, 13 Feb 2023 07:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BSNSfAGjwXwBUfNm6rI5YxIrhmDxNq9yMpPtwQFhIRM=;
 b=N5/z4J0HqXRl+0HWBud2r842Q3a/52ZqsXfIxjtKJ7UQTxJvbFm2wQvIxn33zfeRdd
 hmdyWSMN/7PGzt3qexJOc4rHZ7u3MYL1Qc7HOXXTmP3Es/wki7WNUT2dwzzdgPedWr9O
 KDn9s0FdqgFTNkmkPYR1n3eW1V9GZ8aovmaDoe1U1a79gGkasFWCuk9MhWZ2+la81BU1
 J+bRVMVhbIPFVMhPLEZ8Z3rETOM7hlpeocPZcZ8zGQcY2NuPBzzevY+5QIk2RBm4AhP0
 XHmj9szgCAWSuR0fv0ezAA5TGeaNQR2oNiAQdjg95EHs1EMSC7ya83LWqji2vlU9bMEn
 Sw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BSNSfAGjwXwBUfNm6rI5YxIrhmDxNq9yMpPtwQFhIRM=;
 b=SXgD02W1Ibiukc+Xxxotppgi4OWgau0i+42nT2UP6ib5MMMvI3eB4ZLUekoq/6kgwq
 4YlthvLp7mnLknkPzY3QGi3AlkMMz0mh75wXl67JZhi3S+02nxJKIiIGhiAAhlvaKyn7
 DmWgtPBA3ljU3e7/NP0nWpL0xe1vTWwPZfeAYuyjOsw2J9WKnLjZ7P4ExCSDhCpHbIGh
 Nn04NHbtQaP4MYE66i+yukI7tWnoLGMx7FY5ZVkLqrSifw1xy8LzinJugfYlgbbCmx/j
 jXbfEq7NuIVzDtAV3IL5BuxSQi4ozjMnUX5eyy0f0oMlCnhzDkmQ/XbC8cePazKxBwcN
 GYOA==
X-Gm-Message-State: AO0yUKXlJXKIOzS2v65w8h6ZYR9ta5wfmT4QKFCvcti8FK3IuDGHYn0t
 LCVr3+iDDH9X5TAjEFDDU/XsH4Wdp+7RaveSnhU=
X-Google-Smtp-Source: AK7set9hl/QSX16FESmzrdIymqBrBIU6eeHxT2C34rRBBgRYGCOsq7Fvud/5OL31oWWAK8M2/9T/nzmrOGuAwd6KnSE=
X-Received: by 2002:a0d:c906:0:b0:526:8ea9:49bd with SMTP id
 l6-20020a0dc906000000b005268ea949bdmr2193000ywd.339.1676302116892; Mon, 13
 Feb 2023 07:28:36 -0800 (PST)
MIME-Version: 1.0
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
 <dd55481f-e871-c412-bf81-36632d20ba7f@linaro.org>
In-Reply-To: <dd55481f-e871-c412-bf81-36632d20ba7f@linaro.org>
From: Francesco Cagnin <francesco.cagnin@gmail.com>
Date: Mon, 13 Feb 2023 16:28:25 +0100
Message-ID: <CAF8_6K=ZQgqU8J=S0UHDxjCjB=z55d_XM4Vza50XJsOAh7YSKg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add gdbstub support to HVF
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, mads@ynddal.dk, 
 dirty@apple.com, peter.maydell@linaro.org, qemu-arm@nongnu.org, 
 agraf@csgraf.de, pbonzini@redhat.com, 
 Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=francesco.cagnin@gmail.com; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi Phil,

> Could you share the test-gdbstub.py changes?

I've just opened an issue on Gitlab:
https://gitlab.com/qemu-project/qemu/-/issues/1489

Thanks,
Francesco

