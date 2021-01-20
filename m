Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9092FCC32
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 09:00:31 +0100 (CET)
Received: from localhost ([::1]:58122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l28Pm-0000yP-Kw
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 03:00:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l28Op-0000SY-Fj
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 02:59:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l28Om-0006yZ-0r
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 02:59:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611129566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SyyikSUE4pDvp5GFcL18ynN+j9zUQIkfJEyVrsVOFvw=;
 b=B8Yvvwb5aej9/m7DqabuOC0pQFbfPJxiYqWsHPDV5ueVwiA5mWwFbAMc0SCiZbWbIFO6B2
 BkS3hApGEpIwUBQKqaMPdjztREVt8g0GWdFaKJw6b4YZssQJ48RhLEYCoKeHzTHD7ysYLE
 0GbJNBQMY/6kv9WyXE2DhwJYORdVGM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-zQfC-x-iPcmrNRbknpDQSQ-1; Wed, 20 Jan 2021 02:59:23 -0500
X-MC-Unique: zQfC-x-iPcmrNRbknpDQSQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF067107ACE6;
 Wed, 20 Jan 2021 07:59:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89B126268F;
 Wed, 20 Jan 2021 07:59:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 18588113865F; Wed, 20 Jan 2021 08:59:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: Ask for suggestions for CVE-2019-12928
References: <74ca794a.6063.176f21e2fca.Coremail.18401698361@126.com>
 <20210119201747.GE3888@work-vm>
Date: Wed, 20 Jan 2021 08:59:21 +0100
In-Reply-To: <20210119201747.GE3888@work-vm> (David Alan Gilbert's message of
 "Tue, 19 Jan 2021 20:17:47 +0000")
Message-ID: <87lfcoqbs6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?utf-8?B?5rGf6Iqz5p2w?= <18401698361@126.com>, berrange@redhat.com,
 qemu-devel@nongnu.org, pjp@fedoraproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * =E6=B1=9F=E8=8A=B3=E6=9D=B0 (18401698361@126.com) wrote:
>> Hi:
>>     Sorry to bother you~
>>     I have read the discussions about CVE--2019-12928 ( https://lists.gn=
u.org/archive/html/qemu-devel/2019-07/msg01153.html).
>> But, for the scenario of PC users, which is no requirement of network ac=
cess to QMP, there are some mitigating proposes.
>> 1. Modify the compilation options to disable QMP.
>> 2. Modify command line parsing function to discard the QMP parameters wi=
th network configurations.
>> 3. PC manager or other manage software make sure only the trusted user c=
an use QMP.
>> 4. Other ideas?
>
> QMP is a useful part of QEMU - so we don't want to do 1 - we need it to
> let things control QEMU; including configuring complex setups.

Compiling out QMP gains you exactly nothing unless you also compile out
HMP.  And then you're left without a way to monitor a running QEMU.
Similarly useful (but not nearly as secure) as not running QEMU at all
;)

> The important part is (3) - anything that runs a qemu must make sure it
> wires the QMP up securely; e.g. using unix sockets with appropriate
> permissions or something like that.
>
> As long as they do that, then we're fine.

Yup.

Regarding 4.: making insecure misconfiguration harder might be worth
exploring.


