Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80C76FF0FD
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 14:02:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px4yN-0003DW-Jg; Thu, 11 May 2023 08:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px4yK-0003CX-De
 for qemu-devel@nongnu.org; Thu, 11 May 2023 08:00:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px4yH-0001DV-78
 for qemu-devel@nongnu.org; Thu, 11 May 2023 08:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683806431;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hvLuDVkGdwYrpQcyaIoCFABAr2EgWQbE9pBVlQAokKU=;
 b=g0ImfD9PplKeNw5SpLeNCbO1gpQyyDxJeGyQgjDaOtOzSDMRaOBTSvvUT50uWnmd1/oapH
 mBOjDdfy9eZc/fxmC0TDqLiX5JkSbXeiMx6T3rQzNsCaGQvTxfXeRc/Bt05mXRfZWkqOs9
 Xidggdfua+dVhBUlRjjQRRr/vTLwHcg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-E3-B-QikOXiq6DZxUm1htw-1; Thu, 11 May 2023 08:00:30 -0400
X-MC-Unique: E3-B-QikOXiq6DZxUm1htw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f4ef4bf00dso1701655e9.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 05:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683806429; x=1686398429;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hvLuDVkGdwYrpQcyaIoCFABAr2EgWQbE9pBVlQAokKU=;
 b=UDUsQ+VH6sYTqSQI+RW9jHe2d+PhMFM4FDz9f9NSVfMxybwDATPzWoPQZ7Qi5CFbGN
 Wx9WZxUGzIVrFa+mezAo+mPi1Y+Ng6bfhUD6oRpjxF88YNq0tTT0Dkf3MWLygPa559P4
 sKIEM+CqSgHTy1bvknnHTh2vS/vVZmKaMGmrWcsRbZx8ZheGQtDzyc/qj/vBMAVWUNOX
 DpSRdx0tHGghksUYnfvSOY0j5aLVearQl4k+FmKcXY11y5ep6fgCbai3tTwx7NGr6P7w
 yXZSlaHE1LduNwz9mFKw53VqZIo7GP3wSf6x6ml9xTiHmkVO/LTjwrNTged0m+6NTpmH
 k7Kg==
X-Gm-Message-State: AC+VfDxYwDRDRtKrkuTUr0/Ga5i5xIXDnYubFZGSqc+Xq7zsR+cMe/zR
 wGAxV5+noRcGdfHLl/1AhEKR/PF3cgaAFMzxZc0LodG3qc3F+fReEsRMK0I1gFlihD/XClmxXp+
 78bcjaPM9vaqwqlk=
X-Received: by 2002:a7b:c012:0:b0:3f0:9d1a:223b with SMTP id
 c18-20020a7bc012000000b003f09d1a223bmr15698540wmb.16.1683806429370; 
 Thu, 11 May 2023 05:00:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6FfnFA4GnkOKgKg/OVUPqiuaNO+FxqIHQ/7Uiad0hW5g6ca7dC2znlerg+YWXCwdEkZvxHYg==
X-Received: by 2002:a7b:c012:0:b0:3f0:9d1a:223b with SMTP id
 c18-20020a7bc012000000b003f09d1a223bmr15698513wmb.16.1683806429050; 
 Thu, 11 May 2023 05:00:29 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 u4-20020a05600c00c400b003f4290720d0sm9272996wmm.47.2023.05.11.05.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 05:00:28 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  Avihai Horon <avihaih@nvidia.com>,  Thomas Huth
 <thuth@redhat.com>,  Lukas Straub <lukasstraub2@web.de>,  Alex
 =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2] migration: Add documentation for backwards compatiblity
In-Reply-To: <2912b2c8-41c2-4a9d-64ac-b3a05e66028f@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 11 May 2023 13:23:12 +0300")
References: <20230511082701.12828-1-quintela@redhat.com>
 <2912b2c8-41c2-4a9d-64ac-b3a05e66028f@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 11 May 2023 14:00:27 +0200
Message-ID: <87o7mr3wo4.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> On 11.05.23 11:27, Juan Quintela wrote:
>> State what are the requeriments to get migration working between qemu
>> versions.  And once there explain how one is supposed to implement a
>> new feature/default value and not break migration.
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> In general looks good to me:
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Thanks.

>> ---
>> [v2]
>> - Add all danp fixes
>> [v1]
>> I will really appreciate reviews:
>> - I don't speak natively .rst format, so let me what I have done
>>    wrong.
>> - English is not my native language either (no points if had guessed
>>    that).
>
> Same for me. Sometimes your wording seems awkward to me, but I don't
> risk to propose my awkward replacement)

happens to me all the time O:-)

>> +When we do migration, we have to qemu process: the source and the
>
> two qemu processes

Done.  Already reported by daniel.

> (also probably we should say QEMU everywhere)

Done.

>> +target.  There are two cases, they are the same version or they are a
>> +different version.  The easy case is when they are the same version.
>> +The difficult one is when they are different versions.
>> +
>> +There are two things that are different, but they have very similar
>> +names and sometimes get confused:
>> +- qemu version
>> +- machine version
>> +
>> +Let's start with a practical example, we start with:
>> +
>> +- qemu-system-x86_64 (v5.2), from now on qemu-5.2.
>> +- qemu-system-x86_64 (v5.1), from now on qemu-5.1.
>> +
>> +Related to this are the "latest" machine types defined on each of
>> +them:
>> +
>> +- pc-q35-5.2 (newer one in qemu-5.2) from now on pc-5.2
>> +- pc-q35-5.1 (newer one qemu-5.1) from now on pc-5.1
>
> one in qemu-5.1

done.

>> +
>> +First of all, migration is only supposed to work if you use the same
>> +machine type in both source and destination. The qemu hardware
>> +configuration needs to be the same also on source and destination.
>> +Most aspects of the backend configuration can be changed at will,
>> +except for a few cases where the backend features influence frontend
>> +device feature exposure.  But that is not relevant for this section.
>> +
>> +I am going to list the number of combinations that we can have.  Let's
>> +start with the trivial ones, qemu is the same on source and
>> +destination:
>> +
>> +1 - qemu-5.2 -M pc-5.2  -> migrates to -> qemu-5.2 -M pc-5.2
>> +
>> +  This is the latest qemu with the latest machine type.
>> +  This have to work, and if it don't work it is a bug.
>
> doesn't

done.

Search for all don't and replace lots of them.

>> +
>> +2 - qemu-5.1 -M pc-5.1  -> migrates to -> qemu-5.1 -M pc-5.1
>> +
>> +  Exactly the same case than the previous one, but for 5.1.
>> +  Nothing to see here either.
>> +
>> +This are the easiest ones, we will not talk more about them in this
>> +section.
>> +
>> +Now we start with the more interesting cases.  Let start with the
>> +same qemu but not the same machine type.
>
> sounds like "different machine type on source and target" for me..
>
> Maybe, "not latest machine type" ?

Now we start with the more interesting cases.  Let start with a the
same QEMU process and a different QEMU version machine type.

Better?


Thanks, Juan.


