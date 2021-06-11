Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9023A40C8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 13:06:16 +0200 (CEST)
Received: from localhost ([::1]:40018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrezP-0004dt-3K
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 07:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrey1-0003vl-Br
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:04:49 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrexz-0001L7-9k
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:04:49 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 h11-20020a05600c350bb02901b59c28e8b4so7941049wmq.1
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 04:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=MIZmPJrYhv1YZeXEB1SNFchrvZh7ufV2VHqbHZ0c/Is=;
 b=ix3PsbSPqX814R8jEwms8SnfpejmXHLrvw4fV7T51wb4p0wbWLaa3XiWUFBaFqR9V9
 19k/0G9VAay9ZKTUst2h8XaHJwwyg6AObO+U5SiljebIwT2wiO7y1pSc6XpuxRpjj3+x
 Qq0dCcQdf404tsMRv11iyCnEnCvoUbi2HSZM+lKAIcooI40N81DWwl6pe9umWjbf9CdY
 qpGpve9q04/eN0/HP+WUuSz8bRvssXXgoy+vLK7FUhdJMnYiXRGZdQmwRnSrW0CTFruM
 wssukb/pl4DFxA+oax1JTPFmDBXhWnqTJ+eNbY3yPmd+NACiyLpXmgU+4UmFz/1YeaGJ
 Bzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=MIZmPJrYhv1YZeXEB1SNFchrvZh7ufV2VHqbHZ0c/Is=;
 b=itTyiUhQDZETyv4SjvV5CFrSP9wmLZ8YsTnh3iMqxKTz4MtGrCcvcdDuUUsfTs40I6
 ais5AH9g8NADb+RVLFsYI6ZN6o1Le0aZJqFXmce1Xx4NasUXJ0i0B2dLHLSQmNy5LDPH
 uv/dfe5hZDC6/y+JuKWz9XkbJQXkMbuCKD5ZuGDiHAntOxy8NuDHGmOKRqMGHZbHlsKJ
 kHC/RAhqd/u+vZGZZp1ieHoqx3bLyIcBB863r+Xe/PXJmq8RCDFQ3c1vZ/oNZ0dwS1qE
 ILv+yqoWc9/AmXkgim7rA9Q7gZLkbFbxgSCNgQOPNde8sa1eMQzat3fLxLqwEfW6ckDZ
 LSEQ==
X-Gm-Message-State: AOAM532jGbeYRZrAAyDQx2ewJItULX/4/bduD5XUHhgM5NUWKM7226nh
 M73u1S/aICTWTkPQf5dypxXXbw==
X-Google-Smtp-Source: ABdhPJxohUcFnxhv1pZS5AQ3hipNHeyeafMWkKxBwHQTw4vpCMMw3DKAPxPvhGic4qcqRwxiXCqXHA==
X-Received: by 2002:a7b:c396:: with SMTP id s22mr3318365wmj.131.1623409485548; 
 Fri, 11 Jun 2021 04:04:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f12sm7930353wru.81.2021.06.11.04.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 04:04:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8C2D01FF7E;
 Fri, 11 Jun 2021 12:04:43 +0100 (BST)
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-5-crosa@redhat.com>
 <9770910a-f586-0b79-395c-7154c4693690@amsat.org>
 <CA+bd_6+-je9t3DzegS0uiyC9fCYF++sMXkRJhAz1Dxe2zz-v1A@mail.gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa Junior <crosa@redhat.com>
Subject: Re: [PATCH v6 4/4] Jobs based on custom runners: add job
 definitions for QEMU's machines
Date: Fri, 11 Jun 2021 12:00:12 +0100
In-reply-to: <CA+bd_6+-je9t3DzegS0uiyC9fCYF++sMXkRJhAz1Dxe2zz-v1A@mail.gmail.com>
Message-ID: <87czssirw4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa Junior <crosa@redhat.com> writes:

> On Tue, Jun 8, 2021 at 2:30 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
>  Hi Alex, Stefan,
>
>  On 6/8/21 5:14 AM, Cleber Rosa wrote:
>  > The QEMU project has two machines (aarch64 and s390x) that can be used
>  > for jobs that do build and run tests.
>
<snip>
>=20=20
>  Who has access to what and should do what (setup)? How is this list of
>  hw managed btw? Should there be some public visibility (i.e. Wiki)?
>
> These are good questions, and I believe Alex can answer them about those =
two machines.  Even though I hooked them up to GitLab,
> AFAICT he is the ultimate admin (maybe Peter too?).
>
> About hardware management, it has been suggested to use either the Wiki o=
r a MAINTAINERS entry.  This is still unresolved and feedback
> would be appreciated.  For me to propose a MAINTAINERS entry, say, on
> a v7, I'd need the information on who is managing them.

I can only talk about aarch64.ci.qemu.org which is a donated Equinix
machine that comes from the WorksOnArm initiative. I applied for it on
behalf of the QEMU project and we can have it for as long as it's
useful.

I don't know if we need anything more that documenting the nominal
contacts in:

  https://wiki.qemu.org/AdminContacts

>  Is there a document explaining what are the steps to follow for an
>  entity to donate / sponsor hardware? Where would it be stored, should
>  this hw be shipped somewhere? What documentation should be provided for
>  its system administration?

I think the project can only really work with donations out of someones
data centre where they keep responsibility for the physical aspects of
any machines including the ongoing hosting and running costs.

--=20
Alex Benn=C3=A9e

