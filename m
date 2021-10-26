Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9FB43BBE0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:53:59 +0200 (CEST)
Received: from localhost ([::1]:53172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfTSI-0001Za-6u
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mfTPb-0007Tq-MG
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:51:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mfTPZ-0004b7-FN
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:51:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635281465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JSE5bhA+8kwNfrcTOGdZDdnIz/5IAxwQWR8kJI66clY=;
 b=hSS1vXCYee90PQcX/NWieBzYXA5y65zi5LdpMWT95kLCSFALoSCtAbRuzj2tog6TVxEdls
 TXrmH5OQedOVskBAOmRv2H22Se/vnGrK5yc+2F47g3C5PM6rDQqTr1hAyY3NVaI6ruNfec
 cCDL/P4ae83rsfN5KljeWJZ6p28g1QA=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-asSnePp1MzCYxRxI0ceGxA-1; Tue, 26 Oct 2021 16:51:03 -0400
X-MC-Unique: asSnePp1MzCYxRxI0ceGxA-1
Received: by mail-pf1-f199.google.com with SMTP id
 w13-20020a62dd0d000000b0047bce3ae63bso349888pff.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JSE5bhA+8kwNfrcTOGdZDdnIz/5IAxwQWR8kJI66clY=;
 b=PgMAyrpzLZC0lzNTCEaGhFC3a2MMryAQOPgttKj6PKmWdobtbGWhZumzuVoQ0agd4z
 kC1uMOAAs2hLeHGdp0W6wrstzyfRcKDGL6aRnLtitPm9VY5psX5aRqKYFq3/6+aznevs
 qn400i024A70FmDkh1PgQdGW0FpDGc9FKh4mCfGCMHLNNLy1Ze9Pg5DxQ+yqrgAMLbUU
 W6+qTmFedBE6mLT0InfFTuTm4Hn2NAs2VLn6RyeP+47C1AuO5SK9L5fTKLPOFkp1XYZr
 OiiS7t0AvQT37eVFF48p5ee3VKXxcqwnghwY4LMTc2yK4/jDov4nSJQibXoV+j7EnxZI
 y/Rw==
X-Gm-Message-State: AOAM532QyzGPrJWGVfjT+22miDmS2ptcVXvGX5IUkIcrxymd0c838ekV
 xXHX3wn2/mkbKzX9NhxofdsupEU61d1NYuZkR3ojqIJv21VqaSVGiLmXXWOuHZvpX9wlOSVN2U3
 CZJVm+2sBfWAZsa79GdDMEvCwKGlBZzg=
X-Received: by 2002:a17:902:a702:b029:12b:aa0f:d553 with SMTP id
 w2-20020a170902a702b029012baa0fd553mr24194159plq.3.1635281462577; 
 Tue, 26 Oct 2021 13:51:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2sRTa92sPIFAOakW6N9TVb47qieokLzP+VQcUHX8XOQlO7mBHuzfnYCoiRBtpaR7PBbkmqcZbeNojayPPo/I=
X-Received: by 2002:a17:902:a702:b029:12b:aa0f:d553 with SMTP id
 w2-20020a170902a702b029012baa0fd553mr24194118plq.3.1635281462311; Tue, 26 Oct
 2021 13:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-7-alex.bennee@linaro.org>
In-Reply-To: <20211026102234.3961636-7-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 26 Oct 2021 17:50:36 -0300
Message-ID: <CAKJDGDbzTbCZswmTUzF=QQuVxqScs_kXU-Ckk2NYsq20=6JktQ@mail.gmail.com>
Subject: Re: [PATCH v1 06/28] tests/docker: Add debian-microblaze-cross image
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 Daniel Berrange <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, kuhn.chenqun@huawei.com,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, robhenry@microsoft.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 7:22 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> From: Richard Henderson <richard.henderson@linaro.org>
>
> Build the entire cross tool chain from source.
> For this reason, default to caching.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> [AJB: Update MAINTAINERS]
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20211014224435.2539547-7-richard.henderson@linaro.org>
> ---
>  MAINTAINERS                                   |  1 +
>  tests/docker/Makefile.include                 |  6 ++
>  .../build-toolchain.sh                        | 88 +++++++++++++++++++
>  3 files changed, 95 insertions(+)
>  create mode 100755 tests/docker/dockerfiles/debian-microblaze-cross.d/bu=
ild-toolchain.sh
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


