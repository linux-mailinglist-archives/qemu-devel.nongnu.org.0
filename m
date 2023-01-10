Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EF6664637
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:36:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHaw-0008Iu-W1; Tue, 10 Jan 2023 11:35:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFHav-0008I6-6m
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:35:25 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFHat-0004A3-JC
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:35:24 -0500
Received: by mail-wr1-x42d.google.com with SMTP id t5so7988739wrq.1
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hk6ha5WpGwJd/6ljbsDVnVKebPBuQpeZznh+SQevnvs=;
 b=YLzRGkMVGJ7q2M15hIpbotrh3cxIorr/Sp3BCC1ahVqKmFG8FgXFbnLHJ5fFIGmjcn
 8XTAHD0OuKzb6euePsbLOd/3Qe4FgeKfQCmnInLX0hL21EFoQLACqjPlcn0qpx4xFg8Z
 syZYiH6o1iaZh++SNLwM27umC53n22T8a8Cg4L5qa/ggNL7actEmJf9K3OQF97t/etM+
 8S6EpUeuYjRwKABKkL7GZ8SfNXuDtEoVP4DYBAPNFhnyospVzzyj61CqSxG1xvt+G+zB
 l68ZyQ12iCvN8WyhAyWrnTovIaSZeejxCjbHv8JgHYgIwZZg/12Him4pnWBgqFuNDNJn
 eFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Hk6ha5WpGwJd/6ljbsDVnVKebPBuQpeZznh+SQevnvs=;
 b=4AaIjtM9YiYtMr0JnmFoS/zjKvR6iM0lURsGXfRsPVgEwsqWlclkWk7LKcp9OjI92d
 zSyQBT9+5ClcBU/SOCrjNcShhXRL8ghUafQtdS0+f9UIGphEm7FF0Gpv/duewCtGmYH0
 nWeYFdtE3EC9rUoxLNuGPV6/3ghX59orJw7u+fB6MGG67yJIIumL/lsXghHM818kSX6i
 7PtPxZGaogSirbMaCrb240d4LVJtbv6vaxLtB7XevCgctteNSmUepCcPGHp+qSchzPdw
 nrkUlwBgiEjmGg9pG07UCWmFtT8yoFEihdM23IxXXP+LxgunkPf2EU4yZeIxvzUpXifu
 IOWQ==
X-Gm-Message-State: AFqh2kqbSA9UVen/8TL9H0azLfDWPMrp4cXfszLfZ97gHsgg48iFxmKr
 PktHigqhHdmn0fJI3G8hdcxY8A==
X-Google-Smtp-Source: AMrXdXt18WqjtmncOPUuXfeNtS8S13OLulICI6CEJXx5fH/Li0cOXkRk+GR+Stwd9CUeQu45+/KfIw==
X-Received: by 2002:a5d:640c:0:b0:29f:7c0c:5a46 with SMTP id
 z12-20020a5d640c000000b0029f7c0c5a46mr17970478wru.68.1673368522090; 
 Tue, 10 Jan 2023 08:35:22 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i13-20020adffdcd000000b002a91572638csm11462981wrs.75.2023.01.10.08.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:35:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 569631FFB7;
 Tue, 10 Jan 2023 16:35:21 +0000 (GMT)
References: <20230110132700.833690-1-marcandre.lureau@redhat.com>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, John
 Snow <jsnow@redhat.com>, kraxel@redhat.com, Beraldo Leal
 <bleal@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 pbonzini@redhat.com, Eric Farman <farman@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Markus Armbruster <armbru@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 thuth@redhat.com, Halil Pasic <pasic@linux.ibm.com>, Michael Roth
 <michael.roth@amd.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ed Maste <emaste@freebsd.org>
Subject: Re: [PATCH v4 0/8] Fix win32/msys2 shader compilation & update
 lcitool deps
Date: Tue, 10 Jan 2023 16:35:03 +0000
In-reply-to: <20230110132700.833690-1-marcandre.lureau@redhat.com>
Message-ID: <87h6wymjp2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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


marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> Fix the shader compilation error on win32/msys2 and convert the related s=
cript
> from perl to python. Drop unneeded dependencies from lcitool project.
>
> v4:
> - remove -x from python script, to fix the build on FreeBSD
> - add more commoent on lcitool update patch
> - add some rb/tb tags

Queued to testing/next, 2nd times a charm ;-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

