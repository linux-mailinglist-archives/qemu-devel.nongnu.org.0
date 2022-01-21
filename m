Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39E5496144
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 15:43:27 +0100 (CET)
Received: from localhost ([::1]:50748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAv8Q-0002al-VA
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 09:43:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nAurm-0001XS-5n
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 09:26:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nAurj-0006Ux-NN
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 09:26:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642775169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jimNIN/1PudzYcrnMhDAUyraC4z+3ZbGHcSXbgqVWb8=;
 b=H+GegUZTEqTiLzrxk6O4galV/0nyIOTLrzz/1+b0Wv0XGZgQGB8D5Yggv2f17KfCiD6JLO
 Tm3uMh6xbn6R2ERDTa8Rh+d4YomWY46N1x+D/cO/EiN6H6yy8HSkzhq3qcIglDSA2SsAnZ
 WsqzYEDaVW2v54/uq0Ev52m/SyqgtCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-zEMH9wLCNlScFaKDuIxhUA-1; Fri, 21 Jan 2022 09:26:06 -0500
X-MC-Unique: zEMH9wLCNlScFaKDuIxhUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A903787499D;
 Fri, 21 Jan 2022 14:26:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61E2D81F72;
 Fri, 21 Jan 2022 14:26:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C586B1136421; Fri, 21 Jan 2022 15:26:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 1/3] qsd: Add pre-init argument parsing pass
References: <20211222114153.67721-1-hreitz@redhat.com>
 <20211222114153.67721-2-hreitz@redhat.com>
 <87zgnrubkf.fsf@dusky.pond.sub.org>
 <4a15fbad-b177-f35c-1468-ef14f7ab1887@redhat.com>
 <YehIosxuXCqsGBSW@redhat.com> <87ee5275ya.fsf@dusky.pond.sub.org>
 <ffaf9aee-56e9-c332-09ad-158a3e28758b@redhat.com>
 <87pmol62kv.fsf@dusky.pond.sub.org>
 <f7b6d0e0-ee5f-f7ed-795b-27b13ff816c7@redhat.com>
 <87tudx4c4p.fsf@dusky.pond.sub.org>
 <b2e955f3-2696-5ee3-e8fb-be336e0811c6@redhat.com>
Date: Fri, 21 Jan 2022 15:26:03 +0100
In-Reply-To: <b2e955f3-2696-5ee3-e8fb-be336e0811c6@redhat.com> (Hanna Reitz's
 message of "Fri, 21 Jan 2022 12:16:14 +0100")
Message-ID: <87a6fp4138.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hanna Reitz <hreitz@redhat.com> writes:

> On 21.01.22 11:27, Markus Armbruster wrote:
>> Hanna Reitz <hreitz@redhat.com> writes:
>>> The problem I face is that currently there is no ergonomic way to wait
>>> until the QSD is up and running (besides looping until the PID file
>>> exists), and I don=E2=80=99t think a utility program that doesn=E2=80=
=99t know the QSD
>>> could provide this.=C2=A0 (For example, it looks like daemonize(1) will
>>> have the parent exit immediately, regardless of whether the child is
>>> set up or not.)
>>
>> Why do you need to wait for QSD to be ready?
>>
>> I'm asking because with common daemons, I don't wait, I just connect to
>> their socket and start talking.  They'll reply only when ready.
>
> That only applies when you want to talk to a socket, which I often
> don=E2=80=99t do.=C2=A0 Most of the time I use the storage daemon, I pass=
 all
> --blockdev and --export options through the command line and don=E2=80=99=
t
>  create any socket at all.=C2=A0 When I use the QSD just to export some
> block device, I generally don=E2=80=99t need QMP.

If you export via NBD, why can't you just connect to NBD socket?

> Of course, I could just not do that, and instead only set up QMP and
> then do all the configuration through that (where, as you say, QSD
> will only reply once it can); but that=E2=80=99s much more complicated th=
an
> running a single command.
>
> (Or I could do a mix of both, which I described above, where I=E2=80=99d
> create and have the QSD connect to a Unix socket just to see that
> configuration is done and all exports are up.=C2=A0 I=E2=80=99d prefer no=
t to,
> because it still means using an extra tool (ncat) to create the
> socket.)


