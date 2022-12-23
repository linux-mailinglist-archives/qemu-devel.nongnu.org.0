Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5385654F33
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 11:34:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8fMk-0004Hf-Mb; Fri, 23 Dec 2022 05:33:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p8fMi-0004HV-LY
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 05:33:24 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p8fMg-0001hD-Hc
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 05:33:24 -0500
Received: by mail-ed1-x52e.google.com with SMTP id u28so1709505edd.10
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 02:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/yhGSz4v9NSWZ2xomgsiAjJSmRIK8Z3OvJHOvmKjks=;
 b=pIgk/3N7o3e+JFhMT0N5rZJcyRiI673ngjP3R/BPKmOCSZ3qShWbNRclViq4yt+Hxe
 7bl1MI3I1Mlf/PpJbeWZA9m5vRqGjtEvCcmRW3NQeR/D8hC5A+paiOUwkNPK9O8g3A5d
 cifP4DAsIKQUGQ7yLFkDzo8wdBTLMI02A9vOzrlwWvX/sJJ5h6cD187ip+1jugZmz8n+
 1ls4rUkSg4c0titmTUeqAvJLX9++TX3NlVlyciU3lvgEKFK0eYIB+m9Qkz7+x+iRRWCw
 f93rY7LFju7ptEn8YVRC5qM2Eou8wWsKhZ5CbXhlPsP+7wf69tT2J+911/5Ms2KAeqfv
 2/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c/yhGSz4v9NSWZ2xomgsiAjJSmRIK8Z3OvJHOvmKjks=;
 b=bXNwGCiy/uZVQ5rMGjZA7mT7OJ+u+XhxFPFCyJaRAyloXr3nf+qi8FNEel5NZmBVUe
 ogn+yVBQeteoy/vU4kzhxWKY4LrM1EZXpidfX9xe+egHVyUFWDr0g66xrN1BHSjIMACB
 M3hzyTPGSlmjndcSTHNdZ6xnc4RE3I0x7pA1l8tsVlVeGI6BwXFg2jHwvdpKLRk1O2V7
 4v6VfQCmjBJYv6ied6CT0Hw87Z/HUbGPeNUVt3kO5420UuYwf5RgHHWdZDUqpcq1Ne5E
 EwmJqJyR/DR/cAoQlKnUsW+H1mx/s4oW8BXICmelD85ukUAscI3jsolLuOZxObHVTzeq
 7fQw==
X-Gm-Message-State: AFqh2kqbTr2vvFFM6p195aECYrJGgzFHFNgXCSCDlbDIRzotajpqCMx2
 HQisu8RHnt9kvEV7bDPNg1c=
X-Google-Smtp-Source: AMrXdXssZcyxU80VcUv7JbHuyIwZjiCpw1eghEse6jk+icYlT2vtVK3aUU3geGHnDee1OPYD2xwI4Q==
X-Received: by 2002:a50:d0d1:0:b0:46d:7ed4:1f66 with SMTP id
 g17-20020a50d0d1000000b0046d7ed41f66mr8211732edf.3.1671791600599; 
 Fri, 23 Dec 2022 02:33:20 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-014-080-075.89.14.pool.telefonica.de.
 [89.14.80.75]) by smtp.gmail.com with ESMTPSA id
 d27-20020a056402517b00b0046b531fcf9fsm1339637ede.59.2022.12.23.02.33.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 02:33:20 -0800 (PST)
Date: Fri, 23 Dec 2022 10:33:17 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 jonathan.cameron@huawei.com, philmd@linaro.org
Subject: Re: [PATCH v2 0/7] include/hw/pci include/hw/cxl: Clean up includes
In-Reply-To: <87k02i7kr8.fsf@pond.sub.org>
References: <20221222100330.380143-1-armbru@redhat.com>
 <B98EF322-5449-4942-8718-D3504B863B96@gmail.com>
 <87edsremti.fsf@pond.sub.org> <20221222142149-mutt-send-email-mst@kernel.org>
 <87k02i7kr8.fsf@pond.sub.org>
Message-ID: <B663E587-61F8-471C-9F94-3FF972BFC9B6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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



Am 23=2E Dezember 2022 05:27:07 UTC schrieb Markus Armbruster <armbru@redh=
at=2Ecom>:
>"Michael S=2E Tsirkin" <mst@redhat=2Ecom> writes:
>
>> On Thu, Dec 22, 2022 at 11:48:25AM +0100, Markus Armbruster wrote:
>>> Bernhard Beschow <shentey@gmail=2Ecom> writes:
>>>=20
>>> > Am 22=2E Dezember 2022 10:03:23 UTC schrieb Markus Armbruster <armbr=
u@redhat=2Ecom>:
>>> >>Back in 2016, we discussed[1] rules for headers, and these were
>>> >>generally liked:
>>> >>
>>> >>1=2E Have a carefully curated header that's included everywhere firs=
t=2E  We
>>> >>   got that already thanks to Peter: osdep=2Eh=2E
>>> >>
>>> >>2=2E Headers should normally include everything they need beyond osd=
ep=2Eh=2E
>>> >>   If exceptions are needed for some reason, they must be documented=
 in
>>> >>   the header=2E  If all that's needed from a header is typedefs, pu=
t
>>> >>   those into qemu/typedefs=2Eh instead of including the header=2E
>>> >>
>>> >>3=2E Cyclic inclusion is forbidden=2E
>>> >
>>> > Sounds like these -- useful and sane -- rules belong in QEMU's codin=
g style=2E What about putting them there for easy reference?
>>>=20
>>> Makes sense=2E  I'll see what I can do=2E  Thanks!
>>
>> It would be even better if there was e=2Eg=2E a make target
>> pulling in each header and making sure it's self consistent and
>> no circularity=2E We could run it e=2Eg=2E in CI=2E
>
>Yes, that would be nice, but the problem I've been unable to crack is
>deciding whether a header is supposed to compile target-independently or
>not=2E  In my manual testing, I use trial and error: if it fails to
>compile target-independently, compile for all targets=2E  This is s-l-o-w=
=2E
>
>The other problem, of course, is coding it up in Meson=2E  I haven't even
>tried=2E

There is https://include-what-you-use=2Eorg which is a Clang-based tool=2E=
 Maybe that works?

Best regards,
Bernhard

