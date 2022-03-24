Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8C44E6A13
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 22:03:44 +0100 (CET)
Received: from localhost ([::1]:52300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXUcR-0008Fz-KB
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 17:03:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUay-0007PV-Ak
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:02:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUav-0001NB-FV
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648155728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JWlpziWNcfqbnuOYcxq9JMswpMf9lr0nFKUg5+Nnqpg=;
 b=X24irxosEn3a6RD+XIG/zwfnPxgHuIBqwakjV7AW6vwvCxCaWS+KWLDMTW4169+FzrNo9r
 2/5BCKvpanjvs5Oj/L5UWa+yRvkDFh5JmZuH7RqJ24Hcodq+9xd0nqdWSNJDFF/jlWysml
 BSqUGYNdNCqNeFW0cgAN6WVoZWLE7o8=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-Hb9_iVpBOjCs_1iRI31blQ-1; Thu, 24 Mar 2022 17:02:07 -0400
X-MC-Unique: Hb9_iVpBOjCs_1iRI31blQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 x3-20020a056130008300b003536b7123b0so1585067uaf.22
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 14:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JWlpziWNcfqbnuOYcxq9JMswpMf9lr0nFKUg5+Nnqpg=;
 b=kI2FMH6QvLvXZK2Jddp2S3xKSGvzgfQVMktHGrc5XZuUcAPo972bZXFb9zZKX+RACr
 QPknZFNGlpZfhpbhBhU7NyV+GdlVhRn8vc63ZkCEMSLdYdqeRdoYSOUR5P2kFDowJGfK
 GanlrhfmITG9n0LrkS+W+sYKZfXyq4gcML39nWurvVFu5Pn8f60yTJ+k1DcnuaTrogi0
 aT8fXjU9oZf+AQw5hYN/6ifcn9A3fTAK6ugHmM/EdNkYYxqdGPRH6l0vp78NjtaDnU9y
 VdhOyfHW+UsPoUlSgqgTfVczdXcLNuB2lEadWWQssxBElUsrosWnW+Ma5S8hv2yQet4Y
 nJQw==
X-Gm-Message-State: AOAM530tgLHTX0DhbSEgc+GBZfzE/EDZN6abIgP5LoySfA7XVJPFk1fm
 CCaNoM8/3YIiwA9xD4y10a1OLxtg3IA5mWpM6f9skEiVPQtIZ1mX8LR2NUJ6bYAtl2RrDUTMSAP
 SheltUNF2M9yLxVtjtuajO75t3i5sDrs=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr3396422vsx.61.1648155725745; 
 Thu, 24 Mar 2022 14:02:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRbdVhLHXBrTYWyQURdjcolKxvNzSggYWD3A8jNlB+++BDj+msmZv3vH3R+QWrZ9KsXBX/nqjaJQ/ThJ2d+Bw=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr3396417vsx.61.1648155725573; Thu, 24
 Mar 2022 14:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-8-victortoso@redhat.com>
In-Reply-To: <20220324175015.232794-8-victortoso@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 24 Mar 2022 17:01:54 -0400
Message-ID: <CAFn=p-an=vdcpbY=8eHq2af5XMRhu25G5w350YqWECDATPmtNw@mail.gmail.com>
Subject: Re: [PATCH 07/14] qapi: fix example of UNPLUG_PRIMARY event
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
> * Timestamp is not optional, let's add for completeness.
> * Add '<-' to signalize it is receiving the data
> * Break likes like most of examples do

Oh, I think you meant "break lines like". That took a long minute to parse.

>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/migration.json | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 18e2610e88..092a63354b 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1736,7 +1736,9 @@
>  # Since: 4.2
>  #
>  # Example:
> -#   {"event": "UNPLUG_PRIMARY", "data": {"device-id": "hostdev0"} }
> +# <- { "event": "UNPLUG_PRIMARY",
> +#      "data": { "device-id": "hostdev0" },
> +#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
>  #
>  ##
>  { 'event': 'UNPLUG_PRIMARY',
> --
> 2.35.1
>

With commit message amended:

Reviewed-by: John Snow <jsnow@redhat.com>


