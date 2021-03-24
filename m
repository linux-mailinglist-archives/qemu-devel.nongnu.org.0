Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2851B348311
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:46:40 +0100 (CET)
Received: from localhost ([::1]:54414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPAOl-00021c-5n
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lPAM1-0000Fx-30
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:43:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lPALw-00020S-97
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616618623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yG2lQkdRrZw+EYOJUCtEHFYThvP8+4mjZg3w4wxZfXk=;
 b=dYjw0P7I7dmTZKLJbDghYsbU+Fq5966oQ21UXRDStscSFk3hYajba4KHWnq3kb+Y6GZkt8
 NpCC0vRECVaGIWkJfEZ2za2QgRytuqtLp9apA24ztv2W0/iETc2mfXKzavS5SSwgkDuD0d
 lBNqM7rfMv4D11DylpaSuDKVRiFpplU=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-Jvg97ZzXOV6_kMgJLmA1NA-1; Wed, 24 Mar 2021 16:43:41 -0400
X-MC-Unique: Jvg97ZzXOV6_kMgJLmA1NA-1
Received: by mail-yb1-f199.google.com with SMTP id 2so3781057ybc.10
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 13:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yG2lQkdRrZw+EYOJUCtEHFYThvP8+4mjZg3w4wxZfXk=;
 b=rcaOfNLruE/vr64AOvnYcr8X2KgXRSuUp/Qolv2P+tuNvipvrY6M+DKjtp4ZyIPAia
 iSYgK/NQrqWWcpg7kaR4p/hzh2HUjf2TAYjySz2+3K7vEGn11r9r4gCZc6+xmSmTk/9a
 pkJMRZMJ4upguGRVd2TWTkgLFbdquO3nIVHpxbuL9zcTlweOPp5pCIdFTlufuqtOeuLJ
 NwmA68IAg6RL7yUmxXFLupQQGtORnU41xurU8eKA6ratPPG5usQJyfyZvEEYQ9UsWS3D
 ZL/dEl4iTcdZ01XdYrt3w64E0OIFR4AmTmU6yyaC1lLOOW0CUqUv/jAFWupW5/NBotU8
 b0bQ==
X-Gm-Message-State: AOAM5314hcjeqtN3lul0MUGDku5wvEa5ZLor9yMIJzUEMaSt3xmoxiTZ
 k7dPGbCaStA6vr4b2wXCG+mvseThABU/YqVBRVHYjE6OoXC7uITbhvawmrcSelfl0TmMERjnpOC
 YJzn/u0N+LuJ1OHEHYFSs+y9ylSnntBs=
X-Received: by 2002:a25:2417:: with SMTP id k23mr7882988ybk.350.1616618621034; 
 Wed, 24 Mar 2021 13:43:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3MAqhLM8Q2Vyi5mXIDLxhIdDsGpOMZTw9xz0mnf2pMwdRC2LTOTjX0lxmYkEfnN5UoEP/Zvb+dKr5blvyd6o=
X-Received: by 2002:a25:2417:: with SMTP id k23mr7882965ybk.350.1616618620842; 
 Wed, 24 Mar 2021 13:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-7-crosa@redhat.com>
In-Reply-To: <20210323221539.3532660-7-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 24 Mar 2021 17:43:15 -0300
Message-ID: <CAKJDGDY199=6yo8J2SUKMWy-4=_MiLU6A0vSdM2MJaVbkubj2w@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] Acceptance Tests: make username/password
 configurable
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eauger@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 7:16 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> This makes the username/password used for authentication configurable,
> because some guest operating systems may have restrictions on accounts
> to be used for logins, and it just makes it better documented.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


