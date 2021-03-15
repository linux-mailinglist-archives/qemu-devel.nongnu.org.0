Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE82133AAAB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 06:16:50 +0100 (CET)
Received: from localhost ([::1]:36758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLfaz-0005n4-RM
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 01:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLfYb-0005Ar-3D
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 01:14:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLfYY-0007GY-8u
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 01:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615785256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZgjyBpmyz9ulyDbWzHF850hRFY7XZj2iYjLp/NOjG1E=;
 b=FS/8KIc5Hjqx82IPNnoqzQXI5CFLDDLttvYP09EmxXEqQ4d7KhvgONP0sTx9G0zHkV5Enx
 YT5rhxnMs49xXdxKSzHZUVef6R+rI69HT3CyDe2BFeRHScBGJkrcgm34GnAevfPIWk+EUf
 7WixF7WZw5cKolQNiRAiBd4n4IXgu/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-84QXJBZqPA2EAzRlfqdWsA-1; Mon, 15 Mar 2021 01:14:14 -0400
X-MC-Unique: 84QXJBZqPA2EAzRlfqdWsA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41AF5107ACCD;
 Mon, 15 Mar 2021 05:14:13 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 837451F074;
 Mon, 15 Mar 2021 05:14:04 +0000 (UTC)
Subject: Re: [RFC PATCH 4/8] qtest/fuzz: Restrict CPU I/O instructions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210314232913.2607360-1-f4bug@amsat.org>
 <20210314232913.2607360-5-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1f96a4af-dd90-c67d-adcf-d3e67e2867b5@redhat.com>
Date: Mon, 15 Mar 2021 06:14:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210314232913.2607360-5-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/2021 00.29, Philippe Mathieu-Daudé wrote:
> Restrict CPU I/O instructions to architectures providing
> I/O bus.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tests/qtest/fuzz/generic_fuzz.c   | 16 ++++++++++------
>   tests/qtest/fuzz/qtest_wrappers.c |  4 ++++
>   2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index ee8c17a04c4..3e0089f4a63 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -304,6 +304,13 @@ static bool get_io_address(address_range *result, AddressSpace *as,
>       return cb_info.found;
>   }
>   
> +static bool get_mmio_address(address_range *result,
> +                             uint8_t index, uint32_t offset)
> +{
> +    return get_io_address(result, &address_space_memory, index, offset);
> +}
> +
> +#ifdef TARGET_HAS_IOPORT

Sorry, but the qtests are generic code, I don't think we should introduce 
target specific ifdefs here...?

  Thomas


