Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4C243BBDD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:52:06 +0200 (CEST)
Received: from localhost ([::1]:48274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfTQT-0006b9-PW
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mfTLd-0003eX-Pd
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:47:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mfTLY-0002z7-FU
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635281219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BNzYoiE6nEPNT7ejTjcHogSvevgIPT8uDwhZdKZC8Uo=;
 b=UydI1WwJYAVNNvQqZ/lMbd3O6Mqr0POAeDrQzFH3RArXlN1Lqlvn4FIIpj44gZQI6F3Mpp
 P0BRzFIB1JZCofGC+NHbCZqMHcMvYJIlS13drFlheZBowNiNGUyQcDhrdaRSmTmqpqjgId
 dszXpegUCukgtwmiQpjH2mA6+deIET4=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-PApIFTFZOqyUujR-35kymQ-1; Tue, 26 Oct 2021 16:46:55 -0400
X-MC-Unique: PApIFTFZOqyUujR-35kymQ-1
Received: by mail-pf1-f198.google.com with SMTP id
 x25-20020aa79199000000b0044caf0d1ba8so348652pfa.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BNzYoiE6nEPNT7ejTjcHogSvevgIPT8uDwhZdKZC8Uo=;
 b=XxI9ssbrQ1KiAKsCGzOz/xKAZB+vHXYjrzI5ohVJcqEGzjqMJ6C0J0R9zqDEYjNMBA
 1UXl8SKe3iAHNkfQ9cq/KB/Sq0sKRv0nYyBiCrOCpAcx7CPHmNEwB0HXRVolN9cSr86W
 I9bj+ACDpAUoOfMaZCkfsSJG653IAwRStOJRhMxUK9miDwYYsIS0shTmEtLoCrFTc7nB
 qyxKsLuVbWZUeIdjPXAdIdFccUFKO8WAcRZiI96fxAfIxZsJmv2cbcGPuEslj9saPw+V
 WOUNvkpgFTmN/0s9XTEzQxV2i4aJjEN8RfZlqjiHOLzE3I8gAfVyheqwnkLpog7yWpSc
 J3Mw==
X-Gm-Message-State: AOAM533n+bGYhEKhkXLl+8B+kGYPZUSWskSaohiuooNHfSPQA1mg9SDd
 ++Gg6AOQTPBjJMwSH5wl4q0mXv3ijUvjOmnOblcO6rGACETplWN7S35gm+B6E4f6JpdDP3wSuqi
 lf/0u8m6sjltehB8xa8RazEkUmGambV4=
X-Received: by 2002:aa7:81c2:0:b0:47c:1d4:67f5 with SMTP id
 c2-20020aa781c2000000b0047c01d467f5mr11770346pfn.38.1635281213963; 
 Tue, 26 Oct 2021 13:46:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJpH4miZraLraHRUoKnJLbHGE85NVNCTxQtw6vVl9MU41eUGpfQplscT5TlLoDRe5f2M9Vd5I3NWGVc8zGoNQ=
X-Received: by 2002:aa7:81c2:0:b0:47c:1d4:67f5 with SMTP id
 c2-20020aa781c2000000b0047c01d467f5mr11770318pfn.38.1635281213632; Tue, 26
 Oct 2021 13:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-5-alex.bennee@linaro.org>
In-Reply-To: <20211026102234.3961636-5-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 26 Oct 2021 17:46:27 -0300
Message-ID: <CAKJDGDbXWXkghYKt+XOeBF7HLFQ962wwgQoyHzFy0iGWehi9Og@mail.gmail.com>
Subject: Re: [PATCH v1 04/28] gitlab-ci: Remove special casing for hexagon
 testing
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 Daniel Berrange <berrange@redhat.com>, kuhn.chenqun@huawei.com,
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
> Now that the hexagon container is using a pre-built
> toolchain, we do not need to make the build optional.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20211014224435.2539547-5-richard.henderson@linaro.org>
> ---
>  .gitlab-ci.d/buildtest.yml       |  4 ----
>  .gitlab-ci.d/container-cross.yml | 27 +++------------------------
>  2 files changed, 3 insertions(+), 28 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


