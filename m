Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5643F375C19
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 22:10:59 +0200 (CEST)
Received: from localhost ([::1]:52552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lekKn-0000sr-Ti
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 16:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lekJV-0000Ke-Lc
 for qemu-devel@nongnu.org; Thu, 06 May 2021 16:09:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lekJL-0002eO-Pf
 for qemu-devel@nongnu.org; Thu, 06 May 2021 16:09:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620331765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vsBwz+zJ/4Qyb7L4hYTtzbQenTDpBnGYasmDwUSLSeI=;
 b=NImAGqpCQ37/rd6p5HQ2RjIqlIwOWif0rmwEUyuz9/KkedaqRf2Die8qQIjfkz05RsJcE8
 RSaxK4d+PEE1xzvXHRgVyOA1+p4vc4FTwdSoobdVsWb2Vj0bwo22GxOGXAWDp5vRW2V2BG
 iWDdGP3oZ3eSKWuVfWSJYr2JprIvo0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-vjLxENkKN9q0D8AWT4Kxkw-1; Thu, 06 May 2021 16:09:23 -0400
X-MC-Unique: vjLxENkKN9q0D8AWT4Kxkw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD87D18BA280;
 Thu,  6 May 2021 20:09:22 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D2335D6AC;
 Thu,  6 May 2021 20:09:21 +0000 (UTC)
Subject: Re: [PATCH] tests/qtest/ahci-test.c: Calculate iso_size with 64-bit
 arithmetic
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210506194358.3925-1-peter.maydell@linaro.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <edf28805-209e-df52-349f-cf849d82b7ba@redhat.com>
Date: Thu, 6 May 2021 16:09:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506194358.3925-1-peter.maydell@linaro.org>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 3:43 PM, Peter Maydell wrote:
> Coverity notes that when calculating the 64-bit iso_size value in
> ahci_test_cdrom() we actually only do it with 32-bit arithmetic.
> This doesn't matter for the current test code because nsectors is
> always small; but adding the cast avoids the coverity complaints.
> 
> Fixes: Coverity CID 1432343
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/qtest/ahci-test.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
> index 5e1954852e7..8073ccc2052 100644
> --- a/tests/qtest/ahci-test.c
> +++ b/tests/qtest/ahci-test.c
> @@ -1491,14 +1491,14 @@ static void ahci_test_cdrom(int nsectors, bool dma, uint8_t cmd,
>       char *iso;
>       int fd;
>       AHCIOpts opts = {
> -        .size = (ATAPI_SECTOR_SIZE * nsectors),
> +        .size = ((uint64_t)ATAPI_SECTOR_SIZE * nsectors),
>           .atapi = true,
>           .atapi_dma = dma,
>           .post_cb = ahci_cb_cmp_buff,
>           .set_bcl = override_bcl,
>           .bcl = bcl,
>       };
> -    uint64_t iso_size = ATAPI_SECTOR_SIZE * (nsectors + 1);
> +    uint64_t iso_size = (uint64_t)ATAPI_SECTOR_SIZE * (nsectors + 1);
>   
>       /* Prepare ISO and fill 'tx' buffer */
>       fd = prepare_iso(iso_size, &tx, &iso);
> 

Whupps, thank you, Coverity.

Reviewed-by: John Snow <jsnow@redhat.com>


