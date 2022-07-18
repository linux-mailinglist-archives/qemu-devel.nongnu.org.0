Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BDC578B2B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:48:08 +0200 (CEST)
Received: from localhost ([::1]:42594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDWit-0006KM-35
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oDWCh-0001Tc-7x
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 15:14:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oDWCc-0003EZ-Tm
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 15:14:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658171685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MsP6VVGIeJgRi0CNU78atvESZ/zNJlP1c2EJIJntnE8=;
 b=hJDEe1ZqvCu+UiqsqMbbiWRaLAMMy2+H+E8dVKg72j6ufmPXYO4eUT6kirAxyLARx4WRXP
 9fdGRfHH5blJH/vjvGYguf/f2li3ZC7QDvXZMGOgVoSJqY58/My2zS4YTHX2qZKYFyiLFj
 F5/tAOPCCSkscX58PL9PmzDm64J3OrM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-9TxybqvtOA-dTpNtcSJp2Q-1; Mon, 18 Jul 2022 15:14:44 -0400
X-MC-Unique: 9TxybqvtOA-dTpNtcSJp2Q-1
Received: by mail-qv1-f72.google.com with SMTP id
 p6-20020a0c8c86000000b004731e63c75bso6073552qvb.10
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 12:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MsP6VVGIeJgRi0CNU78atvESZ/zNJlP1c2EJIJntnE8=;
 b=4MtDuAluK4jhaG29+G51DkFDulwqFmKgf+J96jX54mojktY8QwixQ0oD7CFiI5mKcf
 0X3EkyuNhpe5dI9UNHFeSeAqMEL3ADJS/69lC+S2sY8E6C4tqohmjJBvH0rD4SZgxRiZ
 UfC99f2ASdjkYDcbZ6OKWjFFg9Etzz+FfJvHMb2RLFxfTRJGHmvTWUjJDFVqGsNDO1JO
 QmOcZdt2lL+adg6xOeX4Lxlfepl2GFxdbj4Bl4Co7ENLIsIl+zWqCh0e7FTNT7LSXMv2
 Qmpp/zO1t3l065/+iCmrWsn+aKJY3469dAHrW736kGcOLntysPflcGghBkLlY5/k5O9A
 1N0Q==
X-Gm-Message-State: AJIora+eDsKPT5VgLXckrew4wG3Vk/f23fR7FBZPi9Dj6U+TZZ0dBnQ6
 RP/UHz76Ob/QHuSuAcMyIJ0sqg/x/BqxSABYEI2R5Lhsd+yJE0iU1p+lhWIU3OggdUSJgztooYO
 5wBByB6koie7Nrrg=
X-Received: by 2002:a05:6214:246a:b0:473:7eaf:280b with SMTP id
 im10-20020a056214246a00b004737eaf280bmr22268211qvb.17.1658171683344; 
 Mon, 18 Jul 2022 12:14:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uTZQVQWwPPMZVWjNeORj3DyYm0bqQwOD8yJrGVuJKq/6cQX+6HQxENztTPPxMf6YSBirlBYg==
X-Received: by 2002:a05:6214:246a:b0:473:7eaf:280b with SMTP id
 im10-20020a056214246a00b004737eaf280bmr22268197qvb.17.1658171683129; 
 Mon, 18 Jul 2022 12:14:43 -0700 (PDT)
Received: from xz-m1.local ([74.12.30.48]) by smtp.gmail.com with ESMTPSA id
 bm8-20020a05620a198800b006a67d257499sm12381444qkb.56.2022.07.18.12.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 12:14:42 -0700 (PDT)
Date: Mon, 18 Jul 2022 15:14:37 -0400
From: Peter Xu <peterx@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] tests: migration-test: Allow test to run without uffd
Message-ID: <YtWxHSjpORK31aLs@xz-m1.local>
References: <20220707184600.24164-1-peterx@redhat.com>
 <bcd9b961-d1b5-e334-5bb1-7ee56be29725@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bcd9b961-d1b5-e334-5bb1-7ee56be29725@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi, Thomas,

On Mon, Jul 18, 2022 at 08:23:26PM +0200, Thomas Huth wrote:
> On 07/07/2022 20.46, Peter Xu wrote:
> > We used to stop running all tests if uffd is not detected.  However
> > logically that's only needed for postcopy not the rest of tests.
> > 
> > Keep running the rest when still possible.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >   tests/qtest/migration-test.c | 11 +++++------
> >   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> Did you test your patch in the gitlab-CI? I just added it to my testing-next
> branch and the the test is failing reproducibly on macOS here:
> 
>  https://gitlab.com/thuth/qemu/-/jobs/2736260861#L6275
>  https://gitlab.com/thuth/qemu/-/jobs/2736623914#L6275
> 
> (without your patch the whole test is skipped instead)

Thanks for reporting this.

Is it easy to figure out which test was failing on your side?  I cannot
easily reproduce this here on a MacOS with M1.

Or any hint on how I could kick the same CI as you do would help too.  I
remembered I used to kick the test after any push with .gitlab-ci.yml but
it seems it's not triggering for some reason here.

-- 
Peter Xu


