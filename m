Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25148365BD7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 17:05:26 +0200 (CEST)
Received: from localhost ([::1]:42732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYrwL-000422-6W
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 11:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lYruN-0003Wu-Mj
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:03:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lYruE-0000hs-KD
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:03:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618930993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WYdZiTMoV10/mAfw1mxykHyo7wD0NAG9K2gC/DLVhDk=;
 b=EQo7QqLt0Imtu/G35OxkeH5WmRcsmV6WrSFhSr6CoESBFv2my6OiJVgo+uDQpoU0eqgXTm
 pZs1pKMvKGWi6QoZElgyRDv1T7NvFNNNqt71n5IEwz1+hSDnwYs8eYJ6o/CSX3pkraYzHs
 8IDznayIuBxIyuQIlNN3sG3VDznnTD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-3YJ91Yl4NUOjOCRSPdiDGg-1; Tue, 20 Apr 2021 11:03:11 -0400
X-MC-Unique: 3YJ91Yl4NUOjOCRSPdiDGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF8F364165;
 Tue, 20 Apr 2021 15:03:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21015510ED;
 Tue, 20 Apr 2021 15:03:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AF43A113525D; Tue, 20 Apr 2021 17:03:00 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH for-6.0?] qga: fix guest-get-disks regression
References: <20210420125831.233092-1-marcandre.lureau@redhat.com>
Date: Tue, 20 Apr 2021 17:03:00 +0200
In-Reply-To: <20210420125831.233092-1-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 20 Apr 2021 16:58:31 +0400")
Message-ID: <8735vl578b.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Commit 54aa3de72 ("qapi: Use QAPI_LIST_PREPEND() where possible")
> inadvertently removed the has_dependencies from the partition disk
> info, resulting in empty list being returned.
>
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1950833
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qga/commands-posix.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 4299ebd96f..75dbaab68e 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -1376,6 +1376,7 @@ static GuestDiskInfoList *get_disk_partitions(
>          partition =3D g_new0(GuestDiskInfo, 1);
>          partition->name =3D dev_name;
>          partition->partition =3D true;
> +        partition->has_dependencies =3D true;
>          /* Add parent disk as dependent for easier tracking of hierarchy=
 */
>          QAPI_LIST_PREPEND(partition->dependencies, g_strdup(disk_dev));

This is a recent regression, and the fix is as safe as they get.  Please
apply for 6.0.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


