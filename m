Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945432A7FB3
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 14:29:42 +0100 (CET)
Received: from localhost ([::1]:41660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kafKf-0005hh-Mc
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 08:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kafI7-0004dk-Au
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 08:27:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kafI5-0007j3-MS
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 08:27:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604582821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YXDj9V1DmahC502DVTEiEHCDlbxhZSfi7mo65rLIqNo=;
 b=ct4KUifHxzyHlYrzez1SlWu1DEIUvQFAB+Hm5LQhUR5K2q+GJu4Rn8hGo+P/tudS2TGZN8
 LiqgTTSvk4KKDvrfV6FACq1XZzQRFu9NRKEC5GQY8sfwWZXfNg93piLFLPiG5vnBXoeHQo
 TggXcuLuFq5xjTozKVNLs2h31+c0H84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-Kr1K_MpjMRC77XmvXRcj1Q-1; Thu, 05 Nov 2020 08:26:56 -0500
X-MC-Unique: Kr1K_MpjMRC77XmvXRcj1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C95E48018A1;
 Thu,  5 Nov 2020 13:26:54 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-31.ams2.redhat.com
 [10.36.114.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63AA119C4F;
 Thu,  5 Nov 2020 13:26:53 +0000 (UTC)
Subject: Re: [PATCH] block: Fix integer promotion error in bdrv_getlength()
To: Eric Blake <eblake@redhat.com>, Tuguoyi <tu.guoyi@h3c.com>,
 Kevin Wolf <kwolf@redhat.com>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>
References: <c0d398ea9d7141bcbb9b3746f97852b4@h3c.com>
 <bb1cfa18-badd-75af-587e-bd476544ddd2@redhat.com>
 <703e17a1-544f-4e5e-a431-6e20d4a04974@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <f5218bd4-72f3-cf55-af2e-08e609413acf@redhat.com>
Date: Thu, 5 Nov 2020 14:26:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <703e17a1-544f-4e5e-a431-6e20d4a04974@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 01:14:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Chengchiwen <chengchiwen@h3c.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Wangyong <wang.yongD@h3c.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.11.20 14:14, Eric Blake wrote:
> On 11/5/20 2:31 AM, Max Reitz wrote:
>> On 05.11.20 06:40, Tuguoyi wrote:
>>> As BDRV_SECTOR_SIZE is of type uint64_t, the expression will
>>> automatically convert the @ret to uint64_t. When an error code
>>> returned from bdrv_nb_sectors(), the promoted @ret will be a very
>>> large number, as a result the -EFBIG will be returned which is not the
>>> real error code.
>>>
>>> Signed-off-by: Guoyi Tu <tu.guoyi@h3c.com>
>>> ---
>>>    block.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Thanks, applied to my block branch:
>>
>> https://git.xanclic.moe/XanClic/qemu/commits/branch/block
>>
> 
> I actually preferred the v1 solution, rather than this v2, as it avoided
> a cast.

I don’t, because it doesn’t make the ?: go away, so I prefer the less 
invasive version.

If you want to send your suggested version (that drops both ?:), I’m 
happy to take that instead.

Max


