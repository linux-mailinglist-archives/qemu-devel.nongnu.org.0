Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9343E6EA5F9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 10:37:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppmFN-0001km-3C; Fri, 21 Apr 2023 04:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppmFL-0001kY-7N; Fri, 21 Apr 2023 04:35:59 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppmFI-00014i-SE; Fri, 21 Apr 2023 04:35:58 -0400
Received: from mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:2cab:0:640:424b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 3227D5FF21;
 Fri, 21 Apr 2023 11:35:45 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:8816::1:4] (unknown
 [2a02:6b8:b081:8816::1:4])
 by mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id hZasp815Qa60-MWqAvRTv; Fri, 21 Apr 2023 11:35:44 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682066144; bh=L4C662cIu4nV2oc7UGnMWdllBehHs1hNzU5V+AnoPRU=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=fEWBZSkv2ujV2geurCk+3mitsEMogRhUqDPmE8DOcdDKNJaTaNEuOvtxo//nyMye6
 0EAg5qq0wSSjqQQKdHlwvcma9KICbhjL0bORvY87Me3USiEIJ2zk5oyKHRI5jBV5mO
 Vst/3ehkxW7ak4XeqBTLI+FRAgIAPtbn/l22FixY=
Authentication-Results: mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <b9badd90-6d1f-5d1d-72a1-9c357a1fb9b2@yandex-team.ru>
Date: Fri, 21 Apr 2023 11:35:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/4] build: move COLO under CONFIG_REPLICATION
Content-Language: en-US
To: "Zhang, Chen" <chen.zhang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "michael.roth@amd.com" <michael.roth@amd.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "Zhang, Hailiang" <zhanghailiang@xfusion.com>,
 "philmd@linaro.org" <philmd@linaro.org>, "thuth@redhat.com"
 <thuth@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "dave@treblig.org" <dave@treblig.org>, "hreitz@redhat.com"
 <hreitz@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
 <20230419225232.508121-4-vsementsov@yandex-team.ru>
 <MWHPR11MB00312BC202A9B93E260F58369B609@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <MWHPR11MB00312BC202A9B93E260F58369B609@MWHPR11MB0031.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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

On 21.04.23 06:02, Zhang, Chen wrote:
> 
> 
>> -----Original Message-----
>> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> Sent: Thursday, April 20, 2023 6:53 AM
>> To: qemu-devel@nongnu.org
>> Cc: qemu-block@nongnu.org; michael.roth@amd.com; armbru@redhat.com;
>> eblake@redhat.com; jasowang@redhat.com; quintela@redhat.com; Zhang,
>> Hailiang <zhanghailiang@xfusion.com>; philmd@linaro.org;
>> thuth@redhat.com; berrange@redhat.com; marcandre.lureau@redhat.com;
>> pbonzini@redhat.com; dave@treblig.org; hreitz@redhat.com;
>> kwolf@redhat.com; Zhang, Chen <chen.zhang@intel.com>;
>> lizhijian@fujitsu.com; Vladimir Sementsov-Ogievskiy <vsementsov@yandex-
>> team.ru>
>> Subject: [PATCH v2 3/4] build: move COLO under CONFIG_REPLICATION
>>
>> We don't allow to use x-colo capability when replication is not configured. So,
>> no reason to build COLO when replication is disabled, it's unusable in this
>> case.
> 
> Yes, you are right for current status. Because COLO best practices is replication + colo live migration + colo proxy.
> But doesn't mean it has to be done in all scenarios as I explanation in V1.
> The better way is allow to use x-colo capability firstly, and separate this patch
> with two config options: --disable-replication  and --disable-x-colo.
> 

But what for? We for sure don't have such scenarios now (COLO without replication), as it's not allowed by far 7e934f5b27eee1b0d7 (by you and David).

If you think we need such scenario, I think it should be a separate series which reverts 7e934f5b27eee1b0d7 and adds corresponding test and probably documentation.


-- 
Best regards,
Vladimir


