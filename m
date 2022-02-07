Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30EE4AB7F3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:52:12 +0100 (CET)
Received: from localhost ([::1]:58272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0gt-0004eo-Ob
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:52:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nGzf8-0003DE-NU
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:46:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nGzf3-0001W9-V5
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644223572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=56THlZLoS7C7kkwA0jl52OPCTPSK+81PyyU4+zrq3eU=;
 b=HWprHuMag/7t/YPAH4Gi9L4spT6UBkAb3nTP2Gsmf5rfZwlDB+ee8ndnCMh7ne+V9wrrDw
 omO32J9FkyCkNfMtHZTtuXHIJzt0e778O7j8OJEIGlTlzkD0EL2kJAFQ8hbnt6Io+5K/ao
 KyMx2Oi8gQjMvo5sWQ5sZVs/asyp7sE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-kqt5zQ-oN0-GCSfNX05B3w-1; Mon, 07 Feb 2022 03:46:11 -0500
X-MC-Unique: kqt5zQ-oN0-GCSfNX05B3w-1
Received: by mail-ej1-f72.google.com with SMTP id
 v2-20020a170906292200b006a94a27f903so4034857ejd.8
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 00:46:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=56THlZLoS7C7kkwA0jl52OPCTPSK+81PyyU4+zrq3eU=;
 b=0DQ2kZ/bEpEAqNZUjuP011ut0YDsgntdW7J9kNkVvm2elBn/SJPrCs3E9Ut6nOcivx
 Wta39bmIOJok87Xpn8FLyKsYifURqJzs3z/V7nJnlyz6HJvVbsL4fqdtqiRl9mdhQARu
 hmFjns2UUX8k0VUtw4+bJsFQqfxOEnnpePUlKnua8TAxPFq725dB+ticx9oHtHLjv+k/
 6YEoln394lixll2aps2P4eKMhy5PtK36rcxH6woUwPEmUeKXAn4A7t+io7CwN51E86xU
 /eHWF4+cCtuVTVeLG6NZf6qp81Ci774g+4OEt6kasouwoqWWPgJcueCO5b2/HbTBh6Yy
 7CGQ==
X-Gm-Message-State: AOAM531S6zyMiZNaEpVJfskU7gnoOpRaYn4nMHmAGvGj8cgOXDje35mD
 mPtuglR7U7JRrBjxK+DKkI5xHkG5Nr7ZDoZuFl/mJLSIYMDkyM/XxtInFIReYOk4mzM+gh1KVU7
 7RWjXB/KJ2vFbcJs=
X-Received: by 2002:a05:6402:42c1:: with SMTP id
 i1mr12894574edc.52.1644223570364; 
 Mon, 07 Feb 2022 00:46:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLmCzuRZMwNDWEilu+yqtOzV1JUY3eISaLli8mdiem8VybrQAEnbN2Wv2A9CtzssogitrQcw==
X-Received: by 2002:a17:906:d283:: with SMTP id
 ay3mr8960867ejb.249.1644223074046; 
 Mon, 07 Feb 2022 00:37:54 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id v19sm2855477edw.39.2022.02.07.00.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 00:37:53 -0800 (PST)
Date: Mon, 7 Feb 2022 09:37:52 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v4 4/4] hw/i386/sgx: Attach SGX-EPC objects to machine
Message-ID: <20220207093752.7503b6cb@redhat.com>
In-Reply-To: <20220205124526.500158-5-f4bug@amsat.org>
References: <20220205124526.500158-1-f4bug@amsat.org>
 <20220205124526.500158-5-f4bug@amsat.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, "Daniel P .
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat,  5 Feb 2022 13:45:26 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Previously SGX-EPC objects were exposed in the QOM tree at a path
>=20
>   /machine/unattached/device[nn]
>=20
> where the 'nn' varies depending on what devices were already created.
>=20
> With this change the SGX-EPC objects are now at
>=20
>   /machine/sgx-epc[nn]
>=20
> where the 'nn' of the first SGX-EPC object is always zero.

yet again, why it's necessary?

>=20
> Reported-by: Yang Zhong <yang.zhong@intel.com>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/i386/sgx.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> index a2b318dd938..3ab2217ca43 100644
> --- a/hw/i386/sgx.c
> +++ b/hw/i386/sgx.c
> @@ -304,6 +304,8 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>      for (list =3D x86ms->sgx_epc_list; list; list =3D list->next) {
>          obj =3D object_new("sgx-epc");
> =20
> +        object_property_add_child(OBJECT(pcms), "sgx-epc[*]", OBJECT(obj=
));
> +
>          /* set the memdev link with memory backend */
>          object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->mem=
dev,
>                                &error_fatal);


