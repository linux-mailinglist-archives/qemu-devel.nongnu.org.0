Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE77B4E6A40
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 22:32:15 +0100 (CET)
Received: from localhost ([::1]:47806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXV42-0000wl-Vx
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 17:32:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXV3A-0000BV-GL
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:31:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXV38-0006Mm-6V
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:31:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648157477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iKD5dMCYGGIupsMv3MMz9uGr/oVtKCar3qVpb4aOqL8=;
 b=WI4M6/vKVSikpb+vohD8DyqOCyddAktShAeCdH+tJc4FeeH4kXuJOT7C+sHNkm/aU0tMVM
 OvcHvkneigEcgk5Vz1Rhhn3c2FOgpqg2+WIS7kf0Wvs/ruu4znpk8e+L3QU2qOV5Iid+pO
 9L735yrJPQXYo7E8S+j24jfdAaBFkXc=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-zpycGGN6PzuulgvjkTCwrQ-1; Thu, 24 Mar 2022 17:31:16 -0400
X-MC-Unique: zpycGGN6PzuulgvjkTCwrQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 o25-20020ab008d9000000b0034c03fd28b8so1613322uaf.14
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 14:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iKD5dMCYGGIupsMv3MMz9uGr/oVtKCar3qVpb4aOqL8=;
 b=onlOZX+VAYIyqqbGAjOoibum6khsCVp+f6mlW6r/hCXcbWNeb8gkSeESaIK4AQxe1k
 L46dCYmzkyTZDRNvPKJMAJBt/XWAVhhNHGGd3w8BfEQwJQ9Es2mNPMI+vhNMTgT15WlG
 gIAw76xFHJQf5HIBWze1XjidOPXUrKyXTr+GW4WGqIdrtlXueFnZOSU138lUP/AeIrXj
 z7ZZ5V5T+LfeqWCZZueD5wkBwyxoRYoUa2G/DZcIBjOkcZR42MAuA8XTnD0LQwVwKYJW
 aamNmJWr3eLL3eGIH828/o1J5bb7iYDzzoSvc9ETIv6KyzKFhcbPQbM3pRd0SJ0rBKug
 gqKA==
X-Gm-Message-State: AOAM533PJwLElRG468tN18yY1TDh3E1MsefzcNQ0SfcJ1hv7rTm24TbN
 8V2eREkWgEXg0rnA66NRZcMEKZEfoUWezSIRsbTgsP2w/XNIhTDnOc7hrMa69/vzmtIl/TStEMw
 omN38nJ8EINEGTX7osXSpuurL2wbYalg=
X-Received: by 2002:a05:6102:c8e:b0:321:7348:6c2a with SMTP id
 f14-20020a0561020c8e00b0032173486c2amr3701632vst.11.1648157475903; 
 Thu, 24 Mar 2022 14:31:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdOqKuQZln5Gq4pLzS/EbOP3mzfQrOcTEJECyAajDnjhfHn8bJ2XiOJBJrXJmiDlZr1KUhXFG5hNqkuYhTfGk=
X-Received: by 2002:a05:6102:c8e:b0:321:7348:6c2a with SMTP id
 f14-20020a0561020c8e00b0032173486c2amr3701622vst.11.1648157475686; Thu, 24
 Mar 2022 14:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-14-victortoso@redhat.com>
In-Reply-To: <20220324175015.232794-14-victortoso@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 24 Mar 2022 17:31:05 -0400
Message-ID: <CAFn=p-ZdG1PTd6s1tgYv66zWp4NZqWA2pTo3cvNNEsrwUoBdHg@mail.gmail.com>
Subject: Re: [PATCH 13/14] qapi: fix example of ACPI_DEVICE_OST event
To: Victor Toso <victortoso@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 1:50 PM Victor Toso <victortoso@redhat.com> wrote:
>
> * Missing the timestamp
> * Missing the "info" object in the "data" member
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/acpi.json | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/acpi.json b/qapi/acpi.json
> index 51f0d55db7..d148f6db9f 100644
> --- a/qapi/acpi.json
> +++ b/qapi/acpi.json
> @@ -133,8 +133,9 @@
>  # Example:
>  #
>  # <- { "event": "ACPI_DEVICE_OST",
> -#      "data": { "device": "d1", "slot": "0",
> -#                "slot-type": "DIMM", "source": 1, "status": 0 } }
> +#      "data": { "info": { "device": "d1", "slot": "0",
> +#                          "slot-type": "DIMM", "source": 1, "status": 0 } },
> +#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
>  #
>  ##
>  { 'event': 'ACPI_DEVICE_OST',
> --
> 2.35.1
>

Oh, good spot.

Reviewed-by: John Snow <jsnow@redhat.com>


