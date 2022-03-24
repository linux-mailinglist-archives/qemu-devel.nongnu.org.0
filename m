Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFA34E6A3B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 22:29:35 +0100 (CET)
Received: from localhost ([::1]:45610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXV1S-0007iL-LZ
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 17:29:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXV0L-000731-7O
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:28:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXV0I-0005nO-CI
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:28:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648157301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=avEPN6TTqye3WjedNiw8vbyYA478Xm7GUHXci8kCmYE=;
 b=GY/Q7RwsBJawoQl5iyArZ3A06UTsxWS+KP0B4TbC16CX2Qra39+h1+PplmcfhCbDdtLQ6U
 ZOcZei2pCLUktAKp29e6TXZCQ694D7U7eRU/i9XIUHjjWldP3Wk8dIUrIvp278s5YUGdqD
 Pe9Q753Dxa8R4d17epgk56WuiYyZshg=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-80-dGVCfWZlOGKdIER2JEJpwg-1; Thu, 24 Mar 2022 17:28:20 -0400
X-MC-Unique: dGVCfWZlOGKdIER2JEJpwg-1
Received: by mail-vs1-f70.google.com with SMTP id
 g20-20020a67dc94000000b003253f7908dbso1243671vsk.13
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 14:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=avEPN6TTqye3WjedNiw8vbyYA478Xm7GUHXci8kCmYE=;
 b=pZKpqICHgjqi/BlqkNHzOrOCM+papgZzr+HrddNQAF/VpytilMQn+48bFPo5gcbx+u
 rGijSn+BeI0mEl6QchNvNNr+snIKxhdduoSXfOjV/Qp0TnxbsmGiRMwXxXHQu9jHbA+A
 xV7XZsaHRxYrC8STAkNKWF7nDZ402Vs/U+juibOKEiYn0m6zoRt402DxZuH2x4fGKZMt
 d1d/Ton8gjOb+AInLCw1vCLJyA5Q4g9/ejhMvAZvX8a3SiDngV7V8kUDqdyCPSOr8qOq
 tBZaXWdMPLpAvzFxNZ0pzejXGDLAyck06CY8zpUV/rIMHGYk6C2xl6Kk91yzDWdR6Fy4
 Y/2g==
X-Gm-Message-State: AOAM532lNEFZ9/cDHcP6w5YzWM8D819hHxLmPzaohBO76u+MT+axtxek
 B7CIbVC1JZjJ8XYXjoHW+d1Nkh9wsWkBIBl9bRTgRvRa+9mobye59RDRy4D2dJDjBKxW/oW7j4g
 FgJ/QvwkOgd/KhZeGa1vGB4l6qBXwIDA=
X-Received: by 2002:a05:6122:1da:b0:33f:c6b3:ac58 with SMTP id
 h26-20020a05612201da00b0033fc6b3ac58mr2212328vko.1.1648157299829; 
 Thu, 24 Mar 2022 14:28:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxngD9E9qqFBIFJSARnVxw7lGljWgyWBSN2xfGlG26NrpTn9JR8to4cIL/h1RsVKyJJna32ZjekEhs7rLtSZ4=
X-Received: by 2002:a05:6122:1da:b0:33f:c6b3:ac58 with SMTP id
 h26-20020a05612201da00b0033fc6b3ac58mr2212318vko.1.1648157299594; Thu, 24 Mar
 2022 14:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-12-victortoso@redhat.com>
In-Reply-To: <20220324175015.232794-12-victortoso@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 24 Mar 2022 17:28:08 -0400
Message-ID: <CAFn=p-b-SZ7+SLK7a9Ui7sXV9CsZB2RxA4=E75RZ8GFO6ZixpA@mail.gmail.com>
Subject: Re: [PATCH 11/14] qapi: fix example of MEMORY_FAILURE
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
> Minor issues found and fixed with the example:
> * The JSON object of EVENT was not closed
> * Missing timestamp
> * Flags are optional but if defined then all members should be
>   include so we add "recursive" member.

Oh, yeah. Good call.

> * Changed string from '' to "" in action-required member.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/run-state.json | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/run-state.json b/qapi/run-state.json
> index f87b9378ac..ee21decdec 100644
> --- a/qapi/run-state.json
> +++ b/qapi/run-state.json
> @@ -571,7 +571,9 @@
>  # <- { "event": "MEMORY_FAILURE",
>  #      "data": { "recipient": "hypervisor",
>  #                "action": "fatal",
> -#                "flags": { 'action-required': false } }
> +#                "flags": { "action-required": false,
> +#                           "recursive": false } },
> +#      "timestamp": { "seconds": 1267061043, "microseconds": 959568 } }
>  #
>  ##
>  { 'event': 'MEMORY_FAILURE',
> --
> 2.35.1
>

Reviewed-by: John Snow <jsnow@redhat.com>


