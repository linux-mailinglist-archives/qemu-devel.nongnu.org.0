Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C996F1202
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 08:54:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psHy0-0000Gi-Io; Fri, 28 Apr 2023 02:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psHxy-0000GL-NK
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 02:52:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psHxx-0005Es-44
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 02:52:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682664743;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1OxRGZUgQZoOGVAl8+L4VqgbsU9i8w29upqQh9DhHZw=;
 b=Wbh8V6mwh70cKQXO5Y8LhFW1uwzH/XFlmO17wzATZ8RR16sFz91Xt5L6Phs20LQ3VVlTkN
 442qYrog+NF7p6UAMo+W2B6DEo72fxNKRfG285VDlhkBthYtfeBfOkMuOBHJteDZow5TBb
 MUxtDauwdiwWX9Vy+Tx+rhfNXuuzke8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-DY-_MDgwMXm7fTU7eyqGdw-1; Fri, 28 Apr 2023 02:52:21 -0400
X-MC-Unique: DY-_MDgwMXm7fTU7eyqGdw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f173bd0d1bso60631075e9.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 23:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682664740; x=1685256740;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1OxRGZUgQZoOGVAl8+L4VqgbsU9i8w29upqQh9DhHZw=;
 b=PNSWtrNs5F8NrQB79XN9tRbuyERLRS4w6ANv0yatnrihWJC3B2XIYPFhd3/iQVjeDJ
 Tmf+OR4RayItk5PyR27tJ5bAzKdYoxE+iGVwZQor1DoUrLxJfQ9ht+6uNsp/3pZS9FpH
 XWANzY0ZMCdJcSNrBgtGC2Rog+BhJuUbgiELXUKJMTR0NRqmJuw9V2E56bwSy0xByqln
 is0Ht/5e9o+vdOG/0knFlKCFV3j8wS+9/G2ANSJZhMPr2JsCFC58E4LzzayqFgjrC8i3
 SUT/hULTg5YOlMV+0cqv4FEemiuFsMmKOGqE70Z5ZaYN7o50dpLI96MCEuCIqU85STjm
 WiyA==
X-Gm-Message-State: AC+VfDyTs+M1brUFMSFf5amHkzG3mvH2vVeOXZD85CuIrOr5bb3iR7Tf
 pgq/lUFZm+Y2Pky1AsIClJb26Z75nRfmBzZVs1FPbIWtV+FVAfU5DdKg/KRmW3WuewA2Qf54pJt
 MtbdjOJBv+r/YYPk=
X-Received: by 2002:a05:600c:378e:b0:3f2:549b:3ef2 with SMTP id
 o14-20020a05600c378e00b003f2549b3ef2mr2815102wmr.17.1682664740208; 
 Thu, 27 Apr 2023 23:52:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ra//GfnyGKNbSJqANVJF8PgFBYD8pBpbRw7Bcgewp8qzN26ws251kQJMkgxz0VnvRc2+SIQ==
X-Received: by 2002:a05:600c:378e:b0:3f2:549b:3ef2 with SMTP id
 o14-20020a05600c378e00b003f2549b3ef2mr2815090wmr.17.1682664739817; 
 Thu, 27 Apr 2023 23:52:19 -0700 (PDT)
Received: from redhat.com ([95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 l14-20020a7bc44e000000b003f195d2f1a9sm18908714wmi.15.2023.04.27.23.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 23:52:19 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: "Zhang, Chen" <chen.zhang@intel.com>,  "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>,  "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "michael.roth@amd.com" <michael.roth@amd.com>,  "armbru@redhat.com"
 <armbru@redhat.com>,  "eblake@redhat.com" <eblake@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,  "Zhang, Hailiang"
 <zhanghailiang@xfusion.com>,  "philmd@linaro.org" <philmd@linaro.org>,
 "thuth@redhat.com" <thuth@redhat.com>,  "berrange@redhat.com"
 <berrange@redhat.com>,  "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>,  "pbonzini@redhat.com"
 <pbonzini@redhat.com>,  "dave@treblig.org" <dave@treblig.org>,
 "hreitz@redhat.com" <hreitz@redhat.com>,  "kwolf@redhat.com"
 <kwolf@redhat.com>,  "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
Subject: Re: [PATCH v2 3/4] build: move COLO under CONFIG_REPLICATION
In-Reply-To: <73b38f83-a927-d3d9-c08e-7276f48f013c@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 27 Apr 2023 22:31:32 +0300")
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
 <20230419225232.508121-4-vsementsov@yandex-team.ru>
 <MWHPR11MB00312BC202A9B93E260F58369B609@MWHPR11MB0031.namprd11.prod.outlook.com>
 <b9badd90-6d1f-5d1d-72a1-9c357a1fb9b2@yandex-team.ru>
 <MWHPR11MB0031A7CE9FB5A6E93AD601A79B669@MWHPR11MB0031.namprd11.prod.outlook.com>
 <73b38f83-a927-d3d9-c08e-7276f48f013c@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 08:52:13 +0200
Message-ID: <87r0s4bisi.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> On 23.04.23 04:54, Zhang, Chen wrote:
>> 
>>> -----Original Message-----
>>> From: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
>>> Sent: Friday, April 21, 2023 4:36 PM
>>> To: Zhang, Chen<chen.zhang@intel.com>;qemu-devel@nongnu.org
>>> Cc:qemu-block@nongnu.org;michael.roth@amd.com;armbru@redhat.com;
>>> eblake@redhat.com;jasowang@redhat.com;quintela@redhat.com; Zhang,
>>> Hailiang<zhanghailiang@xfusion.com>;philmd@linaro.org;
>>> thuth@redhat.com;berrange@redhat.com;marcandre.lureau@redhat.com;
>>> pbonzini@redhat.com;dave@treblig.org;hreitz@redhat.com;
>>> kwolf@redhat.com;lizhijian@fujitsu.com
>>> Subject: Re: [PATCH v2 3/4] build: move COLO under CONFIG_REPLICATION
>>>
>>> On 21.04.23 06:02, Zhang, Chen wrote:
>>>>
>>>>> -----Original Message-----
>>>>> From: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
>>>>> Sent: Thursday, April 20, 2023 6:53 AM
>>>>> To:qemu-devel@nongnu.org
>>>>> Cc:qemu-block@nongnu.org;michael.roth@amd.com;
>>> armbru@redhat.com;
>>>>> eblake@redhat.com;jasowang@redhat.com;quintela@redhat.com;
>>> Zhang,
>>>>> Hailiang<zhanghailiang@xfusion.com>;philmd@linaro.org;
>>>>> thuth@redhat.com;berrange@redhat.com;
>>> marcandre.lureau@redhat.com;
>>>>> pbonzini@redhat.com;dave@treblig.org;hreitz@redhat.com;
>>>>> kwolf@redhat.com; Zhang, Chen<chen.zhang@intel.com>;
>>>>> lizhijian@fujitsu.com; Vladimir Sementsov-Ogievskiy
>>>>> <vsementsov@yandex- team.ru>
>>>>> Subject: [PATCH v2 3/4] build: move COLO under CONFIG_REPLICATION
>>>>>
>>>>> We don't allow to use x-colo capability when replication is not
>>>>> configured. So, no reason to build COLO when replication is disabled,
>>>>> it's unusable in this case.
>>>> Yes, you are right for current status. Because COLO best practices is
>>> replication + colo live migration + colo proxy.
>>>> But doesn't mean it has to be done in all scenarios as I explanation in V1.
>>>> The better way is allow to use x-colo capability firstly, and separate
>>>> this patch with two config options: --disable-replication  and --disable-x-
>>> colo.
>>> But what for? We for sure don't have such scenarios now (COLO without
>>> replication), as it's not allowed by far 7e934f5b27eee1b0d7 (by you and
>>> David).
>>>
>>> If you think we need such scenario, I think it should be a separate series
>>> which reverts 7e934f5b27eee1b0d7 and adds corresponding test and
>>> probably documentation.
>> In the patch 7e934f5b27eee1b0d7 said it's for current independent disk mode,
>> And what we talked about before is the shared disk mode.
>> Rethink about the COLO shared disk mode, this feature still needs some enabling works.
>> It looks OK for now and separate the build options when enabling COLO shared disk mode.
>
> I've started working on this, and now I see, that check in the migrate_caps_check() is not the only place.
>
> migration/colo.c has also several abort() points. For example,
> colo_process_checkpoint will simply abort if CONFIG_REPLICATION not
> defined.
>
> So for sure, current code is not prepared to use COLO with REPLICATION disabled.
>
> If this possibility is needed it requires more work. Personally, I
> don't think that possibility to enable COLO with disabled REPLICATION
> is really needed and I know nobody who need it, so that seems to be
> extra work.

Whoever does the work to make COLO without REPLICATION work, it can also
do the aditional work of splitting it.  Changing a configure file is
going to be the smaller of its problems.

Later, Juan.


