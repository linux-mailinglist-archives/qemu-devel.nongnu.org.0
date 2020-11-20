Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E012BAAA3
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 13:59:37 +0100 (CET)
Received: from localhost ([::1]:58416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg60m-0004yB-3c
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 07:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kg5zu-0004U5-6B
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 07:58:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kg5zo-0005vW-T0
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 07:58:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605877115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6WhVXr812pX6BdfIwtzLfZDwlwSSwNqYUN5Xe9wMaTA=;
 b=ZGG1aRJA0b8g4O5ZcgY3NKYmZ0lO3t03Ni7rxgy9pbl6PTYziMv3VHFzotfAKS0anV0wws
 NEXBbr1U2822aFg+vfjpGPdZIDzv6TXpYxY1us0t39ZpyRRZ18bqVk+al+rJ6Kc/giZTGE
 cCyz8E+xFtIsN3O1WyG4MV88TA950VE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-1xks769TOL-k_HhgKgVvLA-1; Fri, 20 Nov 2020 07:58:33 -0500
X-MC-Unique: 1xks769TOL-k_HhgKgVvLA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9C658144E3;
 Fri, 20 Nov 2020 12:58:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 881F85D6AD;
 Fri, 20 Nov 2020 12:58:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1618511358BA; Fri, 20 Nov 2020 13:58:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Andrew Melnichenko <andrew@daynix.com>
Subject: Re: [PATCH] hmp: Changed hmp_netdev_add() using
 qmp_marshal_netdev_add()
References: <20200716035532.1407660-1-andrew@daynix.com>
 <CABcq3pGFPkDMmEegGaw6UjHBijPZiyFj-uR+6Phz+0K44VRNgw@mail.gmail.com>
Date: Fri, 20 Nov 2020 13:58:31 +0100
In-Reply-To: <CABcq3pGFPkDMmEegGaw6UjHBijPZiyFj-uR+6Phz+0K44VRNgw@mail.gmail.com>
 (Andrew Melnichenko's message of "Fri, 20 Nov 2020 13:05:36 +0200")
Message-ID: <874klk5gnc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>, qemu-devel@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrew Melnichenko <andrew@daynix.com> writes:

> Ping
>
> On Thu, Jul 16, 2020 at 6:26 AM <andrew@daynix.com> wrote:
>
>> From: Andrew Melnychenko <andrew@daynix.com>
>>
>> There is an issue, that netdev can't be removed if it was added using hmp.
>> The bug appears after 08712fcb851034228b61f75bd922863a984a4f60 commit.
>> It happens because of unclear QemuOpts that was created during
>> hmp_netdev_add(), now it uses qmp analog function -
>> qmp_marshal_netdev_add().
>>
>> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
>> ---
>>  monitor/hmp-cmds.c | 15 +++------------
>>  1 file changed, 3 insertions(+), 12 deletions(-)
>>
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 2b0b58a336..b747935687 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -1597,19 +1597,10 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
>>  void hmp_netdev_add(Monitor *mon, const QDict *qdict)
>>  {
>>      Error *err = NULL;
>> -    QemuOpts *opts;
>> -
>> -    opts = qemu_opts_from_qdict(qemu_find_opts("netdev"), qdict, &err);
>> -    if (err) {
>> -        goto out;
>> -    }
>> +    QDict *non_constant_dict = qdict_clone_shallow(qdict);
>>
>> -    netdev_add(opts, &err);
>> -    if (err) {
>> -        qemu_opts_del(opts);
>> -    }
>> -
>> -out:
>> +    qmp_marshal_netdev_add(non_constant_dict, NULL, &err);
>> +    qobject_unref(non_constant_dict);
>>      hmp_handle_error(mon, err);
>>  }

qmp_marshal_netdev_add() uses the QObject input visitor, which feels
wrong for HMP input.

What exactly is the problem you're trying to solve?  Can you show us a
reproducer?


