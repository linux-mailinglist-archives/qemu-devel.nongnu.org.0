Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BB9477253
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 13:56:49 +0100 (CET)
Received: from localhost ([::1]:35198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqJV-0002m1-0Q
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 07:56:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxq3D-000408-BB
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:40:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxq31-0004wC-60
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639658381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ov4HoB0lALJ2PMzDYTyxgg9xj/y9fueTJex1i/RNUCg=;
 b=MC2/dUpewA2LVhmz0ZPPnNxLWMaLUDsjmvh+Jgb46skQyP3qQucUiS7BksIluNu7nUny+m
 by6P4t1XK9KnefMpsn8KC+iZACmS1bjMKX+I62+LM6oN8/wfAZJfj6VVG52ZWYItwx2sZU
 wGT3zNb7iTuSpXrdMVrANOVgq9EBalc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-j31Chk9YMfWouQQTskwKlg-1; Thu, 16 Dec 2021 07:39:40 -0500
X-MC-Unique: j31Chk9YMfWouQQTskwKlg-1
Received: by mail-qt1-f198.google.com with SMTP id
 i5-20020ac85c05000000b002ae12b76e64so33420673qti.6
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 04:39:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ov4HoB0lALJ2PMzDYTyxgg9xj/y9fueTJex1i/RNUCg=;
 b=bupyiIDzBlSRnJFQw0V1uvF4T/rIvUMerVgix7YKz5mIArxjpWH967kq7+ZwPxwpl+
 XHrNAgrgLcsbJ3qaVQYa9wV9nr7/hKfEXiaVYU1nsofdhvRnL7nWZBlfvn6P133VDGc3
 WfHyLZ1sbS8rPO7shQ7RZaya0T5O4LwfsxLm1nAyFlPfpuUTT6J0BtJ03nDv5DZmgH+Q
 4OvR3mjVxcRzrMDFU16rRjPh2kYTbBI5/CpMCb1n+z3wSqb60jyNX7TEn/fIXiTR65t8
 T0bKkmorkV78VulHWgsVsuPPIozFTrLOoNhMHkmD2BClXQrSrtSTiGGyGP8BB8wzYReb
 LEJg==
X-Gm-Message-State: AOAM533E8nFKykZQtPvGQNeBYDmGdEu8tTyxsAwAfo96lOsvKYiKqxTR
 AYbzucP43gjCaConGvAwd4XUW4euoaOWP40m9z/0vf5N1wQFNccvDi7veQm6FItzNrEWEDVMR2L
 +FJQIzHQZO9FMVd0=
X-Received: by 2002:a05:622a:105:: with SMTP id
 u5mr16673274qtw.561.1639658379997; 
 Thu, 16 Dec 2021 04:39:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAc2/hSeX2FE2Z9TP2yknz9P+RbH3pMGnNCYOY1hirFPT4z2wmfJ3DnacxSaCctMl0NIBhmw==
X-Received: by 2002:a05:622a:105:: with SMTP id
 u5mr16673258qtw.561.1639658379816; 
 Thu, 16 Dec 2021 04:39:39 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id bs16sm2692109qkb.45.2021.12.16.04.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 04:39:39 -0800 (PST)
Date: Thu, 16 Dec 2021 09:39:37 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 02/25] python/aqmp: handle asyncio.TimeoutError on
 execute()
Message-ID: <20211216123937.br5tmrp2fm3ccm5x@laptop.redhat>
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-3-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215193939.3768033-3-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Wainer Moschetta <wainersm@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 02:39:16PM -0500, John Snow wrote:
> This exception can be injected into any await statement. If we are
> canceled via timeout, we want to clear the pending execution record on
> our way out.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/qmp_client.py | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
> index 8105e29fa8..6a985ffe30 100644
> --- a/python/qemu/aqmp/qmp_client.py
> +++ b/python/qemu/aqmp/qmp_client.py
> @@ -435,7 +435,11 @@ async def _issue(self, msg: Message) -> Union[None, str]:
>              msg_id = msg['id']
>  
>          self._pending[msg_id] = asyncio.Queue(maxsize=1)
> -        await self._outgoing.put(msg)
> +        try:
> +            await self._outgoing.put(msg)
> +        except:
> +            del self._pending[msg_id]
> +            raise

At first glance both, except and raise are not good practices, but I
think I got what you are doing here, just intercepting to delete the
pending message and raising it again. So maybe it will be safe to close
the eyes here. ;)

>  
>          return msg_id
>  
> @@ -452,9 +456,9 @@ async def _reply(self, msg_id: Union[str, None]) -> Message:
>              was lost, or some other problem.
>          """
>          queue = self._pending[msg_id]
> -        result = await queue.get()
>  
>          try:
> +            result = await queue.get()
>              if isinstance(result, ExecInterruptedError):
>                  raise result
>              return result

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


