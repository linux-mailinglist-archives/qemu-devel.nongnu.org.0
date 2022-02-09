Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45644AF73D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 17:53:11 +0100 (CET)
Received: from localhost ([::1]:43656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHqDO-0006A2-A4
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 11:53:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@habkost.com>)
 id 1nHouH-0007uK-Cf
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 10:29:23 -0500
Received: from [2607:f8b0:4864:20::c2f] (port=41605
 helo=mail-oo1-xc2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ehabkost@habkost.com>)
 id 1nHouD-0005vO-BK
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 10:29:18 -0500
Received: by mail-oo1-xc2f.google.com with SMTP id
 q145-20020a4a3397000000b002e85c7234b1so2809704ooq.8
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 07:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=habkost-com.20210112.gappssmtp.com; s=20210112;
 h=from:mime-version:references:in-reply-to:date:message-id:subject:to
 :cc; bh=+wby900sSQ2MH+qx1AI2g9uX4NB4oL7kzk5MAE83X/w=;
 b=OJMQ3UClJLlLtMthLPKAkvwK5p0Y9I1aJEWwt7qNvxJmI56dK/sAznWTmEB99zztDo
 dN11Ej7flMUXsTxAX4V7k2/A4a4fLQW/XqitRCPSK7wUf1AqjCnoB8iTwyvmLwGsktHS
 sAO74s8uf/XAyQqpo/kIdsDndQsO3EtINFFlPyd+jYQs7BPcXUNPyJppvYEfdU7+ShrS
 rs1DV6AepWb6QBZdBqBQ9L5S0AHspIi3loVvbfmKzkjB0z7HZ+aYSbVU5eZjs25s/IEl
 Dt35SqUJB1gYRgJGuEvr3zVZjwUx4sbDxzGTT3bw0pJQ2TNQJPis0/gdN07TAq7DWWJ9
 8osQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:references:in-reply-to:date
 :message-id:subject:to:cc;
 bh=+wby900sSQ2MH+qx1AI2g9uX4NB4oL7kzk5MAE83X/w=;
 b=uZFEAii2xLToEElMYnvKdQssfn9ATVODsM3/zMh327tFdz5uYfse821KFSfs0evgal
 uuT1nutSpKkvmIRsc0gK2WPuUSBbWfzjLhVnsNLG/7twrbU69D/ijmiwOvcSpK7ipqWV
 lpHZLNbSTQR4Wlmn0DdpT6aTsVsuWyaMUyfnyUYq3dG2+au0NdaOFqXEgi5Y8l68HBE8
 MxRbzy/OChYSWlK668f/xONMl0R4COKKCtFA7pOaVx+giQXXJflvr129L8Oj9lv8evy/
 59OxCFzqrOIiVQpmjour+2vNONzhJVHc6isCG4skEITZCMOaesWwhKEL2HaVE8aphQ5T
 a9fw==
X-Gm-Message-State: AOAM531qeuFYcmndBMC66tSF8cgs+A6bpk8iyKT8FSFhrG8AOtcnfZB7
 bqYlJSgp1gqrNaJJ82edOWiWrUxtqnsuDzq6
X-Google-Smtp-Source: ABdhPJyH1InqarDbEghOr1YXCssOxaj0Wlt6sWBvN8iUfviSIq58/hHnJCtFiDrBgD3ELctiYIpBJQ==
X-Received: by 2002:a05:6870:8682:: with SMTP id
 p2mr879224oam.11.1644420555145; 
 Wed, 09 Feb 2022 07:29:15 -0800 (PST)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com.
 [209.85.167.181])
 by smtp.gmail.com with ESMTPSA id m7sm6663703ots.32.2022.02.09.07.29.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 07:29:13 -0800 (PST)
From: Eduardo Habkost <ehabkost@habkost.com>
X-Google-Original-From: Eduardo Habkost <eduardo@habkost.net>
Received: by mail-oi1-f181.google.com with SMTP id q8so2808173oiw.7
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 07:29:12 -0800 (PST)
X-Received: by 2002:a05:6808:1307:: with SMTP id
 y7mr1154227oiv.249.1644420552670; 
 Wed, 09 Feb 2022 07:29:12 -0800 (PST)
MIME-Version: 1.0
References: <20220208000525.2601011-1-jsnow@redhat.com>
In-Reply-To: <20220208000525.2601011-1-jsnow@redhat.com>
Date: Wed, 9 Feb 2022 10:28:56 -0500
X-Gmail-Original-Message-ID: <CAFszQJg5_Hge=rtBZ0ujjh71WRdpYUcfF_KLW0oAUa7aNs_6TQ@mail.gmail.com>
Message-ID: <CAFszQJg5_Hge=rtBZ0ujjh71WRdpYUcfF_KLW0oAUa7aNs_6TQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: python - remove ehabkost and add bleal
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=ehabkost@habkost.com; helo=mail-oo1-xc2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Feb 2022 at 19:05, John Snow <jsnow@redhat.com> wrote:
>
> Eduardo Habkost has left Red Hat and has other daily responsibilities to
> attend to. In order to stop spamming him on every series, remove him as
> "Reviewer" for the python/ library dir and add Beraldo Leal instead.
>
> For the "python scripts" stanza (which is separate due to level of
> support), replace Eduardo as maintainer with myself.
>
> (Thanks for all of your hard work, Eduardo!)

Thank you! And my apologies for not sending the MAINTAINERS patch
myself. I'm being unable to deal with the amount of QEMU-related
traffic directed to my email address.

Acked-by: Eduardo Habkost <eduardo@habkost.net>

--
Eduardo

