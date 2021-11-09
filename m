Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E4944ACA3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 12:32:49 +0100 (CET)
Received: from localhost ([::1]:56504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkPMu-0004Xq-8Z
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 06:32:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mkPKs-0003WX-Hq
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 06:30:42 -0500
Received: from [2a00:1450:4864:20::429] (port=34622
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mkPKq-0008Fh-JL
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 06:30:42 -0500
Received: by mail-wr1-x429.google.com with SMTP id d5so32410813wrc.1
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 03:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=UWgV/XXfxlUTALJL4pjNEJkResIzVkSATyWF4RXq3us=;
 b=IbykXoSnwZSYuqzChZqpCO1Ld3/v0aelrH1n4Kc0xnNvpEhFIOe0T2rpvQeAsn9+Mh
 w3ZwToNg7vA4k3m3kPPNdrWbAwqV8LoWEJOqZTdSB2YwsyAUpXsHNHwvi7IeysclNIja
 wWD79a3NDOQ201m/AGTAGOyG1eaK8l5gbYi/2v/Lo+rQdjU0ov4AOEk7+AA3cFKJV0UC
 ZXBq8hSOYPJmrGpZCGb/bMdqBxFZd0YlKLl10+5w+RlbcfW7V6cLIujU0zCjruxDUbgN
 Zs1ZkXkxu5mfa/OG4bbxrAk3CCRQ0Cg006p7iqCGHRRGo/OvYXKDfJ7Sg0FtxfO0uyTw
 fjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=UWgV/XXfxlUTALJL4pjNEJkResIzVkSATyWF4RXq3us=;
 b=N42AxwA9k9OkTv208N9RUHyiuh4jNqWiWSrNbIHUhUTEGn0vWFl6XkqQ9xmg1fZEBT
 jucWSlzCOZrVdyOuaxHOB9zFxs1YP6VIXGEFQ5goKMGzmB7DDho66215HUcqF2mNh9WL
 fYpEtQ6vgnJRUPdoEFMfBEucySfemWiFRIAm9HHjeEiM7eIJ7SjmiEhrCQIo4lq6KyJD
 z8kfyCw3n6nprDOh+GxT8GM7d8pDpceCKPuLYJLm2SrB66SMzju7z/WrWex6v7PkLZ1m
 uCmn068axCMkqMMjCD+wLibfiMqqY3dwJycvjJ+6ihBXGaVEZvF8GEuLLKAO8mJtXJ9x
 OIow==
X-Gm-Message-State: AOAM5300XTQVo0yqSrd4pcjYFnjR62iKMjru0c7/b9yyIgC7kKi0KvOA
 fKBZaJa6v2qugTI+3H81xnPdTg==
X-Google-Smtp-Source: ABdhPJydXK9tfoFKWhj2pgN5x54On30E39e19ooOysWolXkDxeS6Ka38xsBMKdhhO660DMJfqBdbTA==
X-Received: by 2002:a5d:64ea:: with SMTP id g10mr8465886wri.137.1636457438931; 
 Tue, 09 Nov 2021 03:30:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m36sm2430396wms.25.2021.11.09.03.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 03:30:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 965561FF96;
 Tue,  9 Nov 2021 11:30:36 +0000 (GMT)
References: <701011ce-8bc1-9e93-82ed-a4d72c70b2da@redhat.com>
 <4e540821-9bc2-77b5-ad70-ebc5df53e039@redhat.com>
 <YYpF4coXvnStffD5@redhat.com>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: Cirrus-CI all red
Date: Tue, 09 Nov 2021 11:27:42 +0000
In-reply-to: <YYpF4coXvnStffD5@redhat.com>
Message-ID: <87fss5k1lv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-devel <qemu-devel@nongnu.org>, Yonggang Luo <luoyonggang@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Nov 09, 2021 at 10:45:18AM +0100, Thomas Huth wrote:
>> On 09/11/2021 10.39, Philippe Mathieu-Daud=C3=A9 wrote:
>> > FYI, as of today, the latest merge history is red (last 10 days):
>> > https://cirrus-ci.com/github/qemu/qemu
>> >=20
>> > If we want to keep using this, we should somehow plug it to
>> > GitLab-CI (i.e. Travis-CI is run as an external job there) so
>> > the project maintainer can notice job failures.
>>=20
>> Well, considering that all the cirrus-run based jobs are currently faili=
ng
>> due to the non-working API token, that does not seem to work very well
>> either.
>
> Who owns the API token ? For other projects, this was addressed a while
> ago by refreshing the token. I would have tried this myself for QEMU
> but I don't have privileges on the QEMU projects in github/gitlab.

OK I've updated the token (after I figured out the path to it):

  - top right, Settings
  - scroll to bottom "Your GitHub Organizations"
  - click gear icon
  - scroll to API settings, click Generate New Token

It seems to be triggering the builds now although GitLab still reports
failures for some other reason now.

>
>> > Alternatively the windows job could be passed to GitLab:
>> > https://docs.gitlab.com/ee/ci/runners/runner_cloud/windows_runner_clou=
d.html
>>=20
>> See:
>>=20
>>  https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg02474.html
>>=20
>> ... the problem is again that the shared runners are only single-threade=
d,
>> so it's incredibly slow, especially if you have to re-install MSYS2 each
>> time. I once tried to improve the patch by caching the MSYS2 installatio=
n,
>> but it did not work that well either... (but if somebody wants to contin=
ue
>> my work, I can rebase and send it out again, just let me know).
>
> Potentially this is something where we can make sure of the Azure credits
> QEMU is getting, though it would require someone to figure out shared
> runner integration and maintain it...
>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e

