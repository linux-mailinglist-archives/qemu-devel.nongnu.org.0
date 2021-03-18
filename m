Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095CB33FEA0
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 06:09:31 +0100 (CET)
Received: from localhost ([::1]:58550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMkuX-0005Nj-5h
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 01:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMkt9-0004tN-64
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 01:08:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMkt4-00026p-Ig
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 01:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616044077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yUJUIIXQhYfN3aC/knG9yXyZbYgVeRjmiqeq/uK3yl4=;
 b=YSjZJewjBUAmDTnskkOHAwNAfZYWVRNWzmvJ7MUyY3sTXl1diivWsbPwKCvp1pMEG9CMi0
 7vkFl/SbazR93ylIdg9rivKp4i/Dra+igDqTX98wZ5E+cPrS7bzY+mbl4KYirKnsYOegAu
 PIMR2fZqlGll/1sEunbO/htMKB7j2JI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-buEIQw1LOmenYPEXQa9VEA-1; Thu, 18 Mar 2021 01:07:54 -0400
X-MC-Unique: buEIQw1LOmenYPEXQa9VEA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FCA188EF1F;
 Thu, 18 Mar 2021 05:07:53 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4BF56F45E;
 Thu, 18 Mar 2021 05:07:41 +0000 (UTC)
Subject: Re: [PATCH 2/2] utils: Work around mingw strto*l bug with 0x
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210317143325.2165821-1-eblake@redhat.com>
 <20210317143325.2165821-3-eblake@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5457f23c-a94e-bf8b-fa1d-962fa2e429f8@redhat.com>
Date: Thu, 18 Mar 2021 06:07:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317143325.2165821-3-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: richard.henderson@linaro.org, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/03/2021 15.33, Eric Blake wrote:
> Mingw recognizes that "0x" has value 0 without setting errno, but
> fails to advance endptr to the trailing garbage 'x'.  This in turn
> showed up in our recent testsuite additions for qemu_strtosz (commit
> 1657ba44b4 utils: Enhance testsuite for do_strtosz()); adjust our
> remaining tests to show that we now work around this windows bug.
> 
> This patch intentionally fails check-syntax for use of strtol.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   tests/unit/test-cutils.c | 54 ++++++++++++++++++++++++++++++++++++++++
>   util/cutils.c            | 29 +++++++++++++++------
>   2 files changed, 75 insertions(+), 8 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


