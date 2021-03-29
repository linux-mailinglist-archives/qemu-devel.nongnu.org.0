Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58DF34D484
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 18:08:19 +0200 (CEST)
Received: from localhost ([::1]:52692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQuR8-0003gA-A0
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 12:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lQuO5-0002EH-Ec
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:05:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lQuO1-00014R-It
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617033903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qs8b5Nl6VFJISb4EbKdYCIQgMTLdcW8oflY/N77thQM=;
 b=Ibgyuy8WvdA7tcUCHgsY5rdomGg84w/t9C41O0CjUio+V38905Kur56A80Ng+2wEDXwGUf
 kxfWFX2Hq7jR5dDEolrTWlgTrO9J+6bIqYdZLM+NFRgd8rSubCHYepZbA2m0GV87dMviOH
 pXMXoSB8CM1s3tP9+6PC2qk/1kkFN38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-dKaNSNavMemCIqvMfuoGLw-1; Mon, 29 Mar 2021 12:05:00 -0400
X-MC-Unique: dKaNSNavMemCIqvMfuoGLw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C10431009E2D;
 Mon, 29 Mar 2021 16:04:58 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-119.ams2.redhat.com
 [10.36.113.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B43CC10023BE;
 Mon, 29 Mar 2021 16:04:57 +0000 (UTC)
Subject: Re: [PATCH] qcow2: use external virtual timers
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161700516327.1141158.8366564693714562536.stgit@pasha-ThinkPad-X280>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <7fec7e97-9046-e223-8d82-ae1eb926d5c1@redhat.com>
Date: Mon, 29 Mar 2021 18:04:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <161700516327.1141158.8366564693714562536.stgit@pasha-ThinkPad-X280>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.03.21 10:06, Pavel Dovgalyuk wrote:
> Regular virtual timers are used to emulate timings
> related to vCPU and peripheral states. QCOW2 uses timers
> to clean the cache. These timers should have external
> flag. In the opposite case they affect the execution
> and it can't be recorded and replayed.
> This patch adds external flag to the timer for qcow2
> cache clean.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/qcow2.c |    7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Thanks, applied to my block branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

Max


