Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9FA3A240E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 07:44:38 +0200 (CEST)
Received: from localhost ([::1]:42516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrDUb-0007nR-Nv
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 01:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrDT7-00072s-4L
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:43:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrDT1-0005PD-1C
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:43:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623303776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MBEmlwumnIEAdCXzZ+AcFo4MQ0cGX5LF059o8kL+ka8=;
 b=ReInbxRbNbqtc0p0xIHy0tYP0fBfMhdDfny3WYzAccnmDVhkok1S9FvGyRj/KBfaN4STHl
 2Nzgp5Ee0rpiJGAz9FDpTHRhaV0Lso1QF0mjmmljl/WY1n12mtkfSXabh+NlnNTsam2haB
 qBZBSPxR2eUN+F2dujLSTzgTi8V/WBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-XpGRNd--M4OXfKUDAmx3Wg-1; Thu, 10 Jun 2021 01:42:54 -0400
X-MC-Unique: XpGRNd--M4OXfKUDAmx3Wg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB7C4818400
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 05:42:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B14510016FB;
 Thu, 10 Jun 2021 05:42:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0AD75113865F; Thu, 10 Jun 2021 07:42:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PULL 00/12] Machine and OS X changes for 2021-06-08
References: <20210608094017.392673-1-pbonzini@redhat.com>
 <YL8+/iTU/VrJ7oFE@redhat.com>
Date: Thu, 10 Jun 2021 07:42:52 +0200
In-Reply-To: <YL8+/iTU/VrJ7oFE@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 8 Jun 2021 10:57:18 +0100")
Message-ID: <87czsugtr7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Jun 08, 2021 at 11:40:05AM +0200, Paolo Bonzini wrote:
>> The following changes since commit 6f398e533f5e259b4f937f4aa9de970f7201d=
166:
>>=20
>>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-2021060=
4' into staging (2021-06-05 11:25:52 +0100)
>>=20
>> are available in the Git repository at:
>>=20
>>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>>=20
>> for you to fetch changes up to 8f9f729185e3ac8d3c5a65d81eb9e74e229901ea:
>>=20
>>   vnc: avoid deprecation warnings for SASL on OS X (2021-06-07 10:20:23 =
-0400)
>>=20
>> ----------------------------------------------------------------
>> * introduce "-M smp" (myself)
>> * avoid deprecation warnings for SASL on macOS 10.11 or newer.
>>=20
>> ----------------------------------------------------------------
>> Paolo Bonzini (12):
>>       qom: export more functions for use with non-UserCreatable objects
>>       keyval: introduce keyval_merge
>>       keyval: introduce keyval_parse_into
>>       vl: switch -M parsing to keyval
>>       qemu-option: remove now-dead code
>>       machine: move dies from X86MachineState to CpuTopology
>>       machine: move common smp_parse code to caller
>>       machine: add error propagation to mc->smp_parse
>>       machine: pass QAPI struct to mc->smp_parse
>>       machine: reject -smp dies!=3D1 for non-PC machines
>>       machine: add smp compound property
>>       vnc: avoid deprecation warnings for SASL on OS X
>
> None of these changes have any reviewed-by tags.

PATCH 03 looks unfamiliar, so I checked: it hasn't been posted before.

>                                                  Was this really meant
> to be sent as a PULL before getting reviews ?

Seems likely; I very much doubt Paolo would be trying to pull a fast one
on us ;)

Just to be machine-readably explicit:
Nacked-by: Markus Armbruster <armbru@redhat.com>


