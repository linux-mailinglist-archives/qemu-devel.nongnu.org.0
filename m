Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F622E75E5
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 04:57:50 +0100 (CET)
Received: from localhost ([::1]:55044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuScP-0001p4-9h
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 22:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kuSbc-0001QE-PM
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 22:57:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kuSbZ-0004B4-UR
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 22:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609300615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cKKZobjVj3zj4UC7f+EmPdp/ceWXyPbdY/n5Gi/+Pfs=;
 b=bYfYNHKMKi3tUxfrbfhMfLkdDNLOnV/EuSzA2ylV4AmNo3Go0lLauy9mJeAd7D6qRmkXD5
 6GxHJgX70rLWaPtivZlpWBB1RTZ7XBg8kvoNgOMo76sGbLs6kZ7peFGgDOrQwer32C92ok
 D48GxzUjID1mVT+9o+pOptXIwE1WnVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-8dRuE1B2OLeToBEdqP-Mow-1; Tue, 29 Dec 2020 22:56:53 -0500
X-MC-Unique: 8dRuE1B2OLeToBEdqP-Mow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EC19180A087;
 Wed, 30 Dec 2020 03:56:52 +0000 (UTC)
Received: from [10.72.13.30] (ovpn-13-30.pek2.redhat.com [10.72.13.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 547A060BFA;
 Wed, 30 Dec 2020 03:56:50 +0000 (UTC)
Subject: Re: [PATCH 1/3] qapi/net: Add new QMP command for COLO passthrough
To: "Zhang, Chen" <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
 <20201224010918.19275-2-chen.zhang@intel.com>
 <08fe5c51-1383-12dd-b255-151a868cd6d9@redhat.com>
 <a4adb965911348f4901f72e7e472c07e@intel.com>
 <97d593c2-222d-a3cf-e797-8d77b8701bed@redhat.com>
 <704028b0dbf843ed9ae64b93ecd1db13@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <05999128-75c0-aeaf-255f-8c1ec7699eab@redhat.com>
Date: Wed, 30 Dec 2020 11:56:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <704028b0dbf843ed9ae64b93ecd1db13@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.07, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/12/29 上午10:56, Zhang, Chen wrote:
>> I think we can start form COLO. To avoid QMP compatibility issues, I would
>> like to add the n tuple and wildcard support now.
> OK, I will do this job in next version.
> For the QMP compatibility issues, please give me a demo of what we want to see, Like some existing commands.


I meant if we start from port and then want to add e.g n-tuple support. 
Do we need to introduce another command? Or is there any introspection 
that can let management layer know about this?

Thanks


>
> Thanks
> Chen
>


