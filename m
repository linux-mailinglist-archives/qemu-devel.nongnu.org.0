Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC63D6F13A3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 10:55:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psJrm-0006bb-V9; Fri, 28 Apr 2023 04:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psJra-0006XI-9L
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:53:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psJrY-0007NA-Er
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682672035;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1FYu6Uizlvkgfi1EPZynQ8R3KzR+iW2zORnGQ1t5REE=;
 b=Z6wqx9Xedy9DWTyKXK65d/bRIGuJV8Xdff05sgYH5medVTT2Tg2AB7ea7zvZHEROT2QnHk
 H0F7WLwxovd3maMFn2ZaCfJaSFqPLjKltlcawjG7b2VBYY+ME9jtCSUU6IrzZH6e7N7SRB
 2P5ZlzveD8kioKZr3kfY4jIaVjsPwoE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-s4JD7KhqMHSaJy1NHnR7Rw-1; Fri, 28 Apr 2023 04:53:53 -0400
X-MC-Unique: s4JD7KhqMHSaJy1NHnR7Rw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f250e9e090so21454715e9.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 01:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682672032; x=1685264032;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1FYu6Uizlvkgfi1EPZynQ8R3KzR+iW2zORnGQ1t5REE=;
 b=ZvPPjQ+X/AZMfzxWN5BO+BdT5RyLHBMeRbWlq3LROmqg2rdD4RNvzBlg4mSAufkZ81
 NOPo4tuHF+9OFM73IX535Sq0cK4DvCxsJ6TKrco2jrJImX3NlOk1e+HNnKNKJPiv1LJw
 iRVB2UuiqFWT9Ie6qs8tAqtLcUDGBmUWguCEDWmo1KN2sxeWrL8v6N0CI64bxlgz7XtW
 bJsgz61RVOfsDPxgPs6FyP6E4ItoFTg0tlNKLCEvNIXzxnWctK6O24SHyGfD2P+TZOH3
 02N9vbdeHKCwGKDJ5ERzjItie+Bi7rmBzHGbJ74/krfPeeO40tlA2m02tIkZTdxZZbhU
 ofRw==
X-Gm-Message-State: AC+VfDxckVyh0TBkt/KMmuC5w38ir0zspgRVN5jyln+/re+g0jKhXXaz
 28g4kDku74jA7I0Mfsc07RqCMsFOduBTrwR5jrOKBWwXVkPWekB+K6E8AALZwN3w2cjNCoKkAfk
 9BtXEwO93Vvd2NwQ=
X-Received: by 2002:adf:ec04:0:b0:2f9:a798:602c with SMTP id
 x4-20020adfec04000000b002f9a798602cmr2966886wrn.12.1682672032264; 
 Fri, 28 Apr 2023 01:53:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6t9hOQfLUUBYJtw2317iHq5Z5wpuni+MdDHBBkqRV/az3CE+DncuJjDyyB4DUqBANkX9jz4w==
X-Received: by 2002:adf:ec04:0:b0:2f9:a798:602c with SMTP id
 x4-20020adfec04000000b002f9a798602cmr2966862wrn.12.1682672031968; 
 Fri, 28 Apr 2023 01:53:51 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm20589722wrp.59.2023.04.28.01.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 01:53:51 -0700 (PDT)
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
Date: Fri, 28 Apr 2023 10:53:50 +0200
Message-ID: <87y1mc9yld.fsf@secure.mitica>
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


