Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEB22835EB
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 14:48:16 +0200 (CEST)
Received: from localhost ([::1]:57972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPPuY-0005Cr-UQ
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 08:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kPPs8-0004Xf-4Q
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 08:45:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kPPs5-0008A7-CT
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 08:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601901939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2CfXhWywyX+EzQ0gjH3UTRq4gSMoGGT7Gfer9Ko3xVg=;
 b=ZlSC6p/lih18SQcTICBG8wK+2/jRDpCUOFpex7yOS90lTKws2xgrvcFVQy6rKL+jcq/rSr
 J8cdl0XD/n+Y11HwszbZKpSUj8m1yVg80pi1sSYqHwX51lzo688ltDVDoXYJbkeYzh0QoO
 UzmLx2tXazF46qNYIpEBUN5rs40DR4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-Zd-gE5MwNiSK52kmWfEsLw-1; Mon, 05 Oct 2020 08:45:34 -0400
X-MC-Unique: Zd-gE5MwNiSK52kmWfEsLw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A65680BCC7;
 Mon,  5 Oct 2020 12:45:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA52B1002EE4;
 Mon,  5 Oct 2020 12:45:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5619A11329C1; Mon,  5 Oct 2020 14:45:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v5 10/10] migration: introduce snapshot-{save, load,
 delete} QMP commands
References: <20201002162747.3123597-1-berrange@redhat.com>
 <20201002162747.3123597-11-berrange@redhat.com>
 <ef01ef63-7b95-88c2-5d31-103d29f9f64f@redhat.com>
 <87a6x1cev5.fsf@dusky.pond.sub.org>
 <20201005113612.GH2385272@redhat.com>
Date: Mon, 05 Oct 2020 14:45:29 +0200
In-Reply-To: <20201005113612.GH2385272@redhat.com> ("Daniel P. =?utf-8?Q?B?=
 =?utf-8?Q?errang=C3=A9=22's?=
 message of "Mon, 5 Oct 2020 12:36:12 +0100")
Message-ID: <87imboc046.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 02:11:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 "Denis V. Lunev" <den@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Oct 05, 2020 at 09:26:54AM +0200, Markus Armbruster wrote:
>> Eric Blake <eblake@redhat.com> writes:
>>=20
>> > On 10/2/20 11:27 AM, Daniel P. Berrang=C3=A9 wrote:
>> >
>> > Do we have a query- command handy to easily learn which snapshot names
>> > are even available to attempt deletion on?  If not, that's worth a
>> > separate patch.
>>=20
>> Oh, I missed that one.  It's the QMP equivalent to "info snapshots", and
>> it is required to finish the job.  Since we're at v5, I'd be okay with a
>> follow-up patch, as long as it is done for 5.2.
>
> "query-named-block-nodes" returns BlockDeviceInfo struct, which
> contains ImageInfo which contains an array of SnapshotInfo. So
> we don't need any new query command.

My Acked-by stands without a new query then.


