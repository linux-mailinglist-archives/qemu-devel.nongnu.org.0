Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B512298E51
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 14:44:06 +0100 (CET)
Received: from localhost ([::1]:40872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX2n7-00044g-Gi
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 09:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kX2kI-0001cH-CN
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 09:41:10 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kX2kC-00007N-9S
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 09:41:09 -0400
Received: by mail-wr1-x441.google.com with SMTP id x7so12634367wrl.3
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=taR2hC8LHHB+RXm4WOny/v4myzxLN7EPkyO8nrr0e60=;
 b=PdllR3nzMgLmJegLJmvmNiq5kTbaJShUhzIsQ2NHsfT3mTJbvBbU4jkqEXswpWwj2D
 5ENmPiTTHePK8F6ISo+lZ+bW1ba02XQUuoOwA+9yCvPl+ZxQJSxUylVO+LnJy9dIs883
 ElWJOm6N78+qFDvYnF1I9JNrguPx2bE9z6LjlHrj9KsOJiUbp81Z+rSluW9pZnZbq4Mm
 77m0KKYi9jGR3Mv9hjdUmWDRWAW5NLlHkv9TgqEHaPuHY6i3bDJ5BzVcwrGDQh4kGtlu
 SbMp+wkPV/M42Oq3hzJGkcjF8uD55D9mT0g+wl0hveVQYokDvXNTsDiOw10uIst+u8/q
 N6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=taR2hC8LHHB+RXm4WOny/v4myzxLN7EPkyO8nrr0e60=;
 b=FYrXNrikwMTy+2YP4krpIpXcllFWnOyNjfOVqiY6fNlEAxpCDR9spu5nWFNrsikvBO
 Tp5NQ0gH38r/xQU58yUz5x+uqif2b98umyD/UbnGydcG3W1ncozObrlmtS0iFpiPHRPI
 O92wk7jfFIioPfGNI9edJqzrPq/jzf2YPKsnWXCH/LTn1TtID/jSId2RZvL+Ez960bKw
 5tuP5h6pEyRtRdHHfRGcgVeJJNdnRanZhH5jEN4xjrV0XWX7dfsVvXEaem7OOLChudB1
 5vhgWlAXgiGDVVlluCnYC6/QpLWk7Rg1YdU7ueNhP6zl7aetMzS+33+V3ug4lT5ecouA
 NbEg==
X-Gm-Message-State: AOAM532gjqRKA0xCMfinUEyconCm7mSbbhv3LV5rjcPbvbKf05AQ3i/5
 XcohQAot8nfUKQoawgIUh7Slc08bhPOlJw==
X-Google-Smtp-Source: ABdhPJx7M1/VrHe3cdMTGPIEr9r7F+6K6DaUEUa1HLNDH1Vq8AOpetWqCaaDgXcSZnnsoNv9HFt89g==
X-Received: by 2002:adf:8462:: with SMTP id 89mr17873817wrf.389.1603719662312; 
 Mon, 26 Oct 2020 06:41:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b63sm21916563wme.9.2020.10.26.06.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 06:41:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 692CA1FF7E;
 Mon, 26 Oct 2020 13:41:00 +0000 (GMT)
References: <20201023073351.251332-1-thuth@redhat.com>
 <87mu09glre.fsf@linaro.org>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/4] Test more "check-acceptance" tests in the gitlab-CI
In-reply-to: <87mu09glre.fsf@linaro.org>
Date: Mon, 26 Oct 2020 13:41:00 +0000
Message-ID: <87k0vdgl5f.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, qemu-ppc@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 =?utf-8?Q?Phili?= =?utf-8?Q?ppe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Thomas Huth <thuth@redhat.com> writes:
>
>> These patches enable more "check-acceptance" tests in the gitlab-CI,
>> fixing a broken URL, setting AVOCADO_ALLOW_UNTRUSTED_CODE and adding
>> some missing packages to the containers.
>
> Queued to pr/261020-testing-and-misc-1, thanks.

Ahh I shall drop as your PR should be in first anyway.

--=20
Alex Benn=C3=A9e

