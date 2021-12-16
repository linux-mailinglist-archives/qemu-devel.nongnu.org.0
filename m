Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DEC4771D0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 13:28:41 +0100 (CET)
Received: from localhost ([::1]:32982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxpsG-00062v-O1
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 07:28:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxpqo-0004dq-1T
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:27:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1mxpqh-000317-EI
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:27:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639657622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zbTUpUETDeaGsAV/Vf1X3qdjTN/kzpXe56N0RQNNO8w=;
 b=TIIUV0WszKBiPV/mwW4aD7G8nY2/v1cw66htuNzQsTmBR9pXoqCSOTlajuIq4UwuSNE7AF
 +/SXP58J5DFIeIPu0wLVO1spSHporDCMogR34ONuGkNDv9lPmeVh6dStC9E5V+BFLK5WZb
 z8l/6IUnuJWDiu+8B783L098mv8+sCQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-g_bg79WgMAWVgr2lXRA9pQ-1; Thu, 16 Dec 2021 07:27:00 -0500
X-MC-Unique: g_bg79WgMAWVgr2lXRA9pQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 f21-20020ac87f15000000b002be401bd1c6so13362597qtk.1
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 04:27:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zbTUpUETDeaGsAV/Vf1X3qdjTN/kzpXe56N0RQNNO8w=;
 b=2oFyCB2ovPvJXLHHhv7rwTwnfdanLWF4K0A5Ez4gtvq6pkeawHXgPcFrPYDCfMICjK
 NfQ2p3LVJ/otavqUGdLGMKgC2QOXVF+agVvvIedeko/vl1MzxpTfnvdZ09GA15XvZaQt
 fBAymGmwP8xT60/8H8wKXu4cA8KbBiSViLmQ4ori4ihYCWCNv/3IDe0cmbAYMKjXY/lp
 pyg3uoSzRPHJB1nZu7w52fTP4hztKDtknC3Hn8LOqI7mCLXamI98M/+IYsGO77KRw5ev
 f2IN73AoOIa6g7gyJ4a66pP2nvy6M2nE0g8wzPaUaco80UB2sJlLk4wAbAika77vg1Ua
 ycDg==
X-Gm-Message-State: AOAM531+L0JOAKMz6L6x9jHKhSMBI5eRfM2Hqboqbc8LNKqSLhSyoVzb
 Ju6rTvAxkNaJqbMroRPhR7bpsOM75XzsVfbW1fU38SCktmXZlMcJ+b2dVW43cCoxJaqjw646TXf
 tSYYAjHiC2vHMDpI=
X-Received: by 2002:a37:27cc:: with SMTP id
 n195mr11665158qkn.507.1639657620371; 
 Thu, 16 Dec 2021 04:27:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLxlJnkPwAtUcWnkUueoeMw8zONYUCuHRjsLvydz2ubhjveoMDcF1T4Xxh8Lc0RT4dmQ4iPA==
X-Received: by 2002:a37:27cc:: with SMTP id
 n195mr11665137qkn.507.1639657620122; 
 Thu, 16 Dec 2021 04:27:00 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id j16sm3974418qtx.92.2021.12.16.04.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 04:26:51 -0800 (PST)
Date: Thu, 16 Dec 2021 09:26:38 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 01/25] python/aqmp: add __del__ method to legacy
 interface
Message-ID: <20211216122638.fgvudqiovgdoihzz@laptop.redhat>
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-2-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215193939.3768033-2-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Dec 15, 2021 at 02:39:15PM -0500, John Snow wrote:
> asyncio can complain *very* loudly if you forget to back out of things
> gracefully before the garbage collector starts destroying objects that
> contain live references to asyncio Tasks.
> 
> The usual fix is just to remember to call aqmp.disconnect(), but for the
> sake of the legacy wrapper and quick, one-off scripts where a graceful
> shutdown is not necessarily of paramount imporance, add a courtesy
> cleanup that will trigger prior to seeing screenfuls of confusing
> asyncio tracebacks.
> 
> Note that we can't *always* save you from yourself; depending on when
> the GC runs, you might just seriously be out of luck. The best we can do
> in this case is to gently remind you to clean up after yourself.
> 
> (Still much better than multiple pages of incomprehensible python
> warnings for the crime of forgetting to put your toys away.)
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/legacy.py | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
> index 9e7b9fb80b..2ccb136b02 100644
> --- a/python/qemu/aqmp/legacy.py
> +++ b/python/qemu/aqmp/legacy.py
> @@ -16,6 +16,8 @@
>  import qemu.qmp
>  from qemu.qmp import QMPMessage, QMPReturnValue, SocketAddrT
>  
> +from .error import AQMPError
> +from .protocol import Runstate
>  from .qmp_client import QMPClient
>  
>  
> @@ -136,3 +138,19 @@ def settimeout(self, timeout: Optional[float]) -> None:
>  
>      def send_fd_scm(self, fd: int) -> None:
>          self._aqmp.send_fd_scm(fd)
> +
> +    def __del__(self) -> None:
> +        if self._aqmp.runstate == Runstate.IDLE:
> +            return
> +
> +        if not self._aloop.is_running():
> +            self.close()
> +        else:
> +            # Garbage collection ran while the event loop was running.
> +            # Nothing we can do about it now, but if we don't raise our
> +            # own error, the user will be treated to a lot of traceback
> +            # they might not understand.
> +            raise AQMPError(
> +                "QEMUMonitorProtocol.close()"
> +                " was not called before object was garbage collected"
> +            )

From the Python PoV, LGTM.

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


