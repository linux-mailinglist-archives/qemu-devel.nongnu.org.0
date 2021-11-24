Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FF445BF54
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 13:54:01 +0100 (CET)
Received: from localhost ([::1]:41028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mprmi-0005TC-Jl
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 07:54:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mprlQ-0004EK-Jx
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 07:52:40 -0500
Received: from [2a00:1450:4864:20::534] (port=37641
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mprlO-0001ER-Ku
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 07:52:40 -0500
Received: by mail-ed1-x534.google.com with SMTP id e3so9990313edu.4
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 04:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=TCc6g2n3vbe9cAa3bgUbIj5val7SBWn6d8r8zOMX1f0=;
 b=P8Ui6kFgj0gXfTkNMFmxRpSd3xyLLpxFOPZyqaX1zhJEBvEqEUIowDvitE99WDJWRJ
 GfyvHwNFLIO3Ccwa9FQCGGLW+a0AfOwsLQ3uoXx2dR6BtUX071VAWv+ppDJI8gWtiT9C
 mmShr0JkOED3kvP+G3k5iH8rLJkvHiYJWq1r9987uvJwZs+NLaiVj8PjnowwMogmXTJt
 SXQtFK6A77XSr2b3rpGG4gSRMrJYLXPJTBz4QlqYkzqyOMIqc5EhkjzvRt5kFahRz23m
 IKyJsBbGJmSCP8gNNDmwZ2uers0PmPfjbrzFeGw06clRb4447O8DspNAleCJLbkyRQsk
 Q18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=TCc6g2n3vbe9cAa3bgUbIj5val7SBWn6d8r8zOMX1f0=;
 b=MywYbpcciH0IKLbJ45Vp/IQWZcYXVNZcrd8B/OS18Awya7AQIl7ZC/3vGSjCTocaWd
 e8sd6mG3SKDnYk2sIw9Cj6pQkGz4BdxTiLY9XnCmbVIk9n8UvcdtQefAgHlzA58AqmTM
 9zHYSHTqoHwggLqIRNVJSj9E42KizGfdj9sQpsu/EjZ/2OyytHDwp4B8OAs2wikWoeSa
 ROHXFgM8pcy1DYRSrxsBvcNkAfKZ0l+C7327V5XvZok3X2ZHbGeDgNwhjrFnu8LQ1yCr
 0ddje6fMU7rpIEqt91sg4G2xHh4eCAjnFbs5TE6UG4Z2wRJ+fzqHq/FnlU5+TAirpQ23
 PfPg==
X-Gm-Message-State: AOAM533C+je0VEqCbp0dUhCkIUPGaiDA7TIX7tqnmQD0YhAS2ANBRwCi
 ywGv1vVZ65S36V3IvvpPzpDkxtf7i1o+Ug==
X-Google-Smtp-Source: ABdhPJyYmPnjCJQwoi0ujM1V39K/Woi32oaw3H+eMzjc1sTdRqWMlQK+0cnOe5ElEjWgL4axnp79Yg==
X-Received: by 2002:a17:907:3d88:: with SMTP id
 he8mr19723706ejc.565.1637758356303; 
 Wed, 24 Nov 2021 04:52:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id qf9sm7226235ejc.18.2021.11.24.04.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 04:52:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E1DD91FF96;
 Wed, 24 Nov 2021 12:52:34 +0000 (GMT)
References: <20211103144844.1285634-1-jsnow@redhat.com>
 <YZ4tuO2tJKdT7FP3@redhat.com>
 <9fa0d8bb-9f64-539f-c579-f26d6013207e@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/6] tests/docker: Update Fedora containers
Date: Wed, 24 Nov 2021 12:51:50 +0000
In-reply-to: <9fa0d8bb-9f64-539f-c579-f26d6013207e@redhat.com>
Message-ID: <87lf1dhg19.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Alexander Bulekov <alxndr@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Cc'ing Alex.
>
> On 11/24/21 13:19, Daniel P. Berrang=C3=A9 wrote:
>> On Wed, Nov 03, 2021 at 10:48:38AM -0400, John Snow wrote:
>>> Fedora 33 will be EOL before 6.2 ships; Fedora 35 was just
>>> released. Update our various containers to test on F34 and F35.
>>>
>>> Fix a minor code warning issue that surfaces in a new version of Clang,
>>> and fix a small deprecation issue for the latest version of spice.
>>>
>>> In testing, I found that oss-fuzz was more likely to time out on GitLab;
>>> it's unclear if this is a performance regression or just getting unlucky
>>> with when I test.
>>=20
>> For me it times out every time on Fedora 35. In fact if I run it
>> locally, it doesnn't even finish after 24 hours ! There's a real
>> bug in there somewhere.

Is there an other spin of this series coming? I saw there were some
comments to address so I didn't look in detail myself.

--=20
Alex Benn=C3=A9e

