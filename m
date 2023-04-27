Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5685E6F0C92
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 21:33:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps7LO-0000Ws-Cv; Thu, 27 Apr 2023 15:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ps7LL-0000WX-Dg; Thu, 27 Apr 2023 15:31:51 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ps7LH-0002Ln-3j; Thu, 27 Apr 2023 15:31:50 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id A5B0061062;
 Thu, 27 Apr 2023 22:31:34 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b438::1:2b] (unknown
 [2a02:6b8:b081:b438::1:2b])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id WVOp930OquQ0-5nvFlep9; Thu, 27 Apr 2023 22:31:33 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682623893; bh=hDe96BF2CHii5uOAzirOfcpO4TPmyGG2sxILdmtM4Qo=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=jReOqKdBOv2HX5UIwx7utIt6EHs6ZjqSohWsRHQCNi59dzSQgFq0fYZFxqCMKLE9D
 TTFZOKy7XXbJmFyJFNA7Bb8Lh5NTkEPhR8MYtHAI8RXH1xmqofHDCvQA+RTCMQ+YYS
 d6QVZgJ1pKYT9/m0TT0cD0NW9BzbLoXK00/vpQ+o=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <73b38f83-a927-d3d9-c08e-7276f48f013c@yandex-team.ru>
Date: Thu, 27 Apr 2023 22:31:32 +0300
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
 <b9badd90-6d1f-5d1d-72a1-9c357a1fb9b2@yandex-team.ru>
 <MWHPR11MB0031A7CE9FB5A6E93AD601A79B669@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <MWHPR11MB0031A7CE9FB5A6E93AD601A79B669@MWHPR11MB0031.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 23.04.23 04:54, Zhang, Chen wrote:
> 
>> -----Original Message-----
>> From: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
>> Sent: Friday, April 21, 2023 4:36 PM
>> To: Zhang, Chen<chen.zhang@intel.com>;qemu-devel@nongnu.org
>> Cc:qemu-block@nongnu.org;michael.roth@amd.com;armbru@redhat.com;
>> eblake@redhat.com;jasowang@redhat.com;quintela@redhat.com; Zhang,
>> Hailiang<zhanghailiang@xfusion.com>;philmd@linaro.org;
>> thuth@redhat.com;berrange@redhat.com;marcandre.lureau@redhat.com;
>> pbonzini@redhat.com;dave@treblig.org;hreitz@redhat.com;
>> kwolf@redhat.com;lizhijian@fujitsu.com
>> Subject: Re: [PATCH v2 3/4] build: move COLO under CONFIG_REPLICATION
>>
>> On 21.04.23 06:02, Zhang, Chen wrote:
>>>
>>>> -----Original Message-----
>>>> From: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
>>>> Sent: Thursday, April 20, 2023 6:53 AM
>>>> To:qemu-devel@nongnu.org
>>>> Cc:qemu-block@nongnu.org;michael.roth@amd.com;
>> armbru@redhat.com;
>>>> eblake@redhat.com;jasowang@redhat.com;quintela@redhat.com;
>> Zhang,
>>>> Hailiang<zhanghailiang@xfusion.com>;philmd@linaro.org;
>>>> thuth@redhat.com;berrange@redhat.com;
>> marcandre.lureau@redhat.com;
>>>> pbonzini@redhat.com;dave@treblig.org;hreitz@redhat.com;
>>>> kwolf@redhat.com; Zhang, Chen<chen.zhang@intel.com>;
>>>> lizhijian@fujitsu.com; Vladimir Sementsov-Ogievskiy
>>>> <vsementsov@yandex- team.ru>
>>>> Subject: [PATCH v2 3/4] build: move COLO under CONFIG_REPLICATION
>>>>
>>>> We don't allow to use x-colo capability when replication is not
>>>> configured. So, no reason to build COLO when replication is disabled,
>>>> it's unusable in this case.
>>> Yes, you are right for current status. Because COLO best practices is
>> replication + colo live migration + colo proxy.
>>> But doesn't mean it has to be done in all scenarios as I explanation in V1.
>>> The better way is allow to use x-colo capability firstly, and separate
>>> this patch with two config options: --disable-replication  and --disable-x-
>> colo.
>> But what for? We for sure don't have such scenarios now (COLO without
>> replication), as it's not allowed by far 7e934f5b27eee1b0d7 (by you and
>> David).
>>
>> If you think we need such scenario, I think it should be a separate series
>> which reverts 7e934f5b27eee1b0d7 and adds corresponding test and
>> probably documentation.
> In the patch 7e934f5b27eee1b0d7 said it's for current independent disk mode,
> And what we talked about before is the shared disk mode.
> Rethink about the COLO shared disk mode, this feature still needs some enabling works.
> It looks OK for now and separate the build options when enabling COLO shared disk mode.

I've started working on this, and now I see, that check in the migrate_caps_check() is not the only place.

migration/colo.c has also several abort() points. For example, colo_process_checkpoint will simply abort if CONFIG_REPLICATION not defined.

So for sure, current code is not prepared to use COLO with REPLICATION disabled.

If this possibility is needed it requires more work. Personally, I don't think that possibility to enable COLO with disabled REPLICATION is really needed and I know nobody who need it, so that seems to be extra work.


-- 
Best regards,
Vladimir


