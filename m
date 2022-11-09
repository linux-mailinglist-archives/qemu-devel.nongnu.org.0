Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E7362280B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 11:08:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oshzr-0007d3-QR; Wed, 09 Nov 2022 05:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oshzY-0007a6-2T
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 05:07:34 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oshzV-0005At-Ab
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 05:07:30 -0500
Received: by mail-wr1-x433.google.com with SMTP id v1so24936947wrt.11
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 02:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DnqigfFIBkTDM/u6cyQ6mXTrFD0VsKfly7hGPTcaN6w=;
 b=tfkYwGH1lUuNN8w0llCKrUF3sJ20DIdAITvmNBYMwbc8dXwi3pQZLFF/YhEAvCoqyE
 9Wgsx3YPRxaZoeFcZEgmyc+H0DeobUXkCyHENeUV/k9ZuprUIAQTxeUWu4qe0+1o4KfD
 oPM2yExbWuNYGlZzzJiQhZERDbswOVqaDe7/pXD53GyfSOBm9QVk7gXZbOCoDJYUkW93
 KqynQHD/Wu1ksLo1XdVS/6Gxya8OSVnoh0G7ekoKa/3LkpSP61frXg3d+fECeovP/hai
 o4f/cFH0y4ivh+atzPIK2rySUeON4cBYTuhFq3PdCoxkERHnLs5bSnneW58i3cjDL2Z/
 XXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DnqigfFIBkTDM/u6cyQ6mXTrFD0VsKfly7hGPTcaN6w=;
 b=ROnZsdJl1xhBEE0CydlTLOmdhQ4SFi5d6cmd3g5mrn3x+yka1KZqrA+0IKAAxQJL8V
 3SKHIPjkPk5kPBabcAlB55I4GrivhhgdwkjWl+nNtB07ZJpu6ewiOQUUDTIrErhD71iV
 ut+bZ9okh+6DvcCswwFhwClFbnemfGXnuXbtP3IUJv5iLwBOJO0xTrpIZOkgp3u+rZFV
 T9+Br8TfjTrbsHGZqo4Y4V1zvQqWOAQK4axvIvnhvi4FIA9NIw5dS+sHR4Y42NQQcXUl
 iR4Jhe4STZmYCTnWWkhfPUgy7R7ila3QE3tn3G3jXUH4jXD2O33EqS8NC2zn3kwiWY6/
 AOzA==
X-Gm-Message-State: ACrzQf2LAkbxMnCt4XmrfsstLh5wZ98lEESggrvxmiouDJqd9Uh+0Tlm
 TLzBVelyHb3r/Zsb+CrWT55r+w==
X-Google-Smtp-Source: AMsMyM7EZMRrm5FPxQGwp3jUnkctRGyRd8gIb2V6ekcIbvERfSfa22RleNe9hoFwVLpJCo2c9XOlng==
X-Received: by 2002:adf:e810:0:b0:236:5152:b95 with SMTP id
 o16-20020adfe810000000b0023651520b95mr36528975wrm.529.1667988447247; 
 Wed, 09 Nov 2022 02:07:27 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c314800b003b3365b38f9sm1189666wmo.10.2022.11.09.02.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 02:07:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 82F0E1FFB7;
 Wed,  9 Nov 2022 10:07:25 +0000 (GMT)
References: <6FE4D6CD-1F6C-4632-92ED-9233C8F0EB87@amazon.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Li, Kevin" <cnkevin@amazon.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Questions about QEMU exception
Date: Wed, 09 Nov 2022 10:00:18 +0000
In-reply-to: <6FE4D6CD-1F6C-4632-92ED-9233C8F0EB87@amazon.com>
Message-ID: <87h6z8e90i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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


"Li, Kevin" <cnkevin@amazon.com> writes:

> Hi qemu community,
>
>=20=20
>
> We are working on some open source project which uses qemu on mac, and we=
 have some signing process to sign
> qemu-system-x86_64.
>
> If qemu-system-x86_64 is not signed, we don=E2=80=99t see any problem, bu=
t after sign it, we got the following error:
>
>=20=20
>
> qemu-system-x86_64 -M none -netdev help]: stdout=3D\"Accelerators support=
ed in QEMU binary:\\ntcg\\nhax\\nhvf\\n\",
> stderr=3D\"qemu-system-x86_64: allocate 1073741824 bytes for jit buffer: =
Invalid argument
>
>=20=20
>
> Does anyone has clue about what change may result in this failure?

Not sure about the details but I suspect this is something to do with
the way we have to jump through hoops to allocate the code buffer on
MacOSX.

You could stick some printfs around:

  alloc_code_gen_buffer_splitwx_vmremap

and

  alloc_code_gen_buffer_anon

AIUI we have to allocate a non-executable but writable buffer for the
code and then remap an executable view of the same region to execute the
generated JIT code. Maybe being a signed binary adds more restrictions
on which OS apis can be called?

--=20
Alex Benn=C3=A9e

