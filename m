Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FDA686DA8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 19:09:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNHWE-0008FC-4G; Wed, 01 Feb 2023 13:07:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNHWA-0008Eh-Ra
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 13:07:34 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNHW8-000074-SO
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 13:07:34 -0500
Received: by mail-wm1-x32f.google.com with SMTP id n13so6309294wmr.4
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 10:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UhzA51HxGfSVxF4+bvqWtKT2MaGpjfFwb4+VgcFmUTk=;
 b=uoKHrjNxraPvJH4DdveQBHu2vRUJuYl1JV+bvIm8VNhzeZm+9adpSX5vAXEAjGv4Bh
 95UeThhMTDz94BXKHw1Djux3ZpNE8vcNyoLxeVIOU9qtB21iKV78pYUQ01c1yL9HerM5
 V9d/vaMhu+gSa5dorRU0+jQ4OP3mHnBO50ige5ZmcVZhbv09NWL9178D0E5tyMfTjUNA
 j942niEJMxuiWayZ4pnAJB+9U5Q+9UMM4C6UgguAP9+5hzK3MCbYe6U25Wninm1A69uT
 q7CwyWnYYZcuRU1fw858y2o06yHxr2WSE0XEuXDDDgI3dlAIQmal74v0f0VrgN4O8ORi
 hWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UhzA51HxGfSVxF4+bvqWtKT2MaGpjfFwb4+VgcFmUTk=;
 b=W/N5pw8NSkt9tWaEDBUkPgdYb5Ys7BYhl10yoGAFyWfonyPGWs/EEIwQdbkfQB3a8f
 5SJ5NFMc7xZ6RFux4Z7nrcfQa51V3JSq3XPTh2QMmChy5nWYEv6eFd0wyNzF5UbJKr07
 Xo9FHjggBmEQ70ovCSjzqe4qHDQHA7vTGuWmCZ7Wtiq9gh5ZO3X8HnlJDA+B7bAuxAma
 +xdEqfsUkWLKpzr4f/Jg4kr9sN148+09ZF6dflFPX+MbfjlLdu6pfKlL/jgQ8uCRtBQC
 AZ2bypf0iXCB34sr/qpf7UX4hBn7V6CDtAjLc6xWkkYtAtzaGFpX3kKukPvllqWyrPr0
 QP2w==
X-Gm-Message-State: AO0yUKXyfYRGIiDfyKNBHfe8XpSYh337aXON8UUUDDWf9T0kNyxcVLPI
 oWm3i4HiD6M++JIbtd/7cvPuFQ==
X-Google-Smtp-Source: AK7set+IHokY9UfaRUTUNX4N/SOghjx9G47hUIbuMk+Mq13P4lSvPQDOOpgbucCbIvlkSDVXDtWmKA==
X-Received: by 2002:a1c:f307:0:b0:3dc:50be:9206 with SMTP id
 q7-20020a1cf307000000b003dc50be9206mr3218236wmq.4.1675274850551; 
 Wed, 01 Feb 2023 10:07:30 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t16-20020adfe450000000b002bbdcd15e44sm17462959wrm.37.2023.02.01.10.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 10:07:30 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AE6201FFB7;
 Wed,  1 Feb 2023 18:07:29 +0000 (GMT)
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
 <CAFEAcA_TCHw2b=zOWOX7COLa-iqC1P8Bm1wiACKhmx32cuS8SA@mail.gmail.com>
User-agent: mu4e 1.9.19; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/35] Testing, docs, semihosting and plugin updates
Date: Wed, 01 Feb 2023 18:06:59 +0000
In-reply-to: <CAFEAcA_TCHw2b=zOWOX7COLa-iqC1P8Bm1wiACKhmx32cuS8SA@mail.gmail.com>
Message-ID: <877cx11cpq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 26 Jan 2023 at 11:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The following changes since commit 13356edb87506c148b163b8c7eb0695647d00=
c2a:
>>
>>   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu
>> into staging (2023-01-24 09:45:33 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/stsquad/qemu.git tags/pull-jan-omnibus-260123-1
>>
>> for you to fetch changes up to d200653282f50df2a994a0609f88baa6a5889f80:
>>
>>   plugins: Iterate on cb_lists in qemu_plugin_user_exit (2023-01-26 11:1=
2:01 +0000)
>>
>> ----------------------------------------------------------------
>> Testing, docs, semihosting and plugin updates
>>
>>   - update playbooks for custom runners
>>   - add section timing support to gitlab
>>   - upgrade fedora images to 37
>>   - purge perl from the build system and deps
>>   - disable unstable tests in CI
>>   - improve intro, emulation and semihosting docs
>>   - semihosting bug fix and O_BINARY default
>>   - add memory-sve test
>>   - fix some races in qht
>>   - improve plugin handling of memory helpers
>>   - optimise plugin hooks
>>   - fix some plugin deadlocks
>>
>
> Hi; this fails the docs build on macos 12 (probably a difference
> in behaviour across Sphinx versions):
> https://gitlab.com/qemu-project/qemu/-/jobs/3697858012
>
> FAILED: docs/docs.stamp
> /usr/bin/env CONFDIR=3Detc/qemu /opt/homebrew/bin/sphinx-build -q -W
> -Dversion=3D7.2.50 -Drelease=3D -Ddepfile=3Ddocs/docs.d
> -Ddepfile_stamp=3Ddocs/docs.stamp -b html -d
> /private/var/folders/76/zy5ktkns50v6gt5g8r0sf6sc0000gn/T/cirrus-ci-build/=
build/docs/manual.p
> /private/var/folders/76/zy5ktkns50v6gt5g8r0sf6sc0000gn/T/cirrus-ci-build/=
docs
> /private/var/folders/76/zy5ktkns50v6gt5g8r0sf6sc0000gn/T/cirrus-ci-build/=
build/docs/manual
> Warning, treated as error:
> /private/var/folders/76/zy5ktkns50v6gt5g8r0sf6sc0000gn/T/cirrus-ci-build/=
qemu-options.hx:161:duplicate
> label machine options, other instance in
> /private/var/folders/76/zy5ktkns50v6gt5g8r0sf6sc0000gn/T/cirrus-ci-build/=
docs/system/invocation.rst
>
> I think this is "you can't put labels in qemu-options.hx,
> because it gets included in two .rst files (invocation.rst
> and qemu-manpage.rst), and Sphinx complains about the
> duplicate labels, even though one of the two files is
> only used in the HTML and one is only used in the manpages".

Oh boo - anyway to work around that because they are helpful links?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

