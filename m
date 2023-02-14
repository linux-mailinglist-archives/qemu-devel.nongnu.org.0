Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C7D695DAE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 09:54:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRr55-00036O-6e; Tue, 14 Feb 2023 03:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pRr53-00036F-Nn
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:54:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pRr51-0000p3-Ts
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:54:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676364866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fsjeipjiQ7yxq9BsCSYjsPDzA7VHoXsZUedJYItFDKQ=;
 b=NP3qvmQ9q2OAek6Dd3y+IAAiNpuORgwKg/7lje9qfunTF4H35dkLHKoQOFbpjMlSBRgISk
 cFWNFlu4lyfxSnx6Bfe1vQRTIMmnw0oGtEudJHZTBsGKL5f3DSSKBOES0qbGs6HPWWMr88
 qe02gByWWm8ypMy0ZOBwzRrF0fVhEtc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-uCio9HQVOvq8eEPu_JsLPw-1; Tue, 14 Feb 2023 03:54:24 -0500
X-MC-Unique: uCio9HQVOvq8eEPu_JsLPw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7A52971087;
 Tue, 14 Feb 2023 08:54:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 652BD1121318;
 Tue, 14 Feb 2023 08:54:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3A8B421E6A1F; Tue, 14 Feb 2023 09:54:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org,  eblake@redhat.com,  eduardo@habkost.net,
 pbonzini@redhat.com,  marcel.apfelbaum@gmail.com,  mst@redhat.com,
 philmd@linaro.org,  den-plotnikov@yandex-team.ru,
 antonkuchin@yandex-team.ru,  "reviewer:Incompatible changes"
 <libvir-list@redhat.com>
Subject: Re: [PATCH v4 14/16] qapi: deprecate "device" field of DEVICE_* events
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-15-vsementsov@yandex-team.ru>
 <Y+pFe4bRCqbJJbp0@redhat.com>
Date: Tue, 14 Feb 2023 09:54:22 +0100
In-Reply-To: <Y+pFe4bRCqbJJbp0@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Mon, 13 Feb 2023 14:13:15 +0000")
Message-ID: <87bklwoce9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Feb 13, 2023 at 05:01:01PM +0300, Vladimir Sementsov-Ogievskiy wr=
ote:
>> The device field is redundant, because QOM path always include device
>> ID when this ID exist.
>
> The flipside to that view is that applications configuring QEMU are
> specifying the device ID for -device (CLI) / device_add (QMP) and
> not the QOM path. IOW, the device ID is the more interesting field
> than QOM path, so feels like the wrong one to be dropping.

QOM path is a reliable way to identify a device.  Device ID isn't:
devices need not have one.  Therefore, dropping the QOM path would be
wrong.

> Is there any real benefit to dropping this ?=20

The device ID is a trap for the unwary: relying on it is fine until you
run into a scenario where you have to deal with devices lacking IDs.

I suggested to deprecate it in review of "[PATCH v3 14/15] qapi:
introduce DEVICE_ON event" (Message-ID: <873579x67l.fsf@pond.sub.org>).
Quote:

    We commonly send both device ID and QOM path, mostly for historical
    reasons: the former precede the latter.

    There are exceptions, such as query-cpus-fast.  Can't say offhand
    whether CPUs can be created with IDs.

    [...]

    I'd be in favour of deprecating and deleting redundant device IDs in QMP
    output.


