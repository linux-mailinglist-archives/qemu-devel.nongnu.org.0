Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C56A6FEE43
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:02:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2Ay-0003pS-2s; Thu, 11 May 2023 05:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1px2Ab-00032J-Ae
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:01:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1px2AS-0004dW-Fi
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683795654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ta1SSP8eSKfxAW8Mi/XfGrU9PlU6ts5h0AcUCL4iE6Y=;
 b=fHrw20gkZ0kAoLmw+K/eKRxGz9SCaQC4xVcDQXtqfxvZnhdaxbwj5KoOvs1WHc3OBQXNj7
 uqRGbcuGKMYarxYfpz5sDicPEgMsJHJX0WGzxpqms1gMeq8JJd5sjrVbY7V6URcBWckNm/
 ME966dmsBtQ/BnGz7rmO/mwO2/LVbsI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-b1WYalxQPPaq8kiZ9G3iDA-1; Thu, 11 May 2023 05:00:51 -0400
X-MC-Unique: b1WYalxQPPaq8kiZ9G3iDA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE9E61C0897D;
 Thu, 11 May 2023 09:00:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4FA048FB11;
 Thu, 11 May 2023 09:00:49 +0000 (UTC)
Date: Thu, 11 May 2023 11:00:48 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 den@openvz.org, alexander.ivanov@virtuozzo.com
Subject: Re: [PATCH v9 0/6] block: refactor blockdev transactions
Message-ID: <ZFyuwBnsBz1chYdz@redhat.com>
References: <20230510150624.310640-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510150624.310640-1-vsementsov@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 10.05.2023 um 17:06 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi all!
> 
> Let's refactor QMP transactions implementation into new (relatively)
> transaction API.
> 
> v9:
> 01: fix leaks

That's a clever use of g_autofree. Wouldn't have thought of that. :-)

> 02-03: add r-b
> 04: fix leak, s/Transaction/transaction/
> 05: new, was part of 06
> 06: rework of bitmap-add action moved to 05

I took the liberty of moving the removal of the 'prepared' field in
BlockDirtyBitmapState from patch 6 to patch 5, I hope you agree.

Thanks, applied to the block branch.

Kevin


