Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B4B32E278
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 07:47:41 +0100 (CET)
Received: from localhost ([::1]:49818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI4FQ-0003uF-QA
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 01:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lI4Ch-00027D-Tt
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 01:44:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lI4Cg-0007iS-76
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 01:44:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614926689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9AJYig5HeR+atZuIqoYPrr/mAOdSSANDqNMNMuVI++A=;
 b=NeUMBKgTHcRN7MT/93qQCRNferV3h8xkB+eCr8ryG7lGuORiLnbn2qn51hTc/DrLlitpcu
 TRboSdsU3r7KkQflBX+o7Q6UjreTBncUBQElbdsWylfaA2vRQuZZrJnu4Y2B8ZpToesB1W
 /7EQjdFw7VKE367AIx56ZMd5CVSWsjM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-xZo7Wju7MtKcsqEnJ3L61g-1; Fri, 05 Mar 2021 01:44:47 -0500
X-MC-Unique: xZo7Wju7MtKcsqEnJ3L61g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C22381842142;
 Fri,  5 Mar 2021 06:44:45 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-165.pek2.redhat.com
 [10.72.12.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AA9060C5F;
 Fri,  5 Mar 2021 06:44:41 +0000 (UTC)
Subject: Re: [QEMU-SECURITY] [PATCH V4 00/10] Detect reentrant RX casued by
 loopback
To: P J P <pj.pandit@yahoo.co.in>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-security@nongnu.org" <qemu-security@nongnu.org>
References: <20210305062638.6749-1-jasowang@redhat.com>
 <1596609759.756731.1614926341290@mail.yahoo.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <80e6c934-5991-e474-bb51-b61e12109a6b@redhat.com>
Date: Fri, 5 Mar 2021 14:44:40 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1596609759.756731.1614926341290@mail.yahoo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
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
Cc: "alxndr@bu.edu" <alxndr@bu.edu>, "philmd@redhat.com" <philmd@redhat.com>,
 "ppandit@redhat.com" <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/3/5 2:39 下午, P J P wrote:
> Hello all,
>
> Just to note:
>
> * Let's use <qemu-security> list to review non-public/embargoed patch(es) only.
>
> * If patch(es) is being reviewed publicly on <qemu-devel> list,
>    CC'ing <qemu-security> list does not help much.
>
>
> Thank you.
> ---
>    -P J P
> http://feedmug.com


I see.

Thanks



