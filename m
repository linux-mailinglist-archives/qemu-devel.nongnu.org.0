Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B2032A157
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 14:49:06 +0100 (CET)
Received: from localhost ([::1]:35682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH5Ob-0000FX-Gb
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 08:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lH5Ku-0006Mn-Hz
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 08:45:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lH5Ks-0003yz-VN
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 08:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614692714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zdOV7sRAmym0DGGp0xsu7a49ogPacbB8hByEPFNpk/c=;
 b=PPUFecw3zlX1smZF5J8xa/F+rRYbKuat7h0LMHhbnoKn4z4N0slZiDmd+/eXaW+CZo+JwG
 bYkk/edLGRbZEKNVFZQvi+ToDaUQ1TGcQ5WicuBJbjxjg/p0Kw5DTaKZEl34Pr3f9pssQp
 DjqkTpFn5o8rfG2YsMNXUYs3B/EA5kA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-jXD0e5HtMiO9_9_CjJrkeg-1; Tue, 02 Mar 2021 08:45:12 -0500
X-MC-Unique: jXD0e5HtMiO9_9_CjJrkeg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 788DB80196C;
 Tue,  2 Mar 2021 13:45:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45A1D60BFA;
 Tue,  2 Mar 2021 13:45:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0177B113860F; Tue,  2 Mar 2021 14:45:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Andrey Shinkevich via <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 4/5] iotests: 129 don't check backup "busy"
References: <1606484146-913540-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1606484146-913540-5-git-send-email-andrey.shinkevich@virtuozzo.com>
Date: Tue, 02 Mar 2021 14:45:09 +0100
In-Reply-To: <1606484146-913540-5-git-send-email-andrey.shinkevich@virtuozzo.com>
 (Andrey Shinkevich via's message of "Fri, 27 Nov 2020 16:35:45 +0300")
Message-ID: <87lfb5llei.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 vsementsov@virtuozzo.com, qemu-block@nongnu.org, den@openvz.org,
 mdroth@linux.vnet.ibm.com, mreitz@redhat.com, pbonzini@redhat.com,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrey Shinkevich via <qemu-devel@nongnu.org> writes:

> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
> Busy is racy, job has it's "pause-points" when it's not busy. Drop this
> check.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/129 | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
> index 0e13244..3c22f64 100755
> --- a/tests/qemu-iotests/129
> +++ b/tests/qemu-iotests/129
> @@ -67,7 +67,6 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>          result = self.vm.qmp("stop")
>          self.assert_qmp(result, 'return', {})
>          result = self.vm.qmp("query-block-jobs")
> -        self.assert_qmp(result, 'return[0]/busy', True)
>          self.assert_qmp(result, 'return[0]/ready', False)
>  
>      def test_drive_mirror(self):

The same change has since made it to master as commit f9a6256b48
"iotests/129: Do not check @busy".


