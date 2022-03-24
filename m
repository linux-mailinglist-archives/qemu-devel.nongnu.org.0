Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008E74E69E5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 21:36:47 +0100 (CET)
Received: from localhost ([::1]:60458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXUCL-0001Vh-QH
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 16:36:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUAd-0000mu-Jt
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 16:34:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUAa-00047Y-7i
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 16:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648154094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xbuAq0sYdo5EJ17WvkFIqOnyI4JQoT+jiOpxN4dxNfU=;
 b=DnjbG6DB0I1S71yxSHmOXIvJGHYYLGxPBQPCc/+G7sTWO+oo/XG3F6S+hh4+5W1J9aW58p
 EHr9ycvIlPBhU5eMFr/uBYorduUhmu+6rohN3+OAr1DeEO618Bpipx2/pi3F7igr7LI8Xe
 Uo69ziZwbvf+b6+ROMgX5zP4HouiiHg=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-v862BnRXMFSPPuLLAOa2mw-1; Thu, 24 Mar 2022 16:34:53 -0400
X-MC-Unique: v862BnRXMFSPPuLLAOa2mw-1
Received: by mail-ua1-f72.google.com with SMTP id
 a19-20020ab04953000000b0035957a2a58dso1581341uad.12
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 13:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xbuAq0sYdo5EJ17WvkFIqOnyI4JQoT+jiOpxN4dxNfU=;
 b=i8LkU35nILUC4Jd78UN4OUCYiQtb8COzIa2G21Io0cwf3OY6fTqrLynRG73eqypcsm
 37Fh4dAHsMkx1000wGN3xM8ZqFD6C/IBeof/inCks2+xY45H27bFAzsKDCdwCUMX9Kk2
 HN4d1T9Kjg82jUytY42YjVoJMubHfBAyeVg42/Ls+sG0A02mhT44/pkiFQNsX2pOa1ES
 ea0aS3H1EeeUcZMQbjc541vBiGHRnk7/4fiWPr2NWSOBXr7UmsteolkTcL+6wM8tEzAn
 p8OuEi4cMdPMka8oygIFR9h1T8TVRSYnUS2s4fNvRnXFYs2Qlm+eIgHUEEnln6IQ6ytP
 I6ag==
X-Gm-Message-State: AOAM531AeVzN3thOjYGR2Zb7RCJw2l4o2Y46LoOyDWNSPlJ8XuQ6YMvB
 W0GF28MPN9VFtR4YdSw0MwMlKMHqhQ2VBFQN9XG4hyMcnuHDuy8nFmvwdaTM4tIV517hUyOF2Vv
 tOt2NXBTo4KS6Fg0PLc2MHXbroyR6vhk=
X-Received: by 2002:a05:6122:2186:b0:33f:c30b:9b46 with SMTP id
 j6-20020a056122218600b0033fc30b9b46mr2142506vkd.26.1648154092916; 
 Thu, 24 Mar 2022 13:34:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdMBCPReTrqbhbcvm2ti1fGvnQmZhVv1Ze2LOXN0IYcY5PBWMR1HuvjVOCZ209izi0Ejd1XAGskTSWs7KZ1CU=
X-Received: by 2002:a05:6122:2186:b0:33f:c30b:9b46 with SMTP id
 j6-20020a056122218600b0033fc30b9b46mr2142497vkd.26.1648154092736; Thu, 24 Mar
 2022 13:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-2-victortoso@redhat.com>
In-Reply-To: <20220324175015.232794-2-victortoso@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 24 Mar 2022 16:34:42 -0400
Message-ID: <CAFn=p-aMfoxMn7ZUT1ZK4ifP6J-1PB4nj+74BM2OwAxnWKWX7Q@mail.gmail.com>
Subject: Re: [PATCH 01/14] qapi: BlockExportRemoveMode: move comments to TODO
To: Victor Toso <victortoso@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> @hide and @soft are potential additions which fits the TODO section
> perfectly.
>
> The main motivation is to avoid this whole block of comment entering
> the wrong section in the python parser.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/block-export.json | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/qapi/block-export.json b/qapi/block-export.json
> index f183522d0d..1e34927f85 100644
> --- a/qapi/block-export.json
> +++ b/qapi/block-export.json
> @@ -219,13 +219,13 @@
>  #
>  # @hard: Drop all connections immediately and remove export.
>  #
> -# Potential additional modes to be added in the future:
> +# TODO: Potential additional modes to be added in the future:
>  #
> -# hide: Just hide export from new clients, leave existing connections as is.
> -# Remove export after all clients are disconnected.
> +#       hide: Just hide export from new clients, leave existing connections as is.
> +#       Remove export after all clients are disconnected.
>  #
> -# soft: Hide export from new clients, answer with ESHUTDOWN for all further
> -# requests from existing clients.
> +#       soft: Hide export from new clients, answer with ESHUTDOWN for all further
> +#       requests from existing clients.
>  #
>  # Since: 2.12
>  ##
> --
> 2.35.1
>

Does this help with something in particular? (Got an example for me?)

--js


