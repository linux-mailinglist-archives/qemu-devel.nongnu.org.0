Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6173F2055DB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 17:27:27 +0200 (CEST)
Received: from localhost ([::1]:33568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnkpa-0001nt-00
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 11:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jnko9-0000AY-Bq
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 11:25:57 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55457
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jnko6-0000Cz-KD
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 11:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592925953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBAXVsoXXh0/I2Sku0Zs4vjlE275yD39tzwQsaS7Dok=;
 b=DEFBQebIjg/lTtfdnGPbvUXIpH4C1vlsPdyzhNYlFhWYId+SdVcSaGINKZ0y3cswu4y2vV
 0Y2VzxGC6ZtBMz3bFZCnX3lom3gqRrbUm0kwZ/cZTwlKhBRO9tRzhfBTOAUjGLvkfx2Pbf
 R1bYb+tSr5k5G7zDx3fnWTzGGv262R8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-A9yNL1DHOtOBrK8pOcq0nA-1; Tue, 23 Jun 2020 11:25:47 -0400
X-MC-Unique: A9yNL1DHOtOBrK8pOcq0nA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0FBF107ACF2;
 Tue, 23 Jun 2020 15:25:45 +0000 (UTC)
Received: from gondolin (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3CDB60F8D;
 Tue, 23 Jun 2020 15:25:31 +0000 (UTC)
Date: Tue, 23 Jun 2020 17:25:29 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 1/7] accel/kvm: Let kvm_check_extension use global KVM
 state
Message-ID: <20200623172529.4ebe956c.cohuck@redhat.com>
In-Reply-To: <20200623105052.1700-2-philmd@redhat.com>
References: <20200623105052.1700-1-philmd@redhat.com>
 <20200623105052.1700-2-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=207.211.31.81; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 02:54:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, "Michael S.
 Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Jun 2020 12:50:46 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> As KVM supported extentions those should be the same for
> all VMs, it is safe to directly use the global kvm_state
> in kvm_check_extension().
>=20
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  accel/kvm/kvm-all.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index f24d7da783..934a7d6b24 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -913,7 +913,7 @@ int kvm_check_extension(KVMState *s, unsigned int ext=
ension)
>  {
>      int ret;
> =20
> -    ret =3D kvm_ioctl(s, KVM_CHECK_EXTENSION, extension);
> +    ret =3D kvm_ioctl(kvm_state, KVM_CHECK_EXTENSION, extension);
>      if (ret < 0) {
>          ret =3D 0;
>      }

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


