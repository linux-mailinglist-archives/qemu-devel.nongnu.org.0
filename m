Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79AD6EFB40
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 21:42:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prl0j-0004xd-JQ; Wed, 26 Apr 2023 15:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prl0h-0004x0-LB
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:41:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prl0f-0000A9-Nq
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682538060;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=sDFklaXk/CmEsuenWgVn5ttNWFkue6K2KMHX5GavEP0=;
 b=YcHNubzpFh3O5YsG4+me/rGBD1lFz1ms+bmh3YDtFeW8yyPYPORyAEZE5MoL4DeXPipMMl
 4wiw7Pd45vnOHkTXBZjDi1ffutKNAmzhnY8ba3mxWWA2WxHFrOMl/spaOIvglEBxuBg2Wp
 KAztdDqTuZN9IH1vEH6u3kSyRcB0MFI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-hpKA6BNFOk2mc8484kIkCw-1; Wed, 26 Apr 2023 15:40:59 -0400
X-MC-Unique: hpKA6BNFOk2mc8484kIkCw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30467a7020eso3419537f8f.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 12:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682538058; x=1685130058;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sDFklaXk/CmEsuenWgVn5ttNWFkue6K2KMHX5GavEP0=;
 b=klORvLkY2Wkduuh/+cBtUcycXKnfpQvHNj/w5qHDMxMtEhoeFgYqgf6oQk3WqrG0qE
 eQ3iO1+KPX8Jbnq67LjWjdJFNjB4+PV5nMEHcYljbph68SqQV8XIyJVjy2e20HeNfdak
 +TA2N+bbUDcgWoVcxoeL8aeeXKa/j4e/HIjqiFG95nUS/nIidMlQ444QBew/oOB4eZyn
 GPup+8iJLf/y36cuDkoH2GAli9ev/kvM/6Q0OW8DeEATKgn6hH6S4VEnWCk5LCDfcTQU
 iVKcvQ5cfsk8eWcNaH6CXTCz1Waked5akaGgzSZFHNEJxUw4TI9Yfx/GXIXlHrDo1fCo
 zbaw==
X-Gm-Message-State: AAQBX9dZ8VGVI4JCzUEQG/UYjdXWIhRAHLzgPNDNLvPIvCT9o+RPOWRI
 uUndIo+9yucFTfr8SRFpbNXyOMwkSeT9c0p8tzQS3djeM3QDY71L6fVCXYBquT9pCre7Z6aHi4L
 3/NA/WIjW7iuCkE4=
X-Received: by 2002:adf:efc2:0:b0:2ef:4bea:b032 with SMTP id
 i2-20020adfefc2000000b002ef4beab032mr15126218wrp.64.1682538058169; 
 Wed, 26 Apr 2023 12:40:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z/7Q6yH0iBMItiwXnQial93jfzOn0UUoaVnzzZITZHq1K1r6H6aiLXUfD2gfcIcYN7233Z2g==
X-Received: by 2002:adf:efc2:0:b0:2ef:4bea:b032 with SMTP id
 i2-20020adfefc2000000b002ef4beab032mr15126212wrp.64.1682538057842; 
 Wed, 26 Apr 2023 12:40:57 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 iv18-20020a05600c549200b003f17b91c3adsm22691420wmb.28.2023.04.26.12.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 12:40:56 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>,  Stefan
 Hajnoczi <stefanha@redhat.com>,  Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org,  Peter Xu <peterx@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 09/13] migration: Create migrate_tls_creds() function
In-Reply-To: <75f595ed-39a2-446f-d1d1-83fba1e294ca@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 26 Apr 2023 21:55:14 +0300")
References: <20230424183236.74561-1-quintela@redhat.com>
 <20230424183236.74561-10-quintela@redhat.com>
 <75f595ed-39a2-446f-d1d1-83fba1e294ca@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 26 Apr 2023 21:40:54 +0200
Message-ID: <877ctye8jd.fsf@secure.mitica>
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
> On 24.04.23 21:32, Juan Quintela wrote:
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

> could be stricter "const char *"

I change changed the patch just to reflect this.

>
>> @@ -34,20 +34,19 @@ migration_tls_get_creds(MigrationState *s,
>>                           Error **errp)
>
> "s" argument becomes unused, may be dropped.

Good catch!

I created the patches for this, will send after I send the PULL request.

Thanks, Juan.


