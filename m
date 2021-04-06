Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5FE355C8D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 21:51:36 +0200 (CEST)
Received: from localhost ([::1]:40070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTrjb-0005rJ-8q
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 15:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lTriY-0005JU-40
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 15:50:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lTriR-0002GK-K6
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 15:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617738623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IwXi4YcOEAKGazLQA3byH7dp7D0fOvM2TaNNgCctHMs=;
 b=ZJL31xyXw09mGhyZVPGw3cW5cvz9o1C9215lMIcQkAFZVyqNSNd5mXNk1MvgaJbit9DCkq
 XLhVYZXUWd46WCDHdipNg5l2sRwPNAvWFtWKxSM0LDsGLRo8dtOWbZe7334t1pdfTYOyN1
 wPN5njn7HQO4PVjyBk7tw6Ci0aX7aBM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-36vQgmmpPZydiYJ701kr8w-1; Tue, 06 Apr 2021 15:50:19 -0400
X-MC-Unique: 36vQgmmpPZydiYJ701kr8w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 243038189CD;
 Tue,  6 Apr 2021 19:50:17 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7537B10023AC;
 Tue,  6 Apr 2021 19:50:13 +0000 (UTC)
Subject: Re: A question about the translation granule size supported by the
 vSMMU
To: Kunkun Jiang <jiangkunkun@huawei.com>,
 Prem Mallappa <prem.mallappa@broadcom.com>,
 Peter Maydell <peter.maydell@linaro.org>, linuc.decode@gmail.com
References: <fa696532-5f04-aeeb-1ba3-6427675c6655@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <4886d8d0-cca6-d4b2-4139-29ad52020f79@redhat.com>
Date: Tue, 6 Apr 2021 21:50:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <fa696532-5f04-aeeb-1ba3-6427675c6655@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Cc: Zenghui Yu <yuzenghui@huawei.com>,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, Keqian Zhu <zhukeqian1@huawei.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kunkun,

On 3/27/21 3:24 AM, Kunkun Jiang wrote:
> Hi all,
> 
> Recently, I did some tests on SMMU nested mode. Here is
> a question about the translation granule size supported by
> vSMMU.
> 
> There is such a code in SMMUv3_init_regs():
> 
>>    /* 4K and 64K granule support */
>>     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
>>     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
>>     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44
>> bits */
> Why is the 16K granule not supported? I modified the code
> to support it and did not encounter any problems in the
> test. Although 4K and 64K minimal granules are "strongly
> recommended", I think vSMMU should still support 16K.😉
> Are there other reasons why 16K is not supported here?
no there aren't any. The main reasons were 16KB support is optional and
supporting it increases the test matrix. Also it seems quite a few
machines I have access to do support 16KB granule. On the others I get

"EFI stub: ERROR: This 16 KB granular kernel is not supported by your CPU".

Nevertheless I am not opposed to support it as it seems to work without
trouble. Just need to have an extra look at implied validity checks but
there shouldn't be much.

Thanks

Eric
> 
> When in SMMU nested mode, it may get errors if pSMMU
> doesn't support 16K but vSMMU supports 16K. But we
> can get some settings of pSMMU to avoid this situation.
> I found some discussions between Eric and Linu about
> this [1], but this idea does not seem to be implemented.
> 
> [1] https://lists.gnu.org/archive/html/qemu-arm/2017-09/msg00149.html
> 
> Best regards,
> Kunkun Jiang
> 


