Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B46C732D766
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 17:07:24 +0100 (CET)
Received: from localhost ([::1]:51418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHqVX-0003u0-8a
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 11:07:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lHqTu-0002vQ-8G
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:05:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lHqTr-00016I-DI
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:05:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614873938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qY1DlRsij3cTrbhkPV5OgPfiBwcs7doGA1y8LRt1/t0=;
 b=dKy2V+R9kAFBizb9Di6FdXSbEzcsazFozefRcJ/RAYJ0wd959h6N3iTH3GzBMq7m6qlNrk
 6gNFC3GNP3RNFJSEWnbtD6KpsCgOLmvSFyzbfnO/YwGIXeNnJw4ceuBTIFROYgxoSr6gQn
 Qp+fY68OOjFEQdIALUMR0WTxQElc50E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-no-0lgYdN2q0sICV6b5Euw-1; Thu, 04 Mar 2021 11:05:36 -0500
X-MC-Unique: no-0lgYdN2q0sICV6b5Euw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B14E38030D1;
 Thu,  4 Mar 2021 16:05:33 +0000 (UTC)
Received: from gondolin (ovpn-114-163.ams2.redhat.com [10.36.114.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 305F6179B3;
 Thu,  4 Mar 2021 16:05:24 +0000 (UTC)
Date: Thu, 4 Mar 2021 17:05:21 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 02/19] target/s390x/kvm: Simplify debug code
Message-ID: <20210304170521.78c61998.cohuck@redhat.com>
In-Reply-To: <20210303182219.1631042-3-philmd@redhat.com>
References: <20210303182219.1631042-1-philmd@redhat.com>
 <20210303182219.1631042-3-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  3 Mar 2021 19:22:02 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> We already have the 'run' variable holding 'cs->kvm_run' value.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  target/s390x/kvm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> index 7a892d663df..73f816a7222 100644
> --- a/target/s390x/kvm.c
> +++ b/target/s390x/kvm.c
> @@ -1785,8 +1785,7 @@ static int handle_intercept(S390CPU *cpu)
>      int icpt_code =3D run->s390_sieic.icptcode;
>      int r =3D 0;
> =20
> -    DPRINTF("intercept: 0x%x (at 0x%lx)\n", icpt_code,
> -            (long)cs->kvm_run->psw_addr);
> +    DPRINTF("intercept: 0x%x (at 0x%lx)\n", icpt_code, (long)run->psw_ad=
dr);
>      switch (icpt_code) {
>          case ICPT_INSTRUCTION:
>          case ICPT_PV_INSTR:

Thanks, queued this one to s390-next.


