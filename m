Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506DC50816A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 08:48:04 +0200 (CEST)
Received: from localhost ([::1]:44502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh48A-0006O4-UW
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 02:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nh3pj-0003Bz-6m
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 02:29:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nh3pf-0002K8-VN
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 02:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650436123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7IiuA+RFYdBeL8dN4JvaOH9/zzMeyOg2LvnVUt4MSPQ=;
 b=dKsa3FIGSKQwztR+zPX7GSzKILJZMgY9CeQZY+cVMgRhP2QuvF+/tROQ75YtqnmUwYn7tt
 cAyquFNNApZnXZAz9/u8d7LUy8bwF3MMrvlwA6q/yyzhdz3muKmbBM7n3nclsdqwvfrm+o
 2ew4e8D1mwPYUA/Stsy5A62vB7bInq4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-EW3acgtYP8eW27ZKKut_hQ-1; Wed, 20 Apr 2022 02:28:41 -0400
X-MC-Unique: EW3acgtYP8eW27ZKKut_hQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A3D93C02B8A;
 Wed, 20 Apr 2022 06:28:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E2F920296A6;
 Wed, 20 Apr 2022 06:28:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1231E21E6A1F; Wed, 20 Apr 2022 08:28:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH] python: add qmp-send program to send raw qmp
 commands to qemu
References: <20220316095455.6473-1-damien.hedde@greensocs.com>
 <YjG68xzV/qrMnhEW@redhat.com> <878rskccjv.fsf@pond.sub.org>
 <86b617c6-2cec-8570-5947-7e584fb1214b@greensocs.com>
 <Yl7u/ZnK2aJxiHVp@redhat.com>
Date: Wed, 20 Apr 2022 08:28:40 +0200
In-Reply-To: <Yl7u/ZnK2aJxiHVp@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 19 Apr 2022 18:18:53 +0100")
Message-ID: <87bkwwgtev.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Apr 05, 2022 at 02:45:14PM +0200, Damien Hedde wrote:
>>=20
>>=20
>> On 4/5/22 07:41, Markus Armbruster wrote:
>> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>> >=20
>> > > On Wed, Mar 16, 2022 at 10:54:55AM +0100, Damien Hedde wrote:
>> > > > It takes an input file containing raw qmp commands (concatenated j=
son
>> > > > dicts) and send all commands one by one to a qmp server. When one
>> > > > command fails, it exits.
>> > > >=20
>> > > > As a convenience, it can also wrap the qemu process to avoid having
>> > > > to start qemu in background. When wrapping qemu, the program retur=
ns
>> > > > only when the qemu process terminates.
>> > > >=20
>> > > > Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> >=20
>> > [...]
>> >=20
>> > > > I name that qmp-send as Daniel proposed, maybe qmp-test matches be=
tter
>> > > > what I'm doing there ?
>> > >=20
>> > > 'qmp-test' is a use case specific name. I think it is better to
>> > > name it based on functionality provided rather than anticipated
>> > > use case, since use cases evolve over time, hence 'qmp-send'.
>> >=20
>> > Well, it doesn't just send, it also receives.
>> >=20
>> > qmpcat, like netcat and socat?
>> >=20
>>=20
>> anyone against qmpcat ?
>
> Fine with me[1], though I would have slight preference for 'qmp-cat'
> to have a common tab-completion prefix with existing qmp-shell command.

No objections to the dash..

>
> With regards,
> Daniel
>
> [1] Especially if it displays a pretty ascii art cat when you pass
>     the --help flag ;-P

A cat "singing" to an emu?  Count me in!


