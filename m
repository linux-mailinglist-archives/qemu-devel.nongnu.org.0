Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EDC42F784
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 17:59:17 +0200 (CEST)
Received: from localhost ([::1]:46076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbPc3-0000rT-Pe
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 11:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mbPaz-00005r-Ow
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 11:58:09 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mbPax-0005eE-QZ
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 11:58:09 -0400
Received: by mail-wr1-x42f.google.com with SMTP id m22so27487848wrb.0
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 08:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=VpEaUF96fLQZHt8DFk804RVbsV8880l4+MgV3rQlzO4=;
 b=QgEU39XpY7K3620qEXU9Kq3DXiCwTUpeoPLCZeX9pP7q3kvygBWx6Rmhzh+i64TZ+D
 H9NSC+4PW09KsmUnvbwCttb2ZmD0kVtHP72sjvkSUsStGs1jWivkrEt/o0/4qoI+YgVw
 v8oONpJN+ngKGhQyZDznsjqapkpWWiNUkxWQTbl4Rb4wwlAcmdwT4rTxLSUYwpNLO+wJ
 n7ImMp1PC6w01EWBODrpVkH3a0z7SYJ/9dG/kbPk8srsvjhRF0SimfWX8uK3weUDon/2
 gmlGrFx6VTy2KRuggfATI9/RkvuHDhykDKG1BYrw0IqVp5XDmlXyu+qLbCCLOA30lOQZ
 BZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=VpEaUF96fLQZHt8DFk804RVbsV8880l4+MgV3rQlzO4=;
 b=u0VFE2RpMarHQXETd2PjGsxAQxocsn4iaDbnvCHi8nzUdFOBp92DPS2suU8RAYsVti
 UaZsY0ACYuU8LeJTeoYaJCJcPt0j7x2rNgE+xtFOknPzNb/EBYFaq296mO7jZkqTjWHh
 bfql2cjU4vZUrFwfwoAnjFbOyz3kW4tw8Ce0ogmlbJstg+JjzNe6oFkQ+Eh9DXe90u1A
 /dDrA/gUQ8zQznq9EO4bnZ8jxN6XzOTHHgmMQ53M6zOLgQWUVaX4AaxvwpnQP14YwUAg
 3ej/Z/vhLlD7RUxz+J30fBcyHkXv3epd1EDZfKyUaKQimSfIaC0ZwQ6D3PI3uUFCWrqj
 +x4Q==
X-Gm-Message-State: AOAM5334ahqtV27Y48fibAUVLbPeUMw11pCE+zcbjVN+BK2j/VuCQxEz
 nhvYNyuzgGP98wqix8vPLbjChs8qSA0=
X-Google-Smtp-Source: ABdhPJzuP4g47LPH9cKz3nuEbcU3aKxvQFyEtLO8hfzFCGJR4Y2aDlRts0RS0dIRzmFbxz365DM0lg==
X-Received: by 2002:adf:b353:: with SMTP id k19mr15488911wrd.325.1634313485750; 
 Fri, 15 Oct 2021 08:58:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i17sm5842992wru.18.2021.10.15.08.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 08:58:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EC0101FF96;
 Fri, 15 Oct 2021 16:58:03 +0100 (BST)
References: <20211012162252.263933-1-pbonzini@redhat.com>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] ebpf: really include it only in system emulators
Date: Fri, 15 Oct 2021 16:57:54 +0100
In-reply-to: <20211012162252.263933-1-pbonzini@redhat.com>
Message-ID: <87h7dith4k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> eBPF libraries are being included in user emulators, which is useless and
> also breaks --static compilation if a shared library for libbpf is
> present in the system.
>
> Reported-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  meson.build | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index ca7b9d60af..6b7487b725 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2595,8 +2595,6 @@ subdir('bsd-user')
>  subdir('linux-user')
>  subdir('ebpf')
>=20=20
> -common_ss.add(libbpf)
> -
>  bsd_user_ss.add(files('gdbstub.c'))
>  specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)


--=20
Alex Benn=C3=A9e

