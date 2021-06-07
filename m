Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251EA39DE14
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 15:52:10 +0200 (CEST)
Received: from localhost ([::1]:45358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqFfk-00036W-RK
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 09:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqFe9-0001cG-UW
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:50:29 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:44632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqFe8-0007Sl-09
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:50:29 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so9716wmq.3
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 06:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=VP5RN4HxCNzhJYlYohYHZp9DSXnjV5OAd2tedW4/09I=;
 b=UkgdEoysgsXsNO3TH5gH3IDTum9rkAXLYo5tsBrs7n/bBcFUh1evd/Y6xzj/pYFsNs
 bWWnNJnNMsbxd9emSP7gzEiQHUYytCC9Xo+IW+ndVyzc8zVT5zkmJM5myJYDfZdMg+FG
 BLapOM2odgCrvWqHIUKN7BLhDLDB6pQXmH/ZPQ4GkuwDrXPBaYHetkKCVL60nlkgwEJt
 ILatJMiKs3KEKryJnrv44n59ktAYWxIwJH5n1WsOKyUIfxZPachowVf9bkrD7QNWA5AK
 G5VKRUXwJyfbLuYcipnCAWhYgaNO947AxUaFd7GqjAe63kPb/4ywFAthyGX0DI/uGUgN
 83qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=VP5RN4HxCNzhJYlYohYHZp9DSXnjV5OAd2tedW4/09I=;
 b=J3YPUKBq7YX5dGk4mu0vQKjsujUlaWIS4GFZuFd+i2l6NQKUvdtJVxliD+m4YUF434
 GiEFmYTCg1VT0SlVnGTD8DA56fuSq3S0cvV4OGHwGUHdnGM/KUNqWuVTzT1AR78c/ahM
 IKWC72Dqgh7lbhHsBpJCjx41/1vfZMvJPE3oniknEfAd743hO/VuBcLo2Qv8NL6oP5eC
 b8EIJmpw0O+cDVdQ6BV0DVVoOY1Q17maajGF7Ub/mOIMLKcEft13cJdcsfHE9qGpYNjv
 LtOS9S3F9FVx9LV+lH7eKbe84B8nMeLDb6R6dxE9BrW8ku9czVFnu+frJnJuZm9h2ISw
 OIgg==
X-Gm-Message-State: AOAM531gch4XNxBHEbWj6tsxr9Apaz910QcoEItvh/FLymqpKi/Ff2sh
 nMmrWZQfcxgADPMywhmOQUS2Pw==
X-Google-Smtp-Source: ABdhPJymkCkFQFW0P5N9MkwO9F0juLIIwLJhptFbg+KMPoD989MfGvqf61oh559f/ewzmo4bbYGPrA==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr17183723wmk.97.1623073826278; 
 Mon, 07 Jun 2021 06:50:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q3sm16079569wrr.43.2021.06.07.06.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 06:50:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 902D21FF7E;
 Mon,  7 Jun 2021 14:50:24 +0100 (BST)
References: <20210520195142.941261-1-matheus.ferst@eldorado.org.br>
 <bf17cd04-e964-b78b-278e-8b1f2c5554a2@eldorado.org.br>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH] scripts/checkpatch.pl: process .c.inc and .h.inc files
 as C source
Date: Mon, 07 Jun 2021 14:49:54 +0100
In-reply-to: <bf17cd04-e964-b78b-278e-8b1f2c5554a2@eldorado.org.br>
Message-ID: <87czsxokbj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Matheus K. Ferst" <matheus.ferst@eldorado.org.br> writes:

> On 20/05/2021 16:51, matheus.ferst@eldorado.org.br wrote:
>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> Change the regex used to determine whether a file should be
>> processed as
>> C source to include .c.inc and .h.inc extensions.
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>>   scripts/checkpatch.pl | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index 3d185cceac..bbcd25ae05 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -12,7 +12,7 @@ use Term::ANSIColor qw(:constants);
>>   my $P =3D $0;
>>   $P =3D~ s@.*/@@g;
>>   -our $SrcFile    =3D qr{\.(?:h|c|cpp|s|S|pl|py|sh)$};
>> +our $SrcFile    =3D qr{\.(?:(h|c)(\.inc)?|cpp|s|S|pl|py|sh)$};
>>     my $V =3D '0.31';
>>   @@ -1671,7 +1671,7 @@ sub process {
>>   		}
>>     # check we are in a valid C source file if not then ignore this
>> hunk
>> -		next if ($realfile !~ /\.(h|c|cpp)$/);
>> +		next if ($realfile !~ /\.((h|c)(\.inc)?|cpp)$/);
>>     # Block comment styles
>>=20=20=20
> ping

Seeing as checkpatch.pl is in it's own odd fixes silo I might as well
pick it up for my PR that I'm rolling.

Queued to pr/070621-testing-updates-1, thanks.

--=20
Alex Benn=C3=A9e

