Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9210F48DB7C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 17:16:48 +0100 (CET)
Received: from localhost ([::1]:38000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n82mN-0007xr-GH
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 11:16:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n82hO-0004yV-Qi
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:11:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n82hN-0006ap-71
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:11:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642090293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M2Hjsmexf7hY+DSkVVbBArt5yjF2SPD1JIyX6Kvtaxc=;
 b=YqjzjAnPR5cOmDFIEaIXRTDpd/1hUuX1OQbTa/g0z6YeJHZ8kaLeBnIP6JCs/xC8keVrpU
 XjLx8SbVlCTcqt19NwfT/FlLec+MWqMOXeQ444G5pDy2iZn3pNJvL7N++hxtgxLqoNhEES
 SM+6GIQdkVLhK2ZoD/7WJpOgGuwXiA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-y9Dsq9wIOzabx8RQoxlyOw-1; Thu, 13 Jan 2022 11:11:30 -0500
X-MC-Unique: y9Dsq9wIOzabx8RQoxlyOw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EF768E34CE;
 Thu, 13 Jan 2022 16:10:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-9.ams2.redhat.com [10.36.112.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59D9978AB8;
 Thu, 13 Jan 2022 16:10:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D977C11380A2; Thu, 13 Jan 2022 17:10:48 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: Redesign of QEMU startup & initial configuration
References: <87lf13cx3x.fsf@dusky.pond.sub.org>
 <20220104124059.GA1341@redhat.com>
Date: Thu, 13 Jan 2022 17:10:48 +0100
In-Reply-To: <20220104124059.GA1341@redhat.com> (Richard W. M. Jones's message
 of "Tue, 4 Jan 2022 12:40:59 +0000")
Message-ID: <87tue762gn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 qemu-devel@nongnu.org, Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Richard W.M. Jones" <rjones@redhat.com> writes:

> Sorry for very delayed reply ...
>
> On Thu, Dec 02, 2021 at 07:57:38AM +0100, Markus Armbruster wrote:
>> 1. QMP only
>> 
>>    Management applications need to use QMP for monitoring anyway.  They
>>    may want to use it for initial configuration, too.  Libvirt does.
>> 
>>    They still need to bootstrap a QMP monitor, and for that, CLI is fine
>>    as long as it's simple and stable.
>
> libguestfs actually does not use the QMP monitor but manages to
> configure eveything from the command line just fine.  I've attached
> below a typical example.  (Of course we can use libvirt too, but still
> for many configurations libvirt causes problems unfortunately).

This is just the example I've been looking for: an application that
doesn't really need "QMP only".  Thanks!

>> Human users struggle with inconsistent syntax, insufficiently expressive
>> configuration files, and huge command lines.
>
> One advantage of "huge command lines" is that they document the
> configuration of qemu quite well.  I know it's only an approximation,
> but in many cases it's exactly what we want.  It is frequently the
> case when troubleshooting that we ask the user "what is the qemu
> command line", and they can get that from the libvirt log file or
> through "ps".

Yes.

> So we need to consider this and make sure that everything is changed
> so we don't regress.  libguestfs will need substantial changes and

I think we should try to accomodate how libguestfs wants to use QEMU.

> libvirt must dump the full configuration (qinfo or whatever) to the
> log file.

I believe the entire QMP traffic needs to be logged.

CLI + configuration files are all or nothing: if QEMU starts, all, else
nothing.  When you configure via QMP, any command may fail, and these
failures are not fatal.

In general, we can also have run-time configuration changes via QMP,
such as hot plug.  Another reason to log all QMP traffic.

> I don't really disagreee with anything else you wrote however.

Thanks!


