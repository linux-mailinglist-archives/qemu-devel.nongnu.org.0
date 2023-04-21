Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DD26EAB61
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:19:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqej-0003Fe-9L; Fri, 21 Apr 2023 09:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppqeg-0003FG-PT
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:18:26 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppqef-0001cA-10
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:18:26 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so10010985e9.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 06:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682083103; x=1684675103;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H2YvjVPdQ5g1MSSyT+g+pDoNlu0L82u0hoH+Rm9vPBY=;
 b=kopk+Dbmaq6bTCgujmk7hkjv27uQjwZrsonQRl+TOrDMMn/tj7XH130/0Qlu0DI5KQ
 tw1m9zDlexZjoJZn24VSBiJtiNb8KNWNK++VaDRW7l1oE9337ksqnopyZWGJeGrDei80
 dkS5aLfykuzbrQhzEimmIlQojXmx63X7USMmo9FdCTueUA2SKP7u6XzHgg4ZCGFSetMU
 T8NYh5RlDcirrDp6IIFYwXxD5KrhmmhcPAKPGanpKaqkrvy1kveOJvUb6wIfh1S7cXhO
 VwV8Z4Wwuin6f06eRvsVtjomAhG4TjYeP3TdSXS6ge1/TVkqlL0Z2K3BWMAugz/Wy5HY
 FIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682083103; x=1684675103;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=H2YvjVPdQ5g1MSSyT+g+pDoNlu0L82u0hoH+Rm9vPBY=;
 b=e4CkXMbl4oNRm0yZRpxB9i7RbLsUNSNIxi3eHJ2jDH+oRm2Vz5O7iQ7KqjhR33ADJX
 mMmMTKLqKUvgQf1BBP3MWk0dTbiNL68HfQ4WsOo1Lsz0l0H2HsmRQdmyN6yKY1rWSRBl
 UcQYyk3axXkWngmEE1rNNJ+B9qfVCiOPyiapDiD8QCrI6qKk14iE+XCesnsCbUkKgN1H
 OtA6MESIEWeTg9LIciayIbmJyA1jtF6hVAzM+LVFMUIaFG5oaxjL7Ks2gXvQnC5NfMpq
 8JwScf43dJSNn9foLupQNqLpzI6hRIP/Y+C5zApbMbS58bs1p5XKHgX27TVu3DfYaGXW
 P4Ow==
X-Gm-Message-State: AAQBX9eifGqT0b1A+TiTMit8p2a0OPiRGvOvXS27EOspFJhu3s8qpOfu
 z/8szsAbKX21PH8VlbCjb9F6ww==
X-Google-Smtp-Source: AKy350bGMOCTxVeKjKbFDpWowFkUvYmHduNgaD+6DggcfdxtOcOWCq+dfAcihJmv95ZW4IbpxCjQIQ==
X-Received: by 2002:a7b:ce86:0:b0:3f1:70d5:1be8 with SMTP id
 q6-20020a7bce86000000b003f170d51be8mr2074496wmj.15.1682083103299; 
 Fri, 21 Apr 2023 06:18:23 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 bg39-20020a05600c3ca700b003f09c34fa4csm8299128wmb.40.2023.04.21.06.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:18:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 92D161FFB7;
 Fri, 21 Apr 2023 14:18:22 +0100 (BST)
References: <87o7nid5mb.fsf@linaro.org>
 <20230421113420.67122-1-quic_mathbern@quicinc.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Cc: bcain@quicinc.com, eduardo@habkost.net, f4bug@amsat.org,
 marcel.apfelbaum@gmail.com, peter.maydell@linaro.org, philmd@linaro.org,
 qemu-devel@nongnu.org, tsimpson@quicinc.com, wangyanan55@huawei.com
Subject: Re: [PATCH v2 RESEND 3/7] gdbstub: add support for the
 qRegisterInfo query
Date: Fri, 21 Apr 2023 14:17:12 +0100
In-reply-to: <20230421113420.67122-1-quic_mathbern@quicinc.com>
Message-ID: <87pm7xbcgx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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


Matheus Tavares Bernardino <quic_mathbern@quicinc.com> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>>
>> > Matheus Tavares <quic_mathbern@quicinc.com> wrote:
>> >
>> > diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
>> > index be18568d0a..f19f8c58c3 100644
>> > --- a/gdbstub/gdbstub.c
>> > +++ b/gdbstub/gdbstub.c
>> > @@ -1578,6 +1599,12 @@ static const GdbCmdParseEntry gdb_gen_query_tab=
le[] =3D {
>> >          .handler =3D handle_query_curr_tid,
>> >          .cmd =3D "C",
>> >      },
>> > +    {
>> > +        .handler =3D handle_query_regs,
>> > +        .cmd =3D "RegisterInfo",
>> > +        .cmd_startswith =3D 1,
>> > +        .schema =3D "l0"
>> > +    },
>>=20
>> Where is this defined in the protocol spec, I can't see it in:
>>=20
>>   https://sourceware.org/gdb/onlinedocs/gdb/General-Query-Packets.html#G=
eneral-Query-Packets
>>=20
>> and it seems to be information that is handled by the xml register
>> description. Is there a reason that isn't used for Hexagon?
>
> Good point. It's actually an lldb extension to the protocol:
> https://github.com/llvm/llvm-project/blob/main/lldb/docs/lldb-gdb-remote.=
txt#L573
>
> But indeed, lldb should be able to use the xml register description as
> well. I'll take a look and try to do that instead.

There may be an argument for supporting both but only if the details of
the xml/RegisterInfo would be sorted out by gdbstub or some other common
code rather than each front-end growing special support.

For now see how the XML does for you.

>
> Thanks!


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

