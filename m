Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEB6347421
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 10:07:29 +0100 (CET)
Received: from localhost ([::1]:33580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOzU8-0001vY-4k
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 05:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOzSa-0001NJ-Uy
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 05:05:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOzSZ-0001FF-Fy
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 05:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616576750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cqWQ4biIsqGbffuhGtJrjqABhwDdPCoQajgy0EAoXu4=;
 b=F6QhKOeBtWqvQnsrFhwObio9q+7RrOwIfP1j3MBsM7lEBKB12Fwt0Wc4iiGzDOMOxvtA3/
 sZ46enIzbLxOI9j1MQtBVroUmcPlBTQAP4xkzDsmJwYI6NNU191Zf8i8EExOUOPQNLVL31
 3FFPR3NbHbM2iMZvsVTK0uLgha7qgkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-lPA8aiqLMpyTYmhERBLM7g-1; Wed, 24 Mar 2021 05:05:46 -0400
X-MC-Unique: lPA8aiqLMpyTYmhERBLM7g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B668B8189CA;
 Wed, 24 Mar 2021 09:05:45 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-47.ams2.redhat.com [10.36.112.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C07BB709ED;
 Wed, 24 Mar 2021 09:05:43 +0000 (UTC)
Subject: Re: [PATCH v4 3/3] tests/qtest: Add test for Aspeed HACE
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20210324070955.125941-1-joel@jms.id.au>
 <20210324070955.125941-4-joel@jms.id.au>
 <ddc26232-ec90-9c50-1c50-e99a9b5ca6e2@kaod.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <89880af3-bc5e-040c-8065-439b3477c8fb@redhat.com>
Date: Wed, 24 Mar 2021 10:05:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ddc26232-ec90-9c50-1c50-e99a9b5ca6e2@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/03/2021 08.21, Cédric Le Goater wrote:
> On 3/24/21 8:09 AM, Joel Stanley wrote:
>> This adds a test for the Aspeed Hash and Crypto (HACE) engine. It tests
>> the currently implemented behavior of the hash functionality.
>>
>> The tests are similar, but are cut/pasted instead of broken out into a
>> common function so the assert machinery produces useful output when a
>> test fails.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> Thomas,
> 
> Can we keep your Acked-by ?

Yes:

Acked-by: Thomas Huth <thuth@redhat.com>


