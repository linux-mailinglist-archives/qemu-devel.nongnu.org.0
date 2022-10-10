Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78015FA227
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 18:50:40 +0200 (CEST)
Received: from localhost ([::1]:46046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohvzD-0002oi-El
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 12:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ohvjo-000545-NE
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 12:34:44 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ohvjm-0002bP-2j
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 12:34:43 -0400
Received: by mail-wr1-x435.google.com with SMTP id bu30so17823382wrb.8
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 09:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CMvU8YeL67VXZOBkYqaJVIt3yvyLd13KdIqoDYLD9ng=;
 b=NtDUrhdCX+lsi+6uM5q4zxLf9gHmpHUBBaojVMqoAObR80YrSIgSlwV73+lJCxOFmB
 MmUXr1xvle2W06uT8N4zXUhSVEkr5UOn5Kf1WrN77BbVMK8EGejoN8Hr/mefjadMMmqC
 jCuibJ1/IXxySujNdaycH3aQkgnRa/n789HPq6heWqoxCyEwWzXDP9p+zQ4ym2fKaHvq
 1XBkNfg/+Q7vM4qns7x7MiJfk3023LvSsLkXmvk+Yq2h3v1hR8ACEJ4+w9lqMOS9mnIf
 p0U4IFFRWgA2YO5ICqh/8Yvd3dwKVXPektstDGrF/eYdDjR5nZ7ZJmwGLsGN2f7s24vw
 KUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CMvU8YeL67VXZOBkYqaJVIt3yvyLd13KdIqoDYLD9ng=;
 b=UFmkqLekM+RQ+Ck4S2+QsymIrUCZ4l3gMvUnhGdp2lGOWXnzG04mSOGSelVy2vmSjQ
 pCDbTO4YRogeqnNIzhn+vzkyR+NRG+IaQOYCDUAAvyLiYrgjjRe7fV0DlNmeF/Hn3pzc
 sVNAT/KFU3ZUJzQv3/irk7rlzgy+X3W46nhl0ko4qpkXqEItR/XsV+nSXixxOOf8v3IO
 L3rTsIN3fB+ZStjiJNZDVw07//cuq5wFOPUfnFvRbs0D2zcpqdV7KB9OhX+w3rVNRHnC
 mjkrfbtcjeg3HKgENt8RGSwVwkbm7TPh0qmJZeSAx2B+8vvogV4brG1mRltoNOviEHUr
 jvmQ==
X-Gm-Message-State: ACrzQf35TE4xl7a2l5REmB7geg0tcu1DVD/stnffGBsrR+1uhybsEgF4
 1J4wezHMNJ+vxwj7ZDqVrxVRWQ==
X-Google-Smtp-Source: AMsMyM7BcmSVPTU/JC7FWBcyjT6OufaHLSpeNPlMc1X9B1dk6tLkuoll8slLvnlD9gAf/+AONkgQcA==
X-Received: by 2002:a5d:68cb:0:b0:22e:6545:9969 with SMTP id
 p11-20020a5d68cb000000b0022e65459969mr11740971wrw.666.1665419680244; 
 Mon, 10 Oct 2022 09:34:40 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bt7-20020a056000080700b0022e62529888sm9468159wrb.67.2022.10.10.09.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 09:34:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B2F701FFB7;
 Mon, 10 Oct 2022 17:34:38 +0100 (BST)
References: <MW3PR18MB3532CFE7760D160B6F27F1E594209@MW3PR18MB3532.namprd18.prod.outlook.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Yedelli Navya <yedelli.navya@axiado.com>
Cc: qemu-devel@nongnu.org
Subject: Re: Building Qemu Error
Date: Mon, 10 Oct 2022 17:33:12 +0100
In-reply-to: <MW3PR18MB3532CFE7760D160B6F27F1E594209@MW3PR18MB3532.namprd18.prod.outlook.com>
Message-ID: <87r0zfskm9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Yedelli Navya <yedelli.navya@axiado.com> writes:

> Hi,
>
> I am working on zynq qemu. Downloaded the qemu source from " https://gith=
ub.com/Xilinx/qemu.git".
> Followed the compilation steps from
> "https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/822312999/Building=
+and+Running+QEMU+from+Source+Code"
> while executing the Make command following error is appeared.
>
> *
>
> Please provide working sources or any other solutions is highly
> appriciated.

You need to contact the downstream repository owners - this mailing list
is for the upstream qemu project:

  https://gitlab.com/qemu-project/qemu/

--=20
Alex Benn=C3=A9e

