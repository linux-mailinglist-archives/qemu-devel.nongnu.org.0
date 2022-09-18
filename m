Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3520D5BBCD9
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 11:37:27 +0200 (CEST)
Received: from localhost ([::1]:33228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZqjt-0006hA-Jl
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 05:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1oZqig-0005BA-MC
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 05:36:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1oZqic-0005CJ-Ek
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 05:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663493764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8JPLOwneXQMJflIuetAd2gkacmdpnejrozInodnOMiE=;
 b=GxKgBbCfZ60+WZ2FQkgp2i6Q9kYGQRhj9xzJvGYvdAXsVwBAd3eRCnKQkvbPKVwZsHf3BE
 1w0+tjccFxUeyCEEhLpFHlaxuTHaSsIsaOB/7gLMNISOi9U8S2VhlONPhB/NjHitb6vKhG
 WxAoNHdq5Ot9I5Lzjmxpl4a7gUJPR6I=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-349-ytGKuhkKPA-txftFGoqyJA-1; Sun, 18 Sep 2022 05:36:02 -0400
X-MC-Unique: ytGKuhkKPA-txftFGoqyJA-1
Received: by mail-lj1-f197.google.com with SMTP id
 b34-20020a2ebc22000000b0026c273ba56dso3116620ljf.1
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 02:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=8JPLOwneXQMJflIuetAd2gkacmdpnejrozInodnOMiE=;
 b=dyfc3UQOhy+hGSbpGJEOmcRsd6VrpIGjF/J2uWKuOufAp13qMb1Ce1dljmsMqZRk6Z
 08NEEkiU5daezwR6+fvCGR2RKUKCEYQqJ1rtPfSngnIlD2oDHoJ0nbA8M96Xb+b7k9Yf
 QXcWSd4sVxy2A9A1EdQTo/xUIFwj4n9Qfamc2nemKJD4mDByjzHBaPKTX0c4/s7ssFx5
 jrc5ut9wsjoXZmWBXVoMW0k94f46OY0hMTtLV5Tkf6syDr22tHfKUp5os2Aq/0b3HALT
 zpzBNmcK2Dna7dnXJlv8Lytuu0tpJcoDwyqGCVBY2XR3YhTg5+bYtgc9C6B3ScDa1P/1
 IP5Q==
X-Gm-Message-State: ACrzQf0DIHkL4vwYqduOeZF7CrAp776GZw5nUKZYApuW0JsnUXSSZ4wn
 dZm21oeh2Sdskga/lr1XvicGrvyDK6f7tQrsFjmOBYIGQsOfHMUAi37eKDhJpfRAxbOq4CKvIan
 IqF0qChz4A0y9MoQUqXaqM7BOdFi5LsY=
X-Received: by 2002:a19:ca57:0:b0:49f:52ce:d4b8 with SMTP id
 h23-20020a19ca57000000b0049f52ced4b8mr3626092lfj.491.1663493761040; 
 Sun, 18 Sep 2022 02:36:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4I/gkOKkAutSUJ++SNli2AEERJ1X9YlYoBin4oPL/eKa0DBX1zsOSjpO4g3rgx4Q4oxgRfwhRSKQspxmlTj60=
X-Received: by 2002:a19:ca57:0:b0:49f:52ce:d4b8 with SMTP id
 h23-20020a19ca57000000b0049f52ced4b8mr3626084lfj.491.1663493760791; Sun, 18
 Sep 2022 02:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220901143223.201295-1-nsoffer@redhat.com>
In-Reply-To: <20220901143223.201295-1-nsoffer@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Sun, 18 Sep 2022 12:35:44 +0300
Message-ID: <CAMRbyytLUsHYxB6AHscz-e7T6vV76g=Oau-wGEaGa8kwekAshw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add qemu-img checksum command using blkhash
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

ping

Kevin, Hanna, I hope you have time to take a look.

https://lists.nongnu.org/archive/html/qemu-block/2022-09/msg00021.html


On Thu, Sep 1, 2022 at 5:32 PM Nir Soffer <nsoffer@redhat.com> wrote:
>
> Since blkhash is available only via copr now, the new command is added as
> optional feature, built only if blkhash-devel package is installed.
>
> Nir Soffer (3):
>   qemu-img: Add checksum command
>   iotests: Test qemu-img checksum
>   qemu-img: Speed up checksum
>
>  docs/tools/qemu-img.rst                       |  22 +
>  meson.build                                   |  10 +-
>  meson_options.txt                             |   2 +
>  qemu-img-cmds.hx                              |   8 +
>  qemu-img.c                                    | 388 ++++++++++++++++++
>  tests/qemu-iotests/tests/qemu-img-checksum    | 149 +++++++
>  .../qemu-iotests/tests/qemu-img-checksum.out  |  74 ++++
>  7 files changed, 652 insertions(+), 1 deletion(-)
>  create mode 100755 tests/qemu-iotests/tests/qemu-img-checksum
>  create mode 100644 tests/qemu-iotests/tests/qemu-img-checksum.out
>
> --
> 2.37.2
>


