Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FDE6BD2A3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 15:46:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcorP-0001D4-3J; Thu, 16 Mar 2023 10:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcor7-0001Ar-Rj
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:45:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcor6-0006wA-6e
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:45:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678977923;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SSLe5YbZlRHIugqJWwN2AKUgUfO6HibHT9LQpO49GBA=;
 b=SFgwmnhr9unKimf8KNtILCl4YJ36HXTYAwieprCXE/rW95Vz8ffz2uOU/t+2r7tjSOI58O
 IjaZ/TykWjUysx0vjfws1YKVOoqRSof5g6RAZDy6nbH90qT2f953cc/HAZx1V5Lo8CkeRM
 fVpfu6vX7cnwSDwSJi9htH+eHO/bcm4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-QmSoj5nPOa-qCOJbZvIfuQ-1; Thu, 16 Mar 2023 10:45:22 -0400
X-MC-Unique: QmSoj5nPOa-qCOJbZvIfuQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 r14-20020a0560001b8e00b002cdb76f7e80so337388wru.19
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 07:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678977920;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SSLe5YbZlRHIugqJWwN2AKUgUfO6HibHT9LQpO49GBA=;
 b=kx30AHJV0aRTWpJlUDJWJXV4efFwl/OwmJZI7mlPlRfkiZjRJiaS+MawspT3nrvSPW
 afeOwpRqzVtrYRZbW/UiEuHbSRcYp476xRNudmov2OmBErtZRZPiHWBg6bxEBx1IBRsK
 66Qjrj0JOZzS8XEvCTMV1ed2pEu2XwMnNE7urOQAyn38SikMR4j8ztIBT3KaEqD8hLQy
 CiwGZTZGN8HQs4ZvhqTl6ix0hyt5cr2wVtjm/VcVXOACdsGKGZc8GcjrF3c6/koB9sii
 6r7Lxj4S8BXcpXCP/MUm0lHP227V0+Bqu0XV3BBPAbMLloPKp/tMKZN6gUaJXwqwSB0J
 EUfA==
X-Gm-Message-State: AO0yUKXrZ3DZtPNL/b+UVcOaLGMjMUii8CwY0HOWAvN1OXZS76sb7+Vg
 hCxbR/dEtcH0dQ37Hyh5D7I/VSDnniMv+Xa8ITXB1jEs2eefqbgIftbCuW0FUbR4GgvUdBZ3H1y
 JtuMUpnVPw0N7aBg=
X-Received: by 2002:adf:fa0c:0:b0:2cf:e336:cb14 with SMTP id
 m12-20020adffa0c000000b002cfe336cb14mr4794420wrr.10.1678977920560; 
 Thu, 16 Mar 2023 07:45:20 -0700 (PDT)
X-Google-Smtp-Source: AK7set+ZRKNEpd49NQ3iQe9ytl6zCdVt6bUJi2kJwOvFhFRoW1pLv6I9YGA4R1qCySSuY3GG7cuJIA==
X-Received: by 2002:adf:fa0c:0:b0:2cf:e336:cb14 with SMTP id
 m12-20020adffa0c000000b002cfe336cb14mr4794407wrr.10.1678977920243; 
 Thu, 16 Mar 2023 07:45:20 -0700 (PDT)
Received: from redhat.com (62.117.238.225.dyn.user.ono.com. [62.117.238.225])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a05600010cc00b002cfed482e9asm1226429wrx.61.2023.03.16.07.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 07:45:19 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,  qemu-devel@nongnu.org,  Jason
 Wang <jasowang@redhat.com>,  Dmitry Fleytman <dmitry.fleytman@gmail.com>
Subject: Re: [PATCH for 8.0] igb: Save the entire Tx context descriptor
In-Reply-To: <e43d9dde-1eed-b8ae-6d37-b1ee1b65a569@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 16 Mar 2023 13:46:08
 +0100")
References: <20230316122847.11003-1-akihiko.odaki@daynix.com>
 <d60df663-51e0-67bf-0888-cfd78acec7d2@linaro.org>
 <693992ff-cc77-c697-35f3-6ad3a94427bf@daynix.com>
 <e43d9dde-1eed-b8ae-6d37-b1ee1b65a569@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Mar 2023 15:45:18 +0100
Message-ID: <87bkkslpq9.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> On 16/3/23 13:40, Akihiko Odaki wrote:
>> On 2023/03/16 21:36, Philippe Mathieu-Daud=C3=A9 wrote:
>>> On 16/3/23 13:28, Akihiko Odaki wrote:
>>>> The current implementation of igb uses only part of a advanced Tx
>>>> context descriptor because it misses some features and sniffs the trait
>>>> of the packet instead of respecting the packet type specified in the
>>>> descriptor. However, we will certainly need the entire Tx context
>>>> descriptor when we update igb to respect these ignored fields. Save the
>>>> entire Tx context descriptor to prepare for such a change.
>>>>
>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>> ---
>>>> =C2=A0 hw/net/igb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++++--
>>>> =C2=A0 hw/net/igb_core.c | 17 ++++++++++-------
>>>> =C2=A0 hw/net/igb_core.h |=C2=A0 3 +--
>>>> =C2=A0 3 files changed, 15 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/hw/net/igb.c b/hw/net/igb.c
>>>> index 0792626322..50239a7cb1 100644
>>>> --- a/hw/net/igb.c
>>>> +++ b/hw/net/igb.c
>>>> @@ -499,8 +499,10 @@ static const VMStateDescription igb_vmstate_tx =
=3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .version_id =3D 1,
>>>
>>> Don't we need to increment the vmstate version? See
>>> https://qemu-project.gitlab.io/qemu/devel/migration.html#versions
>> This device is added only a week ago so it shouldn't need version
>> bump. That is also why I tagged this change "for 8.0".
>
> Well it is cheaper than dealing with partially backported commits...
> Also could be a better example for future developers IMHO. My 2 cents.

You can't have everything O:-)

I would just bump the version and not do the "dance" where you can
migrate from v1 and v2.  I.e. don't add tests at all.

This way bisect will fail with the correct message.

Later, Juan.


