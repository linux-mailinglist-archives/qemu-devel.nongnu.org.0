Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9E2292487
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 11:20:48 +0200 (CEST)
Received: from localhost ([::1]:43004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kURLT-0001tY-HT
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 05:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kURKN-0001QE-3b
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 05:19:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kURKK-0007NG-RD
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 05:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603099174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jny3kRZG5li2UDitjRNCw9xoh+Gx3C7ZMPwY/sY9qFM=;
 b=jRuN0zUpZZTx+r7Cm5KJGB10JdLR4zPQVpnFaFHEtu7TCDbfdAEckZhBDkZYI87GkvekrF
 hUcthD4VeISNIYf2veNxfhJDGzwaPIbDgLT3n6C1aTPpwZ169kdycHeFgkh+jS/TTGrJgp
 sOoCweifOT7gtdPBNIuPln7RJWDUSm0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-7DnLkPOsMJCD9ihWSKJrBA-1; Mon, 19 Oct 2020 05:19:32 -0400
X-MC-Unique: 7DnLkPOsMJCD9ihWSKJrBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E2F48030A6;
 Mon, 19 Oct 2020 09:19:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3E855D9D2;
 Mon, 19 Oct 2020 09:19:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 703561132A08; Mon, 19 Oct 2020 11:19:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] monitor: Fix order in monitor_cleanup()
References: <20201013125027.41003-1-kwolf@redhat.com>
 <878sc8yba7.fsf@linaro.org> <20201015074613.GA4610@merkur.fritz.box>
Date: Mon, 19 Oct 2020 11:19:29 +0200
In-Reply-To: <20201015074613.GA4610@merkur.fritz.box> (Kevin Wolf's message of
 "Thu, 15 Oct 2020 09:46:13 +0200")
Message-ID: <87lfg2zi72.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 14.10.2020 um 19:20 hat Alex Benn=C3=83=C6=92=C3=82=C2=A9e geschrieben=
:
>>=20
>> Kevin Wolf <kwolf@redhat.com> writes:
>>=20
>> > We can only destroy Monitor objects after we're sure that they are not
>> > in use by the dispatcher coroutine any more. This fixes crashes like t=
he
>> > following where we tried to destroy a monitor mutex while the dispatch=
er
>> > coroutine still holds it:
>> >
>> >  (gdb) bt
>> >  #0  0x00007fe541cf4bc5 in raise () at /lib64/libc.so.6
>> >  #1  0x00007fe541cdd8a4 in abort () at /lib64/libc.so.6
>> >  #2  0x000055c24e965327 in error_exit (err=3D16, msg=3D0x55c24eead3a0 =
<__func__.33> "qemu_mutex_destroy") at ../util/qemu-thread-posix.c:37
>> >  #3  0x000055c24e9654c3 in qemu_mutex_destroy (mutex=3D0x55c25133e0f0)=
 at ../util/qemu-thread-posix.c:70
>> >  #4  0x000055c24e7cfaf1 in monitor_data_destroy_qmp (mon=3D0x55c25133d=
fd0) at ../monitor/qmp.c:439
>> >  #5  0x000055c24e7d23bc in monitor_data_destroy (mon=3D0x55c25133dfd0)=
 at ../monitor/monitor.c:615
>> >  #6  0x000055c24e7d253a in monitor_cleanup () at ../monitor/monitor.c:=
644
>> >  #7  0x000055c24e6cb002 in qemu_cleanup () at ../softmmu/vl.c:4549
>> >  #8  0x000055c24e0d259b in main (argc=3D24, argv=3D0x7ffff66b0d58, env=
p=3D0x7ffff66b0e20) at ../softmmu/main.c:51
>> >
>> > Reported-by: Alex Benn=C3=83=C6=92=C3=82=C2=A9e <alex.bennee@linaro.or=
g>
>> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>>=20
>> LGTM:
>>=20
>> Tested-by: Alex Benn=C3=83=C6=92=C3=82=C2=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Alex Benn=C3=83=C6=92=C3=82=C2=A9e <alex.bennee@linaro.org>
>>=20
>> Who's tree is going to take it?
>
> In theory Markus, but he's on vacation this week. As this seems to
> affect multiple people and we want to unblock testing quickly, I'll just
> take it through mine.

Thanks!


