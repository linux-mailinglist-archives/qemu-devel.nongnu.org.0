Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012403A158D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 15:25:27 +0200 (CEST)
Received: from localhost ([::1]:50742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqyD0-0002ey-3W
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 09:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqyCE-0001zC-Kq
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:24:38 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqyCC-0001EX-W9
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:24:38 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q5so25511914wrm.1
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 06:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=t0y88kdDwlQyPMr9BtppQ3nZCLccKy3wlj1EyClCBRk=;
 b=RmbamrGKy1OKQolVrM1AuuOAN3M0nSNpw+YvFctKYa1r2dtqG7T6QVNlDcWpAiZFnB
 V7RpgDQyqScHgG5rdcTUEgVeaLmEbsdgDb65aWMuVt3Tn7OtiC2Y9hhoGk2ApINoGQjh
 r+EDOp3RuByYO6URVBppSidubHgq4dhlfeJI0DupQvmcCW0ERtWarQz4WfoVrblefOlZ
 mzSeQPa0nbH1wR0dlYVhI3fJkmpGP2Bsp7uCFv0qJWUxN2ILYgGCVyl4ruwoYo0BEq7F
 CG39LWY6cUJQCGAq4QTs8RwU+C3g471R70EwAumtr37HVz0z0NOLUnLvc6EoilQZewiL
 bhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=t0y88kdDwlQyPMr9BtppQ3nZCLccKy3wlj1EyClCBRk=;
 b=o8zPXc65Zu8c0RCPPhrwqTXxSDApH/lw5+29yxZZahedD4s0l0aJUd6UFEi7XHLfyd
 nL4B+WBH9258mMWRXyPDG/odvdNIyc+E3WeHw0ScZMilhzCxXj7/RpDC2WvOqRP5aUBr
 i17M+gFRVbPmvhDu7/rs4yCxBewOmNRuDcq8iusuQauylvAJes3cEjned6Utn+d1mNP5
 DaGL8rFSX0LbRsHlTEtjbjDdW5CrVSbE0LBZwD4Fmt2uBFO5EUBIW24hc64J00dkM0hv
 MUfJ0ArpR/FMPT8/QSie8Zs/EPL92W0xSo+6aWlv2IAJCJk/4QccLDq5KWjm+A/X9wJJ
 mjgw==
X-Gm-Message-State: AOAM532JXYCN6Rd2gTQtYQXpSLxQbxdDmjHYq0geM21gMNa7T6/32UID
 YKCvEwgMFDOk3PgGgY5qGDsk5Q==
X-Google-Smtp-Source: ABdhPJzebOewvEQJs7veoZfd9XoYdC/Q6ElssiwxOuICzlroRVl4LWzLNnN0y4mW4ROyZXPw8jd3Ug==
X-Received: by 2002:adf:ee52:: with SMTP id w18mr28441963wro.37.1623245075380; 
 Wed, 09 Jun 2021 06:24:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k36sm12207444wms.30.2021.06.09.06.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 06:24:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 70FD21FF7E;
 Wed,  9 Jun 2021 14:24:33 +0100 (BST)
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-2-crosa@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v6 1/4] Jobs based on custom runners: documentation and
 configuration placeholder
Date: Wed, 09 Jun 2021 14:24:28 +0100
In-reply-to: <20210608031425.833536-2-crosa@redhat.com>
Message-ID: <87zgvzi31q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E?= =?utf-8?Q?_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> As described in the included documentation, the "custom runner" jobs
> extend the GitLab CI jobs already in place.  One of their primary
> goals of catching and preventing regressions on a wider number of host
> systems than the ones provided by GitLab's shared runners.
>
> This sets the stage in which other community members can add their own
> machine configuration documentation/scripts, and accompanying job
> definitions.  As a general rule, those newly added contributed jobs
> should run as "non-gating", until their reliability is verified (AKA
> "allow_failure: true").
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

