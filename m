Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208226F45B1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 16:00:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptqXr-0007Eh-Gx; Tue, 02 May 2023 09:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptqXp-0007EJ-1S
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:59:53 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptqXh-0003mf-2P
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:59:52 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bc4b88998so4672376a12.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 06:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683035983; x=1685627983;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bl7socQzwmxpElhuKm9ZuXc4R8KVPdgnNU7iWIkJY98=;
 b=tzGmfvb/A46Gjo3ggIur8em/ixg+/6ralV+G3Gqt9jPiNjvuG7Z7RL2pCWjNnO/8QE
 LbnFOH99vBlq+e9o7tCP6Ao96/rNv4ZYbY3j/wlCkT/VbIS3NrwUEKIQqjFE0qdBy7Od
 E+3rkVH+NupE5vbxEZD9Fm5ydFbznBXLIhDEb9KFnz9yC2Ntnmg8nDc2o5GwqlOnyPcP
 7LfUVhvJuc54CcXDxPR7TdU0NHbIiqA52VD9stqJCAu431QxH33bCgK2GvMWoZgDRac1
 +g+z+znnBVXNE7bNwCWXs6OdGwB5PiuO6Cmeb5bKMzjP4Ox9UKQUGsNmJ9JpCQ8s60vX
 FCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683035983; x=1685627983;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bl7socQzwmxpElhuKm9ZuXc4R8KVPdgnNU7iWIkJY98=;
 b=aF0iWr/VbHH+NDfiKqg6nfDdm9PKZGV4pDr3RkFObTQe63A+UcYAVdkwVaG8WmuDSr
 6KEXJBCXSiFDhElRsnJxlLo3JcxD75R9PC6HrWuvUiAS1WasT7L1Ip1BVMIg8tjUUkLx
 sD0xp/7HCe0Asv7KXnX6XVDLq2WpdlDnz3YygViyBfgtF3Fa+tfWVZqSwR3Ru43ioDeS
 3sLkivH68xnOIOWmiFmMJfeJK8vIPfdfW0R6h1TTzhDO/EUvgoWXjQRAIOfdLiQgNNOi
 xpSPP54PYxOfrEFYCxVVmeJ5mzpA/eKggwboymvpGgX0Gw1Hl7LZcT2QnJUZJXMKIa17
 Bf9w==
X-Gm-Message-State: AC+VfDx0zbi35tDC2E6Agko0CG4YAiMhA92zwXicXAZR15KV4yLDZcrV
 cS93LVIiBGL17dFbEQhnxZXaROhbKqaQM8fV+hlENQ==
X-Google-Smtp-Source: ACHHUZ4PRbOHpZtLVw4YQ7iM7s6Jx8tm/cyubNy2VgUug1XfDx19VCotxgnm4Szoat3rFfrfmqLsujikUplYj9/1OoQ=
X-Received: by 2002:aa7:c3d9:0:b0:4fe:19cb:4788 with SMTP id
 l25-20020aa7c3d9000000b004fe19cb4788mr8176714edr.42.1683035982667; Tue, 02
 May 2023 06:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <E1ptqMT-00HAI8-NC.val15032008-mail-ru@smtp44.i.mail.ru>
In-Reply-To: <E1ptqMT-00HAI8-NC.val15032008-mail-ru@smtp44.i.mail.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 14:59:31 +0100
Message-ID: <CAFEAcA8hSb2RFRN+cTLZb4jLR4gPAsWt1xONAJ4eq3Berdb1gA@mail.gmail.com>
Subject: Re: Patch for png_save(), QEMU v8.0
To: =?UTF-8?B?0JLQsNC70LXQvdGC0LjQvQ==?= <val15032008@mail.ru>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 2 May 2023 at 14:48, =D0=92=D0=B0=D0=BB=D0=B5=D0=BD=D1=82=D0=B8=D0=
=BD via <qemu-devel@nongnu.org> wrote:
>
> Hello!
>
> Currently, png_save() in "console.c" uses "PIXMAN_a8r8g8b8" format when s=
aving png.
>
> ( https://gitlab.com/qemu-project/qemu/-/blob/7c18f2d663521f1b31b821a1335=
8ce38075eaf7d/ui/console.c#L314 )
>
> It should probably use "PIXMAN_a8b8g8r8" (red<>blue exchanged).
> Without it I'm getting PNGs with blue and red channels swapped (QEMU 8.0,=
 qemu-system-x86_64, Arm64 host, libpng 1.6.39).

Ah, I was just working on this this afternoon (it was reported
last week as https://gitlab.com/qemu-project/qemu/-/issues/1622 )
and just sent a patch a minute before I read this email :-)

I think your patch only fixes this problem for little-endian
hosts and leaves big-endian hosts still with the wrong
pixel-data order.

You can see my version of the patch here:
https://patchew.org/QEMU/20230502135548.2451309-1-peter.maydell@linaro.org/

thanks
-- PMM

