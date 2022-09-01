Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44B75A9AEB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 16:53:56 +0200 (CEST)
Received: from localhost ([::1]:45376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTlZr-00015e-MZ
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 10:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oTlVj-0003h7-Qo
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:49:39 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:34750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oTlVg-0001Me-1m
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:49:39 -0400
Received: by mail-ed1-x52d.google.com with SMTP id z2so22942065edc.1
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 07:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=X8BMCbBG0i/tLN8Q9OHPMNq8cOZP04gEnqZno09tMmI=;
 b=WJVeLAwOEhuJBG+3txqv9zNDmDZ07Kww93BIAQTNdBlgAqm8t2ae+RkTUU8rGPEF9K
 6/gCA+bQGJzwhtBlI8htPxxbF01IAWZXtWjsM5YSiA7t3W1oTyyS3PxEgl8zpoI5+GlZ
 CF7k7ZJ6hf+NV/vZE7ZqigDWJCP37KiP+Hi2LaZuNH09G3LwTB56jORD3luKeKCZjwNi
 CnDMlyzbKHW/hrOOYvCSfuevSILv9amXa8kuiru/Va+7XxjdAbivq9gZthlHRogkmjB5
 NeL12FiKzGIRsj1WvSf24e2s7c4tVifJnHf+PJoqyce3U7bi1NjkDw3zutxVx0AxeVm3
 DsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=X8BMCbBG0i/tLN8Q9OHPMNq8cOZP04gEnqZno09tMmI=;
 b=LwDr6U5vHYMBWaH/vetXUFYK046ZZFEew69MvOle8wvlHAP2mivwd1wQZ02GWJ/biW
 ozEjVZTcg+1XxuOlEyY20dR3hlGvz8SsHctbTEjOAvzd1VPJCktV7KbJ5AUwYoF0C++J
 JbZFgh7olDO+NnL4xpPkE3qFSWPnShN3P0cIQuxz/gR3mra97wniRZd/UlcAB4YOW++Z
 Kuzwpz+xKbK83ps8DqyCZm5NdOa9ktBnCeEvIZs2rQLMnJFcgqA1gzxdrbrzsM6pzNLC
 bWC0kIYNyc1mulvkMwRQCRVkofpENg1BudtohF666iSqPksPpVoMuEXCgZmHrf8QNBB+
 2b7A==
X-Gm-Message-State: ACgBeo18td1q5Ai/57urKf5ftxfMQ6TUV6ktA8JAdRtWkrvYAlXL1IQD
 rMYh1z0Jxz5QNw8+CW8yL5DFEQ==
X-Google-Smtp-Source: AA6agR6AwoSkOna7Hfw/fje/T0eMe5Ma4X6abbIkLOJ1xVux6KeCT5XyBcTNyHSZ2mHDCeKBk/Uxqw==
X-Received: by 2002:aa7:d596:0:b0:448:3d51:825 with SMTP id
 r22-20020aa7d596000000b004483d510825mr20096223edq.220.1662043774503; 
 Thu, 01 Sep 2022 07:49:34 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 fw8-20020a170907500800b0073d87068042sm8543470ejc.110.2022.09.01.07.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 07:49:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D9401FFB7;
 Thu,  1 Sep 2022 15:49:33 +0100 (BST)
References: <87a67kphih.fsf@linaro.org> <87wnaonxug.fsf@linaro.org>
 <5ba3509f-7125-42ea-93fc-552e88928b32.lzw194868@alibaba-inc.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?B?5YiY5b+X5Lyf?= <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Mark Burton
 <mburton@qti.qualcomm.com>, "Edgar  E. Iglesias"
 <edgar.iglesias@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, David
 Gibson <david@gibson.dropbear.id.au>, Markus Armbruster
 <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>, Luc Michel
 <luc@lmichel.fr>, Damien Hedde <damien.hedde@greensocs.com>, Alessandro Di
 Federico <ale@rev.ng>
Subject: Re: =?utf-8?B?5Zue5aSN77yaQW55?= interest in a QEMU emulation BoF
 at KVM Forum?
Date: Thu, 01 Sep 2022 15:48:49 +0100
In-reply-to: <5ba3509f-7125-42ea-93fc-552e88928b32.lzw194868@alibaba-inc.com>
Message-ID: <87ler3m9oi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"=E5=88=98=E5=BF=97=E4=BC=9F" <zhiwei_liu@c-sky.com> writes:

> These topics are interesting.  I have two questions.
>
> 1. Can we join it on online?  If so, could you share the meeting link bef=
ore the meeting.
>
> 2. If it is only offline, could you share the meeting content to the
> public?

I've created an etherpad for the day (which ever we end up doing):

  https://etherpad.opendev.org/p/qemu-emulation-bof%40kvmforum2022

--=20
Alex Benn=C3=A9e

