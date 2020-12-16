Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24FE2DBD6C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 10:19:12 +0100 (CET)
Received: from localhost ([::1]:34128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpSxj-0004Jz-Ph
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 04:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1kpSvU-00027b-RY
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 04:16:53 -0500
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:56734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1kpSvQ-0000oa-N4
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 04:16:50 -0500
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 6521C2E14CF;
 Wed, 16 Dec 2020 12:16:43 +0300 (MSK)
Received: from localhost (localhost [::1])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 8wse46sMLV-GewmcPSF; Wed, 16 Dec 2020 12:16:43 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1608110203; bh=JyxPKRa1pVIWOcNsiwJuneRkE2d+6C0fL4Q2120mwlM=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=OR1Vl1YWTOG1/FKvTGLTAuDUX+7LdwvK8I52Ms+3VJHv9CNygAEqP9XKECa+tl/dv
 5x6weQPNTUWoW7EbDQkCYedSTMqTryoTZ7YEhORB4DHUL92NnrQrciwWv2LcgHWsun
 h+6xFijO/VWLUnSn2QyJBpH3zNohpADX9pKHyvvA=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000161690
X-Yandex-Avir: 1
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net [2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by myt6-54b637a33407.qloud-c.yandex.net with LMTP id 0hdgQ0OJ4C-gpQxC5Hx
 for <lekiravi@yandex-team.ru>; Wed, 16 Dec 2020 12:16:30 +0300
Received: by myt5-25048b11116f.qloud-c.yandex.net with HTTP;
 Wed, 16 Dec 2020 12:16:30 +0300
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Jason Wang <jasowang@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
In-Reply-To: <92845450.36204439.1608098282759.JavaMail.zimbra@redhat.com>
References: <20201108235952.107961-1-lekiravi@yandex-team.ru>
 <20201108235952.107961-4-lekiravi@yandex-team.ru>
 <3e019e9d-2649-5df8-8f9c-8d76eb2615a5@redhat.com>
 <87o8ivmpia.fsf@dusky.pond.sub.org>
 <92845450.36204439.1608098282759.JavaMail.zimbra@redhat.com>
Subject: Re: [PATCH v5 3/4] hmp: Use QMP query-netdev in hmp_info_network
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 16 Dec 2020 12:16:40 +0300
Message-Id: <185411608109901@mail.yandex-team.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=lekiravi@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


16.12.2020, 08:58, "Jason Wang" <jasowang@redhat.com>:
> ----- Original Message -----
>>  Jason Wang <jasowang@redhat.com> writes:
>>
>>  [...]
>>  > One more stupid question, instead of generating the string via hard
>>  > codes, is there any method (dict?) to iterate all the key/values
>>  > automatically?
>>
>>  QAPI visitors.
>>
>>  The lazy way: use the QObject output visitor to convert the QAPI type
>>  (here: NetdevInfo) to QObject, then qobject_to_json() to convert to
>>  JSON text.
>>
>>  If you don't want JSON, replace qobject_to_json(). Perhaps you can
>>  create something that's generally useful for HMP, not just "info
>>  network". I'd pick keyval_parse() syntax.
>>
>>  The detour through QObject creates and destroys a rather fat temporary
>>  data structure. Tolerable when the amount of data is small. An output
>>  visitor that directly creates the string is more efficient. Takes a bit
>>  more code, though. I intend to post one for JSON, to reduce QMP's
>>  malloc gluttony.
>
> Thanks a lot for the answer.
>
> Alexey, let's try what Markus suggested here.

Thanks for information.
I will do so and send a new version of the patchset.

-- 
Alexey Kirillov
Yandex.Cloud

