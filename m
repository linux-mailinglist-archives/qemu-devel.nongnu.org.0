Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903362C305B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 20:03:04 +0100 (CET)
Received: from localhost ([::1]:36524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khdah-0007ip-MI
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 14:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1khdXj-0006B5-Iy
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 13:59:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1khdXg-0007zq-PY
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 13:59:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606244395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7XwNJdbLYZaAvlFK9DcvQSNEpOoCshlzA3r8DwaCU/Q=;
 b=b2uEDWfaNJ0JLnpv/njG9eh4HWNl9p386FL3/AGDL5ysXZf7+rxzaqibiCtOVIX3zv9c6w
 8ZWIq7qD295ZWD74OvaUGF9TL9fJW9sgmp5QDMj7i6mOT8dquOVLZuKYfPVeWNoLCKgAwg
 Tdiv3AcEG/DNC06O3EbDbDH1TkktQeM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-cRSsdaWdNTmeMUWsN9x5yg-1; Tue, 24 Nov 2020 13:59:52 -0500
X-MC-Unique: cRSsdaWdNTmeMUWsN9x5yg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 488EE180A092;
 Tue, 24 Nov 2020 18:59:51 +0000 (UTC)
Received: from starship (unknown [10.35.206.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4B9D5D9C0;
 Tue, 24 Nov 2020 18:59:48 +0000 (UTC)
Message-ID: <f6df1eedb9785b907807e0581be12c790112d939.camel@redhat.com>
Subject: Re: [PATCH 1/1] Fix qcow2 corruption on discard
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Alberto Garcia <berto@igalia.com>, Kevin Wolf <kwolf@redhat.com>
Date: Tue, 24 Nov 2020 20:59:47 +0200
In-Reply-To: <w51lfeqzimf.fsf@maestria.local.igalia.com>
References: <20201123154929.330338-1-mlevitsk@redhat.com>
 <20201123154929.330338-2-mlevitsk@redhat.com>
 <20201123173853.GE5317@merkur.fritz.box>
 <776008a350e47a33adbe659aa4ba106b6a2daf5f.camel@redhat.com>
 <20201124091723.GA22385@merkur.fritz.box>
 <w51lfeqzimf.fsf@maestria.local.igalia.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, zhang_youjia@126.com,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 andrey.shinkevich@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2020-11-24 at 19:59 +0100, Alberto Garcia wrote:
> On Tue 24 Nov 2020 10:17:23 AM CET, Kevin Wolf wrote:
> > We can then continue work to find a minimal reproducer and merge the
> > test case in the early 6.0 cycle.
> 
> I haven't been able to reproduce the problem yet, do you have any
> findings?
> 
> Berto
> 

I have a working reproducer script. I'll send it in a hour or so.
Best regards,
	Maxim Levitsky


