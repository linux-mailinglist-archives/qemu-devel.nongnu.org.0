Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DCC6E937A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 13:57:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppStZ-0004DA-HT; Thu, 20 Apr 2023 07:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppStX-0004Ck-LF
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 07:56:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppStR-0007ZI-Ca
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 07:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681991764;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=zAvDgzGJBTvVS23qhc+A5W0Y6N09b5q8Lf9B1WGA4DU=;
 b=UzEV0jm2Q+gaS6Oece152y3tFuu3lvUS1FrZWbYehKQJxXYdPhKVRfCIhSknO52Ced1xue
 P5JM1pn/hfuZWB3jreRG4vAeetaphSVF2/s+cd3dv/jigz5pSlwc/ruqud59Dtvzav/O3T
 ipbhqFi6lOP3M6Z9hdZiNk7nvY0klAc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-7wTtX8feMoiz6gMjXiJ9Vw-1; Thu, 20 Apr 2023 07:56:03 -0400
X-MC-Unique: 7wTtX8feMoiz6gMjXiJ9Vw-1
Received: by mail-wm1-f69.google.com with SMTP id
 p3-20020a05600c358300b003f175c338d6so552877wmq.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 04:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681991762; x=1684583762;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zAvDgzGJBTvVS23qhc+A5W0Y6N09b5q8Lf9B1WGA4DU=;
 b=W1vi1qugFqiCBzkBGs1jm1+MAY+qeJLkzxbNXIVHuXU+8qNrBZ/M5NvysAwJ9g2y0g
 aDuMaLg1SzdjJT4+ykmd9s2J7MnfBrvhXZCpAUtMMNWXw18ZnKlQe91GRBJwXdXCGHRP
 rS1LAhJfUU48SpMFbEf6gvhzWM9KGWVZzZ5zuNNk5dhdhzuZ1Gs7G7WWc7+jeAc3vJZH
 iQLf0n9vNZrSAUje8aPYSOPpk2Jnd3cSP/hapl5ch1L+DF701ohzebZPF9RZm8J4PK2Q
 CCFGHcmrmZKIfy7GALG5hoXbFVAS+Dbw8/JCXBzoCxsdILPtCuC5zkH+b4/s8LgKhrki
 ZKgQ==
X-Gm-Message-State: AAQBX9eBOA18n028tV7NPVG5igKjgWufqpL9lh0Bg4FMrwOuBDaRlJ9r
 kRdPw64ln8tclrgQOjKnnMd/qbY7ed2Kb5+6e7GwWB7Qkqlex2dE1QUchxpZsQawKJ30cjcFkuz
 m4EpriasBIjkzxns=
X-Received: by 2002:a1c:e90f:0:b0:3f1:75b0:dc47 with SMTP id
 q15-20020a1ce90f000000b003f175b0dc47mr1103097wmc.15.1681991762239; 
 Thu, 20 Apr 2023 04:56:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350buWRJUVr9X4KLL31Dk+dYeypj7ul+h6CcMV719oRdOop14hLRPToJYypffvB0d5RCZBMUBwA==
X-Received: by 2002:a1c:e90f:0:b0:3f1:75b0:dc47 with SMTP id
 q15-20020a1ce90f000000b003f175b0dc47mr1103066wmc.15.1681991761869; 
 Thu, 20 Apr 2023 04:56:01 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 p10-20020a1c544a000000b003f03d483966sm5129931wmi.44.2023.04.20.04.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 04:56:01 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  michael.roth@amd.com,
 armbru@redhat.com,  eblake@redhat.com,  jasowang@redhat.com,
 zhanghailiang@xfusion.com,  philmd@linaro.org,  thuth@redhat.com,
 berrange@redhat.com,  marcandre.lureau@redhat.com,  pbonzini@redhat.com,
 dave@treblig.org,  hreitz@redhat.com,  kwolf@redhat.com,
 chen.zhang@intel.com,  lizhijian@fujitsu.com, Daniel Berrange
 <berrange@redhat.com>
Subject: Re: [PATCH v2 3/4] build: move COLO under CONFIG_REPLICATION
In-Reply-To: <9be9bb57-a5c0-377d-3f51-6155357d0405@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 20 Apr 2023 14:40:36 +0300")
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
 <20230419225232.508121-4-vsementsov@yandex-team.ru>
 <87h6tazx8v.fsf@secure.mitica>
 <9be9bb57-a5c0-377d-3f51-6155357d0405@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 13:56:00 +0200
Message-ID: <87r0seydgv.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> On 20.04.23 13:03, Juan Quintela wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
>>> We don't allow to use x-colo capability when replication is not
>>> configured. So, no reason to build COLO when replication is disabled,
>>> it's unusable in this case.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> 
>>> +bool migrate_colo_enabled(void)
>>> +{
>>> +    MigrationState *s = migrate_get_current();
>>> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_X_COLO];
>>> +}

>> Aha, It is for this that you changed the black magic on the previous
>> patch. Looks ok from my ignorance.  As said before, I would not remove
>> the capability, left it the way it was.
>> You have less code (less #ifdefs that you just had to add), and
>> enabling/disabling checking capabilities don't need anything from replication.
>
> Yes, I had a sense of doubt while adding these #ifdefs.
>
> Still, on the other hand I feel that it's strange to have public interface which only can say "I'm not built in" :)
>
> Actually with my way, we have just two #ifdefs instead of one. Seems,
> not too many. And instead of "I'm not supported" error we just not
> include the public interface for unsupported feature. It seems to be
> better user experience. What do you think?

I preffer the regularity that all capabilities are the same, and the
only place to look if something is disabled is a single place.

But on the other hand, the main user is libvirt, so

Daniel, what does libvirt preffers?

/me guess that they have to do both anyways to detect old versions, but
who knows.

Later, Juan.


