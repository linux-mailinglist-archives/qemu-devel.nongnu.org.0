Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2BF3A6644
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 14:07:40 +0200 (CEST)
Received: from localhost ([::1]:52478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lslNS-00028W-OW
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 08:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lslLy-0000pw-Rz
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 08:06:06 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lslLw-00015a-QS
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 08:06:06 -0400
Received: by mail-wm1-x334.google.com with SMTP id m3so6758216wms.4
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 05:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=v+Z/6EEf+sKbpbl7uc55GMyIw8XdRladoUy8Xc/tjuQ=;
 b=OOPk4XuDFGPkNb+yjunbA0uxmUSakT/g8hU3kCjMIm2AUQHawywTWqpUV35f+63rCS
 eFrAIe111c2uBKH9cPWIOa9gsxCJ6BedlteVoohhMZK2NHKxMkXn6o7mvn2EKTEj+hgC
 zKGvhW9FV30Kti5xAzOdamjXOM4N3yor6KYsQdnoqiHGxfVNhVpd6wjnDRdloJzKeJuG
 XxqtDCWY45uSHeFnGd+dcIXtvCXP4yiaONw+yhx1PcFKiSCoChTp83WvW0Sfi/OyFHz2
 Y/MlL0PolF6X0B4yh+PttEGj6QONr6mXu5CPAFhCdvu2CnNaw6a2Hu1a83KxdzCrDQKS
 u7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=v+Z/6EEf+sKbpbl7uc55GMyIw8XdRladoUy8Xc/tjuQ=;
 b=V9fDa5KD48ZWXAve+PtM6QTgV5KKZf2YzkZNFNDU9Gq0bKtqOmnlu2uzwdNPnCJ/ko
 wWUe46pW0aE0zkWpfOmAvM5jnPle3EtHXvK9Y0tjcpc2lcyXAniBMKp1gaRqCOvQhZg/
 HGlStBiTZOxrSzSHcIc0AkxyFAgEICn0TWy90Stn2OPD2IsOmOCNOwEhLCJkpGEvCnaH
 uOFo02KMJeiIbbExUx0HriCzWH2KhrHR5VkziH1YPJHWesZK9pwqakpOvrVQ2Tin2ghF
 QvPMcPY5LNmzvKZs7nw3PHm3xG4XTP3wyN5D9JDSOBUOgQ7hvdWsEZa3axIXkPQRGYAc
 7KTA==
X-Gm-Message-State: AOAM533JcXvogJ7DLb2CehIky42OWk2VFdJRRXY3N/8CzFeARXUd72jo
 2H2DVfZ5sQ1owN3VTj72YsoNVQ==
X-Google-Smtp-Source: ABdhPJyWh7I1gSaAgus/e+xWQjnfFuT7DFsa8MD+7LI51rvVqgbLt8k2Er/XikAm9F/nCU8/YR/4Pw==
X-Received: by 2002:a1c:2202:: with SMTP id i2mr31851045wmi.72.1623672363059; 
 Mon, 14 Jun 2021 05:06:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q20sm20213096wrf.45.2021.06.14.05.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 05:06:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2A04F1FF7E;
 Mon, 14 Jun 2021 13:06:00 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] linux-user: Set CF_PARALLEL when mapping shared memory
References: <20210612060828.695332-1-richard.henderson@linaro.org>
Date: Mon, 14 Jun 2021 13:06:00 +0100
In-Reply-To: <20210612060828.695332-1-richard.henderson@linaro.org> (Richard
 Henderson's message of "Fri, 11 Jun 2021 23:08:28 -0700")
Message-ID: <87czsok5w7.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> Signal the translator to use host atomic instructions for
> guest operations, insofar as it is possible.  This is the
> best we can do to allow the guest to interact atomically
> with other processes.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/121
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

