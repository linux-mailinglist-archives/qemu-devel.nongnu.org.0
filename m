Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC8B33D54D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 14:57:44 +0100 (CET)
Received: from localhost ([::1]:55532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMACd-0006Rx-Gh
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 09:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMABe-00061N-O0
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:56:42 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:38246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMABc-0002hr-V3
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:56:42 -0400
Received: by mail-ej1-x62a.google.com with SMTP id mj10so72308411ejb.5
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 06:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=JYHTkbO11MEw1TLuTWcMK/eim+sm7U4mwKnK9SVuZNA=;
 b=kbb6hOZK83N91kyzBYrdCnxnFycHWbouXVYt49IajJyEDnvnQMwCT+5+Oi9H52epih
 DYO4svuU6feN6GrCsSGD4JIWXutFwoPlZwxEiKWGK1jZxzxgjQnz626x0A3qqjATH3Xf
 jP8iLuOxvsA+fKMNZqBzlJkZhFqIdjwBvg5fluoo4wWcC7wo9+CngKMZyE5M/njYaXEf
 dlyoLZg7Mgp1AsamFg6yg+Df93aG91G/jA4u+nUqx7UjtUlEwsK8u6oV3bRqlloyveXb
 kfUqo5loHpYRqTdbAi9t+/d/9RI0KCIN2NNW3MTTRkREYIE4qTxn+xbqdbCqtZpzS4DV
 UJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=JYHTkbO11MEw1TLuTWcMK/eim+sm7U4mwKnK9SVuZNA=;
 b=ATv5naMVqDGenL8y+tz0Btnpx/QIDoQetuIQ2hq2PTIZavAPnnS2dYYS6Ja3SHVhfe
 G0B9Ld5mJH5uqkFmRgq4R6HU7Jek6wXv5SphyrjantE2zfmHKm99tFBzCSSCHMHF2Uqo
 csVtxX+eEYmiR7VHEv2kNSxxd0igIN88ll3NjYGOTu3gB497IeEr+XE0oEeIJkpjUVtv
 iHhXu2VTM9ZIJ3q9isik9NS2ohliDHheQuPANlXreamS2DTeiSye9nvcYsLTOror6ycy
 nTVIv9ZF5P3iVhGLYwNwfoniECj8k7tPPQEBOkyKahEfWIEgjScqG0/txnb1fE7TmyDh
 qePg==
X-Gm-Message-State: AOAM531vkIvTGjwNDzVMghJNaKYehVKeWcImVx7Usqh2nv8IiouKjrkr
 uS+eEy0ineDcvpoWgyuMs4Ss3g==
X-Google-Smtp-Source: ABdhPJy0lDsjIgbNkwBYntpcQhPFj7XJuKtAbzjX7jGgHV9ZvOsnrHDurSKbCjUZJg+du/leJT7ZgQ==
X-Received: by 2002:a17:907:33c6:: with SMTP id
 zk6mr28928594ejb.228.1615902999336; 
 Tue, 16 Mar 2021 06:56:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id cw14sm10715658edb.8.2021.03.16.06.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 06:56:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A46441FF7E;
 Tue, 16 Mar 2021 13:56:37 +0000 (GMT)
References: <20210312172821.31647-1-alex.bennee@linaro.org>
 <20210312172821.31647-13-alex.bennee@linaro.org>
 <YEu1pd6Ko1OYat6T@strawberry.localdomain>
User-agent: mu4e 1.5.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: [PATCH  v1 12/14] plugins: expand kernel-doc for memory query
 and instrumentation
Date: Tue, 16 Mar 2021 13:55:47 +0000
In-reply-to: <YEu1pd6Ko1OYat6T@strawberry.localdomain>
Message-ID: <875z1r8ane.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: kuhn.chenqun@huawei.com, cota@braap.org, qemu-devel@nongnu.org,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Mar 12 17:28, Alex Benn=C3=A9e wrote:
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Small comment below, but otherwise:
>
> Reviewed-by: Aaron Lindsay <aaron@os.amperecomputing.com>
>
>> ---
>>  include/qemu/qemu-plugin.h | 35 ++++++++++++++++++++++++++++-------
>>  1 file changed, 28 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
>> index d4adce730a..aed868d42a 100644
>> --- a/include/qemu/qemu-plugin.h
>> +++ b/include/qemu/qemu-plugin.h
>> @@ -392,24 +392,45 @@ uint64_t qemu_plugin_insn_vaddr(const struct qemu_=
plugin_insn *insn);
>>   */
>>  void *qemu_plugin_insn_haddr(const struct qemu_plugin_insn *insn);
>>=20=20
>> -/*
>> - * Memory Instrumentation
>> - *
>> - * The anonymous qemu_plugin_meminfo_t and qemu_plugin_hwaddr types
>> - * can be used in queries to QEMU to get more information about a
>> - * given memory access.
>> +/**
>> + * typedef qemu_plugin_meminfo_t - opaque memory transaction handle
>
> Would it still be useful to include the types of things you can do
> with a qemu_plugin_meminfo_t here?

I've referenced it can be "..further queried using the qemu_plugin_mem_*
query functions."

--=20
Alex Benn=C3=A9e

