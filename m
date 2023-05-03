Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813EB6F616C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 00:45:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puLCb-0005u6-Fs; Wed, 03 May 2023 18:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1puLCZ-0005ts-Ng
 for qemu-devel@nongnu.org; Wed, 03 May 2023 18:43:59 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1puLCW-0006JB-1c
 for qemu-devel@nongnu.org; Wed, 03 May 2023 18:43:59 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 68F355F6B8;
 Thu,  4 May 2023 01:43:46 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b43b::1:1a] (unknown
 [2a02:6b8:b081:b43b::1:1a])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id ihXFKd0MbCg0-OG2LfNdL; Thu, 04 May 2023 01:43:45 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683153825; bh=BxwxVClw1MqAJ0dk1GC8jfCN5o7UdzQloywxfgaCXyw=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=FVb4DzXN8hyTcm1vZ/MC+zXfMJduQ/01NgoxcgQrP4IXLRScYtbMsCmBLgueACriK
 WY5+H6YJjXmDFNASA1KmkYmX5ZtQu4V2TfnFel+E/+KRn2+wfe9yvZMY9XtACCh4Z6
 BKbKNG5MR7ubAQVZDQ3310K+a5Tq/ZjBDhn9qN9U=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <650b62d2-a28f-338d-6d36-4cd2d268aae3@yandex-team.ru>
Date: Thu, 4 May 2023 01:43:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 03/10] build: move COLO under CONFIG_REPLICATION
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, lukasstraub2@web.de, quintela@redhat.com,
 chen.zhang@intel.com, "Dr . David Alan Gilbert" <dave@treblig.org>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Leonardo Bras <leobras@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-4-vsementsov@yandex-team.ru> <ZFE9Vb6iMcGCzkM3@x1n>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <ZFE9Vb6iMcGCzkM3@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02.05.23 19:41, Peter Xu wrote:
>>   ##
>>   # @query-colo-status:
>> @@ -1674,7 +1676,8 @@
>>   # Since: 3.1
>>   ##
>>   { 'command': 'query-colo-status',
>> -  'returns': 'COLOStatus' }
>> +  'returns': 'COLOStatus',
>> +  'if': 'CONFIG_REPLICATION' }
> I still see a bunch of other colo related definitions around in the qapi
> schema, e.g. COLOExitReason.  Is it intended to leave them as is?
> 

Removing them will make us to add more and more ifdefs in the code.

We decided to keep x-colo capability.
One more enum field is colo migration status - not worse than x-colo enum field, and is not possible with replication disabled

The others (like COLOExitReason) are just structure definitions - not a public API, so no reason to care about.

The exclustion is COLOStatus, we have to handle it. If not compilation fails:

qapi/qapi-commands-migration.c:821:13: error: ‘qmp_marshal_output_COLOStatus’ defined but not used [-Werror=unused-function]
   821 | static void qmp_marshal_output_COLOStatus(COLOStatus *ret_in,
       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors


- COLOStatus becomes unused with replication disabled, as it is used only in migration/colo.c

-- 
Best regards,
Vladimir


