Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CD0205716
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 18:19:21 +0200 (CEST)
Received: from localhost ([::1]:46416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnldo-0003FI-D4
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 12:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jnlbs-000214-D4
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 12:17:21 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jnlbo-0000MH-G6
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 12:17:20 -0400
Received: by mail-wm1-x343.google.com with SMTP id 17so3886347wmo.1
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 09:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=sK7tJHYNlHqdxciKF0UEK58EIrzjO/kLMi8O1IkIQ+E=;
 b=YiXBSr4RlK8ke0OuIL4f+9anSirG8bINEMh7fyUHDZhqR1lVzX/K8Noo79n0NRhtTo
 it7NCCyg/fylgh0GNPDHEcTzEZbaAxHegfy/Sdymlw++o4o9zr7vaMOeLiCOYImyRf4L
 lFj11O4K4hNYp5ctSp28Woh8PFHKarbUw7gEumqznmiIAX5nxgml8COjhheQ0L0hmS2M
 xQhgR512sk0Brhg0b+RE6vP8BG5l56mg7gMF5cJXlQoVWDdXhe/O2RBaVP25kg4hS5DQ
 BEsX9/5x+xSJmlDiXFXd92wzuxbEgGwEGolJTnUiKZ3e4wm524gY+/FhLQTx2wnrlfm6
 1vPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=sK7tJHYNlHqdxciKF0UEK58EIrzjO/kLMi8O1IkIQ+E=;
 b=SCEiPo50BgDt876BdJ5g/LgmfwOSlDl9E4S8R3P3ZD8gi5P3HrPB6n64heRdTETtk6
 LqV+sbfePlDdmHfcetywdsP/BaHHhx9xyojrU/eub3VlJX3Q3lB6TzqcNj/hzk7lLqJO
 WxKak0/7Na/zvQ+xvsIaJsjWmcGN+Fig+2wau0fBiNU4Nkixv9WZXHB+XKEsNsY10nro
 rADCWIBr7m0B020ThsgXeu5xo+59CkhFpwxPnpBvraSNp1D7dL4tc0Xuh1u4o7Jm6Bba
 MMiv43bbL/c/QLbEsi9yVhU1T7DVDE6/002AkrMiKUG2SeS3Uk7cisnJO5IWWZbRw4SJ
 m98Q==
X-Gm-Message-State: AOAM532M1NAQYu4UCwE84P0AliQV/419pEJELKUGNrE/ovk7hFPyQU1b
 PlyXwF+Yr7OK3cMOKNWc4+Epcw==
X-Google-Smtp-Source: ABdhPJzs/asBw3diq8fKa7eYO8tTR4uo8D92UbB8mSBaWJhWUqiKiGW7pef8XNVf0kfbk9T0aduC8Q==
X-Received: by 2002:a1c:2d4d:: with SMTP id t74mr26731983wmt.177.1592929033660; 
 Tue, 23 Jun 2020 09:17:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p13sm12835678wrn.0.2020.06.23.09.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 09:17:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BA4DF1FF7E;
 Tue, 23 Jun 2020 17:17:11 +0100 (BST)
References: <20200522023440.26261-1-richard.henderson@linaro.org>
 <20200623144446.4243-1-alex.bennee@linaro.org>
 <CAFEAcA8LvhhWihVHc_09ZRzZKv8tiWFfd2MfT7ZawJpU3UktyQ@mail.gmail.com>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] risu: don't do a full register compare for OP_SIGILL
In-reply-to: <CAFEAcA8LvhhWihVHc_09ZRzZKv8tiWFfd2MfT7ZawJpU3UktyQ@mail.gmail.com>
Date: Tue, 23 Jun 2020 17:17:11 +0100
Message-ID: <87eeq592pk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 23 Jun 2020 at 16:07, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> OP_SIGILL means we have an unexpected invalid operation. If this is a
>> load or store the register state may be un-rectified pointing at the
>> memblock so would be invalid. In this case just compare the PC and
>> make sure the other end also faulted at the same place.
>
> In case of mismatch of the PC do we still print the full register
> dump?

As rth points out with a new mismatch code we could do whatever we
wanted on a fail although the "master" will not have sent a register
dump so we can only dump the local register state.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

