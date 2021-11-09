Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B540644A73C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:01:04 +0100 (CET)
Received: from localhost ([::1]:42364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkL7v-0000B8-QT
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:01:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkKrk-0000y4-M5
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 01:44:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkKrg-0007cl-So
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 01:44:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636440255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E0IYkj+cq2T2HDHh1iXRB9KmACnHrvBndKNfBpmjQsU=;
 b=Pv+cp5dqno9UigVkkbRRo3ckr1TZl6DfWjY0RpwpZzEtOLFx++rEtcGtbpZlTNMOpRQiJk
 C7VMiP7OMmnZlWH7Jr+jAcCxSvmhHbn0Xa2jBHlz+QLNgJ+bCSR2oo4cwsLEpQV7oXFJuE
 UDWUIwzobE3dXmzZqHyFibZmClEUKc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-Ox9tzCSaN4GGa4QUjKnAeg-1; Tue, 09 Nov 2021 01:44:14 -0500
X-MC-Unique: Ox9tzCSaN4GGa4QUjKnAeg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EF131006AA0;
 Tue,  9 Nov 2021 06:44:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFDF25F4E9;
 Tue,  9 Nov 2021 06:44:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1628F11380A7; Tue,  9 Nov 2021 07:44:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: Poking around bdrv_is_inserted()
References: <87tuglg7ly.fsf@dusky.pond.sub.org>
Date: Tue, 09 Nov 2021 07:44:11 +0100
In-Reply-To: <87tuglg7ly.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Tue, 09 Nov 2021 07:34:33 +0100")
Message-ID: <8735o5g75w.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Screwed up qemu-devel@nongnu.org, sorry for the inconvenience.

Markus Armbruster <armbru@redhat.com> writes:

> bdrv_is_inserted() returns false when:
>
>     /**
>      * Return TRUE if the media is present
>      */
>     bool bdrv_is_inserted(BlockDriverState *bs)
>     {
>         BlockDriver *drv = bs->drv;
>         BdrvChild *child;
>
>         if (!drv) {
>             return false;
>
> 1. @bs has no driver (this is how we represent "no medium").
>
>         }
>         if (drv->bdrv_is_inserted) {
>             return drv->bdrv_is_inserted(bs);
>
> 2. Its driver's ->bdrv_is_inserted() returns false.  This is how
> passthrough block backends signal "host device has no medium".  Right
> now, the only user is "host_cdrom".
>
>         }
>         QLIST_FOREACH(child, &bs->children, next) {
>             if (!bdrv_is_inserted(child->bs)) {
>                 return false;
>
> 3. Any of its children has no medium.  Common use looking through
> filters, which have a single child.
>
>             }
>         }
>         return true;
>     }
>
> Makes sense.
>
> Now look at the uses of QERR_DEVICE_HAS_NO_MEDIUM.
>
> * external_snapshot_prepare() in blockdev.c:
>
>     if (!bdrv_is_inserted(state->old_bs)) {
>         error_setg(errp, QERR_DEVICE_HAS_NO_MEDIUM, device);
>         goto out;
>     }
>
>   where @device is the device name, i.e. BlockdevSnapshot member @node
>   or BlockdevSnapshotSync member @device.  Uh-oh: the latter can be
>   null.  If we can reach the error_setg() then, we crash on some
>   systems.
>
> * bdrv_snapshot_delete() and bdrv_snapshot_load_tmp() in
>   block/snaphot.c:
>
>     if (!drv) {
>         error_setg(errp, QERR_DEVICE_HAS_NO_MEDIUM, bdrv_get_device_name(bs));
>         return -ENOMEDIUM;
>     }
>
>   where @drv is bs->drv.
>
>   Why do we check only for 1. here instead of calling
>   bdrv_is_inserted()?


