Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A7163EDA8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 11:26:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0glP-0007yN-1i; Thu, 01 Dec 2022 05:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0glF-0007v1-Pt
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:25:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0glC-0007vW-NB
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:25:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669890342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X0fQcqq8Np2VJPCM+89Xs6XWUzb/m+KJdYiLSmCL+mo=;
 b=h9A3dIP6APqHycBrLN4lc2KDvz5oYTfkT0ewzDWXVUl7e25h+bfGt6ASkgsGeQPqJY8wi4
 LvkCqMkjillFIDlONEsggk+JTl4vyGKeg73sLWqijWvPhngf5B08+aNS/mPXC1zG3cgatu
 qtgandZGMDLx+EHIoIr1R7fuPVLFsPY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-HiQZIZb9M8y_yWh4mefI4Q-1; Thu, 01 Dec 2022 05:25:40 -0500
X-MC-Unique: HiQZIZb9M8y_yWh4mefI4Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3321486F12A
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 10:25:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0F1A140EBF5;
 Thu,  1 Dec 2022 10:25:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 91E7621E6921; Thu,  1 Dec 2022 11:25:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  kraxel@redhat.com,  dgilbert@redhat.com
Subject: Re: [PATCH 3/9] ui: Drop disabled code for SPICE_CHANNEL_WEBDAV
References: <20221201061311.3619052-1-armbru@redhat.com>
 <20221201061311.3619052-4-armbru@redhat.com>
 <Y4hqiiNzcMVS0t0k@redhat.com>
Date: Thu, 01 Dec 2022 11:25:36 +0100
In-Reply-To: <Y4hqiiNzcMVS0t0k@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 1 Dec 2022 08:49:14 +0000")
Message-ID: <87edtjzahr.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

> On Thu, Dec 01, 2022 at 07:13:05AM +0100, Markus Armbruster wrote:
>> HMP "info spice" has a bit of code to show channel type
>> SPICE_CHANNEL_WEBDAV as "webdav", disabled since commit 7c6044a94e
>> "hmp: info spice: take out webdav" (v2.3.0), because it compiles only
>> with Spice versions 0.12.7 and later.  Our minimum version is 0.12.5.
>
> Last version bump was 4 years ago
>
> commit 1b63665c2c0e0d52735e0dd5217f109fe0dd2322
> Author: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Date:   Wed Nov 28 19:59:32 2018 +0400
>
>     configure: bump spice-server required version to 0.12.5
>
>     ...snip....
>
>     According to repology, all the distros that are build target platforms
>     for QEMU include it:
>=20=20=20=20=20
>           RHEL-7: 0.14.0
>           Debian (Stretch): 0.12.8
>           Debian (Jessie): 0.12.5
>           FreeBSD (ports): 0.14.0
>           OpenSUSE Leap 15: 0.14.0
>           Ubuntu (Xenial): 0.12.6
>
> We moved on from Debian and RHEL since then
>
>    Debian 11: 0.14.3
>    RHEL-8: 0.14.2
>    FreeBSD (ports): 0.14.4
>    Fedora 35: 0.14.0
>    Ubuntu 20.04: 0.14.0
>    OpenSUSE Leap 15.3: 0.14.3
>
> IOW, we can bump to 0.14.0, and then revert the
> webdav conditional commit.

Will do in v2.  Thanks!


