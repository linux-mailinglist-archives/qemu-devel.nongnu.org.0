Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CFF4E6A1A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 22:07:34 +0100 (CET)
Received: from localhost ([::1]:54720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXUg9-0001gO-2R
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 17:07:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUee-0000y4-FR
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:06:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUec-00021O-8s
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648155957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m5syJ4mAWHRFSYvvoedcfzHSSZNm30U11nan4bSw5uw=;
 b=XmrG5M1/A7alZmRI0UnBMjhr8DeyfuZar4HGruymOmOzQ8y3aUMTsIZmWPb+rnAEqO+Mdz
 ul7m5RV+fVC91y63TOFPReYiAxd7SfnCz+oCj0ypJAvQf73jPrQvnN0DDtXP+RsGJwqKiX
 FWCs5y8xzmC/drJCaA7s1738sHtCKRI=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-ZjTj9N-7PQue7DBTYUmHaw-1; Thu, 24 Mar 2022 17:05:56 -0400
X-MC-Unique: ZjTj9N-7PQue7DBTYUmHaw-1
Received: by mail-vs1-f69.google.com with SMTP id
 x4-20020a67b404000000b0031bf0c6cff4so1230786vsl.21
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 14:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m5syJ4mAWHRFSYvvoedcfzHSSZNm30U11nan4bSw5uw=;
 b=NtPikzgsAArbEPwrbvGsLenKHv+RYsE1R8dKOFR+x7DBrSnPiauuEbYDvAByFa1m+y
 cg/zkKB8JkKH1uHQcgufWMffLe9T6NuCHPo+z/eHstlzoQvWZQhZDUHgCMR8JP5xF2JU
 xjzv0cqLzhPYoSBrV32kkSq2acShAbtd7IIGzAMH1EijE596EaeJ4SVaTl9qfTpWBwPN
 rvTi6yyXThZQ5QUk/c0IDvbG+zniqddTvoWE1/3QyOpmOh73raa589Hg3SlLPnLJM2ot
 +qyQfGG3MEHOzB2TVDtX2ntZr9hKIsfTUVbntm71TPgAdsd1FCqFeEKn98/xeau+kIzI
 7JiQ==
X-Gm-Message-State: AOAM531hs1pJHOLtXblRUah/Qf8DwfL6h+qWwaRmbEgAXpN/I3g8uSEx
 OqeiJvQgZ8b8/bYfCrjYi/FBojXhFRtOGrOUDP+EZwNZcSR72vR+0l68acjkGoz4QfNn9w8G94T
 u5ENYQcnhaAheyZq1za/+oJQ7QZTwnrA=
X-Received: by 2002:a05:6102:c8e:b0:321:7348:6c2a with SMTP id
 f14-20020a0561020c8e00b0032173486c2amr3662677vst.11.1648155955331; 
 Thu, 24 Mar 2022 14:05:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI/pR3SlCXOqxX5vB0fsk/Wk1f3X/NUqtQH4gopUZpbs+xWLSpY9U9Aj11UzqQoF4HOxMiSKFtLEhjOLOTE6s=
X-Received: by 2002:a05:6102:c8e:b0:321:7348:6c2a with SMTP id
 f14-20020a0561020c8e00b0032173486c2amr3662669vst.11.1648155955096; Thu, 24
 Mar 2022 14:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-9-victortoso@redhat.com>
In-Reply-To: <20220324175015.232794-9-victortoso@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 24 Mar 2022 17:05:44 -0400
Message-ID: <CAFn=p-ZPk1pKWs_b+i3Sdo1v85TaaxYGrFGCRMif=wi2beY_Qg@mail.gmail.com>
Subject: Re: [PATCH 08/14] qapi: fix example of FAILOVER_NEGOTIATED event
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
> * Data is an object, not a string. It generates a qdict.
> * Timestamp is not optional, let's add for completeness.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/net.json | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/net.json b/qapi/net.json
> index 7fab2e7cd8..82c0d9e778 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -691,7 +691,8 @@
>  # Example:
>  #
>  # <- { "event": "FAILOVER_NEGOTIATED",
> -#      "data": "net1" }
> +#      "data": { "device-id": "net1" },
> +#      "timestamp": { "seconds": 1368697518, "microseconds": 326866 } }
>  #
>  ##
>  { 'event': 'FAILOVER_NEGOTIATED',
> --
> 2.35.1
>

Oh, this one is all messed up to hell. We're not documenting the
device-id properly, either. Can that be fixed as well?

Your patch ain't wrong, though:

Reviewed-by: John Snow <jsnow@redhat.com>


