Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E053DE654
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 07:49:30 +0200 (CEST)
Received: from localhost ([::1]:54818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAnIv-0007hl-U2
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 01:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAnHv-0006qH-DN
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 01:48:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAnHt-00051U-1J
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 01:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627969702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=go917mmdi4npQ3beJ/AIELLhlj+g2M/fKHjcOcWbnek=;
 b=JUPgKvwXE73guWdZijV2oiIPSE0M3+hfpoVERMDN/16p91gMt0JM6oEQ9z0IMSj+3AWxkF
 3qqJWRFEQeplxaxqwzhSSXDIeUMukCsG/Mwf/5RqV59lqBwQxpFM7vSR95kAu446ux7vrI
 Hz2pbDW5GG3lXI4r39av1OgboLwn0BY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-addfA5WwPhKucUT0OowFNw-1; Tue, 03 Aug 2021 01:48:21 -0400
X-MC-Unique: addfA5WwPhKucUT0OowFNw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FCD7801E72
 for <qemu-devel@nongnu.org>; Tue,  3 Aug 2021 05:48:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18A2E136F5;
 Tue,  3 Aug 2021 05:48:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9640911380A0; Tue,  3 Aug 2021 07:48:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 12/16] vhost: Clean up how VhostOpts method
 vhost_get_config() fails
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-13-armbru@redhat.com>
 <4d0d6438-dc67-4d4a-96d8-d337e589eea8@redhat.com>
Date: Tue, 03 Aug 2021 07:48:08 +0200
In-Reply-To: <4d0d6438-dc67-4d4a-96d8-d337e589eea8@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 2 Aug 2021 20:58:19
 +0200")
Message-ID: <87wnp3jcyv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, "Michael S .
 Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 7/20/21 2:54 PM, Markus Armbruster wrote:
>> vhost_user_get_config() can fail without setting an error.  Unclean.
>> Its caller vhost_dev_get_config() compensates by substituting a
>> generic error then.  Goes back to commit 50de51387f "vhost:
>> Distinguish errors in vhost_dev_get_config()".
>>=20
>> Clean up by moving the generic error from vhost_dev_get_config() to
>> all the failure paths that neglect to set an error.
>>=20
>> Cc: Kevin Wolf <kwolf@redhat.com>
>> Cc: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  hw/virtio/vhost-user.c |  2 ++
>>  hw/virtio/vhost.c      | 10 ++--------
>>  2 files changed, 4 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>> index 29ea2b4fce..dbbd6fbc25 100644
>> --- a/hw/virtio/vhost-user.c
>> +++ b/hw/virtio/vhost-user.c
>> @@ -2139,10 +2139,12 @@ static int vhost_user_get_config(struct vhost_de=
v *dev, uint8_t *config,
>>      msg.payload.config.offset =3D 0;
>>      msg.payload.config.size =3D config_len;
>>      if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>> +        error_setg_errno(errp, -EPROTO, "vhost_get_config failed");
>>          return -EPROTO;
>>      }
>> =20
>>      if (vhost_user_read(dev, &msg) < 0) {
>> +        error_setg_errno(errp, -EPROTO, "vhost_get_config failed");
>>          return -EPROTO;
>>      }
>
> Oops, should be error_setg_errno(EPROTO)!

D'oh!  Thanks!


