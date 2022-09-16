Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D3B5BAE36
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 15:33:36 +0200 (CEST)
Received: from localhost ([::1]:35958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZBTK-0004K5-Nb
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 09:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oZBMW-00059N-64
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 09:26:32 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oZBMU-0007PF-JQ
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 09:26:31 -0400
Received: by mail-wr1-x436.google.com with SMTP id z6so3536228wrq.1
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 06:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=I90VLk6fg5it/6d1+1GwuCaMWYVh8DckYrKpq65htQw=;
 b=ecQ6f9vYNXisZK2sn+c8r4luQXvonnAjonR5fPhAWLRL4QlplmwylLAUeOT/Npcaz9
 nNBUQk51Z8mOrTfPG8WP+CeCtd4lr+I7RpruAVO+FvPEbh/F0d4+u3myBoxuh2XQh58C
 0wZSDwXKbfUpJTCXZvhMtcq8B5vz6tZZWyd7QqlXMzmzr3CY/5nDtrOGKEB/mLXZkjpY
 zu5dJTTxKR2uf7UnBfeoHs1hnTmHYC1Ro2+YMzL3iWfywYIyLRLkg9+hsp+6g4OKxzSL
 0fsPEoWwSj6MfRVJUbkEVL14AzupWyU4022+ACoMwkgwmIT6hB+LTlmcQSj8cCZWcDuk
 yyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=I90VLk6fg5it/6d1+1GwuCaMWYVh8DckYrKpq65htQw=;
 b=kYWxThV6er9LTvIHoKoAmeaYJZyGNG8xZTcqC7UuAf6y7u6/+AnNw+z34pdFH1CIf0
 VNLhHZTGSWhGePd5Ftv4Lgr/2udPFWEwI3Xrib2frXsw6JFjtJZPiBnquTrngo39eANy
 aHc1Z1SshaaAjChhHWxHYKX/JQCO9uHztFJwokMpjVaNXOiV/yLDuNEDExSfSa4+zb5M
 wdBuOkQlx1/OrlFCi+HqR2JicFfJ4MZUFs0XtYFuLC23nmyaF757NoiezLZuDg7x0UJU
 QI5nXzOvkosyoYW/BfR9nNLW0/fLhXEx2v5hIPYoaGqWu/rM5OAy4gOE0OvX3RPuaj6N
 Dk6A==
X-Gm-Message-State: ACrzQf0WwS9AXIc4fSirFOAVV0/59NLKXI312jIB0iuxpkxKMN+Sgy7L
 aK3O2w5nF1R1bho6Wc63H+O9XA==
X-Google-Smtp-Source: AMsMyM5YpfjekQBVh5yWS0uaZAfZNjIHIltjK2fgdri1kiDDuxwoCDUekMCdYaMmc1toMr9CDT+6PA==
X-Received: by 2002:a5d:6da2:0:b0:228:64cb:5333 with SMTP id
 u2-20020a5d6da2000000b0022864cb5333mr2743194wrs.428.1663334789082; 
 Fri, 16 Sep 2022 06:26:29 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a05600016c700b00228933481dbsm4805998wrf.47.2022.09.16.06.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 06:26:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 92FB71FFB7;
 Fri, 16 Sep 2022 14:26:27 +0100 (BST)
References: <ba99db564c3aeb1812bdfbc9116849092334482f.1661362557.git.quic_mathbern@quicinc.com>
 <7d14967366c0e3640f47a15e80d1cc911413cadb.1661946575.git.quic_mathbern@quicinc.com>
 <SN6PR02MB4205789F605DBB66A4A6E178B8489@SN6PR02MB4205.namprd02.prod.outlook.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Brian Cain <bcain@quicinc.com>
Cc: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "f4bug@amsat.org"
 <f4bug@amsat.org>, "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH v2] gdbstub: only send stop-reply packets when
 allowed to
Date: Fri, 16 Sep 2022 14:25:56 +0100
In-reply-to: <SN6PR02MB4205789F605DBB66A4A6E178B8489@SN6PR02MB4205.namprd02.prod.outlook.com>
Message-ID: <87a66z8n7g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Brian Cain <bcain@quicinc.com> writes:

>> -----Original Message-----
>> From: Qemu-devel <qemu-devel-bounces+bcain=3Dquicinc.com@nongnu.org>
>> On Behalf Of Matheus Tavares Bernardino
> ...
>> On Wed, 24 Aug 2022 at 14:51, Matheus Tavares Bernardino
>> <quic_mathbern@quicinc.com> wrote:
>> >
>> > Instead, let's change gdb_set_stop_cpu() to send stop messages only as=
 a
>> > response to a previous GDB command, also making sure to check that the
>> > command accepts such a reply.
>> >
>> > Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
>> > ---
>>=20
>> Gentle ping :)
>
> Alex, Peter - any thoughts on this change?

Sorry I was super busy on the run up to KVM forum, I have given some
thoughts today.

--=20
Alex Benn=C3=A9e

