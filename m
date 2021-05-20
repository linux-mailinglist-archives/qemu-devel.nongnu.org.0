Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3F138B0D4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:00:59 +0200 (CEST)
Received: from localhost ([::1]:52814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjEQ-0001h4-4N
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ljjBP-0006Sp-Cu
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:57:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ljjBI-0006c9-HX
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621519062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rBifVzFW0zn5d9kBI7mjM+Zt5nKeZ1ZhoXYe+UG9Ebw=;
 b=EmmUkq0YvwMuvHSsn03fSoGQVRibr6j2ejCDpp67KTgbso2Y4EqQ7Mj5u3RV4oONCUJ7NK
 gbW/BTy97+VS4MOgokAMWDWcRnYa9lA78NePSC3azdSb6/Xb5WQDRGUwcxMbNTzIobVIjr
 f5un9vR1A3TWG+DPRBO3GbcTtjStQm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-HqiGzflEMfq64ifnvd8u4Q-1; Thu, 20 May 2021 09:57:41 -0400
X-MC-Unique: HqiGzflEMfq64ifnvd8u4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D67CD8189C9;
 Thu, 20 May 2021 13:57:39 +0000 (UTC)
Received: from [10.36.114.4] (ovpn-114-4.ams2.redhat.com [10.36.114.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE9CF608DB;
 Thu, 20 May 2021 13:57:35 +0000 (UTC)
Subject: Re: QEMU SMMUv3 stage 2 translation
To: Shashi Mallela <shashi.mallela@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <6146FAFB-FDAF-4C37-A488-9A0797CB5405@getmailspring.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <83bd5d21-7c9f-1d49-559b-f45e966e5292@redhat.com>
Date: Thu, 20 May 2021 15:57:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <6146FAFB-FDAF-4C37-A488-9A0797CB5405@getmailspring.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Auger Eric <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Shashi,

[ fixing my email address ]

On 5/13/21 4:25 PM, Shashi Mallela wrote:
> Hi,
> 
> Since the current SMMUv3 qemu implementation only supports stage 1
> translation,wanted to understand if the implementation could be extended
> to stage 2 translation support and if yes what is the overall scope
> involved.This is required for sbsa-ref platforms.

Yes I think this is feasible. This would require some additionnal
decoding in the STE and also adapt the page table decoding to stage2
according to AArch64 Virtual Memory System Architecture.

If you proceed I would like this code to be isolated of the stage1
decoding as much as possible to alleviate the maintainance all the more
so the stage1 code is the one likely to be used in production for DPDK
or SVA use cases, let's dream. One of the tricky part is the internal
TLB modeling (cache and IOTLB). In your case you may not need to
implement such internal IOTLB for stage 2 entries as I guess you do not
really target perf and this is the source of lots of bugs/headaches ;-)

Thanks

Eric
> .
> Thanks
> Shashi
> Sent from Mailspring


