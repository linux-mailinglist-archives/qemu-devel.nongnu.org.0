Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDCE4D977B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 10:18:40 +0100 (CET)
Received: from localhost ([::1]:43350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU3KB-0007pN-95
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 05:18:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU2if-00044R-1N
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:39:53 -0400
Received: from [2a00:1450:4864:20::535] (port=45953
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU2id-0004NU-9K
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:39:52 -0400
Received: by mail-ed1-x535.google.com with SMTP id m12so23157527edc.12
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 01:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=kRsXDeGyu9BjmiMfolmcIbRNt2Qm8VZZW3M3fMvl2hM=;
 b=tJ51LNi8b5jg9xMDGEKOO7vHjU5DdmjvEZTGK8C7OSuZp5xLL62q03mgKWUlyApze0
 iIcgKn6fyD9dHwtgGqLFUjw8LqfwHkfc3g8lDnWxgSwZkgm4wuM/Hxh9w4SYlA2QCkfF
 A10hfpjAEg0wurTXPo30ode1jD1QldmftoqCQDd8RUpEW9D+ysLqR+qlYPwnLbvygjqp
 oDGiBCUlncgRIc/Sthbq21O106AbtEVb9x8sne4uKs/ceUtYnT9qazGOgXzDKgWXVk5Z
 904RHkCcgLfnMj79vmfGXX+IQxC35OESDksv2ZTzgA78g8zXWbo3EKH6x8GKRyxRiHmz
 7Ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=kRsXDeGyu9BjmiMfolmcIbRNt2Qm8VZZW3M3fMvl2hM=;
 b=BVOc5WforQ8mwKP83mDCPRRJKiaLJgHZLRODnIkFoRls3oGSsoGO5IqryMLI0HXapZ
 YHx17/sZh4XJFKkKo2wUocHYd3ZwpHtmogRfAPGktdP+OucEP7R5KM98N7cW3BJ+rKV4
 hhV9MuXdT86QDvESI/DfXlfEUVY8TBAaxvYo7QFrvSrEaAX6ZHjP6akEwP8NN2JEC9v1
 d0Iui/vN/zU8VMOSZXqV1NTNUiesE728bc5YC8JtIP8rrhqeF1+KhpBXZ7vADy5DMdpX
 xcH+VZ2HaAjPkdLwrjpXtKf04p7rDjuo+hBWuatiKzeaBbfvMdRXvgRCksL0cPNXV8xn
 4qPQ==
X-Gm-Message-State: AOAM530AIZOZD8DsAcM+EBUup4jWmkZsXTniRqZ/qO0JUwdHTFFQgo+k
 aZtcUjg/NaEFqRsxHcpAzqVrcQ==
X-Google-Smtp-Source: ABdhPJwgXpv+S1EX4kmLClrSA8O3MX2abL4tIXsU+8dSQX93k9kWhMQ3JmNNhw1kVwyqFHQRMVvsYg==
X-Received: by 2002:a05:6402:5173:b0:415:f1e2:8d53 with SMTP id
 d19-20020a056402517300b00415f1e28d53mr23966505ede.95.1647333589777; 
 Tue, 15 Mar 2022 01:39:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a50ee9a000000b004160c295356sm9145809edr.5.2022.03.15.01.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 01:39:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D60B1FFB7;
 Tue, 15 Mar 2022 08:39:48 +0000 (GMT)
References: <87a6ds40ke.fsf@mpe.ellerman.id.au>
 <OF08FB7AFF.45C7DDEB-ON07258805.00803474-07258805.00803575@ddci.com>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: alarson@ddci.com
Subject: Re: [RFC PATCH] mailmap/gitdm: more fixes for bad tags and authors
Date: Tue, 15 Mar 2022 08:38:45 +0000
In-reply-to: <OF08FB7AFF.45C7DDEB-ON07258805.00803474-07258805.00803575@ddci.com>
Message-ID: <87tubz4njg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Michael Ellerman <michael@ellerman.id.au>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <andreas.faerber@web.de>,
 Peter Chubb <peter.chubb@nicta.com.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


alarson@ddci.com writes:

>>Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> I was running some historical tags for the last 10 years and got the
>> following warnings:
>>=20
>>   git log --use-mailmap --numstat --since "June 2010" | ~/src/gitdm.git/=
gitdm=20
>> -n -l 5
>>   alarson@ddci.com is an author name, probably not what you want
>> ...
>> The following fixes try and alleviate that although I still get a
>> warning for Aaron which I think is from 9743cd5736.
>
> Alex, I'm not sure what I can do to help, but my email address hasn't
> changed, still works, and I lack any sort of accent (just ask me :-).

An Acked-by is fine. I'll see if I can work out which route gitdm uses
to translate badly formed DCO tags so you can get proper attribution in
the stats.



--=20
Alex Benn=C3=A9e

