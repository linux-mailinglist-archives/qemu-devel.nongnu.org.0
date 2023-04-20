Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F411E6E9C6D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 21:23:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppZs0-0005Wy-Au; Thu, 20 Apr 2023 15:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppZrz-0005Wq-9v
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 15:23:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppZrx-0005E5-Lm
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 15:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682018579;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2auLrPqkG88XAISYu8sLEKsBK/O0t3q+MXmbaPE3/94=;
 b=NB6s+K84hct3pRDlpjmjScQEu7c7R6NIv62y+6f7u+rRzElu4P0X1iXLL2OriXSjOVdFY1
 1xdcMZRIB05IPxLKnpHXeJPMLBFuFbEIFqy2FrlFiThOBxbOQGCgYqhMWJGJVP7WRSux9Y
 9Ln6RDqXfBr3ucTzKy4YeFLQNH+9kIY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-g79OGzvMN6S5c_0s3stPNQ-1; Thu, 20 Apr 2023 15:22:57 -0400
X-MC-Unique: g79OGzvMN6S5c_0s3stPNQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f080f46fb1so3787355e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 12:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682018577; x=1684610577;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2auLrPqkG88XAISYu8sLEKsBK/O0t3q+MXmbaPE3/94=;
 b=lqV8GvuhbVgScntyBV8lSDBxjY+jduxlSzAH4dC/a872mwaphLmSg2BoJaiYUayIJ4
 9HNAmM2y9hgaR1/UYZg5juJmIWQOAFnWj0nYxTeZUElZH2Dw/SrngS+v0Ppv1Z3MENow
 DES8ZrwG32DMhTg/0SMmERqbjzSQ7pdHdpQWWEfBC/QZkDOf9UNdRyntjO46ZBuf3pE1
 SKKxpx+X+GiAeiwD5efmUU3Hy7BsTVcfwu/SYMXDUXxRevSD7zgV2IVn8qFtpxK+v0RM
 GMuIVY4tduc7I5sd3bjTYkAI454/crPb1dNaiVeIdjGLcfbPlLRjRVpFYm7dslEqgeIu
 rH0g==
X-Gm-Message-State: AAQBX9c3cwAoG5SxmPACtYDjTt4UbpUUvFbARkySEtFCt8HsXeXKn5ey
 GKfxNDN0vCN48JUrf3R73bqA6ojswW9IWJfIabRuoDpWskn8NIkDeJMGIyN0eGcssVmJBLwZ5xo
 HRYjdaKV9Ykij8TU=
X-Received: by 2002:adf:f5c7:0:b0:2f9:ae41:5b07 with SMTP id
 k7-20020adff5c7000000b002f9ae415b07mr2070296wrp.44.1682018576853; 
 Thu, 20 Apr 2023 12:22:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350bTIjx6kQmt4EVOgmLLgHL9A0HAjth9+7r5H5YlcxmVbQHJEmB4gAZJb6Hb/dAOpoa4xZmu2g==
X-Received: by 2002:adf:f5c7:0:b0:2f9:ae41:5b07 with SMTP id
 k7-20020adff5c7000000b002f9ae415b07mr2070270wrp.44.1682018576548; 
 Thu, 20 Apr 2023 12:22:56 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 w9-20020a05600c474900b003f17e37ce60sm6187547wmo.47.2023.04.20.12.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 12:22:55 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org,  Peter Xu <peterx@redhat.com>,  =?utf-8?Q?Marc-?=
 =?utf-8?Q?Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>,  Fam Zheng <fam@euphon.net>,  Hailiang
 Zhang <zhanghailiang@xfusion.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org,  Gerd Hoffmann <kraxel@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  Leonardo Bras
 <leobras@redhat.com>,  Markus Armbruster <armbru@redhat.com>,  Stefan
 Hajnoczi <stefanha@redhat.com>,  Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 03/43] migration: Create migration_cap_set()
In-Reply-To: <87o7ni8kbp.fsf@suse.de> (Fabiano Rosas's message of "Thu, 20 Apr
 2023 15:44:42 -0300")
References: <20230420134002.29531-1-quintela@redhat.com>
 <20230420134002.29531-4-quintela@redhat.com> <87o7ni8kbp.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 21:22:55 +0200
Message-ID: <87a5z2we7k.fsf@secure.mitica>
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

Fabiano Rosas <farosas@suse.de> wrote:
> Juan Quintela <quintela@redhat.com> writes:
>
>> And remove the convoluted use of qmp_migrate_set_capabilities() to
>> enable disable MIGRATION_CAPABILITY_BLOCK.
>>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/migration.c | 34 ++++++++++++++++------------------
>>  1 file changed, 16 insertions(+), 18 deletions(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 74f28cdca6..4bf5df4778 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -1913,25 +1913,24 @@ void migrate_set_state(int *state, int old_state, int new_state)
>>      }
>>  }
>>  
>> -static MigrationCapabilityStatus *migrate_cap_add(MigrationCapability index,
>> -                                                  bool state)
>> +static bool migrate_cap_set(int cap, bool value, Error **errp)
>
> Just a nit, the commit message says migration_cap_set.

Good catch. Fixed.

> Reviewed-by: Fabiano Rosas <farosas@suse.de>

Thanks.


