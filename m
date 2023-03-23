Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2166C62C9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 10:07:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfGuc-0008Ss-GD; Thu, 23 Mar 2023 05:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pfGuV-0008SO-Ad
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 05:07:03 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pfGuS-0001UE-BX
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 05:07:03 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v1so13524847wrv.1
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 02:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679562418;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bu+/16xStNalwkdUAKp0C/9YHh5yrf5FTvxreoMucSo=;
 b=yb7K8PH5+s5Bvtms/TCJT4Uk2AU7746Z3BtFYNRJqTTQpsKoaHX8uMXDL/6HyE0cin
 qIak/WPg+bgt5yBmg4Lnlc1qUVpgDH0LNALdX+XKlOpJkyO3QdEOfiOcnKmMkg7RM71r
 V4V17EOBfiDxvlGcPYepp6aWyAo5qstzUGI3fk++FtP/OXaIbuhUmvaPHdnBrFqLKWZP
 jmRxg+PcC7fUuWjibF9aE9xwWTPRI0ASRCLr3cV4CiUhl/LGTBu89SPJnTdObvLt3heL
 4bwB5owR6ote7q/c7yqnJm6X3L9SivPGLGtFwluRh3K4wJfKyJji4LNUEcZMR91uBd3U
 KrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679562418;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Bu+/16xStNalwkdUAKp0C/9YHh5yrf5FTvxreoMucSo=;
 b=tU7aRsr1c0kYPZKr5WVMeNY91juRNVA+LuX3Bymb/b83Sob83hmcWiuIo/i9lJBjG6
 KUchGJ8iDwFY0SgfaLoPbAyaJfBsWAwEXUFOkJma7K+unSVumt5GMd2OTm9aRRLL2M6G
 URs6fm8ha7OMRV6LqN7c5/mG+sx66EZ5+rAT1t6m/UdUC6LBdn6iBLXDyaYWfkLEIynq
 INF45wpoczHDpOB2LHtbesPcpiVKNfkLUxQuS32uYCkxKVtSsi2d4nihpWES4hxDJ8sv
 +uSxwGkqqhz+1dEz4QzYg921vPdrMegdTKElp2BxRhLZaMIseWyqqwilhLc6sDH2X4wl
 MEog==
X-Gm-Message-State: AAQBX9deuewuV2wXIuCsTq+Mk5V4pGQN/OdQzF1gWGDZfK7ps2+USsdi
 gMUR0IMXzkm6zeX1eadu3US8Bg==
X-Google-Smtp-Source: AKy350aYoK8xaUGfFJfTn9yU4S+nQAVUslnqBUcuqcifsrAODmwma0YR2Ga8Ke5NDYjhSmBaXaePTw==
X-Received: by 2002:a5d:63c4:0:b0:2cf:e422:e28c with SMTP id
 c4-20020a5d63c4000000b002cfe422e28cmr1925632wrw.42.1679562417757; 
 Thu, 23 Mar 2023 02:06:57 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i7-20020adffc07000000b002c5706f7c6dsm15678475wrr.94.2023.03.23.02.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 02:06:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0E5B61FFB7;
 Thu, 23 Mar 2023 09:06:57 +0000 (GMT)
References: <CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com>
 <20230223152836.dpn4z5fy6jg44wqi@hetzy.fluff.org>
 <Y/eHLCKcdYk0V4Tt@redhat.com> <Y/fkf3Cya1NOopQA@invalid>
 <Y/zhZ4brfdQ7nwLI@redhat.com>
 <CAJSP0QX2tkaVZh0FX4Ke8EWn7tO9qm76YnRCHe6-UxWJg6LzTQ@mail.gmail.com>
 <ZBnd4/UTH6CD5vx7@redhat.com> <ZBvpWMguR89kfZDG@invalid>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eldon Stegall <eldon-qemu@eldondev.com>
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Stefan
 Hajnoczi
 <stefanha@gmail.com>, Ben Dooks <qemu@ben.fluff.org>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: out of CI pipeline minutes again
Date: Thu, 23 Mar 2023 09:05:42 +0000
In-reply-to: <ZBvpWMguR89kfZDG@invalid>
Message-ID: <87y1nn4z0v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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


Eldon Stegall <eldon-qemu@eldondev.com> writes:

> On Tue, Mar 21, 2023 at 04:40:03PM +0000, Daniel P. Berrang=C3=A9 wrote:
>> 3 weeks later... Any progress on getting Red Hat to assign someone to
>> setup Azure for our CI ?
>
> I have the physical machine that we have offered to host for CI set up
> with a recent version of fcos.
>
> It isn't yet running a gitlab worker because I don't believe I have
> access to create a gitlab worker token for the QEMU project.

Can you not see it under:

  https://gitlab.com/qemu-project/qemu/-/settings/ci_cd

If not I can share it with you via some other out-of-band means.

> If creating
> such a token is too much hassle, I could simple run the gitlab worker
> against my fork in my gitlab account, and give full access to my repo to
> the QEMU maintainers, so they could push to trigger jobs.
>
> If you want someone to get the gitlab kubernetes operator set up in AKS,
> I ended up getting a CKA cert a few years ago while working on an
> operator. I could probably devote some time to get that going.
>
> If any of this sounds appealing, let me know.
>
> Thanks,
> Eldon


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

