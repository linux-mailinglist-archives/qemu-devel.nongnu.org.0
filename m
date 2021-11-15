Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C230F450881
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:32:16 +0100 (CET)
Received: from localhost ([::1]:47290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdxv-0002wX-Rm
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:32:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmduj-00005Q-4h
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 10:28:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmdud-00045x-Bv
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 10:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636990130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BVHhsCw9O2ggnExrr14rJCasOF9R2+/mOEEL5419+pE=;
 b=S7McskutVlT44w2hvxIR8s+PE/gXBUJcBd98bWwV8K0Whg2RICnaANkY+3fWcl7MZdXooe
 z5CaoOCo1/0dGL06Kpb9ejYRRy5PAE+tnHRTl8av5po45Kc6mZENWgMKmmjMNhIh40u/2C
 2VyFmK5GxsORwj4iVInqzSzp0LVnreo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-HJJUrw8RPqaLt6-cZYX46w-1; Mon, 15 Nov 2021 10:28:47 -0500
X-MC-Unique: HJJUrw8RPqaLt6-cZYX46w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84679EC1A0;
 Mon, 15 Nov 2021 15:28:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19A425BAF0;
 Mon, 15 Nov 2021 15:28:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AE12611380A7; Mon, 15 Nov 2021 16:28:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: does drive_get_next(IF_NONE) make sense?
References: <CAFEAcA9zmPds0+jHm8VY465XEhK6bbVPd+nDob1ruRPaHOua_Q@mail.gmail.com>
 <87r1bxzl5c.fsf@dusky.pond.sub.org>
 <e7ec3afc-6db9-822e-5a5e-dee7c4db8f34@redhat.com>
 <87pmr5cxbt.fsf@dusky.pond.sub.org>
 <CAFEAcA8sNjLsknea5Nt-tANEniFF2FYmjiV0xz=pr+vFwkX-gw@mail.gmail.com>
 <875ysunfwz.fsf@dusky.pond.sub.org> <YZJffhlo7I3sOqFs@redhat.com>
 <CAFEAcA_N6r81-0K6Y-qCdzyx67jzsSZnh-R8vYh2ZGZtAHpAAQ@mail.gmail.com>
Date: Mon, 15 Nov 2021 16:28:39 +0100
In-Reply-To: <CAFEAcA_N6r81-0K6Y-qCdzyx67jzsSZnh-R8vYh2ZGZtAHpAAQ@mail.gmail.com>
 (Peter Maydell's message of "Mon, 15 Nov 2021 13:31:52 +0000")
Message-ID: <874k8digk8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 15 Nov 2021 at 13:24, Kevin Wolf <kwolf@redhat.com> wrote:
>> Same question as for Hao Wu's series: Wouldn't the proper solution be to
>> add a drive property to the machine type?
>>
>> If you can't use -blockdev, it's not done right.
>
> Is there an example of "doing it right" for built-in-to-the-machine
> devices?
>
> (My experience with the new-style options is that almost
> always they're designed for x86 where the device they're attached
> to is also created on the command line, and then handling of boards
> where the device is builtin is either an afterthought or forgotten.
> See also -netdev, where it took forever for built-in-ethernet to
> be usable.)

I'm afraid the situation for onboard block devices is far worse than it
ever was for NICs.  See my reply "On configuring onboard block devices
with -blockdev" to Kevin's other message on the topic.

To be fair, improving onboard device configuration is *hard*.  Our
general device configuration interface doesn't cover them, and we've so
far failed finding a general solution.  Without one, we're drowning in
the sheer number of boards and onboard devices.  Which is ever growing.


