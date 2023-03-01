Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5776A6CFB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:22:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMPO-0006Nk-DM; Wed, 01 Mar 2023 08:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pXMPB-0006NS-6p
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:22:02 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pXMP9-0002Xc-H4
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:22:00 -0500
Received: by mail-lj1-x235.google.com with SMTP id z42so13890097ljq.13
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 05:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677676915;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DJbfMrOgKHfSZYYumhZ1jttKH8wUuiPiyHZ15Vge4Lw=;
 b=bw37Bc/yieZ0iAA1pXkxNgd2o4xXc/4LmFRF2E480GrKEiwJUUO4maawyZozZiatyj
 4IVqKaMiA3IK6wyNRCw63nTG2c88CmwpnaBsH1pxNtNcJcsmhsyWM0t9PviiS5MI6fht
 gqy3BU6Mdv6Hj8CF924RUv2NSVv3IjXO66LJO3o8nOZxa/WNivmV7IQ4llRpJzRGas2N
 h1DCPbRhAYL43l6P2YDoPcTypYYcy9DUtssyJVSOeSzQNTHLrDmpU6/VHBENdndL4DmA
 4A4SSmvUgC+ugVTdt8sNopmtFIFoynnPELt0IVaKxiNHV+wrbQuHbCKnT6lx4gzNP/cg
 GXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677676915;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DJbfMrOgKHfSZYYumhZ1jttKH8wUuiPiyHZ15Vge4Lw=;
 b=soIRQcqDnZZtQblfjHLbel3Yi20irpKdgNlJV7spvr6mNxUSHqPzJ1+XAoch9pnrEh
 9uLD4rkoWAAxTHoR2RlohBY8Ess5pqq5rCfe9xlbpVGtVMr020A/PUYQTPB5fy+XsyGH
 zQ2sSHuCrk+/ZY+sO2BPuWFzsbq/yh8Fujs/oWBP3ivpM5OgHXlMBT4QVvlyV8EBfa6x
 uwN6BK8hve10KcKdGe1M0mJmn+xtGD9VnTbZL2wdddw5YIQKXrvJYHXBN2F7SGUV8H3G
 bvtyKlp6sXkmob2RSHnlFWszS0JroHeWNnbZd/Y6XGXpi5Z4Vrx+TRodyEl9GAhE/ydl
 Jgrg==
X-Gm-Message-State: AO0yUKWdCWA6ncKC93iu2J4iGqdz72FSZ45IpMOb+2nmiXrUA3ORr/Wf
 5jT2VDZ/W7iEQ/+n+5QJJYTERndfOEq4qiXobRk=
X-Google-Smtp-Source: AK7set/MG84etLO7HdrYU6/wZLF+3kxwnqm42RndtVtQRBTGfwbAHcBdmC9su5W2XwEFGnvGabWIRxq3+9Sidg2fNDU=
X-Received: by 2002:a2e:8e70:0:b0:295:d63a:949b with SMTP id
 t16-20020a2e8e70000000b00295d63a949bmr617812ljk.4.1677676915400; Wed, 01 Mar
 2023 05:21:55 -0800 (PST)
MIME-Version: 1.0
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-8-marcandre.lureau@redhat.com>
 <87fsb4k85h.fsf@pond.sub.org>
 <CAMxuvax6qPYQCzNX7vESJM9_f5k4C1Yat0sJcJjrHkh_1WGpQA@mail.gmail.com>
 <87a61821y3.fsf@pond.sub.org>
 <CAJ+F1CJNgmf+j36wutNMdPYBShoZUXJvzEBGEVwW-B-Z6Tc3ug@mail.gmail.com>
 <87356yq9rs.fsf@pond.sub.org> <20230228155801.s2imkaybh3a4d5x3@redhat.com>
 <Y/8Zy/Lk8i9RCOdc@redhat.com> <875ybkwr10.fsf@pond.sub.org>
In-Reply-To: <875ybkwr10.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 1 Mar 2023 17:21:43 +0400
Message-ID: <CAJ+F1C+S+ChMdk0y5VHzFj94y5UV3iPjHweeLoUTHcBHW-pkYw@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] qapi: implement conditional command arguments
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x235.google.com
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

On Wed, Mar 1, 2023 at 5:16 PM Markus Armbruster <armbru@redhat.com> wrote:
> What about 3. have an additional command conditional on CONFIG_WIN32?
> Existing getfd stays the same: always fails when QEMU runs on a Windows
> host.  The new command exists only when QEMU runs on a Windows host.

This is what was suggested initially:
https://patchew.org/QEMU/20230103110814.3726795-1-marcandre.lureau@redhat.c=
om/20230103110814.3726795-9-marcandre.lureau@redhat.com/

I also like it better, as a specific command for windows sockets, less
ways to use it wrongly.


--=20
Marc-Andr=C3=A9 Lureau

