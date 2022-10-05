Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0745F576D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 17:28:09 +0200 (CEST)
Received: from localhost ([::1]:33108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og6Jc-0003ak-Pl
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 11:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1og6FM-0000N8-4C
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 11:23:44 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1og6FJ-00062c-Eg
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 11:23:42 -0400
Received: by mail-wr1-x42a.google.com with SMTP id n12so6880645wrp.10
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 08:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=a1rO/eGK3S8OQ3MjSfusaVNpeeTijOV95Whz7cWkhlE=;
 b=q/tdLxeq/7YXflLuJeIiukMu1zpu/Rvkd8z98DomIyttc4xriWoTDWDRrD+COcY/dl
 qyMgJ3VS4Wc3gvosX8jKvkX0tbtycr8KDMh2an2uGPm3/zvARhW4WBkenEQ0YvnE0luK
 dZxeluQp0OmPyVi7IhTJbnQxVHJqyumS/beLVufTdL7Ur9Gm2z/iWG/FZf33vDibOGbE
 wwWabaxtr5Vkx94vo7qYmsrPigUH+UhlftoNQ+zlL/d7/dnwwOiW3CAQALW0Prfz0gpO
 O+iXfxtX8oxd0M4nPToCmBe5dFs3BDD2l1Fp3mzu4eijY4N1dDfX3nW+X3I6W3S8YhHQ
 w71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=a1rO/eGK3S8OQ3MjSfusaVNpeeTijOV95Whz7cWkhlE=;
 b=BN8W+Hay4i2r/OLpJSBUx1+DH5qmHxTQ8IHqboEifIoEz0bZepgswO3+Es89oxnCoF
 78fEemXf/OpKYaSUNaGtRBx6vCsn76K3QO2XOVQW+ZWbn80u+R4nnPl1YwsmlUj1lx1Z
 7NLWX6OM6943e18/4rGkmh8UPiTw2bHqERjL1JRpteUS1/acbr8dStRcCMpGBi8cfTtU
 eIToBn29WfIi07RAwGDDYZJXpJu++0AmacmdTCIiJaZFC2gVLn80iPOB4AlhuZVA7UNH
 Feoujscrb23/ZoTQV+ptim1kJHTW8G7alLVVrHjZqB2oYTJJ0iqJC5sP6DfgLvSpCG4+
 /8HA==
X-Gm-Message-State: ACrzQf0XclYc14Rq/trehzptdZG56gYqrWilbZ163WTJb0JfTxlQG0jl
 RPUGHfyD7/kHYx8D2b7OG9OJFA==
X-Google-Smtp-Source: AMsMyM5BS5apgn+sXHSpKZRLtdNqdAD52tCCobnoL5gG6BOy3eSkRjjCJqoRI0JGvH6Qco86heEicQ==
X-Received: by 2002:a05:6000:1f8f:b0:22e:627d:855c with SMTP id
 bw15-20020a0560001f8f00b0022e627d855cmr189727wrb.468.1664983419593; 
 Wed, 05 Oct 2022 08:23:39 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a5d6790000000b0022e3e7813f0sm8213995wru.107.2022.10.05.08.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 08:23:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 426CB1FFB7;
 Wed,  5 Oct 2022 16:23:38 +0100 (BST)
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
 <CAJSP0QUCnYVyDfUY7aC+ayJS0RwJ70QRMti6Z-vLfu9==VWRxA@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [PULL 00/54] testing, gdbstub, plugin and gitdm updates
Date: Wed, 05 Oct 2022 16:23:24 +0100
In-reply-to: <CAJSP0QUCnYVyDfUY7aC+ayJS0RwJ70QRMti6Z-vLfu9==VWRxA@mail.gmail.com>
Message-ID: <87o7uqjnut.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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


Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Tue, 4 Oct 2022 at 09:38, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> The following changes since commit efbf38d73e5dcc4d5f8b98c6e7a12be1f3b91=
745:
>>
>>   Merge tag 'for-upstream' of git://repo.or.cz/qemu/kevin into staging (=
2022-10-03 15:06:07 -0400)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/stsquad/qemu.git tags/pull-testing-gdbstub-plugins-=
gitdm-041022-1
>
> Hi Alex,
> Please rebase and resend. There is a merge conflict.

Any clue as to where - because it rebased cleanly for me.

>
> Thanks,
> Stefan


--=20
Alex Benn=C3=A9e

