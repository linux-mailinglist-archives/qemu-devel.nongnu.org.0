Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BAE6F13A4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 10:55:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psJrn-0006cF-QA; Fri, 28 Apr 2023 04:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psJrk-0006a6-2v
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:54:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psJri-0007OO-NU
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682672045;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1FYu6Uizlvkgfi1EPZynQ8R3KzR+iW2zORnGQ1t5REE=;
 b=OqYRH6OrrpDV2S6kKPQZI5g43qBz8nu3Pfxsejj2BMH3RcfxRlpb1NURp6+JTTYIo2lHH4
 6RZOWDSJ+4XeHdkTXYucS8wUMdrKsPaPDLaJJzOPxTi3mEmiCyzNURZtlkqJ1HmQlmVDdo
 Gblon9sU0BSqUUvxoCnz7lbUx6yVFjU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-AsVGTWH6PXaG-rqkr5vFuQ-1; Fri, 28 Apr 2023 04:54:04 -0400
X-MC-Unique: AsVGTWH6PXaG-rqkr5vFuQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f08901fed3so59341875e9.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 01:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682672043; x=1685264043;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1FYu6Uizlvkgfi1EPZynQ8R3KzR+iW2zORnGQ1t5REE=;
 b=Sq0oQYe1UfxRoFNhgY+BJtL/46rZtaCj4Dqk7BWsyQfvRplZS42QF0kRpa/YdjF5sH
 iKdYk5unOeqdRtX2nIcq0KzgawBvHl2+htgfMgG00ITIBnXyb6BSjEFl3na+XMgNbJNx
 +MzWPHaZ+bTKbGxHAid9hmlHOIzjaWeUJZrOnpjFUq5ItRGenXUJHoqxmTDeIeDN8AkX
 c18XhVxyH4zIRtgzK5OPpRBkjL/M2OPnDCVz34UyZBZU3UjZ7tSwh/Z5MRU1lJzhtyIz
 NJZUSP51/BU8V8VkmZ2zXLj0TpSuhRGGIK3lTuVSMBLzQq354GPicuype4lU8E8wATvN
 psFQ==
X-Gm-Message-State: AC+VfDx66Hofna5WQa/raQeYC5A6xAhvfGIRz1G1WLOouTOxXlgM47Pn
 gmpiLq1e5mrFyZXuKMgqJtkk3MXf24jNEGsJNjokSx+1wqQo0CLBkcdZBRbpXriMsGjRRhVqPBc
 HYccgsO4oNo6wIow=
X-Received: by 2002:a7b:c4da:0:b0:3f1:8aaa:c212 with SMTP id
 g26-20020a7bc4da000000b003f18aaac212mr3568311wmk.33.1682672043373; 
 Fri, 28 Apr 2023 01:54:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7xVSpk7E4ADijyerL7kXqbSxGeHYEnpoCez9nokYT2Zcc0dLKqkCOkS8J/rAYOL17uLECgdg==
X-Received: by 2002:a7b:c4da:0:b0:3f1:8aaa:c212 with SMTP id
 g26-20020a7bc4da000000b003f18aaac212mr3568291wmk.33.1682672043039; 
 Fri, 28 Apr 2023 01:54:03 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 ay37-20020a05600c1e2500b003f18b52c73asm23438598wmb.24.2023.04.28.01.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 01:54:02 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  michael.roth@amd.com,
 armbru@redhat.com,  eblake@redhat.com,  jasowang@redhat.com,
 zhanghailiang@xfusion.com,  philmd@linaro.org,  thuth@redhat.com,
 berrange@redhat.com,  marcandre.lureau@redhat.com,  pbonzini@redhat.com,
 dave@treblig.org,  hreitz@redhat.com,  kwolf@redhat.com,
 chen.zhang@intel.com,  lizhijian@fujitsu.com,  lukasstraub2@web.de
Subject: Re: [PATCH v3 4/4] configure: add --disable-colo-proxy option
In-Reply-To: <570bb94d-ed84-72dc-be94-450a9ee5389a@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 28 Apr 2023 11:30:09 +0300")
References: <20230427202946.1007276-1-vsementsov@yandex-team.ru>
 <20230427202946.1007276-5-vsementsov@yandex-team.ru>
 <87ildgbgv9.fsf@secure.mitica>
 <570bb94d-ed84-72dc-be94-450a9ee5389a@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 10:54:01 +0200
Message-ID: <87wn1w9yl2.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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
> On 28.04.23 10:33, Juan Quintela wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
>>> Add option to not build filter-mirror, filter-rewriter and
>>> colo-compare when they are not needed.
>>>
>>> There could be more agile configuration, for example add separate
>>> options for each filter, but that may be done in future on demand. The
>>> aim of this patch is to make possible to disable the whole COLO Proxy
>>> subsystem.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> As you have arrived to an agreement about what to do with
>> filter-rewriter, the rest of the patch is ok with me.
>
> You mean filter-mirror, precisely this change to the patch:
>
>  @@ -22,7 +22,7 @@ if get_option('replication').allowed() or \
>   endif
>     if get_option('colo_proxy').allowed()
>  -  softmmu_ss.add(files('filter-mirror.c', 'filter-rewriter.c'))
>  +  softmmu_ss.add(files('filter-rewriter.c'))
>   endif
>     softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
>
> ?

Oops, yes.

>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>> 


