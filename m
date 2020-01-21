Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF52143BF2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 12:24:06 +0100 (CET)
Received: from localhost ([::1]:52014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itrdd-0004cM-D2
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 06:24:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42810)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <npiggin@gmail.com>) id 1itrco-000453-L1
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:23:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <npiggin@gmail.com>) id 1itrcn-0005BB-NE
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:23:14 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:39799)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <npiggin@gmail.com>)
 id 1itrcn-0005Ae-Ei; Tue, 21 Jan 2020 06:23:13 -0500
Received: by mail-pl1-x644.google.com with SMTP id g6so1208315plp.6;
 Tue, 21 Jan 2020 03:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=oO5EnIrEtGfi6tXgcOJJXq3O0vyXm0dIqs1G2RYuqtc=;
 b=fUwSpXIFczjwzWIBmHKgw6xjDNvii0IFej2ot67oqFFl/qHlkKdy8szxsynFeOF+53
 r5Ib/Zd+lr3TtgmqmhQ+ZNKHWN4SdHezu6TR1sUyuP23fsNEaZAQlFqHjj/qEgDQWWTW
 C0C9cSFJyj8pf3fztZJ+mHHijkh5n25RNGbzdIR/D7O69/O7fOc1528rpZC2d2fH+3sV
 2wBS9B/oNZjggBmdApTmyc1FWzdGh3hMM5vX6HkTzRW+hCaYKyF0IUeCx6SJ3opk+5vD
 IvkPQ5MWatnNIMarW8f+3LE7bqgTHs/HFkHjTMMdZVBiNjOHem5ZGyzBx+kXVRaTllpl
 VE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=oO5EnIrEtGfi6tXgcOJJXq3O0vyXm0dIqs1G2RYuqtc=;
 b=ZAVb23UJrwhS1TDuO/1KQfYV97SGKQeqGMR45t2dEyXvCYf6u8tcG6Y6wrFrxOhxYN
 uroU9jZPhVgOKTJgIivYA2yNXLzdzwra308bAtCDzqX4pCJwFDlcehlJKlnm34LjLqqg
 gLJf5L/NgMSxzM07Ux5WaawZbnPlcM5ugedkdwltVVh6+9gpeYFwGtFLqRzPRhHYnX7J
 +YI/jLO3+3BQGRZI4XNUHNRJ/rqyTGb3zkxuNFK8rRi7+DmbsCKyB3yQSqY19J3dN9Bh
 W0LX/ccODIuBfN5y1FwtGJBOZua4tiQz+4LNgAubBPMr71lQsYvLrOLnwfKwqmMZkgua
 mlLA==
X-Gm-Message-State: APjAAAXiRAF4TOfn11Gy22X92qc6j7u2kyIz/aLuTiyMy6WkxvWjWWSk
 B/1OcMfnG9JT5XRqU7yDjZg=
X-Google-Smtp-Source: APXvYqzFf0PgySrkudF+oC0YYx4d1ZO98IFYZk1OncEtTvmU5VXTQcvhxfM6DtKdXbQLPeHgyJ/K/g==
X-Received: by 2002:a17:90a:b30b:: with SMTP id
 d11mr4845699pjr.22.1579605792258; 
 Tue, 21 Jan 2020 03:23:12 -0800 (PST)
Received: from localhost (193-116-65-251.tpgi.com.au. [193.116.65.251])
 by smtp.gmail.com with ESMTPSA id w20sm43064214pfi.86.2020.01.21.03.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 03:23:11 -0800 (PST)
Date: Tue, 21 Jan 2020 21:20:03 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [Qemu-devel] [RFC PATCH] Implement qemu_thread_yield for posix,
 use it in mttcg to handle EXCP_YIELD
To: Alex =?iso-8859-1?q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190717054655.14104-1-npiggin@gmail.com>
 <87h81vdtv2.fsf@linaro.org>
In-Reply-To: <87h81vdtv2.fsf@linaro.org>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1579604990.qzk2f3181l.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Benn=C3=A9e's on December 20, 2019 11:11 pm:
>=20
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> This is a bit of proof of concept in case mttcg becomes more important
>> yield could be handled like this. You can have by accident or deliberate=
ly
>> force vCPUs onto the same physical CPU and cause inversion issues when t=
he
>> lock holder was preempted by the waiter. This is lightly tested but not
>> to the point of measuring performance difference.
>=20
> Sorry I'm so late replying.

That's fine if you'll also forgive me :)

> Really this comes down to what EXCP_YIELD semantics are meant to mean.
> For ARM it's a hint operation because we also have WFE which should halt
> until there is some sort of change of state. In those cases exiting the
> main-loop and sitting in wait_for_io should be the correct response. If
> a vCPU is suspended waiting on the halt condition doesn't it have the
> same effect?

For powerpc H_CONFER, the vCPU does not want to wait for ever, but just
give up a some time slice on the physical CPU and allow other vCPUs to
run. But it's not necessary that one does run (if they are all sleeping,
the hypervisor must prevent deadlock). How would you wait on such a
conditon?

Thanks,
Nick
=

