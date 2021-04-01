Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96072351013
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 09:27:07 +0200 (CEST)
Received: from localhost ([::1]:44964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRrjO-0006jS-LC
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 03:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lRrgj-000477-36
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:24:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lRrgg-0001s6-58
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:24:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617261857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mXecmIP3OyVKEA0fauedeIDlLHkMWJYEh5uGsqJ8b8g=;
 b=TymU4hdObyxeDxUjHmJMQlvzeym/WtqIMUsJ/wehHTp/DctZkci0zEL/riksPHCoqHq9Dg
 4iECKMO4hF5R++KcIK6TNqd84F79uXEsL5lJwY3Km9n9X1GVAGVgiGOmvLZZtAxaZq3mUf
 hdcKeJ43Yc5kzvUSuv1whLWysk/P3dw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-Jnv8xOJtP1eBnM-8xniURA-1; Thu, 01 Apr 2021 03:24:15 -0400
X-MC-Unique: Jnv8xOJtP1eBnM-8xniURA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86CE58030C9;
 Thu,  1 Apr 2021 07:24:14 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-210.pek2.redhat.com
 [10.72.13.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7C7F5C1BB;
 Thu,  1 Apr 2021 07:24:13 +0000 (UTC)
Subject: Re: [PATCH] tap-bsd: Remove special casing for older OpenBSD releases
To: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
References: <YF5y+MDiK2QInFA2@humpty.home.comstyle.com>
 <8571b8c8-f3ed-ef67-6ea3-2e6652a2e435@redhat.com>
 <1787bf01190.27f3.c0f5e3539a5acb9c2563017afaca17d6@comstyle.com>
 <35befc6a-6167-1251-75ec-35e723b7547b@redhat.com>
 <c34234c1-5221-afd3-b850-1e78e566e2b5@comstyle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0d0e3ba7-ce55-bb63-109b-86792d3ac08a@redhat.com>
Date: Thu, 1 Apr 2021 15:24:12 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <c34234c1-5221-afd3-b850-1e78e566e2b5@comstyle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/3/30 上午4:38, Brad Smith 写道:
> On 3/28/2021 11:58 PM, Jason Wang wrote:
>
>>
>> 在 2021/3/29 上午11:03, Brad Smith 写道:
>>> It very much is correct. We don't care about such releases anymore.
>>
>>
>> So is there a doc/wiki to say Qemu doesn't support those OpenBSD 
>> release?
>
> The (OpenBSD itself and QEMU) project only makes a concerted effort to 
> support
> two previous releases. I can't remember where in the QEMU Wiki it is 
> mentioned.
>
> Just looking at the Meson requirement alone limits us to the previous 
> two releases
> never mind older. Even if that wasn't a consideration there would be 
> issues with
> a few other dependencies like Gtk before going back this far to 
> support such old
> OpenBSD releases.
>
>

Ok. So I've applied this patch.

Thanks


