Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0C73EF243
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 20:50:23 +0200 (CEST)
Received: from localhost ([::1]:40336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG4AI-0002QB-E5
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 14:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG48r-0001hZ-C0
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 14:48:53 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:47072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG48p-00073s-LU
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 14:48:52 -0400
Received: by mail-ej1-x62c.google.com with SMTP id gt38so19390352ejc.13
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 11:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W5Puof1J6ryG4zXkGHwa5Y6hK+nsyX681704aGBsbSs=;
 b=n3BgbrH2ZA7qKosWHMpKZKyGHWZWnIExz7UpBoCkjwLJxaR51wfOqwA9B0Pfigtxc9
 snBp55206gevlv44bOZCpdlk9I3zFRBL60gosP8hMtv47yHDDf0rWylbRUeX/MqdGVLx
 3qubLoGbknfUkhEFTrQV/o1CyGVd53ewVtNFRPTHE1V7SpBlEbJimyz7pNAN3wlAUepW
 pdFWO2Rm1man+H5qXHBhDSOzuN4NYYQKtN6m4ELkV0MN3XDqZLTiyfXfu7dOpGZP7Q49
 WyDBvXTCv09mK/7ruU011n1xXSPsUVHzA2JdYZj/Wmb/9tZ0it4O0CxaLf/pDamQ5j6b
 bZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W5Puof1J6ryG4zXkGHwa5Y6hK+nsyX681704aGBsbSs=;
 b=euUrYuzwEseKUb0HqUUc5xFxLh4aumS6rblmEPXEN2n5u82QbZTz7iOMHlm1C1lt09
 HZqgIp7DfiHotxwkSjtYsnvLm/TsLREhAFBaGQqIxpCu5Y7DcaBqkVPJ7sRoI6hQP1GG
 ubwh9rFrCTiVzV3uQJ1A5toaODipQUede9K26XX6lWX5C+a6wfFqMn6VeKt12n1lhVPp
 I79Wf8BONJWxQ9ZjTeLLwClrfvlcVGJIhxSfLF5OBxtP9IPb/oSd46Po6J27sEZZAxut
 EByRQbWeGm76iloCUvMUok7lt16nTBuKbDlzX8nca626vMGoLF6LL5CWtzJjnRbIx07V
 /N0w==
X-Gm-Message-State: AOAM5336j23a89SeCPD/q3zeBVDZTVDi5SrRpqcCf5KAqUjgds173E3S
 1IoO5neB4G7m1pDpclIM5Uq/lUWAefrKYUGIO5fO9Q==
X-Google-Smtp-Source: ABdhPJxw0/e6otYs64w1P/SP8+R6EYtNfT5ZEBpTezhrUDGwgnLt78JUdE1qe8OC3rGHETTWMDnywXbjVAlIj2i4uRU=
X-Received: by 2002:a17:906:3bc3:: with SMTP id
 v3mr5559084ejf.482.1629226129997; 
 Tue, 17 Aug 2021 11:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <BY5PR02MB7028431FD055B48DAD3841F7F7F99@BY5PR02MB7028.namprd02.prod.outlook.com>
 <YRvjHiZmPkSuv//z@work-vm>
In-Reply-To: <YRvjHiZmPkSuv//z@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Aug 2021 19:48:03 +0100
Message-ID: <CAFEAcA_h_WWf=0rU1yTqOA4AH5kYfLNqdbqHokdtoBP7bmepUw@mail.gmail.com>
Subject: Re: Using loadvm with snapshot
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Gabriel Southern <gsouther@qti.qualcomm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Aug 2021 at 17:27, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Gabriel Southern (gsouther@qti.qualcomm.com) wrote:
> > Hi,
> >
> > Are there plans to support using -loadvm with -snapshot?
> >
> > I saw some past discussion on mailing list including bug that was close=
d earlier this year but no recent activity:
> >
> > https://lore.kernel.org/qemu-devel/162424905685.11837.73035700618573836=
41.malone@loganberry.canonical.com/
> >
> > Testing with latest qemu it looks like -loadvm still does not work when=
 combined with -snapshot.
> >
> > I'm curious how complex it would be to implement this feature and if it=
 may show up on QEMU roadmap in the future. Or if there is alterative comma=
nd that can be used to save the state of a running VM and then use the same=
 qcow to run multiple QEMU instances loading this VM state running in snaps=
hot mode.

Do you know why -loadvm and -snapshot don't work together?
It doesn't on the face of it seem like they would be incompatible...

-- PMM

