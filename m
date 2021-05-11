Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7D237AD72
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 19:57:00 +0200 (CEST)
Received: from localhost ([::1]:34226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgWct-0002QO-9u
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 13:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lgWbC-0001cF-6e
 for qemu-devel@nongnu.org; Tue, 11 May 2021 13:55:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lgWb5-00048t-8O
 for qemu-devel@nongnu.org; Tue, 11 May 2021 13:55:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620755702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0c/UaA2UbkBYFB5SMK78GBcCzkrY1MJgqFCj7xjw0I=;
 b=Aqq2Uu73qXDejwsk4LgSENyUQGsOKHalcZIlpnDWAIep2CNF/LQqEWuqT/rQ1RH2gMiExc
 3d2Bmz4xozwjW4Bo4v3idlnXOY812AOVOxoD/2Lv+sjYjX4wmmCEdKZ/JlQTAJlV0DE4zr
 L9AnFF+G1vFCSHwwDCFlIDimx845O+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-tC7Yq9UCNS-fxSG9h5mwhw-1; Tue, 11 May 2021 13:54:58 -0400
X-MC-Unique: tC7Yq9UCNS-fxSG9h5mwhw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 970AD106BB31;
 Tue, 11 May 2021 17:54:56 +0000 (UTC)
Received: from [10.3.114.221] (ovpn-114-221.phx2.redhat.com [10.3.114.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C3715D6A8;
 Tue, 11 May 2021 17:54:44 +0000 (UTC)
Subject: Re: [PATCH v4 01/11] block/io: bring request check to
 bdrv_co_{read,write}v_vmstate
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210324205132.464899-1-vsementsov@virtuozzo.com>
 <20210324205132.464899-2-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <4243c820-14fa-3782-4b90-f11c41d89d3d@redhat.com>
Date: Tue, 11 May 2021 12:54:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210324205132.464899-2-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, integration@gluster.org, berto@igalia.com,
 stefanha@redhat.com, pavel.dovgaluk@ispras.ru, sw@weilnetz.de, pl@kamp.de,
 qemu-devel@nongnu.org, mreitz@redhat.com, jsnow@redhat.com,
 ronniesahlberg@gmail.com, pbonzini@redhat.com, namei.unix@gmail.com,
 dillaman@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 3:51 PM, Vladimir Sementsov-Ogievskiy wrote:
> There are only two drivers supporting vmstate: qcow2 and sheepdog.
> Sheepdog is deprecated. In qcow2 these requests go through
> .bdrv_co_p{read,write}v_part handlers.
> 
> So, let's do our basic check for the request on vmstate generic
> handlers.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/io.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


