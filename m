Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2655367CD6F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 15:17:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL34A-00079m-0d; Thu, 26 Jan 2023 09:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL33W-0006vx-3R
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:16:57 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL33T-0006ju-Sq
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:16:45 -0500
Received: by mail-wm1-x32c.google.com with SMTP id q8so1210472wmo.5
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 06:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OBBssYuXJsmRIcPY22KRXjGBHg2tbEhkTsrsKHCe+eE=;
 b=NN9aNm7PP0LBRgXJEg24AXokFM9AD3Gvb7Np8Eoz71MhMdwRqZUdnS/dgqU837er8D
 /cwR/8G0fUSZWaQFbe8kvjX+rsUrgo7T646Q84dHAfZ2bGAKzk34tqj9FyC84LC/CO8t
 aMGN4VVvRGdMz/EhDbx/ZPO2ksSZCyR9G0kpW3pYzbkSxxWUgO9RKJ+oG/WRLI50wrX1
 AMOwvCFLyy3PlvAShMbIb7ZuW2gkuLHtljiFTN3gEuykeVCLxWXlWifNjOVdiHVs+J4C
 vGTzqiDwffTOOd9ixN36DzTKLpxn6m8HjKtjKcOx/+e1bKffFeHTBVv4HmJ06hJ2jnyv
 RRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OBBssYuXJsmRIcPY22KRXjGBHg2tbEhkTsrsKHCe+eE=;
 b=ol7ovtuErXRAeqlSHtnhH+rdkSFPHR/Rvu5ZgcSCb1QqyglhqKBaQzFhS4ExIGlYdO
 PVM1CYlAIZ6yi3HAAolEq8K6a15luhS5L6WsTA5WKZoWUvcjRy3UZ9VC1e0i0B98qVT9
 xA8yg/FFSD4ms+8Hb1C+VAvj8zKsn6YtjCSeYhU7dgoBT74yhX5pyfAWfr4Hj2D4FHmm
 e9wwU/JXArQ+syzI6uOqNRqJJcKE4HMd1oFdPjSHuiBNTbu3Eh/uzh5zOVJTUdF25Jnf
 msUUOG9ejLfW4MrPuTDchtW94Rci83feZNQ0mQIzGOImd0MUwfo3nX6nJcgo1fjGJtFC
 oMAw==
X-Gm-Message-State: AFqh2krMRjPwT5xU0clXjQYBABHxVKd39eOR5jH7dl/9OTLQnoueILtK
 qWfW1TY+uGls4eXfelCrBkAE+w==
X-Google-Smtp-Source: AMrXdXs282f7IGjZvbzXD/565mLuPuHzUr+Jwv7sKQr/m2n+2aTzTjsNnANHqG4MdKMVXXpFsqb/Zw==
X-Received: by 2002:a05:600c:995:b0:3da:f4f5:ad0e with SMTP id
 w21-20020a05600c099500b003daf4f5ad0emr34861570wmp.9.1674742600361; 
 Thu, 26 Jan 2023 06:16:40 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a05600c19cc00b003db0ee277b2sm5383297wmq.5.2023.01.26.06.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 06:16:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 525971FFB7;
 Thu, 26 Jan 2023 14:16:39 +0000 (GMT)
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
 <Y9KFp06pp/qohgV1@invalid>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eldon Stegall <eldon-qemu@eldondev.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>, "Daniel P.
 Berrange" <berrange@redhat.com>
Subject: Re: no more pullreq processing til February
Date: Thu, 26 Jan 2023 14:13:22 +0000
In-reply-to: <Y9KFp06pp/qohgV1@invalid>
Message-ID: <87h6wdpeig.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

> On Thu, Jan 26, 2023 at 01:22:32PM +0000, Peter Maydell wrote:
>> Hi; we've run out of gitlab CI pipeline minutes for this month.
>> This leaves us the choice of:
>>  (a) don't process any more pullreqs til we get more minutes in Feb
>>  (b) merge pullreqs blindly without CI testing
>>  (c) buy more minutes
>>=20
>> For the moment I propose to take option (a). My mail filter will
>> continue to track pullreqs that get sent to the list, but I won't
>> do anything with them.
>>=20
>> If anybody has a better suggestion feel free :-)
>
> Would it be possible if (d) were to run self-hosted instances of the
> runner? I am not sure how gitlab pricing works, but I believe on github
> self-hosted runners are free.

Yes running more stuff on custom runners would be great (and also
possibly not as slow as the heavily loaded shared runners).

> I have several baremetal machines colocated that I could dedicate to
> execute these runs, dual processor xeons with a couple hundred gigs of
> RAM. I would need approx 48 hours notice to initially provision the
> machines. I would be happy to provide root credentials and work out IPMI
> access if that becomes necessary.

I think we would need:

  - provisioning scripts in scripts/ci/setup (if existing not already
    good enough)
  - tweak to handle multiple runner instances (or more -j on the build)
  - changes to .gitlab-ci.d/ so we can use those machines while keeping
    ability to run on shared runners for those outside the project

> If this offering isn't suitable, let me know how we can consider
> adapting something to the project's needs.
>
> Thanks,
> Eldon


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

