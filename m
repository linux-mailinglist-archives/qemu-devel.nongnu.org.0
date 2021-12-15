Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF967475566
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 10:47:45 +0100 (CET)
Received: from localhost ([::1]:48062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxQsy-0002SO-C1
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 04:47:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxQqT-0001HM-TW
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 04:45:09 -0500
Received: from [2a00:1450:4864:20::32c] (port=41692
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxQqO-00021V-ST
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 04:45:08 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so15576301wmb.0
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 01:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=I1lDuFymPUuuUkWEPz5H7uzfNdUYszgqVkKX0FjFbfs=;
 b=IJrt2/15QeR6VJ1NSxzf0Q5J1at+CoLOSSTr0qPqdLniZkkRf4obx0bdoVDWMTR5VL
 jYTE1/mvTMtJ3GvmUUF0WcW7ExFgimgcF/Tdghks8D4M5kfVa+RDPRNZnuQh0jdS9G8P
 Le4YKpa2uQTE2OArafJGErckvBVhl6dM2p1Wu+U6ByKyPnd9DZMOaup7qf8v71RpEkdq
 JmilZMZhQsv9GBJeNYPOXWSEr7oRllr9cWCR2oax/0X4+HvA3t6VBQumkSkA0AM2CXQr
 ppzOlrzsNovou+kLgON2iiHBJv3oKvo/oePN+5IXmQUeVta9xoPSDbeGeywa/8mqsVZA
 nJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=I1lDuFymPUuuUkWEPz5H7uzfNdUYszgqVkKX0FjFbfs=;
 b=QOi045cWPd1FzyL/8K4oGxqYYZcnPMhDQ5xUA0R/EVzQ2iNZQ58ZjZeCn2E6cygjtG
 57RW6+8CWuLjcmpMeOjhRemuGv8yzDm9dD3ZEFrj+OQ1vgdzzGwtkzEkNeuHN+q/7j+q
 uHQEBgHmleOzxMtqdOdi8WTCdg1zukNWL4FRKbtuu/i2luWsk5E8G65JZrtku5dYHO9s
 u2sOQu+ufZ9DAUEhS6gdByEULqek9dGnEjr4rrY4GrcFifoLqvw0lu8y8FbACTdp/vvL
 Ahp2ZLrqbU2GA011ZvmSifXwnLcbYNOk5rpDUYJBUPTP5Iti8RCjQLyf2y7J5xVISUIk
 fmcg==
X-Gm-Message-State: AOAM531eC5dz6QURJVrBK03VnmSzftuZFkCVfqOiauojGpnezTM8l80R
 sBF9iIRKgxkqCIA8N7lZxVwpEA==
X-Google-Smtp-Source: ABdhPJymvG7rbsNnRHYntTrzNf+V3t4GtJpMPCrxFIjMpOj7lU19UkxmUJMdarUs8DUfWk4lADiqwA==
X-Received: by 2002:a05:600c:4e8f:: with SMTP id
 f15mr3824009wmq.116.1639561503223; 
 Wed, 15 Dec 2021 01:45:03 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m17sm1462010wrz.22.2021.12.15.01.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 01:45:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F36D1FF96;
 Wed, 15 Dec 2021 09:45:01 +0000 (GMT)
References: <20211214195048.1438209-1-alex.bennee@linaro.org>
 <Ybmw+MhScugEy8bm@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2] monitor: move x-query-profile into accel/tcg to fix
 build
Date: Wed, 15 Dec 2021 09:44:29 +0000
In-reply-to: <Ybmw+MhScugEy8bm@redhat.com>
Message-ID: <87czlygq1u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Dec 14, 2021 at 07:50:48PM +0000, Alex Benn=C3=A9e wrote:
>> As --enable-profiler isn't defended in CI we missed this breakage.
>> Move the qmp handler into accel/tcg so we have access to the helpers
>> we need. While we are at it ensure we gate the feature on CONFIG_TCG.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Fixes: 37087fde0e ("qapi: introduce x-query-profile QMP command")
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/773
>>=20
>> ---
>> v2
>>   - enclosed in #ifndef CONFIG_USER_ONLY section
>> ---
>>  qapi/machine.json    |  1 +
>>  accel/tcg/cpu-exec.c | 31 +++++++++++++++++++++++++++++++
>>  monitor/qmp-cmds.c   | 31 -------------------------------
>>  3 files changed, 32 insertions(+), 31 deletions(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
> Sorry about the mess up I introduced in refactoring, and thanks for
> fixing it for me.

Thanks for the review - now await v3 as I can see my CI died on a whole
bunch of non-TCG builds!

>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e

