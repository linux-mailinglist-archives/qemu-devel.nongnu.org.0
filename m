Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474F4212B53
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 19:33:22 +0200 (CEST)
Received: from localhost ([::1]:51928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr35N-0006T1-9D
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 13:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jr34K-000508-TY
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 13:32:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54668
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jr34I-00057Z-Ey
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 13:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593711133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oqifKOgX/4ah2Q5cQsXxHScchUnJUeWeO6nhgXMYbZI=;
 b=cpM/RCMgKmHLRljL5GK1cfKY41VFodu1PdYdB1qEIaAlI8kpBTcq93/JeROZmufHPNBwoO
 WQwY2BLJS4pbsgw5gqNZM8uHqdDOXMZTPF/626A6m9YrlHWJM9lvpKcqMT6d1sf4jtN25a
 l2o4B/GigbeYefxhi5mT8ABkOpLwIXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-FjZBz_zFNJ2PNtQnSSglpQ-1; Thu, 02 Jul 2020 13:32:12 -0400
X-MC-Unique: FjZBz_zFNJ2PNtQnSSglpQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C72D58064DF;
 Thu,  2 Jul 2020 17:32:08 +0000 (UTC)
Received: from [10.3.112.202] (ovpn-112-202.phx2.redhat.com [10.3.112.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38DB0101042D;
 Thu,  2 Jul 2020 17:32:08 +0000 (UTC)
Subject: Re: [PATCH v2 29/44] qom: Use returned bool to check for failure,
 manual part
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200702155000.3455325-1-armbru@redhat.com>
 <20200702155000.3455325-30-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b2c135d2-2343-5f5e-7c63-5b6ce8da6e34@redhat.com>
Date: Thu, 2 Jul 2020 12:32:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200702155000.3455325-30-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:23:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/20 10:49 AM, Markus Armbruster wrote:
> The previous commit used Coccinelle to convert from checking the Error
> object to checking the return value.  Convert a few more manually.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/core/bus.c              |  6 +-----
>   hw/core/qdev.c             |  7 +------
>   hw/s390x/s390-virtio-ccw.c | 13 +++++++------
>   3 files changed, 9 insertions(+), 17 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


