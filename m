Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244533774E6
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 03:58:45 +0200 (CEST)
Received: from localhost ([::1]:54776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfYiR-0006DS-R5
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 21:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@remexre.xyz>)
 id 1lfYhY-0005Mo-Gq
 for qemu-devel@nongnu.org; Sat, 08 May 2021 21:57:48 -0400
Received: from mail-40131.protonmail.ch ([185.70.40.131]:10234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@remexre.xyz>)
 id 1lfYhU-0004zK-Oi
 for qemu-devel@nongnu.org; Sat, 08 May 2021 21:57:48 -0400
Date: Sun, 09 May 2021 01:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=remexre.xyz;
 s=protonmail3; t=1620525460;
 bh=6DYn2/vCkJx7pxblYaGXnljXWBvipKw3Ah+F4DTtPgs=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=ScxuYnm9PDfe9fYUVeENLEyn6lxqZwlTSEpiQmOd79x2GrBeHf0VSMbwOP1EWbC2r
 SAxQgbbAkMJxD/8WZPDu/NsGxdMxGh9YH/dVHHxiZUMR1OjDrj8B4GIX7ojisuTKnK
 MpR9UCryll0xS1BR7AK9LPVPsvgNDECWD+dD0ssWiuKcVfYC5sdxtTorg3FsNy4BMx
 D75B18So/uHp0+VLIsIeLEFbB2kw8IJMGQVHj9Di5EleVtKzWbomq2wcEmDsWhBold
 EQ9gNDvdlZKN6SsWzVE5QTp7rQpgTpng5Wdl33nDRD5mvu60+LiocSIctF0AafXNyV
 qvi27I/tZ1dxw==
To: Richard Henderson <richard.henderson@linaro.org>
From: Nathan Ringo <nathan@remexre.xyz>
Subject: Re: [PATCH v2] This makes it easier to figure out whether a
 particular instruction was actually translated.
Message-ID: <d18gk-AF0Wjro1nZkvwjmqlM5mzXO9j68Pp5aELgxzTnI6SMj8tuekbHJ8--baeNWr_zeWw-6BLzTm07cz1T_oxwFuxyAtmgGiV-XYpLL88=@remexre.xyz>
In-Reply-To: <f3e79a92-802d-b9d0-048a-cf8d80309388@linaro.org>
References: <FITkUaiC5DeyCU3e1T6EisgkkQ8Fnrwf2WZTBGE@cp4-web-031.plabs.ch>
 <f3e79a92-802d-b9d0-048a-cf8d80309388@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.131; envelope-from=nathan@remexre.xyz;
 helo=mail-40131.protonmail.ch
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_SUSPICIOUS_NTLD=0.498, PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: Nathan Ringo <nathan@remexre.xyz>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm mostly looking at AArch64, so they're the same there :) I'm using
this to collect code coverage information, so I have the disassembly,
and it's slightly easier to report it that way; if you think it'd be
more useful on other architectures to report the byte range instead,
it'd be an easy change to my scripts.

Also, noticed I accidentally deleted the first line of the commit
message when I updated the patch... I can fix that if you want me to
switch the size metric.


