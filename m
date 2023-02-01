Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E79D5686493
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 11:42:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNAI2-00064N-SD; Wed, 01 Feb 2023 05:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNAI0-00063z-JN
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:24:28 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNAHz-0001rC-0Y
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:24:28 -0500
Received: by mail-wr1-x431.google.com with SMTP id r2so16802412wrv.7
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 02:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9K+pgypHpQw0rtcxPQhgsnhStYxWmAzrSs8zu4Rldbo=;
 b=QKwZw466ChFpgWX6HMs7/TsWfVFF5jT1JHpr2ON2xNQid592ouxObeyAoRgr+wwAc4
 5X0utprsXaw/3iAjQOHc5byDkHs6ueN/IH5THJOjtyFoWnz4YSlW1vxNO6eQ3kiXH9Mb
 r/+cytZRWsHekCFKYu/24L6zuqFBOPGSFP6ONa4X6dAjPkV1cDNopsdfI0H0ho5ZGVNp
 XQ8U8COHK1YSUo4LlDrqzzLn6ATUxSwZiV1u0oSdlfc+5NaFW2sgxZMNwbAUroKfnxsO
 VGie2pGPaoiJc1SaySpqM312dkoIfezBxIAdTvNPfVsC8XaWf24zqZYAVRCY+zXt0waX
 YI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9K+pgypHpQw0rtcxPQhgsnhStYxWmAzrSs8zu4Rldbo=;
 b=ZhYo4SmbpMRaMiB3JLAaS/DrJtQewWv5yDznl/NkBzoCSzPD3KJ1T8CFcQC47VC6Vm
 ozPzLUAIfEBO2gPQFXJvL93ARIDiChk6/BxBj6ACbvirEG/XgQiF1CTLuV5gZ4tDXBtv
 zbNIU0lVxqc+XADuHwOdYAplikjMIF0Id4KXarGi0GFUprg3cHZW8QaCfiYUL5heK1u5
 cF8GzWlUK3P2EQ/gQ8KT/lsekaDGoqH4j89lD68YJ3l+zz9IdeVOc6QDQ4L+zQjMWVHZ
 RwnUqsxzmVcNuEgRrlpnHKx+WDWwN6E4eRVHEUZ/3dC12m3CgMxj40drE18D2NK0Cciy
 o4iA==
X-Gm-Message-State: AO0yUKVRvQxtj+ZFIVwTTNNKfIofkI2P4AaYyYYSE9VSzuR98qPv/yGR
 u2vwBn5w6kgScCaK2RApOb17Zg==
X-Google-Smtp-Source: AK7set+2bexLyIr4Iwns0h9XlVD75udmtz40530NQrYuv0H9iNO1nJxH7pxyDJSSY+OBNiHgJbtnDw==
X-Received: by 2002:adf:f502:0:b0:2be:5be8:5ac with SMTP id
 q2-20020adff502000000b002be5be805acmr5738029wro.40.1675247065305; 
 Wed, 01 Feb 2023 02:24:25 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o9-20020adfeac9000000b002bfebe2d67esm9516929wrn.9.2023.02.01.02.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 02:24:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 906B91FFB7;
 Wed,  1 Feb 2023 10:24:24 +0000 (GMT)
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
 <3c2ceaf1995dfd98c254cf3e2f6d1a68970bb1e8.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp, pbonzini@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org,
 kwolf@redhat.com, hreitz@redhat.com
Subject: Re: [PATCH 3/9] Updated the FSF address in file hw/scsi/viosrp.h
Date: Wed, 01 Feb 2023 10:24:15 +0000
In-reply-to: <3c2ceaf1995dfd98c254cf3e2f6d1a68970bb1e8.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
Message-ID: <87ilglsmxz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk> writes:

> Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
> ---
> The Free Software Foundation moved to a new address and this file referre=
d to their old location.
> The address should be updated and replaced to a pointer to <https://www.g=
nu.org/licenses/>=20=20
> This will resolve the issue #379 in the QEMU source repository.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

