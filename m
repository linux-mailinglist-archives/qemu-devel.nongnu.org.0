Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CF63393DE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 17:49:02 +0100 (CET)
Received: from localhost ([::1]:42832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKkyC-0003db-Sb
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 11:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lKkYF-0003QO-1p
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:22:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lKkY7-0003rH-QB
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:22:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615566123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CSME15ihlSn9Jkv5YdVYaA0osaWRH/ZDMDtyQ9ndHHQ=;
 b=biUWTn0iHD9Y4zjN/UUvNVyZKvqIvE6MN1ZSOiiWO3xgks80csuCj3CFzhgjm1WjaGiP9M
 HCGctxWVN5hTPsroNc716e2dlrdGjfGFdpJ16/nc29woW/VIunuvOzYXNUivGXr7taoCy4
 TOJUbMbPiPgxSOPRviW6Izq+q6HRGKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-Y3t-XDq9OrSCyhgpnAIGkQ-1; Fri, 12 Mar 2021 11:21:27 -0500
X-MC-Unique: Y3t-XDq9OrSCyhgpnAIGkQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58C7E83DD2B;
 Fri, 12 Mar 2021 16:21:26 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 659C35D6D7;
 Fri, 12 Mar 2021 16:21:25 +0000 (UTC)
Subject: Re: [PATCH] fdc: fix floppy boot for Red Hat Linux 5.2
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210312063259.1721939-1-jsnow@redhat.com>
 <0badfac5-8c0e-600c-949c-61e196e7aa31@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <e6e36a89-805c-c6c3-acb9-b3edbaf0dab9@redhat.com>
Date: Fri, 12 Mar 2021 11:21:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <0badfac5-8c0e-600c-949c-61e196e7aa31@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 3:01 AM, Thomas Huth wrote:
> 
> That whole table-based approach seems quite unreliable to me - I've seen 
> floppy disks with 80, 81, 82 or sometimes even 83 tracks in the past, so 
> I think we would do better with a more flexible way of guessing ... but 
> for the time being, this is certainly a quick and easy fix that also 
> should not have any negative impact, thus:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Yes, that's my thought. I can't personally justify tackling this hokey 
system -- I simply don't know enough about the history of the device to 
design a suitable replacement.

So, it's a band-aid, but one that fits with the way the floppy has 
worked for quite a long time, and seems the least likely to bother 
anything further.

--js


