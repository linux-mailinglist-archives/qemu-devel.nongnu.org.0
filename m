Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A99698305
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:16:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMJZ-00028t-6l; Wed, 15 Feb 2023 13:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSMJK-0001p5-K4
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:15:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSMJG-00035X-W1
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:15:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676484913;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=j/AiXUe7mpGG9iCMipuYg6vvcSsUeH1D3R0iXOQbYBA=;
 b=UE9wFcf/lG5ceg9MCLSSaytQdAu53neAcjTq5HS2ACaxUVA//6JYglnzNwB2DWPFzOh+Ze
 Dp0YXXzRHMbnzrqj136fBKhk/Hd6gJqSt5pA2C9cQ4R3UwqARo2mBXSy1hC/hbr+BGC/pr
 N+mEInp/Bs+Lmp6/nkeu7ihUlvvMLE0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-Obg2z8JpOP2LirsHH35DjA-1; Wed, 15 Feb 2023 13:15:04 -0500
X-MC-Unique: Obg2z8JpOP2LirsHH35DjA-1
Received: by mail-wr1-f70.google.com with SMTP id
 t20-20020adfba54000000b002be0eb97f4fso3843543wrg.8
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 10:15:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j/AiXUe7mpGG9iCMipuYg6vvcSsUeH1D3R0iXOQbYBA=;
 b=k2RWDaxkdPdZseOJUoFyHNKTSLvglE5h8UH0EJ9Xq0y+XDcb4puKtYsoxQZjTI2tat
 jUsKzUhLfGLHOS0avix2Uxo7++Cgkrycg7y2DBzlPMfl5zMNBHuGL7gqsjW68kJlaT5O
 XpdXvLB18+Y6JinXiL2/SPGyHVQ25YskgTQtEcviFSGqIfSe2MB5/Uy08mf11q5mAI5/
 pUNflomn7YOgO4trdhVs4MNrHftFgeAid5J9j3d2frKcR+ed+vEmsWm3c/jthpJH8jLG
 DsubUqTl/JMDZJJ5pmCwGKheO8aMItMeY897ZIMI73leVYV0ijXjvM1GSpTM3N4RIfYh
 Xwgw==
X-Gm-Message-State: AO0yUKWNDc/f/v4ygyxiJJPjWHE4spJEcpuYVHbW772pqiUEwy65YGJk
 gLinqLvqduDpznaUoTsy303IAMIRCFpld0y6u6FbNpG4YME06dPWMuTSk65+pZGNHwTTi6Ilg/F
 h7R7D/QZ1O6VApGo=
X-Received: by 2002:a05:600c:90a:b0:3df:50eb:7cd9 with SMTP id
 m10-20020a05600c090a00b003df50eb7cd9mr2855643wmp.14.1676484903451; 
 Wed, 15 Feb 2023 10:15:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+OGBeNP90D4za5ndECEXEjH4DlU4NSPufdcUpmSlwR2I7wBzKX0OVWk5k7aqqS8YZSFdQPPA==
X-Received: by 2002:a05:600c:90a:b0:3df:50eb:7cd9 with SMTP id
 m10-20020a05600c090a00b003df50eb7cd9mr2855621wmp.14.1676484903192; 
 Wed, 15 Feb 2023 10:15:03 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c4f0900b003dff870ce0esm3275714wmq.2.2023.02.15.10.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 10:15:02 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  John Snow <jsnow@redhat.com>,  Halil Pasic
 <pasic@linux.ibm.com>,  Christian Borntraeger <borntraeger@linux.ibm.com>,
 Fam Zheng <fam@euphon.net>,  Alex Williamson
 <alex.williamson@redhat.com>,  qemu-s390x@nongnu.org,  Thomas Huth
 <thuth@redhat.com>,  Eric Farman <farman@linux.ibm.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Eric Blake <eblake@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  qemu-block@nongnu.org,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 3/3] migration: Rename res_{postcopy,precopy}_only
In-Reply-To: <6b46bb8a-cbdd-b2d9-e542-a28d598d0140@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 15 Feb 2023 20:53:29 +0300")
References: <20230215170345.6220-1-quintela@redhat.com>
 <20230215170345.6220-4-quintela@redhat.com>
 <6b46bb8a-cbdd-b2d9-e542-a28d598d0140@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 15 Feb 2023 19:15:01 +0100
Message-ID: <87ilg2ztga.fsf@secure.mitica>
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

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> On 15.02.23 20:03, Juan Quintela wrote:
>> Once that res_compatible is removed, they don't make sense anymore.
>> We remove the _only preffix.  And to make things clearer we rename
>> them to must_precopy and can_postcopy.
>> Signed-off-by: Juan Quintela<quintela@redhat.com>
>
> Ideally headers of trace events (trace_vfio_state_pending, trace_migrate_pending_estimate, trace_migrate_pending_exact)
> should be changed correspondingly.

They already use abrevs:

migrate_pending_estimate(uint64_t size, uint64_t pre, uint64_t post) "estimate pending size %" PRIu64 " (pre = %" PRIu64 " post=%" PRIu64 ")"

So I don't feel like doing bigger lines.

> with or without:
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Thanks.


