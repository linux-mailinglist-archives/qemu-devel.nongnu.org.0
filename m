Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AA36E9569
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:09:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppU23-0002Y8-Am; Thu, 20 Apr 2023 09:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppU1z-0002Ub-FS
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:08:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppU1x-0001iA-NI
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:08:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681996137;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=lE+81yvPV+YjkmDA3Lrc4CUwo8DBeACeUHHvkO2/mxA=;
 b=jT8Dwy+8+QNifaHzXdRhnE5N2y16gS+KI2tLxD0JpElpgCksUZYnb10JByO1lDNHo1l56E
 dvyiWnRHNRUKuxRgYfmm87OyUYT9D+ctr99sBxkrbk2q5idblbA3PSEcPY8VfmRvR1yDqa
 pJKd42tQawuRynDo8Ia05AbGmmHb2hU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-0zln7uaxMS6Tn5OasxxxWA-1; Thu, 20 Apr 2023 09:08:55 -0400
X-MC-Unique: 0zln7uaxMS6Tn5OasxxxWA-1
Received: by mail-wr1-f71.google.com with SMTP id
 j16-20020adfa550000000b002fee71f4a42so81415wrb.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 06:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681996134; x=1684588134;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lE+81yvPV+YjkmDA3Lrc4CUwo8DBeACeUHHvkO2/mxA=;
 b=FKofDL25NHmmZ0n87QCHf584gdwfJ6sGjh8LjTqTKqjnBRO6B4tsQHGr1xLnKZpUKJ
 KAKQkMOWT+Xr6H79arkEGMYN9wbrGwZ95kRpf3K5Pos9UJsNPgg2u60OvXMba+RxzIJ5
 pQruZWV4WkS/tjMYtZ4hm5so5M8tgCyCHlGsv9E7H6+IRQOrSAmdSGTzGKIclqb0Csdc
 TR4Yax6j/IzsjT3UzzxUff5Mg6Lq1Kc5xCVaUp8KybbSw3BpHPYndI2LQRn4v9fydrbv
 3Km8DpTifcsfCU71PmCDy0H3TJCNndvaj6WVSIvNKzAJIfba2n46NgM2ULWceSATw1Ih
 lLOg==
X-Gm-Message-State: AAQBX9eHv1fKwuigsTxT1cO7refbBbmI75TmLXLUcsJNlqt/VCB1Ulnb
 6ACAp5r++J9imy8+MZv+uIaCtQ1NA/KFhwsTQXsQO7XDk88rs+STdM51KAJW2k80i5+rhtkHAm5
 QKihdbhrEc1nFUTA=
X-Received: by 2002:a1c:7906:0:b0:3f1:6ecf:537 with SMTP id
 l6-20020a1c7906000000b003f16ecf0537mr1216001wme.33.1681996134482; 
 Thu, 20 Apr 2023 06:08:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350YN+N/vHwilXjO2+2tErRDS0/x8wOtzwhXyl836ua6LeOBdroiXQm7RMdLp6xuWggtmts70sQ==
X-Received: by 2002:a1c:7906:0:b0:3f1:6ecf:537 with SMTP id
 l6-20020a1c7906000000b003f16ecf0537mr1215984wme.33.1681996134137; 
 Thu, 20 Apr 2023 06:08:54 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bca41000000b003f179fc6d8esm1931199wml.44.2023.04.20.06.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 06:08:53 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  David Hildenbrand <david@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org,  Hailiang Zhang <zhanghailiang@xfusion.com>,  Fam
 Zheng <fam@euphon.net>,  "Michael S. Tsirkin" <mst@redhat.com>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 00/43] Migration: Create options.c for
 capabilities/params/properties
In-Reply-To: <491fa865-a40b-7f91-7505-f80819b07d7a@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Mon, 6 Mar 2023 17:29:34 +0300")
References: <20230302163410.11399-1-quintela@redhat.com>
 <491fa865-a40b-7f91-7505-f80819b07d7a@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 15:08:52 +0200
Message-ID: <87o7niwviz.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
> On 02.03.23 19:33, Juan Quintela wrote:
>> Hi
>> This series move to options.c:
>> - all migration capabilities code
>> - all migration parameters code
>> - all properties code
>> - all qmp commands that only touch the previous
>> And once there:
>> - sort of functions
>> - make consistent and coherent all the functions naming/typing
>> - create accessors for the parameters/capabilties that don't exist
>> - more cleanups here and there.
>> Todo:
>> - There is still capabilities code on savevm.c, but I want this in
>>    before moving that code to options.c, but still needs more thought
>>    for my part. I.e. should I put vmstate sections in options.c, or
>>    should I create new functions to access the capabilities in savevm.c.
>> Please review.
>
> Hmm, I can't apply to current master, neither can patchew:
> https://patchew.org/QEMU/20230302163410.11399-1-quintela@redhat.com/
>
> On which commit the series based on?

It was on top of my spice changes O:-)
But I sent a new version right now on top of the PULL request.

Thanks, Juan.


