Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CF743BC0E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 23:07:41 +0200 (CEST)
Received: from localhost ([::1]:44032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfTfY-0006Eg-NE
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 17:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mfTd9-0004Nu-F0
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 17:05:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mfTd7-0002mZ-5m
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 17:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635282308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DJq1riufOzpkadyuHchK3D2Lo0zxLtbXmWp9uM1TsRE=;
 b=KLjTIgd5rULuZzCWd6unwb3k1vXYNURlRLz4HScwsA6Ctl8kDuRYoAznQ6BSc0l+eIHMgU
 Fo0NZZwZlG2ult0XwYL6767k2aVhl/JqDqKKfFbZ8059S4mgarcMlCmCbVGbdYFps94cX1
 4rWn3gsvhf5lmp1Ih9T08ZqkncFPtTA=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-6iKNWxCZPXCgKT_HC9xQgA-1; Tue, 26 Oct 2021 17:05:07 -0400
X-MC-Unique: 6iKNWxCZPXCgKT_HC9xQgA-1
Received: by mail-pg1-f197.google.com with SMTP id
 m74-20020a633f4d000000b0029fed7e61f9so340544pga.16
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 14:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DJq1riufOzpkadyuHchK3D2Lo0zxLtbXmWp9uM1TsRE=;
 b=AgLp8rneOvE1FhlcVxrwNzmVQ6TJCbvDAuC5fKTD2UD4Gr2a07uwEl1t7ztsdbiVGZ
 yN+EswtxbrY+gsvwk3yzLbp18JSYWJ2gCICG6rJHFWpWLaRtszcdcKV45kz46Nqy0Lgi
 BIJSI314cEgt43LWVZ9GAIGwXswp4wsYYibqzU24cR5b6xxInfETEuZBdIiMyGAsbGu1
 v63h2NaYEWU6lPP/6hITytz/ZZs9gYAOdD6sj4NoGEjrIXoGDC6tkqrCasDm3DyOFPK6
 Hn4GcwQ2yjRA8ltWt4dGzKu1uKE9IhAUP/4y+9kqJ9qyrujvCMyoENZDN5RWMX3/V7wv
 DcpA==
X-Gm-Message-State: AOAM5302XwapKaxt9VMS5bAUxbhfhVBDYe3NUghNA7wexLyBVi3x3+1a
 WcV+uADgJHjlds9gPqMCw1cgAQKWJujSfJqL9YUk0K+WwngoOdQD/lU+fIZEszsvlWHzDYzEnWm
 UaLSjKscmIyWlnEVpQDIQbEOgO9PeFqc=
X-Received: by 2002:a62:7d8d:0:b0:47b:dfd7:e888 with SMTP id
 y135-20020a627d8d000000b0047bdfd7e888mr22840826pfc.42.1635282305995; 
 Tue, 26 Oct 2021 14:05:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxx/69hzs/aLE1J9g35BAPTFzT9GsW0jFDP8B2CldUhCu3cdjXPoujIHtycDYOznpydHeZ1YSJxjGKR/AtvR2s=
X-Received: by 2002:a62:7d8d:0:b0:47b:dfd7:e888 with SMTP id
 y135-20020a627d8d000000b0047bdfd7e888mr22840790pfc.42.1635282305690; Tue, 26
 Oct 2021 14:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211026145509.1029274-1-philmd@redhat.com>
 <20211026145509.1029274-2-philmd@redhat.com>
In-Reply-To: <20211026145509.1029274-2-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 26 Oct 2021 18:04:39 -0300
Message-ID: <CAKJDGDYOh=wjEKTWQhtfJBWm5VqLDRT5wfgmyoinqpuHN2Eijw@mail.gmail.com>
Subject: Re: [PATCH 1/1] gitlab-ci: Only push docker images to registry from
 /master branch
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 11:55 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Users expect images pulled from registry.gitlab.com/qemu-project/qemu/
> to be stable. QEMU repository workflow pushes merge candidates to
> the /staging branch, and on success the same commit is pushed as
> /master. If /staging fails, we do not want to push the built images
> to the registry. Therefore limit the 'docker push' command to the
> /master branch on the mainstream CI. The fork behavior is unchanged.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  .gitlab-ci.d/container-template.yml | 11 ++++++++++-
>  .gitlab-ci.d/edk2.yml               | 11 ++++++++++-
>  .gitlab-ci.d/opensbi.yml            | 11 ++++++++++-
>  3 files changed, 30 insertions(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


