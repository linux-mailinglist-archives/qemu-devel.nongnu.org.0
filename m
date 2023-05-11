Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1156FF671
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:50:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8XO-0002iL-18; Thu, 11 May 2023 11:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px8XM-0002i4-SF
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:49:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px8XK-0003eJ-Uy
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:49:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683820137;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=7IQH6XaW5+81QUtRlCGNVN8c4YwgH7skEEAQ80+T8qw=;
 b=hnRUhr76j2eqdH03tEMNNNbVc+K4AEDmtJLDN4GxgmCTVzZ+E2pdTLQPSTDmyzYo8fX9ag
 kVW3l5jCw8gUXCm5z27aDXN6IBpt5mVtB80Jz79e1M/3z1ZmbSiTZTX6IRp5stwchABiFS
 URF7vvrHN8OQvgR12LgWziip/r1eQ2Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-eisLRVQ8PZuAhrat44EMww-1; Thu, 11 May 2023 11:48:56 -0400
X-MC-Unique: eisLRVQ8PZuAhrat44EMww-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-50bc95a5051so10006927a12.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683820135; x=1686412135;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7IQH6XaW5+81QUtRlCGNVN8c4YwgH7skEEAQ80+T8qw=;
 b=aPUCzZMEeImGiUWq5syU8GeD73OqgIchj+6ZqmoYjZoYAzVTIDAhoJEtIBQPupVzZo
 HSXPPxIlFs8bcpNCqo2ApscV3ci8usEgqimTZOTKvOF8lpHnZHcfNgFHBSOFhwcV6grV
 bkJDFvsWCfkHbjhGhXHRbN8/xuCmWJ4OSLgvdi2C5pxj54sFBQ3ltasW4aaCB2oEfJoe
 SJskSaUpCkXjTHKmamLNckMocy8J+QWjxiISVgV7aWHlLxZxSrw07tHcxOaF/IQpv1aE
 IlgX4w2Jptr+rMtYHY7BrjUN3FEHE252RfO2V0sfzp/l7yuKDAA581AdM74DOvZheJYT
 QSlg==
X-Gm-Message-State: AC+VfDyZudDLwxPJbzWSiqtKG9/yDunHGQCkpPhEkRXAzmckvUf1TGNV
 8Qqa5TECukwC//Asa7oH3TbbNn9B2YKecAiPkJ3yKJOVEngZVRLOFDS6QQ9NeLQAiO6RMqDpxk2
 2LAg7EjinSdPZ4Rc=
X-Received: by 2002:a05:6402:1256:b0:50b:c5dc:28d8 with SMTP id
 l22-20020a056402125600b0050bc5dc28d8mr17208334edw.16.1683820135306; 
 Thu, 11 May 2023 08:48:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5QLQjlDplvM7KHv3Bfw378wI/HK5Vw3RVMyIhgwciVV9I/YrgpMgwA8YJl/qN0hnVD8btezw==
X-Received: by 2002:a05:6402:1256:b0:50b:c5dc:28d8 with SMTP id
 l22-20020a056402125600b0050bc5dc28d8mr17208321edw.16.1683820135024; 
 Thu, 11 May 2023 08:48:55 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 bc15-20020a056402204f00b0050b2f588db6sm2985120edb.16.2023.05.11.08.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 08:48:54 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  Avihai Horon <avihaih@nvidia.com>,  Thomas Huth
 <thuth@redhat.com>,  Lukas Straub <lukasstraub2@web.de>,  Alex
 =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Daniel =?utf-8?Q?P=2EBerrang=C3=A9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2] migration: Add documentation for backwards compatiblity
In-Reply-To: <3e294e10-12ec-bb00-cf7d-c6b1574fc252@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 11 May 2023 17:16:40 +0300")
References: <20230511082701.12828-1-quintela@redhat.com>
 <2912b2c8-41c2-4a9d-64ac-b3a05e66028f@yandex-team.ru>
 <87o7mr3wo4.fsf@secure.mitica>
 <3e294e10-12ec-bb00-cf7d-c6b1574fc252@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 11 May 2023 17:48:53 +0200
Message-ID: <87bkiq50nu.fsf@secure.mitica>
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
> On 11.05.23 15:00, Juan Quintela wrote:
>>>> +Now we start with the more interesting cases.  Let start with the
>>>> +same qemu but not the same machine type.
>>> sounds like "different machine type on source and target" for me..
>>>
>>> Maybe, "not latest machine type" ?
>> Now we start with the more interesting cases.  Let start with a the
>> same QEMU process and a different QEMU version machine type.
>> Better?
>
> No)
>
> Neither I have good wording in mind. That doesn't really matter I
> think, so don't worry, meaning is obvious from the context anyway.
>
> I just mean, that for me:
>
> "same" here: source.qemu.version == target.qemu.version
>
> "different" here: source.qemu.machine_type != target.qemu.machine_type
> -- but you don't mean this and this case doesn't work anyway

Ah, I see what you mean know.

>
> What you mean by "different" that machine type is not equal to qemu
> version.. But formally, it's never "equal", actually, latest machine
> type of the qemu version "corresponds" to that qemu version.
>
> Maybe:
>
> "Consider the case with same QEMU version (5.2) but not latest (not 5.2) machine type:"

Now we start with the more interesting cases.  Consider the case where
we have the same QEMU version in both sides (qemu-5.2) but we are using
the latest machine type for that version (pc-5.2) but one of an older
QEMU version, in this case pc-5.1.

Better?

Later, Juan.


