Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC72F6AFF2B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 07:57:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZnj4-0005Al-Vx; Wed, 08 Mar 2023 01:56:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZnj0-00058v-PM
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 01:56:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZniy-00034B-E8
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 01:56:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678258590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zlXW728+608ted3Dm2DIntUsDjHIH5AQkXLZh5H/soQ=;
 b=bey3R9TbhNzMPmVrCO5tW/7YA9DxeTKhe53FUFo+kXgCQEttYPhhvm0FTINIfRoFhC1WAQ
 wQ+CrioICXTRxWl3lc5RDps4AKCaCHK7HCpkgvqLz2IzhNMt4lru2SGZ4iaTRRQNUYXMTN
 VAGrg5HGGKsITSV6cjROfH7YIsYTjMU=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-X5MhRw12Pu-Q1-kifg5QHQ-1; Wed, 08 Mar 2023 01:56:29 -0500
X-MC-Unique: X5MhRw12Pu-Q1-kifg5QHQ-1
Received: by mail-oi1-f197.google.com with SMTP id
 az13-20020a056808164d00b003842c9798dcso6516335oib.14
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 22:56:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678258589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zlXW728+608ted3Dm2DIntUsDjHIH5AQkXLZh5H/soQ=;
 b=Zgjp7t9z3CYJngcr5UXrIkY4rFlCEJIIUkyiRWZISf+xkUKM4t5+L0Env7ab5xBoxF
 KXpuXsKQ9k5AS9Uc8gQrXKdhrVPqLz7VIiqE3/PJYyzLnf0YdNj+JsvvS6nAYq63CSUs
 bVsVCNftUtnNowPYcWwKhVMXNqiSQmQeX2amk4Dca+IRevPhufrlQXucCNfGQlHyoRwh
 /NKVOjTH7iPz/yyY69eTBlfiRO6mZbnsFAaNQCIhCzi32ZeRUgh9l08jnOlIIq8rt+0l
 9iD23l9t0jBNGbWUmQztp8AhfPNdjU1fU9tr4C/37xPw555P37TJKnCehapo0hP2Z8Fd
 qIMA==
X-Gm-Message-State: AO0yUKUakmTeNdduHChqgxnVuekPBGowxRelMqSoJ8C84E/zVgnRwC+6
 hVuekTK51zne3WJoHsMlCQJ0RKRphC+TMDYLUzfMuA4iSdiMXgK514XZlJYFnFsL7qMehk5Rh7E
 Gok98koyCVlKGaOaDmDm3DPX1MxFxivQ=
X-Received: by 2002:a05:6870:c384:b0:175:31d3:e12d with SMTP id
 g4-20020a056870c38400b0017531d3e12dmr5997997oao.9.1678258588867; 
 Tue, 07 Mar 2023 22:56:28 -0800 (PST)
X-Google-Smtp-Source: AK7set93kdGytNm3zVpB7mXxQWz75NwbiSCypl5fap5qGnk9WnDw2kcE0ueVHfVZFpJnEb5cTbbtR1xUGU5PJSmhhsY=
X-Received: by 2002:a05:6870:c384:b0:175:31d3:e12d with SMTP id
 g4-20020a056870c38400b0017531d3e12dmr5997991oao.9.1678258588694; Tue, 07 Mar
 2023 22:56:28 -0800 (PST)
MIME-Version: 1.0
References: <20230307070816.34833-1-jasowang@redhat.com>
 <CAFEAcA_Pctm1m30Cm2Q2cpyp9JmNgej5nB0ovZGtjfFHU2R9SQ@mail.gmail.com>
 <4b67f103-0df3-891c-2a0f-466a82e89732@linaro.org>
In-Reply-To: <4b67f103-0df3-891c-2a0f-466a82e89732@linaro.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 8 Mar 2023 14:56:17 +0800
Message-ID: <CACGkMEsuy_eCGcLy2C8-BybbwGC4ak9+Gfv9EeiG6DAZrLjZdQ@mail.gmail.com>
Subject: Re: [PULL 00/51] Net patches
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Wed, Mar 8, 2023 at 4:43=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> On 7/3/23 18:01, Peter Maydell wrote:
> > On Tue, 7 Mar 2023 at 07:08, Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> The following changes since commit 817fd33836e73812df2f1907612b57750fc=
b9491:
> >>
> >>    Merge tag 'audio-pull-request' of https://gitlab.com/marcandre.lure=
au/qemu into staging (2023-03-06 14:06:06 +0000)
> >>
> >> are available in the git repository at:
> >>
> >>    https://github.com/jasowang/qemu.git tags/net-pull-request
> >>
> >> for you to fetch changes up to c19b566a3898510ec2b3e881b3fb78614b24041=
4:
> >>
> >>    hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by EEPRO100() (20=
23-03-07 14:55:39 +0800)
> >>
> >> ----------------------------------------------------------------
>
> > build-oss-fuzz failed on something involving fuzzing eepro100:
> > https://gitlab.com/qemu-project/qemu/-/jobs/3889073821
> Jason, please drop my patches. I'll look at that failure.

Ok.

Thanks

>


