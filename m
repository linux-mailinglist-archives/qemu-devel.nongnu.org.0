Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9625B7181
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 16:44:11 +0200 (CEST)
Received: from localhost ([::1]:48182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY78z-0004Lp-RL
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 10:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oY744-0006dH-5F
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 10:39:04 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:45951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oY740-0000Qv-JZ
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 10:39:03 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so9634851wmb.4
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 07:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=FW3G9iKVzbtM11BiXVg49hEiSllVekZPAdqyciR39Bo=;
 b=sHJTADA0w506HhwSVRG0jNQZX+Y0WUod5wh+7gXfVTdEJOxfNa2gFWt7HJ2g81s5M9
 l/hoEnSHNB73IUm4zVR+EEKzPADIKbTYHAz9f/XsVVOOZ8vj8XFL6ycmCHQcnkLPLBsc
 Dgu2wP6eLpqLdm8fIeL00jOSg1cRxRJU6lpD51N5UGrqe0wd8M3CGv7zR2RHmRKtWHxI
 +TO0ZQEX04d/rAJJiiTF/uzyoHlAnyosyrBBaL1zldEGQZv7GiV/lfZ/RRh+Hh1n6Q43
 3KCYcB1aOg+NLP2DJHEovOTTt9Vs0BbOXAZyoshSuoNJw/84C9zoiJQ/DpVtWx9wkVYQ
 gaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=FW3G9iKVzbtM11BiXVg49hEiSllVekZPAdqyciR39Bo=;
 b=cYCETR+3V0Jdbepvs2TOVEuOKGtVZmIfw/8gyWIlwXHet1lN4M8SJSfCcJdTb1CksF
 Vyoe2P2SFAJ5/4PXRTEciSi+4pwiiAPagSnmB3rNRtne7l1OWrEKDwBQweq+ZL3b7M7N
 2GVTM4VbXVqhIHm7brrC2+//0gZehLPPUs1ppEzRUpG+rsqlQRaUndlXFJcN5ZWWKKzm
 3KMsRza/86nid54aUaJeHhDN6n527iCx6epk3WPlj+3SpEfPrpmLrsDsMjmtXw4JckzK
 AGiETCNgEqLzyER5jv33Nfx5A2VmFyJnQBqF0ZhVnmkF0x9HFJb0nd4Jw5aurGS4zP9X
 Lwdw==
X-Gm-Message-State: ACgBeo3DPSUen8tHtgUF7Mt4S44FuURpcpRK0TC9uo3wBcDKzk14s09C
 VjDKPoi1It2/ZeYV3AtclXuOYQj7801Hut9m
X-Google-Smtp-Source: AA6agR6TxgqrC32y3kVZ4Fko0lBiBqtyA8r7yUYFYwCIZtH/pIN68kpmSyjgCMqYb26z25Sg32rlsw==
X-Received: by 2002:a1c:f406:0:b0:3a5:d667:10 with SMTP id
 z6-20020a1cf406000000b003a5d6670010mr2723712wma.70.1663079938540; 
 Tue, 13 Sep 2022 07:38:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b002258235bda3sm10841065wrv.61.2022.09.13.07.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 07:38:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3B2971FFB7;
 Tue, 13 Sep 2022 15:38:57 +0100 (BST)
References: <CAJ307Ej5stZr6fPsLROFBkmtg=uzkG50yVVY6=Ru6LTLQzae5A@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Chigot <chigot@adacore.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Subject: Re: Question about loading bare metal firmware
Date: Tue, 13 Sep 2022 15:35:14 +0100
In-reply-to: <CAJ307Ej5stZr6fPsLROFBkmtg=uzkG50yVVY6=Ru6LTLQzae5A@mail.gmail.com>
Message-ID: <87o7vjz6da.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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


Cl=C3=A9ment Chigot <chigot@adacore.com> writes:

> Hi all,
>
> I'm wondering if there is an official way to load bare metal software
> within qemu emulations.
> I've seen a lot of people (including us) using -kernel. However, the
> doc seems to imply that the generic loader would be a better approach
> (cf [1]). I know that the compatibility with older Qemus is one of the
> reasons why -kernel is still highly used. I've also seen that the
> reset vector can be initialized automatically by -kernel unlike with
> the generic loader (this is the case with RiscV AFAICT).
> But is there any kind of official recommendation on that topic ?

The recommendation is in the document you linked. For bare metal use the
generic loader and make sure you put the blob in the right place so the
architectural reset vector will jump to it.

> I'm asking that because a recent change in RiscV Polarfire Soc is
> forcing -dtb to be passed along -kernel. But in case of bare board
> software, -dtb isn't needed (at least in our use case).
> I've a patch that allows "-dtb" to be missing with "-kernel" only if
> "-bios none" is provided. But I'm not sure if this is the right way to
> say "it's a bare board software".
>
> @Bin Meng you're the one that added this -kernel support in PolarFire
> Soc. Thus, is my approach looking good for you or do you have a better
> one in mind ?
>
> [1] https://www.qemu.org/docs/master/system/qemu-manpage.html#hxtool-8
>
> Thanks,
> Cl=C3=A9ment


--=20
Alex Benn=C3=A9e

