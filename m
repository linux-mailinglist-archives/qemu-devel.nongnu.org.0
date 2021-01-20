Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D3F2FD2DB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:41:44 +0100 (CET)
Received: from localhost ([::1]:46546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Eg3-0003KP-5V
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2EeG-0002Xs-UE
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:39:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2EeC-0003CN-Et
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611153587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gpOUc2YQ7OzwDdTbIXdu+aF5mwPNkWiU96kyIsUN7as=;
 b=ivM34SUKoXr29srXsfhxmDwVo+4nAoWyEty5oBQoPaoIO3l800kh2eodYy+Bxew3Ey2OZn
 OtKnpmnyDyD9wD/iuHVnPm3wzhA1SLZCEsRWR68E9Ni5a+tPMRCAyQ33WDYpi+nnDkBLmH
 yddl20iULQrQ0l4KQ7H6jOyw/Wpbk4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-dxpYvbjTOU2NminHjRGFOg-1; Wed, 20 Jan 2021 09:39:44 -0500
X-MC-Unique: dxpYvbjTOU2NminHjRGFOg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C69F610054FF;
 Wed, 20 Jan 2021 14:39:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E5D4E155;
 Wed, 20 Jan 2021 14:39:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 650EE113865F; Wed, 20 Jan 2021 15:39:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v9 11/11] migration: introduce snapshot-{save, load,
 delete} QMP commands
References: <20210120104411.3084801-1-berrange@redhat.com>
 <20210120104411.3084801-12-berrange@redhat.com>
Date: Wed, 20 Jan 2021 15:39:36 +0100
In-Reply-To: <20210120104411.3084801-12-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Wed, 20 Jan 2021 10:44:11
 +0000")
Message-ID: <878s8npt93.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> savevm, loadvm and delvm are some of the few HMP commands that have never
> been converted to use QMP. The reasons for the lack of conversion are
> that they blocked execution of the event thread, and the semantics
> around choice of disks were ill-defined.
>
> Despite this downside, however, libvirt and applications using libvirt
> have used these commands for as long as QMP has existed, via the
> "human-monitor-command" passthrough command. IOW, while it is clearly
> desirable to be able to fix the problems, they are not a blocker to
> all real world usage.
>
> Meanwhile there is a need for other features which involve adding new
> parameters to the commands. This is possible with HMP passthrough, but
> it provides no reliable way for apps to introspect features, so using
> QAPI modelling is highly desirable.
>
> This patch thus introduces new snapshot-{load,save,delete} commands to
> QMP that are intended to replace the old HMP counterparts. The new
> commands are given different names, because they will be using the new
> QEMU job framework and thus will have diverging behaviour from the HMP
> originals. It would thus be misleading to keep the same name.
>
> While this design uses the generic job framework, the current impl is
> still blocking. The intention that the blocking problem is fixed later.
> None the less applications using these new commands should assume that
> they are asynchronous and thus wait for the job status change event to
> indicate completion.
>
> In addition to using the job framework, the new commands require the
> caller to be explicit about all the block device nodes used in the
> snapshot operations, with no built-in default heuristics in use.
>
> Note that the existing "query-named-block-nodes" can be used to query
> what snapshots currently exist for block nodes.
>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Looks good to me, my Acked-by stands.


