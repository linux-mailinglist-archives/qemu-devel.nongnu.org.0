Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1BA3E4C18
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 20:27:28 +0200 (CEST)
Received: from localhost ([::1]:57458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD9zj-0004Kr-0G
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 14:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD9yr-0003dB-OK
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 14:26:33 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:38686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD9yq-0005Zz-4J
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 14:26:33 -0400
Received: by mail-ed1-x52c.google.com with SMTP id y7so26018522eda.5
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 11:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qPrzg6Wvu4NiB+i+/3exmtaTv4Bc/oWl/UNMvqSKrqY=;
 b=GrKi27j1K9Tq1oVGPMA9CQvyauKUZ5k0zvpnAR/PzO75/dB08ymisjUDtNuwJhFe7G
 1yUo9L60rbYzOdd2tRzNND4A1eOEIT+XufOg+3h1diYau+IuChVTAFb1HBrFQKeEKGFw
 SZHmjlmce4gHkRRr3GzCNMxGelrBQ1Qy9aFZbm1Ji6fqD14qU0BeKkaop6LTGgtAdr7o
 YFSJFbJN1UXcK023w9tO15hi+j0CK5vUI5mh7mu485U94BH7CO9FhDV8s4qmTqfB2jMJ
 vK999SF7Q8iQ18dHzxzj9vm8kZZpFIVEuXX5SKfany77bP39eW5RtE2K3W1m60PHdoZo
 Mq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qPrzg6Wvu4NiB+i+/3exmtaTv4Bc/oWl/UNMvqSKrqY=;
 b=DlFT5/VwhKyC26w9UzbLWxtwp0upZcj9aHB2EVioOCCEwWMa0IurCzjsz0zB1UPJ8b
 Y7K39K9GM1rPIsRYNyjxMv3hl3NL2HviShZefkxYEQEQeKibH3VBooPmQPP+SzIxY8il
 Hb0VVccONpiKDpZXxocz+ix46KGusJ1iJirono0kJ9FDTft5hILkAcvUtN0YobMtPy2D
 JfnBVqHBXj9N/EPdWpRbW6+LO7OywhglAGjArKSP96BSF8oKjQQS7yhqct8IAb5nYGGB
 +xE6Mcx4uHj4PItftC94aY6c11AFErLvC7T/0MOqm8pabVfMytD9vHHznHbBCtXcKXMS
 L9eQ==
X-Gm-Message-State: AOAM5315uN4fgvBoctgcVObpKNnvHGrQKaOVZQUFQJHSsILyjb7e9U/h
 GKIbPhCbNYr0HsQSY5PicM4LTTlHTI2ixRaiySwbiQ==
X-Google-Smtp-Source: ABdhPJx57PH1KdD6aReHCcnkVOhMOxV4XeMTcRB+vadIEpk6O/MRamhzKEftHmW+U8VMxd4EQ7ukL+x2WQ79HO1SHvE=
X-Received: by 2002:a50:f615:: with SMTP id c21mr32196660edn.146.1628533590232; 
 Mon, 09 Aug 2021 11:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210809111621.54454-1-alxndr@bu.edu>
In-Reply-To: <20210809111621.54454-1-alxndr@bu.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Aug 2021 19:25:45 +0100
Message-ID: <CAFEAcA8F07vzmOGdTEcQeemGCszDU3nCWH7ehvkBWWQMxm8QgQ@mail.gmail.com>
Subject: Re: [PATCH] fuzz: avoid building twice, when running on gitlab
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Aug 2021 at 12:18, Alexander Bulekov <alxndr@bu.edu> wrote:
>
> On oss-fuzz, we build twice, to put together a build that is portable to
> the runner containers. On gitlab ci, this is wasteful and contributes to
> timeouts on the build-oss-fuzz job. Avoid building twice on gitlab, at
> the remote cost of potentially missing some cases that break oss-fuzz
> builds.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>
> From a couple test runs it looks like this can shave off 15-20 minutes.
>
>  scripts/oss-fuzz/build.sh | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)

I tried a test run with this, but it still hit the 1 hour timeout:

https://gitlab.com/qemu-project/qemu/-/pipelines/350387482

-- PMM

