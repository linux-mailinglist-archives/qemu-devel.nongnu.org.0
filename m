Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B864FF83D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 15:57:14 +0200 (CEST)
Received: from localhost ([::1]:40796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nedUf-0006ZN-VX
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 09:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nedSG-00053c-Ml
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 09:54:44 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nedSF-0005gC-41
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 09:54:44 -0400
Received: by mail-ed1-x52d.google.com with SMTP id v4so2453535edl.7
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 06:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=0USowxVcBH2GIvK410tRyiJ1RKQzSTxpJFdyy2dx8Mw=;
 b=aib72bAvUle6/3C9AZZZoEmTfECSyYqI3BMPA0mvE3aIEmlwAod7FsJf660xCRcN47
 shJpyS4rDAGpT82xF0V7T46vucx76LaW76PBaATot+Rh5LEKz2RojDEX+9nz15UNY7mj
 fwd0SnBKySCjWLb0FEIFq4v3Yvo6GcFUyYdIZ0zqqfgkVl/r6AAPmUvA1pcHlEeUJp/5
 +4UsCcgjExJfM8Q/QnvYQC915MCIDbhZD5lAMHgMpX6KCwGvN2rNRfCg7ncoU/NuBbEd
 MSHYyyWLakhp/5u77lQWA4SoUlIQCZsbPkXQX/5wMSE+OX4df8HBYhg8wEXR1O0Iu5TF
 vDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=0USowxVcBH2GIvK410tRyiJ1RKQzSTxpJFdyy2dx8Mw=;
 b=fdmkf3bapVnAurGPaDmrrvvKG4+oTWzV2b26KhiNqk4PxUFSmAjOLNRhchpc8JFGHK
 eWCadjlwD4GDViSKu2OfC87v7WHkZHbyEc0oM3BMFKp9lsjySo67nzLWTlnpzwy2gn59
 RvMDTWvdpl/82FlcMY0ZR0P5ltlRl1noLsN4cKcglSY9Nc2li/CUEH144WtWloT+hQ1O
 6EJ3AFrXTb8JxLDQGWUFLcBT5oPpCjkpVMPhIzxAjL598qFW6SqqBOBti8F8KjymMP2D
 BjJkCPIQ5IovlhF/wSI1R//ScRdEVi3tzIiO9oQgGtaXBkFlYyElao6vLwR714Z4/UfC
 s/Ww==
X-Gm-Message-State: AOAM531r9RjPAzIi01Poc3ulnGI8mVpKwSvn780WnoqwiUX2cXv2lj58
 RK1ixTddmEWEWiHuZ2BGqBmjyuVuz1d22A==
X-Google-Smtp-Source: ABdhPJyJQqaIS6ULo5NrAD748wzOqYUPA0/wf/+o/6MGHEl8Ziiv/K7eEZSznGC0pZhe1yTfJGukzA==
X-Received: by 2002:a50:a408:0:b0:41c:cdc7:88bd with SMTP id
 u8-20020a50a408000000b0041ccdc788bdmr43871819edb.399.1649858081279; 
 Wed, 13 Apr 2022 06:54:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a50fd8f000000b0041f95b8a90dsm736099edt.69.2022.04.13.06.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 06:54:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C88F61FFB7;
 Wed, 13 Apr 2022 14:54:39 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-18-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 09/39] *: Use fprintf between qemu_log_trylock/unlock
Date: Wed, 13 Apr 2022 14:54:35 +0100
In-reply-to: <20220326132534.543738-18-richard.henderson@linaro.org>
Message-ID: <87ilrdxf4w.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Inside qemu_log, we perform qemu_log_trylock/unlock, which need
> not be done if we have already performed the lock beforehand.
>
> Always check the result of qemu_log_trylock -- only checking
> qemu_loglevel_mask races with the acquisition of the lock on
> the logfile.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

