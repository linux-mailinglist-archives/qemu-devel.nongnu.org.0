Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0555221F7D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jul 2020 11:16:06 +0200 (CEST)
Received: from localhost ([::1]:53542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvzzp-0000dr-It
	for lists+qemu-devel@lfdr.de; Thu, 16 Jul 2020 05:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvzyF-0007Xy-DC
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 05:14:27 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:24849
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvzyD-0005bc-Mg
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 05:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594890864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F77NVdu6bHX4ViQYCkufmy+yjYSSpBiklfvfdU/XvTo=;
 b=fl49lAHcf1SXwDxQAE3s7+mxv/1SSjrobP9u2GCVb8GX9kD5W/Ysx8EDEcnJPXAnKUt0M5
 +Rx2fdMS/SBPqkkT6XdUiEO6g7014zWWBjCEiUY6VMB/jdxL4I+tcVogiN+ursiXOzvY5h
 LHYGwf6HMjRY66CQ6zalsHzpwwIn5JE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-RwrkU2GHOFuLGjWNWuYjug-1; Thu, 16 Jul 2020 05:14:22 -0400
X-MC-Unique: RwrkU2GHOFuLGjWNWuYjug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1DA98015F4
 for <qemu-devel@nongnu.org>; Thu, 16 Jul 2020 09:14:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B094E78479;
 Thu, 16 Jul 2020 09:14:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3EA5911385E0; Thu, 16 Jul 2020 11:14:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH-for-5.2 5/5] hw/virtio: Simplify
 virtio_mem_set_requested_size()
References: <20200715175835.27744-1-philmd@redhat.com>
 <20200715175835.27744-6-philmd@redhat.com>
Date: Thu, 16 Jul 2020 11:14:20 +0200
In-Reply-To: <20200715175835.27744-6-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 15 Jul 2020 19:58:35
 +0200")
Message-ID: <87a6zzrfdf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 04:55:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Simplify by directly using visit_type_size() return value.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/virtio/virtio-mem.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index ddf09ed1bf..e407abc2d8 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -687,12 +687,9 @@ static void virtio_mem_set_requested_size(Object *ob=
j, Visitor *v,
>                                            Error **errp)
>  {
>      VirtIOMEM *vmem =3D VIRTIO_MEM(obj);
> -    Error *err =3D NULL;
>      uint64_t value;
> =20
> -    visit_type_size(v, name, &value, &err);
> -    if (err) {
> -        error_propagate(errp, err);
> +    if (!visit_type_size(v, name, &value, errp)) {
>          return;
>      }

Crept in after I transformed the pattern in my "Less clumsy error
checking" series.  There are a few more instances.  I expected that to
happen, and intend to transform stragglers periodically until their
supply dries up.


