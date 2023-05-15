Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD02A702E31
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:34:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyYKS-0006g6-Gk; Mon, 15 May 2023 09:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyYKQ-0006fD-KZ
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:33:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyYKP-0007uX-4V
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684157608;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rS2LwkdP398ifjfbFAoLJ43aPJk6dCD/eocu8cAKvvI=;
 b=G/73stgLUTTft6Yfsg/JWkoskB4FDiYJzfo6DYVRzaV6ALnlS6NEcBLkmpJvOkd0Mftv7t
 1mai4yq9NO/mUYX+sTJMjZ9hCt3a1O9T4NMPFZGL+KX+pfrAj+ZEgMyKbPuSAZk2XjkSnf
 4bcZY6J6+MVfRKdZTV52MN7tHgAqQbg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-fsmKBW5EMY2INIXpdiUziQ-1; Mon, 15 May 2023 09:33:19 -0400
X-MC-Unique: fsmKBW5EMY2INIXpdiUziQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f433a2308bso121241165e9.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 06:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684157598; x=1686749598;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rS2LwkdP398ifjfbFAoLJ43aPJk6dCD/eocu8cAKvvI=;
 b=HPOKv6FuDlfsU5XIsM/Os1E5boL7b9SOfGXr8FWoPesNs0NG9SmVGvs8SxytFfo4Ss
 n3gioM9HI3R9lPftWIQ1/VeriNXEeLxGDytiYxoq+NgoQoGfiEDKqLmQdHINpBAu+/Uv
 ofvSa2cFiziqrrNbfLKmeOboR8gqJmnQImUviyU2TKxjCdiBIrkBTGs4pTwOT2vePVkc
 cFFjOYiMUZThip/a0zu679EirOo3PRSI0suqQuIl77JpMMHHJ8FgSYLze/f2dX7Qc7LU
 jAduyhlCBhWKMN88GvWrjlL994RjqUm/sOBKfMqJD8c86FENSFJxuGOTL1vvBXs7PBgk
 W2NA==
X-Gm-Message-State: AC+VfDySYCpcV8jDuSm77zR2ypZzSHS5FUNpCR9FdyVXgqRFDsdTQ0SN
 cGPZ9emVhzQeh4UtPC8+V5R45MDyH4tsqewhXftkV3i1d/t2SH5TuhKnIttJyied+y6z0WVMmkX
 8DiNlpnd0qFrTdwM=
X-Received: by 2002:a5d:6212:0:b0:307:95c9:c010 with SMTP id
 y18-20020a5d6212000000b0030795c9c010mr17769205wru.34.1684157598546; 
 Mon, 15 May 2023 06:33:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4KHWW5kxNltlELSXzhxLi8ZulrRI1gpCKXbBJ+xu8hiajlhrWkxM3kFA9YXEtBYY4SVTu3Pg==
X-Received: by 2002:a5d:6212:0:b0:307:95c9:c010 with SMTP id
 y18-20020a5d6212000000b0030795c9c010mr17769173wru.34.1684157598210; 
 Mon, 15 May 2023 06:33:18 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003f4290720cbsm20826661wmc.29.2023.05.15.06.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 06:33:17 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: <qemu-devel@nongnu.org>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,  <qemu-block@nongnu.org>,  Eric
 Blake <eblake@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  John Snow <jsnow@redhat.com>,  Halil Pasic
 <pasic@linux.ibm.com>,  Peter Xu <peterx@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  David Gibson
 <david@gibson.dropbear.id.au>,  Harsh Prateek Bora
 <harshpb@linux.ibm.com>,  Eric Farman <farman@linux.ibm.com>,  Greg Kurz
 <groug@kaod.org>,  <qemu-ppc@nongnu.org>,  <qemu-s390x@nongnu.org>,  Fam
 Zheng <fam@euphon.net>,  Thomas Huth <thuth@redhat.com>,  Leonardo Bras
 <leobras@redhat.com>,  Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH 10/21] migration: Move rate_limit_max and
 rate_limit_used to migration_stats
In-Reply-To: <eda6df92-f363-ef12-3f70-e07b26ed0512@kaod.org>
 (=?utf-8?Q?=22C=C3=A9dric?= Le
 Goater"'s message of "Mon, 15 May 2023 15:28:35 +0200")
References: <20230508130909.65420-1-quintela@redhat.com>
 <20230508130909.65420-11-quintela@redhat.com>
 <4a7fcac1-a8f1-44d2-1a5a-284a80486633@kaod.org>
 <87h6sdzqoo.fsf@secure.mitica>
 <eda6df92-f363-ef12-3f70-e07b26ed0512@kaod.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 15 May 2023 15:33:16 +0200
Message-ID: <878rdpzplv.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URG_BIZ=0.573 autolearn=no autolearn_force=no
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

C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 5/15/23 15:09, Juan Quintela wrote:
>> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>> On 5/8/23 15:08, Juan Quintela wrote:
>>>> This way we can make them atomic and use this functions from any
>>>> place.  I also moved all functions that use rate_limit to
>>>> migration-stats.
>>>> Functions got renamed, they are not qemu_file anymore.
>>>> qemu_file_rate_limit -> migration_rate_limit_exceeded
>>>> qemu_file_set_rate_limit -> migration_rate_limit_set
>>>> qemu_file_get_rate_limit -> migration_rate_limit_get
>>>> qemu_file_reset_rate_limit -> migration_rate_limit_reset
>>>> qemu_file_acct_rate_limit -> migration_rate_limit_account.
>>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>>> ---
>>>> If you have any good suggestion for better names, I am all ears.
>>>
>>> May be :
>>>
>>>   qemu_file_rate_limit -> migration_rate_limit_is_exceeded
>> I try not to put _is_ in function names.  If it needs to be there, I
>> think that I need to rename the functino.
>
> It is common practice for functions doing a simple test and returning a b=
ool.
> No big deal anyway.
>  > migration_rate_limit_exceeded()
>> seems clear to me.
>>=20
>>>   qemu_file_acct_rate_limit -> migration_rate_limit_inc
>> My problem for this one is that we are not increasing the
>> rate_limit, we
>> are "decreasing" the amount of data we have for this period.  That is
>> why I thought about _account(), but who knows.
>>=20
>>> Also, migration_rate_limit() would need some prefix to understand what =
is
>>> its purpose.
>> What do you mean here?
>
> I am referring to :
>
>   /* Returns true if the rate limiting was broken by an urgent request */
>   bool migration_rate_limit(void)
>   {
>       ...
>       return urgent;
>   }
>
> which existed prior to the name changes and I thought migration_rate_limi=
t()
> would suffer the same fate. May be keep the '_limit' suffix for this one =
if
> you remove it for the others ?

ok, will think about this one.

Later, Juan.


