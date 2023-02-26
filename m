Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13AD6A2EFB
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 10:19:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWDA3-0005Il-L5; Sun, 26 Feb 2023 04:17:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien@zamaudio.com>)
 id 1pWDA1-0005Gh-Bj
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 04:17:37 -0500
Received: from mail-4323.proton.ch ([185.70.43.23])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien@zamaudio.com>)
 id 1pWD9x-0008B4-EA
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 04:17:37 -0500
Date: Sun, 26 Feb 2023 09:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zamaudio.com;
 s=protonmail3; t=1677403050; x=1677662250;
 bh=joLP84T8BvuM3BjMg/6sjsqzOVzAvIsbxoDaWYGvys4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=RnumRmWmrfazRPDU59eDNkNX9REtYVahKIHnT7bs5tUoJ+ZxIX8FUvHbKeqAY+DFm
 BkhuNkFnFUWLNnaXVwj1idtkNo/6yhWeJ40X/iRWJOVJARCyFKDin2d1I2ZHTL6DRT
 U8QXwqIwlIciJsmHIP0NzgTKw2uFRK5WQS8ht9GDxQPjq43I6xWoMpj07nWJtzZR5i
 etTvoqt+/zXrBqwrd+C6Df6n6Y9NFm3IT/lCypn+55Ng6l2Q7d6UKujAbMbc44or+K
 dxVwSfkpAfUWu0z6dDjpoDj6Rq/BIeQmp8yFGBLjQThNY1VtVwg+RO6PpFH3SHiWdN
 Q8ME8y9J4Pv9Q==
To: "Michael S. Tsirkin" <mst@redhat.com>
From: Damien Zammit <damien@zamaudio.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH qemu] timer/i8254: Fix one shot PIT mode
Message-ID: <2a62e6fa-3c80-5d07-2b65-0ef27ceabb86@zamaudio.com>
In-Reply-To: <20230226035018-mutt-send-email-mst@kernel.org>
References: <20230226015755.52624-1-damien@zamaudio.com>
 <20230226035018-mutt-send-email-mst@kernel.org>
Feedback-ID: 43209410:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.43.23; envelope-from=damien@zamaudio.com;
 helo=mail-4323.proton.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Hi Michael,

Thanks for reviewing this on a weekend!

On 26/2/23 19:51, Michael S. Tsirkin wrote:
> On Sun, Feb 26, 2023 at 01:58:10AM +0000, Damien Zammit wrote:
>>       case 0:
>> -        out =3D (d >=3D s->count);
>> -        break;
>
>
> I think you need something like
> =09/* FALLTHRU */
> here otherwise some gcc versions will warn.
>
>>       case 1:
>> -        out =3D (d < s->count);
>> +        out =3D (d >=3D s->count);

It seems that there are quite a number of these consecutive fallthrough cas=
es
without /* FALLTHRU */ in i8254_common.c

Can these be fixed in a separate patch?

Damien


