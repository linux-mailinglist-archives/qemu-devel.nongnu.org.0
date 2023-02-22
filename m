Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C854D69F40A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 13:09:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUnvJ-0003KA-4H; Wed, 22 Feb 2023 07:08:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUnuu-0003Ew-CU
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 07:08:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUnus-0008MS-TR
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 07:08:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677067690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kH0q2ILHpQoiRtmfNCZIM77/BARv97SCTM0zRiw4Veo=;
 b=Y8vuW+HXcY8wk1hsZ29JbySou/4PSrJJ1n2co5Ja92wvNy4ov4VKGHuhbm+im8xeUZ6uGZ
 dzzgW+Fifj50HCBsjBp3u8xxAFCxv2vc1BiT3MvTPt6y2nnk/Zm46DGXWsCdGuazvFpskr
 CmFUsz5WhrnXLaB1Sq6UtbqZ5BWFktw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-aZ2fak24MyuVTaIeV5Qaew-1; Wed, 22 Feb 2023 07:08:07 -0500
X-MC-Unique: aZ2fak24MyuVTaIeV5Qaew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0E473814950;
 Wed, 22 Feb 2023 12:08:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8938D40168B9;
 Wed, 22 Feb 2023 12:08:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7CE2521E6A1F; Wed, 22 Feb 2023 13:08:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,  qemu-block@nongnu.org,
 hreitz@redhat.com,  aesteve@redhat.com,  nsoffer@redhat.com,
 vsementsov@yandex-team.ru
Subject: Reference-counting and finalizers that can fail are uneasy partners
 (was: [PATCH 0/4] qemu-img: Fix exit code for errors closing the image)
References: <20230112191454.169353-1-kwolf@redhat.com>
 <874jsu51sj.fsf@pond.sub.org> <Y8FAkAC3L7oF5q48@redhat.com>
 <87cz6b9ivm.fsf@pond.sub.org>
Date: Wed, 22 Feb 2023 13:08:05 +0100
In-Reply-To: <87cz6b9ivm.fsf@pond.sub.org> (Markus Armbruster's message of
 "Wed, 15 Feb 2023 14:07:57 +0100")
Message-ID: <87ttzdoqca.fsf_-_@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

A half-baked thought has been sloshing around in my head.  Perhaps I can
bake it some more by writing it up.

Reference-counting and finalizers that can fail are uneasy partners.

When managing lifetimes manually, you control where finalization
happens.  When finalization can fail, you're as empowered as you could
be to make it fail in a place where you can handle the failure sensibly.

Manual resource management is tedious and error prone, and that's a
serious problem.  Garbage collection takes it off your hands.  Good.
But now finalization happens at some future time, and in garbage
collection context.  Fine when finalization's side effects are
sufficiently harmless.  But what if finalization can fail?  We trade one
serious problem (manual resource management) for another one (handling
finalization failures).

Reference counting is slightly different.  Here, finalization can only
happen at unref, which means you retain more control than with garbage
collection.  However, we do need unrefs in places where we can't
sensibly handle failure.  For instance, when code operates on an object
whose reference count can be dropped concurrently, we need to guard with
a ref/unref bracket to keep the object alive while the code is messing
with it.

The only way out I can see is to systematically avoid finalizers that
can fail, by extracting the part that can fail into a shutdown method,
to be called in a suitable context, and before finalization.

Yes, this takes us back to manual resource management, only we manage
shutdown instead of death.

Finalizing something that has not been shut down would be a programming
error.  A recoverable one, I guess; we can have finalize attempt to shut
down then, and if it fails, just weep into the logs and move on.

We gain a "shut down" state, and new problems may well come with it.


