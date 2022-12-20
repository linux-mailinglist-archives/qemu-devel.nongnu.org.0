Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21C0651C53
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 09:27:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Xwj-0003si-Gj; Tue, 20 Dec 2022 03:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7Xwg-0003rf-2Y
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 03:25:55 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7Xwd-0004uq-Ur
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 03:25:53 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 131-20020a1c0289000000b003d35acb0f9fso430021wmc.2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 00:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eVus0cFhcLo23hyrqQSSUurfiVhbRmbjzbOBT9PNuS8=;
 b=WXhvCbDW2+uJYorrBAOHZbJftrfSacEaREI044aE0jPGyDxQf3LiHqIdLxqSeMbEn5
 PkzzOlHyZzsHueMmpXNvtvTVRwzljR8D2kcZJ6Rx12gOR1xKgkQXCd9ykSvKO2+Oj5sK
 ALqE/FpQUOUhsg1C2MRStNdDaGhrbZLH/t5O70ZCO8qjKvsRQiDXuxg4s8l9d3gszylr
 SUzjTm4XvWqTM9Lob6zFYfEdjaZRFGfGUe9HCyrjkw1FwwZ6TEX/Hkui3wKkak5iADsp
 9/DTxJu+KnE8li2oBo4qv2wxuuP9DCHNZa2Eh8xWDcHgXBC2G83OAapKFEfxPLBv8xGC
 FMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eVus0cFhcLo23hyrqQSSUurfiVhbRmbjzbOBT9PNuS8=;
 b=AS7M96/mLuULdk0J0s1ToyEMIHLadruZPL/M9bUrqSrZ3OlWSudOn2pcri8Sq29xVQ
 TZU0/B0yBgGURu+w0ajtx/1UmeX0nSBRZJUA497wv0SjLZd+ilfxNLlsrd+T+W41HiIP
 CQkRe1+PMmVEZEjSSAjNSkluHP4ZHh8fKGGKtuY3Rr6YkvKS7kxwLVN6DjkJABdn0V/E
 u9XATj67fhwI34iTjYkSc9SJltlP4cCuDapFR9g1BCFjNpQDdgaCrU/Aw6QMPDggwnth
 VuQxDXCkoHY3A0qcZSib7ahsXpfFAANP80HpAOOcM0ba7BNzeGrM7ak1E/Q78sYiHK4t
 EhgA==
X-Gm-Message-State: ANoB5pmB7O1l5dZSqZvMsO8a6PX09l6Kf6HhI8iyf7PZVgIUEJaYf/vq
 xpHIo2ICCiNzw/KucGL5raKqGA==
X-Google-Smtp-Source: AA0mqf4v3qNuLIw6I5+17LOMfUcVbh9zRVC+IpzoTJQEijYq5w/3NgBbV5Rq0oFmRWIqrNdHUFDPPQ==
X-Received: by 2002:a05:600c:6549:b0:3cf:8b22:76b3 with SMTP id
 dn9-20020a05600c654900b003cf8b2276b3mr33844773wmb.0.1671524750111; 
 Tue, 20 Dec 2022 00:25:50 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k62-20020a1ca141000000b003cf894dbc4fsm14875313wme.25.2022.12.20.00.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 00:25:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 07D161FFB7;
 Tue, 20 Dec 2022 08:25:49 +0000 (GMT)
References: <20221219121914.851488-1-alex.bennee@linaro.org>
 <20221219121914.851488-2-alex.bennee@linaro.org>
 <b674a0e9-28a7-76b6-d1a1-d34807a803de@linux.alibaba.com>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Guo Ren <ren_guo@c-sky.com>, Liu Zhiwei
 <zhiwei_liu@c-sky.com>, guo_ren@linux.alibaba.com
Subject: Re: [PATCH 01/11] contrib/gitdm: add C-Sky to the domain map
Date: Tue, 20 Dec 2022 08:23:40 +0000
In-reply-to: <b674a0e9-28a7-76b6-d1a1-d34807a803de@linux.alibaba.com>
Message-ID: <875ye6iir7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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


LIU Zhiwei <zhiwei_liu@linux.alibaba.com> writes:

> The c-sky domain mail is no longer being used for Guo Ren and me.
>
> C-SKY company and C-SKY arch is still existing, but its website domain
> has been moved to https://www.t-head.cn/.

Is this the new corporate entity for the C-SKY architecture? I can
change the domain-map for that and add the old c-sky.com emails to a
group map.

>
> Otherwise,
>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Or map your old c-sky.com email addresses to your current address via
the .mailmap.

>
>
> Thanks,
> Zhiwei
>
> On 2022/12/19 20:19, Alex Benn=C3=A9e wrote:
>> Although the majority of the recent work has been done by LIU Zhiwei
>> it does appear to be a corporate effort.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Guo Ren <ren_guo@c-sky.com>
>> Cc: Liu Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   contrib/gitdm/domain-map | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
>> index 3727918641..6f3a24b399 100644
>> --- a/contrib/gitdm/domain-map
>> +++ b/contrib/gitdm/domain-map
>> @@ -7,6 +7,7 @@
>>   amd.com         AMD
>>   baidu.com       Baidu
>>   bytedance.com   ByteDance
>> +c-sky.com       C-Sky
>>   cmss.chinamobile.com China Mobile
>>   citrix.com      Citrix
>>   crudebyte.com   Crudebyte


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

