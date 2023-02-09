Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C92690B56
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 15:07:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ7ZK-00072S-R9; Thu, 09 Feb 2023 09:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pQ7ZG-000728-QW
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:06:32 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pQ7ZF-0007pp-7z
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:06:30 -0500
Received: by mail-wr1-x436.google.com with SMTP id j25so1884771wrc.4
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 06:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8gSZkvZZ3cUhDqd35bFnhJM2ZJGp3As6PUwUiChV6AM=;
 b=cCI9urgZGacmpjAbrxhFs5Xu9XE5gluyNNjjbj17S8mECBy0393orc43m3Y5rTdzLn
 OQdkrnpAul553WHsz1RYO4X2WbUcdaOxjWDj4YbuwzfdxYvl3OZq8YMaTWe7U+3ZJo+c
 HZOXucOzlwB8UEiOzkFDJPPkGzTnxyzKis/VO1QSNeT02bbixXExqSVAgCyTi2SqfhO2
 Dlg+xJvKEI59fzT+1zuif28YZFGyZbqntC5XjGqOYwU9JLBloNSSPRZhhhdNKzmcWMqD
 KP99bSXFZAjCuUq99xoFSSGPA2eDEQcs2qAnAjy0Btd+aU8H6zvCjFCzBl+9nTwM+CgF
 dOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8gSZkvZZ3cUhDqd35bFnhJM2ZJGp3As6PUwUiChV6AM=;
 b=GQxzg9MzhSk7BymkajDhMPPcQIdO6u0CRjxhWtopqEcYClX4v//3hp5P91vmQJs4rS
 5Uu5meCY2gPXkha4DP1lfg8D6NnFEHnW51VuHn3ZeBh32MwJ74PH8jvxbOUSrww9Wnnw
 e163PNbyPXOSPS5x33Qe/uPvomdni5pU7s660e9i6WByEUvWwC0ItgfTDRhY2sc0Jxma
 Sw8bqnV4+Yr5Kk9hIXkB5igy2wMNsjBGSQzkKsntDI3TZhd7dbZe82zQ0nNRhaNhZ/y8
 /QmM5oYSZl2gUwIYvrjS9TBFJ4OvIB/d9x9aRWCjsAD+jIJzYPPBs8+aS1rHx07e0/Pe
 /oLw==
X-Gm-Message-State: AO0yUKUFVWgQS3RWKaJyaVrlM5TYXCXswQBORJ/SwFONFMgD189ld0Vd
 va9L/dyoZTry0F0493FcIkpJtQ==
X-Google-Smtp-Source: AK7set+/4nAdHI7j9xphcD01uImQL6AaLQK3Lg3RMc8J/ZdTdV8Dp1zYepW8+vMdWpLFNUWi5AFwOw==
X-Received: by 2002:a5d:4c8e:0:b0:2c4:852:c451 with SMTP id
 z14-20020a5d4c8e000000b002c40852c451mr2950301wrs.14.1675951587463; 
 Thu, 09 Feb 2023 06:06:27 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r7-20020adfdc87000000b002bded7da2b8sm1369875wrj.102.2023.02.09.06.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 06:06:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 780A61FFB7;
 Thu,  9 Feb 2023 14:06:26 +0000 (GMT)
References: <cfa1e51f-c74b-c1d1-d6ea-a25a5a5f6c4b@nutanix.com>
 <18bea7dd-c776-6328-2c6b-71c88838db72@nutanix.com>
User-agent: mu4e 1.9.19; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: John Levon <john.levon@nutanix.com>, Florian Schmidt
 <flosch@nutanix.com>, carl.waldspurger@nutanix.com, Prerna Saxena
 <prerna.saxena@nutanix.com>, Aravind Retnakaran
 <aravind.retnakaran@nutanix.com>, rohit.kumar3@nutanix.com, "Daniel P .
 Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org, Juan Quintela
 <quintela@redhat.com>, Dr. David Alan Gilbert <dgilbert@redhat.com>,
 Maciej S. Szmigiero <maciej.szmigiero@oracle.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Paolo Bonzini <pbonzini@redhat.com>, Justin
 Terry (VM) <juterry@microsoft.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: Expose support for HyperV features via QMP
Date: Thu, 09 Feb 2023 13:58:01 +0000
In-reply-to: <18bea7dd-c776-6328-2c6b-71c88838db72@nutanix.com>
Message-ID: <87r0uzlyql.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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


"manish.mishra" <manish.mishra@nutanix.com> writes:

> Hi Everyone,
>
> Checking if there is any feedback on this.

I've expanded the CC list to some relevant maintainers and people who
have touched that code in case this was missed.

> Thanks
>
> Manish Mishra
>
> On 31/01/23 8:17 pm, manish.mishra wrote:
>
>  Hi Everyone,
>  I hope everyone is doing great. We wanted to check why we do not expose =
support for HyperV features in
>  Qemu similar to what we do for normal CPU features via query-cpu-defs or=
 cpu-model-expansion QMP
>  commands. This support is required for live migration with HyperV featur=
es as hyperv passthrough is not
>  an option. If users had knowledge of what features are supported by sour=
ce and destination, VM can be
>  started with an intersection of features supported by both source and de=
stination.
>  If there is no specific reason for not doing this, does it make sense to=
 add a new QMP which expose
>  support (internally also validating with KVM or KVM_GET_SUPPORTED_HV_CPU=
ID ioctl) for HyperV
>  features.
>  Apologies in advance if i misunderstood something.
>
>  Thanks
>
>  Manish Mishra


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

