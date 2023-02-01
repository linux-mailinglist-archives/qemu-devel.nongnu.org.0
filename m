Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A8F6864A3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 11:46:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNAJC-0006QH-7p; Wed, 01 Feb 2023 05:25:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNAJ7-0006PL-V1
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:25:38 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNAJ6-00027d-Fn
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:25:37 -0500
Received: by mail-wm1-x331.google.com with SMTP id n13so5269362wmr.4
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 02:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aUSIKDVdI3AtBicPaYvSXoCED6+fujyX3WoBd48K0cs=;
 b=LThuzVfaKQycdiK0co3gTA698HmX33qyZHUY/7c6QBEWlUpMI62QrK5aWQZj1hb9Ib
 mhGSbhVQfBennoCqGf12YIgtkdEAfhbnaAejYiu5YjBR69uCBhWD5SQ7/04kXXOH2Enj
 bjeCZEfw2ERr8auIj4cP40ML94Uk67i6jWbk1AEKR+L7e95b5/+E+lekK6O78vuHnDM0
 bOlNVnYUWphvjkDwF1ZwBVgLFT9RhC3kCXt9avuZHomwzvBpteuU/kg03URW3imtizid
 7xnKvcxXV7iRUPD+f0rlBzBMHCvLgceyNub9men4Kb+SUOQVVUcH06r2BL3dPkzUTCRc
 TJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aUSIKDVdI3AtBicPaYvSXoCED6+fujyX3WoBd48K0cs=;
 b=ffbtwjFZLPIa9m0GJ9sfM7qLtgg0JJyZ4CdeUkzvvSFdSZ2Myg//beitbjB2aeuApt
 LmMqmS6P44ya84Yo+Vs4gRJ6bX9ntPs/KnuLQxajBsXEnJbibbeeVwAIBC2j5mMStngw
 TnbGcSpWbfFYKrAKGWL/sYwUkdlfkLBBECNLKfGIrPmcfgZ7BAPeOrIWoyea1bwAULDr
 jl1oN6Losei3rKkpThTmaG04OJo2bgzRD4yYb/9gHijqyTqtvSGWypOtzmMXyJ8Zr+PU
 5VApg09hOSMgq/ceRxtfjWZlX23PIfAAG0RkPtIVZlB41bzXRpqjs6KFFpGi9U3oZYpu
 sx0w==
X-Gm-Message-State: AO0yUKUB4GJMGiP9n7WHEPNnEKdpmiauzp3mV8C7qp/9/BTpwQ21UNKx
 TjK37Ogq3eLZHfwzKhgTnKw7lrOROSv8ID8p
X-Google-Smtp-Source: AK7set8gPE5iSW9X1DV3ulRuaBfVrRmAbEXsbY7jHMqcavKYQbv86pQ/hnDQCdvdHc+2Vc6N3ncYxQ==
X-Received: by 2002:a05:600c:3b91:b0:3dc:545f:e9ce with SMTP id
 n17-20020a05600c3b9100b003dc545fe9cemr1501910wms.24.1675247134790; 
 Wed, 01 Feb 2023 02:25:34 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bd16-20020a05600c1f1000b003db0ee277b2sm1368948wmb.5.2023.02.01.02.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 02:25:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0EAFA1FFB7;
 Wed,  1 Feb 2023 10:25:34 +0000 (GMT)
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
 <404c2309c845321a21e2896a151840750ec4fe2e.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp, pbonzini@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org,
 kwolf@redhat.com, hreitz@redhat.com
Subject: Re: [PATCH 9/9] Updated the FSF address in tests/qemu-iotests/022
Date: Wed, 01 Feb 2023 10:25:23 +0000
In-reply-to: <404c2309c845321a21e2896a151840750ec4fe2e.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
Message-ID: <87sffpr8bl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

