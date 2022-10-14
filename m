Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1688F5FEBBC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 11:35:46 +0200 (CEST)
Received: from localhost ([::1]:55860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojH6X-000895-0o
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 05:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ojH2K-0005E0-9d
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 05:31:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ojH2H-0007Yk-QI
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 05:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665739880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GNJCXxsvVqbKzKy6ZFr2BWc+CcvBDBoxEAGzcgVzrks=;
 b=dGCgIkkhnHLYxNrDqX7r4nv3lBYr4np1hH3KT+MJuv2Yp7RR5+JUjkedxpnpujzyviFvpQ
 umPayTM0iFP9dM7WcOqPI/IQF25ge93fFRcPHO+RQpSbSUXxiR9yMaUlyZVcHG40J9Al8b
 Q0//nuX0riiMcwkd/DTAcqFUkfSMFEs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-Ew73iweuNbCqiiQ-VWJGnA-1; Fri, 14 Oct 2022 05:31:16 -0400
X-MC-Unique: Ew73iweuNbCqiiQ-VWJGnA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA19B3814591;
 Fri, 14 Oct 2022 09:31:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55BC2C23F9E;
 Fri, 14 Oct 2022 09:31:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E6B7421E691D; Fri, 14 Oct 2022 11:31:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Denis Plotnikov <den-plotnikov@yandex-team.ru>,  qemu-devel@nongnu.org,
 yc-core@yandex-team.ru,  michael.roth@amd.com,
 vsementsov@yandex-team.ru,  marcandre.lureau@gmail.com
Subject: Re: [PATCH v3] qapi/qmp: Add timestamps to qmp command responses
References: <20221011153408.495401-1-den-plotnikov@yandex-team.ru>
 <87tu47vkdx.fsf@pond.sub.org> <Y0gxfqMXi3gLH/3H@redhat.com>
Date: Fri, 14 Oct 2022 11:31:13 +0200
In-Reply-To: <Y0gxfqMXi3gLH/3H@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 13 Oct 2022 16:40:46 +0100")
Message-ID: <8735bqu4ym.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Oct 13, 2022 at 05:00:26PM +0200, Markus Armbruster wrote:
>> Denis Plotnikov <den-plotnikov@yandex-team.ru> writes:
>>=20
>> > Add "start" & "end" time values to qmp command responses.
>>=20
>> Please spell it QMP.  More of the same below.
>>=20
>> >
>> > These time values are added to let the qemu management layer get the e=
xact
>> > command execution time without any other time variance which might be =
brought by
>> > other parts of management layer or qemu internals. This is particulary=
 useful
>> > for the management layer logging for later problems resolving.
>>=20
>> I'm still having difficulties seeing the value add over existing
>> tracepoints and logging.
>>=20
>> Can you tell me about a problem you cracked (or could have cracked) with
>> the help of this?
>
> Consider your QMP client is logging all commands and replies in its
> own logfile (libvirt can do this). Having this start/end timestamps
> included means the QMP client log is self contained.

A QMP client can include client-side timestamps in its log.  What value
is being added by server-side timestamps?  According to the commit
message, it's for getting "the exact command execution time without any
other time variance which might be brought by other parts of management
layer or qemu internals."  Why is that useful?  In particular, why is
excluding network and QEMU queueing delays (inbound and outbound)
useful?

> Relying on tracing means that when a user attaches the QMP client log
> to a bug report, the timing info is missing. You have to ask the user
> to try to reproduce again with QEMU tracing enabled, which may be
> impossible, and then correlate the tracing output with the QMP client
> log.
>
> QEMU side tracing & logging is fine, but not a substitute for having
> this info included by default IMHO.

Not an answer to my question, but helpful all the same.


