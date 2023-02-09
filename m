Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A5F6908CE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 13:29:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ63H-0000c9-G9; Thu, 09 Feb 2023 07:29:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQ63F-0000b0-17
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 07:29:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQ63D-0005YG-FY
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 07:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675945758;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NAS+ENuHoRwcH799XpLWI6z6RnlIC3cuht6QzFrJazY=;
 b=JMkvQZFTJ3pIMVxcdZIHKT2TTG14otSBmVqLbHQPAN7MxB21ksX4YDMj5nPrcu4eBthEhP
 Nk5hEKrlTsMLoubQ+fcwTLGLJm/u1q0dGHOq5s8TF+bTuXnZeUwb/v89UzKCUV2HaCPG3D
 57CY2ZxBBYA1JBI11HyrqVt8W2fZJV4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-518-BUn4LhICMHacHp7thgOdxQ-1; Thu, 09 Feb 2023 07:29:17 -0500
X-MC-Unique: BUn4LhICMHacHp7thgOdxQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 o31-20020a05600c511f00b003dc53da325dso2750843wms.8
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 04:29:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NAS+ENuHoRwcH799XpLWI6z6RnlIC3cuht6QzFrJazY=;
 b=sPXIyV4/F82lie5XPT4OcEQy5Y/9vm4In2h0NfO4G85HLs5llYM0XO2edrPql9T1xS
 HAxXEred8gEIekk6ilP1/90q5Hka3viMDKcKSHBceSMPBMSmSdxq22nV4QmR7qGL35pN
 aq5vktioGm/7mH9806KvcT6JUyq0/jwfCFyO31cYPMgas++8NbKQBoa3BSyAkEqVv1i7
 9PO2V7uQpcL1QMRpFBJTfwFjbDqjyQ50rVys9x54UhKU8ToDRnI56SMEkmVuHNSv4qwK
 8qf7RXRBqfaswH42T/RXH1+y0qPDpa9lvzKHOiTg+v9veSmJ2QdAz3NBu/dp7EyFBOch
 pK0A==
X-Gm-Message-State: AO0yUKXlQL/gYDF11uWikjGlLCaVRA162yx963ZlW6fsdsK0Jih4DM4f
 GxvqhSGt2FfZKeg7ldn7z1rLwKm9mWBLGYDnrI6qm6p0x4gKY4dIVYHME5j1ae/pyNFvMvHKy6X
 vi+p+dOJ4Qp5tI9Q=
X-Received: by 2002:adf:ed11:0:b0:2bd:d45c:3929 with SMTP id
 a17-20020adfed11000000b002bdd45c3929mr9771618wro.54.1675945756481; 
 Thu, 09 Feb 2023 04:29:16 -0800 (PST)
X-Google-Smtp-Source: AK7set/y/zjewfWbL385FKTntuMe+hVXuOGfMhvEunprTuo3+XpEBQAGCUQXIcRthBsPMCaB8KPCXw==
X-Received: by 2002:adf:ed11:0:b0:2bd:d45c:3929 with SMTP id
 a17-20020adfed11000000b002bdd45c3929mr9771581wro.54.1675945756270; 
 Thu, 09 Feb 2023 04:29:16 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b003dc34edacf8sm5403694wmq.31.2023.02.09.04.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 04:29:15 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,  Stefan Berger
 <stefanb@linux.vnet.ibm.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 "Halil Pasic" <pasic@linux.ibm.com>,  John Snow <jsnow@redhat.com>,
 David Hildenbrand <david@redhat.com>,  Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  "Vladimir
 Sementsov-Ogievskiy" <vsementsov@yandex-team.ru>,  "qemu-s390x@nongnu.org"
 <qemu-s390x@nongnu.org>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  "Dr. David
 Alan Gilbert"
 <dgilbert@redhat.com>,  "Marcel Apfelbaum" <marcel.apfelbaum@gmail.com>,
 Coiby Xu <Coiby.Xu@gmail.com>,  "Ilya Leoshkevich" <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>,  Yanan Wang
 <wangyanan55@huawei.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Markus Armbruster <armbru@redhat.com>,
 "Paolo Bonzini" <pbonzini@redhat.com>,  Alex Williamson
 <alex.williamson@redhat.com>,  Eric Blake <eblake@redhat.com>,  Eric
 Farman <farman@linux.ibm.com>
Subject: Re: [PULL 28/30] multifd: Fix flush of zero copy page send request
In-Reply-To: <SJ0PR11MB67440DCD9ABD1087E59456FF92D99@SJ0PR11MB6744.namprd11.prod.outlook.com>
 (Zhenzhong Duan's message of "Thu, 9 Feb 2023 01:27:52 +0000")
References: <20230207005650.1810-1-quintela@redhat.com>
 <20230207005650.1810-29-quintela@redhat.com>
 <SJ0PR11MB67440DCD9ABD1087E59456FF92D99@SJ0PR11MB6744.namprd11.prod.outlook.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 09 Feb 2023 13:29:14 +0100
Message-ID: <87bkm358f9.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

"Duan, Zhenzhong" <zhenzhong.duan@intel.com> wrote:
> Hi Juan,
>
>>-----Original Message-----
>>From: Juan Quintela <quintela@redhat.com>
>>Sent: Tuesday, February 7, 2023 8:57 AM
>>To: qemu-devel@nongnu.org
>>Cc: qemu-block@nongnu.org; Stefan Berger <stefanb@linux.vnet.ibm.com>;
>>Stefan Hajnoczi <stefanha@redhat.com>; Halil Pasic <pasic@linux.ibm.com>;
>>John Snow <jsnow@redhat.com>; David Hildenbrand <david@redhat.com>;
>>Fam Zheng <fam@euphon.net>; Thomas Huth <thuth@redhat.com>; Daniel P.
>>Berrang=C3=A9 <berrange@redhat.com>; Laurent Vivier <lvivier@redhat.com>;
>>Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>; qemu-
>>s390x@nongnu.org; Christian Borntraeger <borntraeger@linux.ibm.com>;
>>Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>; Michael S. Tsirkin
>><mst@redhat.com>; Juan Quintela <quintela@redhat.com>; Philippe
>>Mathieu-Daud=C3=A9 <philmd@linaro.org>; Dr. David Alan Gilbert
>><dgilbert@redhat.com>; Marcel Apfelbaum <marcel.apfelbaum@gmail.com>;
>>Coiby Xu <Coiby.Xu@gmail.com>; Ilya Leoshkevich <iii@linux.ibm.com>;
>>Eduardo Habkost <eduardo@habkost.net>; Yanan Wang
>><wangyanan55@huawei.com>; Richard Henderson
>><richard.henderson@linaro.org>; Markus Armbruster <armbru@redhat.com>;
>>Paolo Bonzini <pbonzini@redhat.com>; Alex Williamson
>><alex.williamson@redhat.com>; Eric Blake <eblake@redhat.com>; Eric
>>Farman <farman@linux.ibm.com>; Duan, Zhenzhong
>><zhenzhong.duan@intel.com>
>>Subject: [PULL 28/30] multifd: Fix flush of zero copy page send request
>>
>>From: Zhenzhong Duan <zhenzhong.duan@intel.com>
>>
>>Make IO channel flush call after the inflight request has been drained in
>>multifd thread, or else we may missed to flush the inflight request.
>>
>>Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>>Reviewed-by: Juan Quintela <quintela@redhat.com>
>>Signed-off-by: Juan Quintela <quintela@redhat.com>
>>---
>> .../x86_64-quintela-devices.mak               |    7 +
>> .../x86_64-quintela2-devices.mak              |    6 +
>> migration/multifd.c                           |    8 +-
>> migration/multifd.c.orig                      | 1274 +++++++++++++++++
>> 4 files changed, 1291 insertions(+), 4 deletions(-)  create mode 100644
>>configs/devices/x86_64-softmmu/x86_64-quintela-devices.mak
>> create mode 100644 configs/devices/x86_64-softmmu/x86_64-quintela2-
>>devices.mak
>> create mode 100644 migration/multifd.c.orig
>>
> Just back from vacation, hoping it's not too late to report:
> x86_64-quintela-devices.mak x86_64-quintela2-devices.mak and
> multifd.c.orig might be unrelated to this patch?

Sent patch, thanks.

/me puts brown paper bag on head for this week.


