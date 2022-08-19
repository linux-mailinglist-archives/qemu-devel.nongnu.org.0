Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C0A5999BA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 12:28:40 +0200 (CEST)
Received: from localhost ([::1]:43540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOzF0-0003r7-Ha
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 06:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oOzBI-0001CA-Dn
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 06:24:49 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:53840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oOzBE-0003wy-Ia
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 06:24:47 -0400
Received: by mail-wm1-x329.google.com with SMTP id h1so2072065wmd.3
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 03:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=3wo3LxGAV1L5FpJERnFaOwp0MYyEvKEcg4qfIYFY9ww=;
 b=Kv7ELLXZ+3SVVsZpctv94nmlDy0p/OdBmWoBdWd/ua2HGbPBHnrrjMP7Qj/cy5OtLS
 CYyANS57ZPN6RrDoZGXERtV1M/ONgbdbGL4qIcneIeqDyzXH/jmWlu3y2wSKH0ChS2P5
 PyQWqFTTx4hhINUuKtevIDhV6jgtIeqlYflGU+qskI/BXefhi3lLJQJbMmzyuVcYgOWu
 o8oQfL3VNcCfC0OOhgL+YPVnnY/d6jAdhAjMwOCIA01oPyijhYx/08S1Ay9+9LcK+7PK
 bUgkCsJEvF3mZtLq2YtHBJpIHlW7IbfgSOEzf/RqMLrfZh2bQnaBJYg+RiNa+omh1f66
 IhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=3wo3LxGAV1L5FpJERnFaOwp0MYyEvKEcg4qfIYFY9ww=;
 b=mIzFg6UI6G7SoSzWSvP35uA314x4nE6oeOuLoWB/lN5gtWNCOthYoz0EyIveUjKGYB
 iX7l1x0bMnPM26XpLh4v43j5AKaZPHLOopmIuwPwZ4j78NCkGibKp6h7iE1HGcGecjc0
 SNlPuyCGiEjhCES5AfIDr0bxEAAF68w8qWOPc1gfU4gY+O4NmQF9JxA1Qae2hLBWsooL
 ir4YZYMKUNyGJxl/zowPandkBdexqgTtlIWT/JUWofWd+XzBRVByDbOWY8cJ7YfR60d8
 1AlMUgqEaVpyrGQoThl/umLpEQmOYdsCuY5RsCwhOZjqaKhimDXmKdGAS8ddxE1Rl4vK
 JsXw==
X-Gm-Message-State: ACgBeo33vzhxtGgvrflw91gHLfuQOGz3cuR3S7VQW1XfxLsNrqVZDJQT
 2CDvy96V8nPEY/Q1DyckksAwMg==
X-Google-Smtp-Source: AA6agR4IDNrm9OWHllhuB0XDgW70vQ6xxOfbj2+4Hs+twUXCwGMn+ZP+J72VkaVKUNanU5Nh1MSrbg==
X-Received: by 2002:a05:600c:3d05:b0:3a5:dd21:e201 with SMTP id
 bh5-20020a05600c3d0500b003a5dd21e201mr4343882wmb.132.1660904681842; 
 Fri, 19 Aug 2022 03:24:41 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b16-20020adfe310000000b0022159d92004sm3514673wrj.82.2022.08.19.03.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 03:24:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2DBF01FFB7;
 Fri, 19 Aug 2022 11:24:40 +0100 (BST)
References: <20220817034630.1600434-1-bmeng.cn@gmail.com>
 <87zgg2rpu5.fsf@linaro.org>
 <8c005cf6-24c0-bdbc-e892-3a4c520bb0ad@redhat.com>
User-agent: mu4e 1.8.9; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, Beraldo Leal <bleal@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] .gitlab-ci.d/buildtest.yml: Increase the
 check-gprof-gcov job timeout
Date: Fri, 19 Aug 2022 11:23:57 +0100
In-reply-to: <8c005cf6-24c0-bdbc-e892-3a4c520bb0ad@redhat.com>
Message-ID: <874jy84jkn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


Thomas Huth <thuth@redhat.com> writes:

> On 18/08/2022 09.07, Alex Benn=C3=A9e wrote:
>> Bin Meng <bmeng.cn@gmail.com> writes:
>>=20
>>> Current project timeout is 1 hour, but the check-gprof-gcov job never
>>> completes within 1 hour. Increase the job timeout to 90 minutes.
>> I've tried to do some data mining on this test which seems to
>> indicate
>> that the average successful completion time for gprof-gcov is 27 mins.
>> So it seems the sometimes *something* causes it to run a lot more
>> slowly. I wonder if increasing the timeout just masks the problem?
>
> I think it's very certainly the migration test that is causing the
> timeout now. In former times, the test was skipped, see e.g.:
>
>  https://gitlab.com/qemu-project/qemu/-/jobs/2795092179#L48
>
> Since commit 2649a72555e the tests are run and take ca. 2 * 20 minutes:
>
>  https://gitlab.com/qemu-project/qemu/-/jobs/2798625330#L48
>
> That's why I started a discussion here for how to reduce the amount of
> time of the migration tests in the CI:
>
>  https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01219.html

OK I have queued to this patch to testing/next while the discussion is
had. I'll update the commit message.

--=20
Alex Benn=C3=A9e

