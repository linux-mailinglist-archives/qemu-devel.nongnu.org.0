Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1925C2F7D9A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:04:49 +0100 (CET)
Received: from localhost ([::1]:44316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Pia-0004my-4y
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:04:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l0P6m-0001WZ-1q
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:25:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l0P6k-0004nz-BR
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:25:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610717141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nxo+yfeV3rb2MNyXYxMdBWJSPFbVm2cEVyBVrdkUiFk=;
 b=XuRyc5yxdmRSS/GQH3Kiz//WNHEGecuDVKEB+tJhhY5g2eY3t2/WDb/TZ+x8wuEsQpGrE5
 V0jvWcBRsSkY+wpehPlBCHkasL2RIJprk0MmjN2o0PUjMV0JDOHzdbPeh+csoR/MfNwD1h
 Q3iI34ZvgzhJye2ziaWrlEVwsGrdxCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-HY14-hnKPway_X0lShLY7w-1; Fri, 15 Jan 2021 08:25:39 -0500
X-MC-Unique: HY14-hnKPway_X0lShLY7w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07FAA814418;
 Fri, 15 Jan 2021 13:25:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-142.ams2.redhat.com
 [10.36.115.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9366D722D1;
 Fri, 15 Jan 2021 13:25:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 124A811386A7; Fri, 15 Jan 2021 14:25:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH] vnc: add qmp to support reload vnc tls certificates
References: <20210104071128.754-1-changzihao1@huawei.com>
 <20210104122740.GI640208@redhat.com>
Date: Fri, 15 Jan 2021 14:25:23 +0100
In-Reply-To: <20210104122740.GI640208@redhat.com> ("Daniel P. =?utf-8?Q?Be?=
 =?utf-8?Q?rrang=C3=A9=22's?=
 message of "Mon, 4 Jan 2021 12:27:40 +0000")
Message-ID: <87wnwemiws.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: oscar.zhangbo@huawei.com, Zihao Chang <changzihao1@huawei.com>,
 kraxel@redhat.com, xiexiangyou@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Jan 04, 2021 at 03:11:28PM +0800, Zihao Chang wrote:
>> QEMU loads vnc tls certificates only when vm is started. This patch
>> provides a new qmp command to reload vnc tls certificates without
>> restart vnc-server/VM.
>>=20
>> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
[...]
>> diff --git a/ui/vnc.c b/ui/vnc.c
>> index 7452ac7df2..b0cfbcf47c 100644
>> --- a/ui/vnc.c
>> +++ b/ui/vnc.c
>> @@ -582,6 +582,26 @@ VncInfo2List *qmp_query_vnc_servers(Error **errp)
>>      return prev;
>>  }
>> =20
>> +int vnc_display_reload_cert(const char *id, Error **errp)
>> +{
>> +    VncDisplay *vd =3D vnc_display_find(id);
>> +
>> +    if (!vd) {
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (!vd->tlscreds) {
>> +        error_printf_unless_qmp("If you want use vnc tls  please enable=
 "
>> +                                "vnc tls using '-vnc tls-creds=3D${tls-=
obj-id}'.\n");
>> +        return -EPERM;
>
> You're passing in a 'Error' object, so use that and don't retyrn errnos

Do return a value that indicates success / failure.  See the big comment
in include/qapi/error.h for why.

I recommend bool unless callers need to distinguish between several
failures.

[...]


