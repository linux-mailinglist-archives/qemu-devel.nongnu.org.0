Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAD72F7822
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 13:00:35 +0100 (CET)
Received: from localhost ([::1]:36116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0NmL-0004rB-SM
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 07:00:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0NkN-0003nv-B7
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 06:58:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0NkK-0008Qh-9a
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 06:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610711907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J4fX50PGWqOHe2tCj9+vRE1yTyZ3HNJdgzeJMMG9fNs=;
 b=J0Q1IykO37aqAfE3Dm+0L01RbzXJjjzlFl85T/n+r6yLLOkWiZEoZ0U6DfTarS+O94Kdf5
 Njl3QRhbqVlsDLlnFhYjuifwWWTfuedv2l5wa5SGQ3yI9lIJAhXVFn9z4rSoQp511yLQzY
 Kd4TPqWRo3deTY3cAuj70nZJ4d7fjqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-ogrdUVONMdahYIPAhC8dMQ-1; Fri, 15 Jan 2021 06:58:23 -0500
X-MC-Unique: ogrdUVONMdahYIPAhC8dMQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B524D107ACF7;
 Fri, 15 Jan 2021 11:58:22 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-144.ams2.redhat.com
 [10.36.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3C745D9E3;
 Fri, 15 Jan 2021 11:58:21 +0000 (UTC)
Subject: Re: [PATCH v3 06/10] iotests/129: Use throttle node
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210114170304.87507-1-mreitz@redhat.com>
 <20210114170304.87507-7-mreitz@redhat.com>
 <858dfc32-24f6-1b4c-48b4-7c340c2e5269@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <5c125929-eec1-904b-7bdb-e867ff1c4e23@redhat.com>
Date: Fri, 15 Jan 2021 12:58:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <858dfc32-24f6-1b4c-48b4-7c340c2e5269@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.01.21 12:16, Vladimir Sementsov-Ogievskiy wrote:
> 14.01.2021 20:03, Max Reitz wrote:
>> Throttling on the BB has not affected block jobs in a while, so it is
>> possible that one of the jobs in 129 finishes before the VM is stopped.
>> We can fix that by running the job from a throttle node.
>>
>> Signed-off-by: Max Reitz<mreitz@redhat.com>
>> Reviewed-by: Eric Blake<eblake@redhat.com>
> 
> you forget my :)
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Sorry O:)


