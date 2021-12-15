Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766434760CE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:34:19 +0100 (CET)
Received: from localhost ([::1]:57656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZ6Y-0000Zb-I6
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:34:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxXua-0004u2-IB
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:17:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxXuX-0001wi-Uh
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:17:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639588668;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mqwrPSbY/JGb754RPS3dLXynKiuM1Q8YUyM0R4IY3/s=;
 b=YYyJ+5QLZDnpb/ac7oI1P8TuWKrpae4NLjIu1CdQJT0YuTR3dp00HvXSZzHCQFw9WYKokj
 U4OayA/N8nt88wkhyQJ5VdenK/Qr/XJXQF0X6RH/XnryT5QkE2guImZarYaSI22O+7Du3X
 HqiVN7mnzmbeBDheVrX4UbtA9bAPjAk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-17-Kc9lsN3OnrrFWZl7J5w-1; Wed, 15 Dec 2021 12:17:47 -0500
X-MC-Unique: 17-Kc9lsN3OnrrFWZl7J5w-1
Received: by mail-wm1-f71.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so12871417wmb.3
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 09:17:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=mqwrPSbY/JGb754RPS3dLXynKiuM1Q8YUyM0R4IY3/s=;
 b=00WRtimj9CP1dbabmXbKIC78D+nxzkr9lBGt7VTlFUfAqgMRvECkw4mIVEmX3AV8F+
 +lsBSMMH5ItPcDFvmNyuEA6w19V0UzY7HcEWyKuVTsbOWvKaURZLMJ+JMPA++oW2RZrL
 aDC2yGvPx4HYrQHsgMv0DjaCVQQKwS8u4FjQ/OTpWPK59xOjJKK3WSIlncqC6wviKTaB
 vE9MmrKMAZG3kXyEJx3crV+L/wGqVOITyZmcanDXTirhprKT+DCeODxGefY+YLp0Vd+e
 +L54foMd6Zi/0ZFcD9MoBRVp/ISi6dLXMd48SYXFRPYGKIQJ1FTUTz8uWhKVd5uxT9VX
 1eCg==
X-Gm-Message-State: AOAM531c3w8Yx2jv57WLnA8kTKH3YThS/sF0m+pBEP8x2L8CO6Mz10jD
 nE6nZHUYHZ8z5GvSKQ0z2cm4KFpSdOzcGkuS8qF4bys6c3ZcTUk3MSRU23Fqh+DMg8eBIX41dQf
 ozZou+/nsVbxkseE=
X-Received: by 2002:adf:b35e:: with SMTP id k30mr5252610wrd.707.1639588666290; 
 Wed, 15 Dec 2021 09:17:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKHtlMM05FfJuT24g0V4eEjEVtkhcnPT9otRnfLgGNY6qO+NzsxwpBpjnJBPlGgBRCIjurcg==
X-Received: by 2002:adf:b35e:: with SMTP id k30mr5252578wrd.707.1639588666140; 
 Wed, 15 Dec 2021 09:17:46 -0800 (PST)
Received: from localhost (static-174-144-85-188.ipcom.comunitel.net.
 [188.85.144.174])
 by smtp.gmail.com with ESMTPSA id o4sm1334197wmc.43.2021.12.15.09.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 09:17:45 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH for-7.0] hw: Add compat machines for 7.0
In-Reply-To: <20211208170241.110551-1-cohuck@redhat.com> (Cornelia Huck's
 message of "Wed, 8 Dec 2021 18:02:41 +0100")
References: <20211208170241.110551-1-cohuck@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 15 Dec 2021 18:17:45 +0100
Message-ID: <87lf0lyeh2.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cornelia Huck <cohuck@redhat.com> wrote:
> Add 7.0 machine types for arm/i440fx/q35/s390x/spapr.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I did a similar one with 6.3 by error, I think we should get a script to
do this everytime that we increase the version number O:-)

Later, Juan.


