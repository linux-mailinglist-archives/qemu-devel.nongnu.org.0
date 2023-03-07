Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD59F6AE14E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:50:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXhF-0002xC-DQ; Tue, 07 Mar 2023 08:49:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pZXh0-0002pe-Nt
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:49:28 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pZXgx-0007M8-Nb
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:49:25 -0500
Received: by mail-lf1-x12c.google.com with SMTP id g17so17156280lfv.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 05:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678196962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cFaCRirNomk3a+cyiwZtQqj1LT1LXnRZ/pn/9HFUMoE=;
 b=ak6HLoIoIm0n6Q6L1v+srgM3H75dvEgkj/ixanQd6iBaDFHCY/nhZps7UKaoLTUF6+
 DRsO82BUjnr936FKJ7KguBojAPksNH4UCrARH9IEWZiI4pMWLu2plc709IcPY5q5O+fi
 kZCaH47Bta/YFQr3jY1WceIm3NSZigOugmb7Rfd9TSTKiyXsVwW+Ov5FAjjPc+ZpLMMc
 kSFp9xekwaSLyTlraOnxJV0v9d66Y2pOfu/V2Fo/0Bn3KogTapG+2vlPzZ6hgzdWenSx
 hi37foLrjbMDDw0rnbLx1jmeEaQxgg72eMAbnUmXxqS15UKmssa6PFsXSYQ1w3kaxM3d
 wn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678196962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cFaCRirNomk3a+cyiwZtQqj1LT1LXnRZ/pn/9HFUMoE=;
 b=OsNEv5oLV8PqKADW0aJH6MwWdU05wboF7s61TSeefjNDEfKkGJXRmxOablqwUMggot
 blPZxl68me0abPTFJs69k4qQRwFxcH/Zhv3KNjaeOTLXOhbJVD0RGTRyeJEgFa8Y0e+5
 RWR8Pc/hRXx+8sMueExxoK/QVeBHlE1St+5hVSTv+CX23EasknsVlwrCw3lqyb3MWx3X
 qnvyPLbALXH3wtD9MHuyQMgg/QrD7TN1vvDAp+qiJnQyNFu95tJC/UXzcDnxgYKNx7Aj
 oc/0MCcU5tZPeyBeWjCzgzdTpnvKwhliQYgHoEZ3aNqlNf+pMvx569PvHHPtGYq+fbxE
 ipgQ==
X-Gm-Message-State: AO0yUKUpF1oqCCjqefLRlrHwAxU72GfJd7JKaMYdwWUsOjNUd/b0ILOw
 o0UmjYaDfyv/oxpVwOpyRjmaAckXMdO7WlbMlUA=
X-Google-Smtp-Source: AK7set/UbR9DXjFmQlyEq6+pa10pqGLSiUFCLTh2kkQmhcDTbD7f0k9BGydf9y6N5t9d9CHCGdU1A+4NlwF+k+e0B/A=
X-Received: by 2002:a05:6512:48e:b0:4db:33ed:89eb with SMTP id
 v14-20020a056512048e00b004db33ed89ebmr4556641lfq.5.1678196961780; Tue, 07 Mar
 2023 05:49:21 -0800 (PST)
MIME-Version: 1.0
References: <20230227215943.114466-1-dbassey@redhat.com>
 <CAJ+F1CKRPVF5ciDQwbaacdozNx27hmo514OONOk3p_LLtB+OBg@mail.gmail.com>
 <CACzuRyxMSnJ9ANgQT+Vt1SK3ETt=TtvtKsA2GNzEpe=AQ6iApQ@mail.gmail.com>
In-Reply-To: <CACzuRyxMSnJ9ANgQT+Vt1SK3ETt=TtvtKsA2GNzEpe=AQ6iApQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 7 Mar 2023 17:49:10 +0400
Message-ID: <CAJ+F1CJRXdiv=Denf-q7cQ=X39MQL8X=_4Zf7aB5ozPCGJDY9A@mail.gmail.com>
Subject: Re: [PATCH v5] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: Dorinda Bassey <dbassey@redhat.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, armbru@redhat.com, 
 qemu_oss@crudebyte.com, pbonzini@redhat.com, wtaymans@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi

On Fri, Mar 3, 2023 at 8:06 PM Dorinda Bassey
>> What are those thread_loop_signal() for? Maybe leave a comment?
>
> the explanation of the function is in the reference header file.
>

Yes, I read the reference documentation before asking: "Signal all
threads waiting with pw_thread_loop_wait."
(https://docs.pipewire.org/group__pw__thread__loop.html#gaf9bc8dd348d05b095=
139f5a55ac5a4b0)

Unfortunately, you are not calling pw_thread_loop_wait yourself, so
that doesn't help me what this is supposed to do. When signaling
things and expecting a certain state and side-effect from a different
thread or context, it's nice to document it.

I guess this will break the thread loop? What happens next?

thanks

--=20
Marc-Andr=C3=A9 Lureau

