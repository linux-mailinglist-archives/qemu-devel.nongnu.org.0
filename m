Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 496682C84BA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:13:15 +0100 (CET)
Received: from localhost ([::1]:38186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjizS-00050k-AL
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:13:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kjish-0001Ga-Il
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:06:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kjisd-00064N-Pm
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:06:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606741570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+cQUQe+R5J9nJO78a40Wfj9NEMSXgjbnuBH4fDcF9eQ=;
 b=B6r5dZ2qOcHgVOgttXq85PqqBfoAMyudt+aIxC3wgm0wzoI27i1bOIhlruYmZz9SNKXYaq
 vkYG3FtEvg8QQsuzcO3zzmclbnUj611CW0zLl3ePKnP9Y0u6bqQuUaRJ7YU7o9YyVzr2Lf
 7GcrVOOCh8Wi/vguQ2vvsqYZFIN9mCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-CutMxep_Nwu7IgFwroGMGA-1; Mon, 30 Nov 2020 08:06:06 -0500
X-MC-Unique: CutMxep_Nwu7IgFwroGMGA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C622E809DDA;
 Mon, 30 Nov 2020 13:06:04 +0000 (UTC)
Received: from [10.36.112.89] (ovpn-112-89.ams2.redhat.com [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DEF260C4D;
 Mon, 30 Nov 2020 13:06:03 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/smmuv3: Fix up L1STD_SPAN decoding
To: Peter Maydell <peter.maydell@linaro.org>,
 Kunkun Jiang <jiangkunkun@huawei.com>
References: <20201124023711.1184-1-jiangkunkun@huawei.com>
 <CAFEAcA_tfEO0FaTq_Ud4FE_j93O0ohx3mGKtm2GoGZDfw-ZPAQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <54899eb7-e16d-502c-4757-f24596fea446@redhat.com>
Date: Mon, 30 Nov 2020 14:06:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_tfEO0FaTq_Ud4FE_j93O0ohx3mGKtm2GoGZDfw-ZPAQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: wanghaibin.wang@huawei.com, "open list:ARM SMMU" <qemu-arm@nongnu.org>,
 Keqian Zhu <zhukeqian1@huawei.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kunkun, Peter,

On 11/30/20 12:29 PM, Peter Maydell wrote:
> On Tue, 24 Nov 2020 at 02:37, Kunkun Jiang <jiangkunkun@huawei.com> wrote:
>>
>> Accroding to the SMMUv3 spec, the SPAN field of Level1 Stream Table
>> Descriptor is 5 bits([4:0]).
>>
>> Fixes: 9bde7f0674f(hw/arm/smmuv3: Implement translate callback)
>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>> ---
Acked-by: Eric Auger <eric.auger@redhat.com>
> 
> 
> Applied to target-arm.next for 6.0, thanks.
thanks and sorry for the delay

Eric
> 
> -- PMM
> 


