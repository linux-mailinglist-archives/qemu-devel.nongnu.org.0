Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE63369250F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 19:10:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQXqD-0006C3-Kr; Fri, 10 Feb 2023 13:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQXqB-00063J-AQ
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 13:09:43 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQXq9-0001Wn-K2
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 13:09:42 -0500
Received: by mail-pg1-x529.google.com with SMTP id c29so147458pgm.5
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 10:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676052580;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dJOH2hnK+z41/YaNqhQ23qcjboxqg2FAZcHE82d7tag=;
 b=WIp7Bb8PzIXaTwwix+tLKLyCnLP2/63dL922me0Z9NBNsk2Kh7aUxF5/gQLl3Fl8as
 JRk3aLntBre7AbL+8gqLYdlkqaWF+okXg3/PK+vlrDSZ4qj9owMIdKplN3smKRl8JQlT
 D9K1VeKv2EbzV4GqxfbUzA0XY0FoOcEcjZpOGvQptQb1Takl9bTtb0lOg6BihWNMs28+
 P2E/RfoT7F7WNME6zaHcOTd6qemyJWcWGWEZTR04qfKVqCC1/mlT14Hwok8YJ+50D03T
 BgVMtB9CkN9pK/niq2GNwtWcuHJlNMjEs90kvtFQY4kUPH7Jb6yj0Yr3LNUVTmyrxgWD
 lYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676052580;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dJOH2hnK+z41/YaNqhQ23qcjboxqg2FAZcHE82d7tag=;
 b=6Y8yUEwepBh3teCxpy+riqX7zxvs1u7EuAcSW+UX5qE4V68gv/LkypdhGEdeW48i94
 RrGka8JvLmLZPDPNkciYqq/u2U1z5oFuuGH+DybbDoQYEYozTZZX8QfClaLx/L0t61uz
 KDei0fmeSw2za8aWl8zAhMJ6yiBrMgdTn7etmj6F3W/SUq9KXCDU1GqpCdYD1UuhO5VI
 J0R95eZRgVvsI46LPeHcL0FvGESdG5JUYAi2Q6OuiZeVIwSjj8a9t0o7AzRfgkeC35CA
 LCxJ0NOyWk7SHuqIFGZj4DBGkqK5bVheWQK6KinhUHHxeTKOtlQfw/O6NuZwd1f7E24Y
 POEQ==
X-Gm-Message-State: AO0yUKW2XTGxBc6k7rsvw8kuPjDgUW+rL5PrlBfawpcyR/zD+X7T/QWh
 38dGXyOMi9hOp+d6I8fZBHahoA2FGXzkV2e3LDB+tg==
X-Google-Smtp-Source: AK7set+fqMWtThJmConv6I+EWQcUC9D3Qb4Rli96XHEsIudTTSimu1WANYnBzb5iQWpD1SaqDx493boxARUxPtiycJo=
X-Received: by 2002:a62:1c8c:0:b0:593:ef2a:5ea8 with SMTP id
 c134-20020a621c8c000000b00593ef2a5ea8mr3303990pfc.7.1676052580174; Fri, 10
 Feb 2023 10:09:40 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <CAFn=p-aLGgf-tWA5kXeTXWjKicCb+T0MZ3M6eFEP3YQxf4MKPg@mail.gmail.com>
In-Reply-To: <CAFn=p-aLGgf-tWA5kXeTXWjKicCb+T0MZ3M6eFEP3YQxf4MKPg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 18:09:28 +0000
Message-ID: <CAFEAcA-FhKp7EitQ016dNc_6epra--pqnVOC8XtEdLEJnCZdXQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x529.google.com
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

On Fri, 10 Feb 2023 at 17:55, John Snow <jsnow@redhat.com> wrote:
> (The problem with just allowing sphinx to be a black box and
> continuing to happily use the 3.6-based versions is that we are
> using QAPIDoc extensions from our own codebase, which would lock
> those to 3.6. A big motivator for Markus is dropping some 3.6
> kludges we're carrying for qapi, so I looked to the opposite
> solution - nudging Sphinx forward instead.)

Mmm. Where on the pain spectrum does "allow python 3.8
because CentosOS ships that, except that where our python
code gets run via Sphinx that part of the codebase must
retain 3.6 compatibility" sit ?

thanks
-- PMM

