Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE6964028C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 09:55:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p11o5-0004D3-S8; Fri, 02 Dec 2022 03:54:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p11o2-0004Cd-SC
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 03:54:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p11o1-0007pk-D6
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 03:54:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669971240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aQcCSXiFAF2L81EAA5lji2vAstDjVjeWxi4Yd9lyf48=;
 b=CVsq7VlWjZYWeI93tiKXNz8ZfteqRoOX8jSEKyQQ83jq7wncEzoDW7ofUHLYGO2JhuMdKZ
 w0/VhaR6b/SGlNWLHV17UmSU+joQ84HoxJ+46nyRgaCzMS0Fo6+gFnCVOufSXFOGEbtrE9
 0vXw+aUdhm5n9KiChyUqEvJnnzR39uA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-u3ii-unoMP6JoLGOF_lwxA-1; Fri, 02 Dec 2022 03:53:56 -0500
X-MC-Unique: u3ii-unoMP6JoLGOF_lwxA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32EBB811E75;
 Fri,  2 Dec 2022 08:53:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9B751402BDA;
 Fri,  2 Dec 2022 08:53:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C80B021E6921; Fri,  2 Dec 2022 09:53:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Vikram Garhwal <vikram.garhwal@amd.com>,  qemu-dev@xilinx.com,
 stefano.stabellini@amd.com,  alex.bennee@linaro.org,
 xen-devel@lists.xenproject.org,  Stefano Stabellini
 <sstabellini@kernel.org>,  Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul@xen.org>,  "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: Re: [QEMU][PATCH v2 07/11] hw/xen/xen-hvm-common: Use g_new and
 error_setg_errno
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-8-vikram.garhwal@amd.com>
 <e7922267-9a87-8936-942e-e73a789672f9@linaro.org>
Date: Fri, 02 Dec 2022 09:53:52 +0100
In-Reply-To: <e7922267-9a87-8936-942e-e73a789672f9@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 2 Dec 2022 08:27:39
 +0100")
Message-ID: <871qpitcdb.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 2/12/22 03:59, Vikram Garhwal wrote:
>> Replace g_malloc with g_new and perror with error_setg_errno.
>>=20
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> ---
>>   hw/xen/xen-hvm-common.c | 15 ++++++++-------
>>   1 file changed, 8 insertions(+), 7 deletions(-)
>
>
>> @@ -717,7 +717,7 @@ void destroy_hvm_domain(bool reboot)
>>      xc_interface *xc_handle;
>>      int sts;
>>      int rc;
>> -
>> +    Error *errp =3D NULL;
>>      unsigned int reason =3D reboot ? SHUTDOWN_reboot : SHUTDOWN_powerof=
f;
>>=20=20=20
>>      if (xen_dmod) {
>> @@ -726,7 +726,7 @@ void destroy_hvm_domain(bool reboot)
>>              return;
>>          }
>>          if (errno !=3D ENOTTY /* old Xen */) {
>> -            perror("xendevicemodel_shutdown failed");
>> +            error_setg_errno(&errp, errno, "xendevicemodel_shutdown fai=
led");
>
> See "qapi/error.h":
>
>   * =3D Passing errors around =3D
>   *
>   * Errors get passed to the caller through the conventional @errp
>   * parameter.
>
> Here you are not passing the error to the caller.

Instead, you're leaking its memory.

> Maybe you are looking for the "qemu/error-report.h" API?

Plausible.

Also, @errp is the conventional name for the Error ** parameter used to
pass errors to the caller.  Local Error * variables are usually called
@err or @local_err (I prefer the former).

[...]


