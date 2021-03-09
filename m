Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA6E3325DE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:55:22 +0100 (CET)
Received: from localhost ([::1]:48636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbtR-0004bp-HS
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:55:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lJaz6-00088t-11
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:57:08 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lJaz4-0006iL-Ix
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:57:07 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so5752378wmy.5
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 03:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version; bh=D00tlaWh0D0zg6qfxP2WbPIE21o6XC5zlMKsk7pUCPs=;
 b=tMJexgtHnnPpNNeClaml0RRcQ2H5lkL0OegszX2av8VaZvqCz4v5Lc6MBqzu9M5PxH
 b89HjZpY8TTCZOA6KGrfVWNpPXf1n7KU0FmXm152XpplFCOEQu5uUq8HxXz0kcqGB/3r
 IoCZ4eUdlX3DEDJRCqyoPO+Ym7+JSNcu7gZjQol7r1EAJdUTp+j41QpFnnI1buBPc04U
 DmVRaRZz/on9R5l7+ju1/1PHeQc0PArAsZhaDuiF03W1lvKEJRf+6SA72c5GjBZ8Br5j
 sDgQfZRDDHCf1fYQLo0pAiTmmalq51EaSxlkwFKo5H9Vgj4c3Gs3HkSvzbSK+kh8fF2m
 yhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version;
 bh=D00tlaWh0D0zg6qfxP2WbPIE21o6XC5zlMKsk7pUCPs=;
 b=HTV10RS7/WNxaJkrTzekPt6aeFDGLuLeSPHtR6WIAGdR9pk7hrnow4Av6J5mrWFYyF
 0x5Y4Csyx8sjGTSCl5GgepwJQ99sD2CVSPE84UONWUCLWxONyApPbR6ZF5Pc8VjhG4/D
 A9PZmUN7l8S5gOvaNA+HUbE/SzE9ZrtY0aV4TmVB9Ctk9kO8l7ANBzoAylEtjbpihZNm
 BV4lsqEbNKZiieVkP40jMoYuzsRu2fb6LZRG8xOx5eLIrQpQsfjfpa17doaDE4AT35Jb
 mQEbZ1vt7d65PfgnGdKRCW7eoXdXCNc4zUuZJ1lCcEwRIXRxxDToNUF5Ls2dsGRHOIOa
 PGkA==
X-Gm-Message-State: AOAM533Ih+Y3SNlaOTuXjEo+htEnJ/Kc3Ol1CNbPI8hHBCiUW7Ur4kVD
 f1hv2ayEgc33Yv5rHRwJZJI73g==
X-Google-Smtp-Source: ABdhPJyg6LX7foEPfqUTufkfMZvPRp4d1hTVkNkcOygDZyMF1CDIqaJ2lFuRiDJNt0DHymEJ6gkCTA==
X-Received: by 2002:a05:600c:2945:: with SMTP id
 n5mr3652857wmd.78.1615291024034; 
 Tue, 09 Mar 2021 03:57:04 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id h20sm3580413wmp.38.2021.03.09.03.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 03:57:03 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 48118348;
 Tue, 9 Mar 2021 11:57:02 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 4/4] coroutine/rwlock: Wake writers in preference to
 readers
In-Reply-To: <8de7f2e6-825f-a803-cf12-870559b5e787@redhat.com>
References: <20210309102157.365356-1-david.edmondson@oracle.com>
 <20210309102157.365356-5-david.edmondson@oracle.com>
 <8de7f2e6-825f-a803-cf12-870559b5e787@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Tue, 09 Mar 2021 11:57:02 +0000
Message-ID: <m2pn08h75d.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::331;
 envelope-from=dme@dme.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-03-09 at 12:06:22 +01, Paolo Bonzini wrote:

> On 09/03/21 11:21, David Edmondson wrote:
>> -        /* The critical section started in qemu_co_rwlock_wrlock.  */
>> -        qemu_co_queue_restart_all(&lock->queue);
>> +        /* The critical section started in qemu_co_rwlock_wrlock or
>> +         * qemu_co_rwlock_upgrade.
>> +         */
>> +        qemu_co_queue_restart_all(&lock->wqueue);
>> +        qemu_co_queue_restart_all(&lock->rqueue);
>
> Hmm, the devil is in the details---this is a thundering herd waiting to 
> happen.  But fortunately this can be fixed while making the unlock 
> primitive even simpler:
>
>      if (lock->reader) {
>           self->locks_held--;
>
>           /* Read-side critical sections do not keep lock->mutex.  */
>           qemu_co_mutex_lock(&lock->mutex);
>           lock->reader--;
>           assert(lock->reader >= 0);
>       }
>
>       /* If there are no remaining readers wake one waiting writer
>        * or all waiting readers.
>        */
>       if (!lock->reader && !qemu_co_queue_next(&lock->wqueue)) {
>           assert(!lock->pending_writer);
>           qemu_co_queue_restart_all(&lock->rqueue);
>       }

That's a nice improvement, I agree. I'll roll it into another revision
and work on a test.

dme.
-- 
But uh oh, I love her because, she moves in her own way.

