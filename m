Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A061533EA5D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:11:23 +0100 (CET)
Received: from localhost ([::1]:45444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQKw-00088X-73
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMQJR-0007IM-F4
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:09:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMQJN-0008PX-MT
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:09:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615964983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AB4qhkmOF6dwrINVwozBGTejjIH12tXfMH/wsyN5udU=;
 b=bVJUjhDyHhSIocHymuibRuDQ0blI5gPQ6CAgbAwqhjtPmssy45xEhnuvbjCy3o3aNOFrlc
 p2objM8Y7klO20Ds3qLj7awiep7bQfCijtisjm4KOixiS6uGv+1BBE0/rNOdLultD1bYkJ
 AmfhGjTNK42k375MnZaXvC6XmGknYe8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-t2F30217Mm2M74qfhknXNQ-1; Wed, 17 Mar 2021 03:09:41 -0400
X-MC-Unique: t2F30217Mm2M74qfhknXNQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21F33107ACCA;
 Wed, 17 Mar 2021 07:09:40 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1550B5D9C0;
 Wed, 17 Mar 2021 07:09:38 +0000 (UTC)
Subject: Re: [PATCH v2 1/1] utils: Use fixed-point arithmetic in qemu_strtosz
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210315155835.1970210-1-richard.henderson@linaro.org>
 <20210315155835.1970210-2-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6ebe24d3-5424-5958-7ffb-80c90a020e18@redhat.com>
Date: Wed, 17 Mar 2021 08:09:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315155835.1970210-2-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/2021 16.58, Richard Henderson wrote:
> Once we've parsed the fractional value, extract it into an integral
> 64-bit fraction.  Perform the scaling with integer arithemetic, and
> simplify the overflow detection.

I've put this patch in my local branch, but I'm still getting a failure in 
the cutils test, this time in the Cirrus-CI with the MinGW build:

  https://cirrus-ci.com/task/5413753530351616?command=test#L543

Is it related or is this a different bug?

  Thomas


