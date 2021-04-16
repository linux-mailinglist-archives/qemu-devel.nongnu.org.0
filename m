Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9F6362333
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 16:58:32 +0200 (CEST)
Received: from localhost ([::1]:53286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXPvT-0008TT-C3
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 10:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lXPtc-0007Uk-9Z
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 10:56:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lXPtZ-0008GO-JQ
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 10:56:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618584991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hYQuDg6idCeaJGB7SqwxevQcv6zo9OAM1x4jMf/7Weo=;
 b=HHKndKV7H/Rlc4qA/jn7yyTKzyjTPMKafZ4LCdI0i5vFc0CR2JQEyV9VbG992BzzyWn12H
 SPc+esUWtms1wmzt+Xo76CTb9kJs2uiGwEI2rarG1MxxXYV+8QXSQVnuhOH27xWOSubOPr
 nLgdbFTrO9k74NI4Zc6MoGMd39M9pCk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-7KDWSJItM76jvRI2Q844pw-1; Fri, 16 Apr 2021 10:56:28 -0400
X-MC-Unique: 7KDWSJItM76jvRI2Q844pw-1
Received: by mail-ed1-f72.google.com with SMTP id
 t11-20020aa7d4cb0000b0290382e868be07so7132610edr.20
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 07:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hYQuDg6idCeaJGB7SqwxevQcv6zo9OAM1x4jMf/7Weo=;
 b=FcKv4aMbPJZyJA8DsS7Z86o+hDIcZK22+t21RlWYvaMJ7yHbY7YrLzhHVPl8T39h22
 pZmFaeDbef4DtfzGo8nO27d94wV2yvVvwp0i4sUNmeGJ5IbpRtD74JwzdkwS2UctoyNK
 4/tpyvs3YLmzHYOH2ikHLsq/rYLkFl5YntqeJTLPG+yOhSPOo6bIYnVfh4c8Qs/Fovfi
 2yow520XA9380XKXOslPjHD2RLtkvh/q9oZVzfPJja1NlMRZLetV5jP57xqJPIwoZ3tY
 hEwtN4R7c59sxJy9wMD6OLaD2QQXCPlOA7QI4giDmhHmE7sbzS0P5y68tyFHSOP0zGHZ
 bcRQ==
X-Gm-Message-State: AOAM533h+Ufm/95aBo2HaNSnpTwGbcmTIePneFo/x/hNZVk8A9i9tWvo
 GWgzPQ+oI6M1M8oXwtvrQxdsm3A3/zBX/SVhLlVjyGMjJ5ZLg5LL7Z43e/mJgRdZKw5lNCO/BcC
 C5qdx5QwwzuidqhFcw8vKSpMvPcBsU9cyGlwrVxUd/v++WfcaGjeMZyw91ZMBaS5dzoc=
X-Received: by 2002:a17:906:40da:: with SMTP id
 a26mr8694870ejk.513.1618584986923; 
 Fri, 16 Apr 2021 07:56:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxwtJ84XP5dJyO3/qagsLzaF1UAJCxuZlv72kj4bUVUy1/iImBAl9soLduZH62ghV4+4T++A==
X-Received: by 2002:a17:906:40da:: with SMTP id
 a26mr8694851ejk.513.1618584986763; 
 Fri, 16 Apr 2021 07:56:26 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id kx3sm4432993ejc.44.2021.04.16.07.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 07:56:26 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] qom: move user_creatable_add_opts logic to vl.c
 and QAPIfy it
To: Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>
References: <20210312173547.1283477-1-pbonzini@redhat.com>
 <20210312173547.1283477-3-pbonzini@redhat.com>
 <f0ea67d8-9641-104d-f8ec-5fc343256cc9@redhat.com>
 <87im4q23v2.fsf@dusky.pond.sub.org>
 <07c08cc3-f3ca-6f7a-e5f7-d2d3ee8de79e@redhat.com>
 <87mtu2wm49.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bd57550a-666a-3d25-b9d3-3baa7bd7b453@redhat.com>
Date: Fri, 16 Apr 2021 16:56:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87mtu2wm49.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/04/21 11:48, Markus Armbruster wrote:
>> Oh, there is qapi/qom.json -- maybe that does the trick.
>>
>> (I have mixed feelings about having to specify the same thing twice at
>> different locations)
> 
> With reason.
> 
> We've talked about generating QOM boilerplate from the QAPI schema, but
> haven't progressed to actual patches.

There is an initial sketch at
https://wiki.qemu.org/Features/QOM-QAPI_integration, covering what can 
be done before touching the code generator.

The basic idea is to keep property getters, which allow to read how an 
object was configured and already vastly reduces the amount of 
boilerplate, and replace the setters with a method that takes a QAPI 
visitor.

Later on the low-level QAPI code can be generated by qapi-gen, similar 
to QMP commands.  However, unlike QMP (where QAPIfication included 
switching from raw QDicts to QAPI structs) here we already start with 
code that uses vistors and QAPI structs.  So it's not like having to 
rewrite things twice.

Paolo


