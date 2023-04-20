Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7512E6E9551
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:03:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTwE-0005AS-7H; Thu, 20 Apr 2023 09:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppTwC-00058V-AO
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:03:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppTwA-0007Ay-Nb
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681995777;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=aCHmdNmMrAh6+/i4gH6g+uHpdwB8i9xdo/NCakZBcQY=;
 b=VAQCS4aZ8L/I+3M+JwtvT5Pb2TBAZ7XgaSwWXcEjm6EupB/bxPH/cbCBvkRUfFobnb2Z6B
 +pgL3ciis+tQrzRRmu23Ip2VYp/J+G8x+r7Zb+ew3T0LXDeT9p1xipZ/1NimhKoxHNlYov
 qAGM5A5jikav6AmxniQKUBS9X/Ra9Hg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-SFZwIOYlN26wrTv0cjDygA-1; Thu, 20 Apr 2023 09:02:53 -0400
X-MC-Unique: SFZwIOYlN26wrTv0cjDygA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f080f53d62so2502975e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 06:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681995758; x=1684587758;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aCHmdNmMrAh6+/i4gH6g+uHpdwB8i9xdo/NCakZBcQY=;
 b=gFAoD2+1+vWrfTTkN6jBNRkkbX9KDdxXf8/cmLqTewdwLZUEnHK3VCYHzrBPIriDpU
 eUz80eXfgYu/LKuThmQamatB39S5P+KAA8AIgMaNq1fAsvQQLJL+DTvCJ7nl9AHBLxAq
 +RGJn+dlpQbHsgzlHv96fhP3TDZXY+G616ieW/sPhPhM4wkFHCVGVoBRJaJnSPYR4vi+
 +9yYDMklebIg8/E2mUujgLQECkqKUauGbwaX2q6hUPuzfw+yVG+UkMpgHFjgIiz6xtZ+
 C6dPOVym5Nhd8GDn+IkdAfX7Fq0utu1jCYCRXU7seaZ0aW8Mrz1hg8zIXkYNIjQxNW7h
 xdzA==
X-Gm-Message-State: AAQBX9foFovFttdpsq4nXMok1LAADBxld3a4j9fdpfq9rbA7IzxR9PZG
 9vdXtz36a0zGuCunaadhVwnAhI/Tqy+t9G/9PIFLzoDyq+VCfI1w1cPDuCC4HWEvYgmtRnZGUhR
 HZAdQtIxmBBC2HrE=
X-Received: by 2002:a5d:428f:0:b0:2d4:751d:675b with SMTP id
 k15-20020a5d428f000000b002d4751d675bmr1242829wrq.35.1681995757987; 
 Thu, 20 Apr 2023 06:02:37 -0700 (PDT)
X-Google-Smtp-Source: AKy350aNx5+v6Isie7Eou0OGx7uLKkiJn65AucQ9MjRO/VuaGxLuCA+2LhYEJtldSat3jBMWUXab1Q==
X-Received: by 2002:a5d:428f:0:b0:2d4:751d:675b with SMTP id
 k15-20020a5d428f000000b002d4751d675bmr1242797wrq.35.1681995757655; 
 Thu, 20 Apr 2023 06:02:37 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 d13-20020adfe88d000000b002e55cc69169sm1929650wrm.38.2023.04.20.06.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 06:02:37 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org,  David Hildenbrand <david@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  John Snow
 <jsnow@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org,  Hailiang Zhang <zhanghailiang@xfusion.com>,  Fam
 Zheng <fam@euphon.net>,  "Michael S. Tsirkin" <mst@redhat.com>,  Eric
 Blake <eblake@redhat.com>
Subject: Re: [PATCH 04/43] migration: create options.c
In-Reply-To: <ZAhZbln8FjR6e6Rj@work-vm> (David Alan Gilbert's message of "Wed, 
 8 Mar 2023 09:46:22 +0000")
References: <20230302163410.11399-1-quintela@redhat.com>
 <20230302163410.11399-5-quintela@redhat.com>
 <ZAhZbln8FjR6e6Rj@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 15:02:36 +0200
Message-ID: <87sfcuwvtf.fsf@secure.mitica>
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

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> We move there all capabilities helpers from migration.c.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>

>> --- /dev/null
>> +++ b/migration/options.h
>> @@ -0,0 +1,34 @@
>> +/*
>> + * QEMU migration options
>> + *
>> + * Copyright IBM, Corp. 2008
>> + *
>> + * Authors:
>> + *  Anthony Liguori   <aliguori@us.ibm.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>> + * the COPYING file in the top-level directory.
>> + *
>> + * Contributions after 2012-01-13 are licensed under the terms of the
>> + * GNU GPL, version 2 or (at your option) any later version.
>
> I don't think any of these functions were written by Anthony, and I

I investigated, and the creator of enabled_capabilities is:

commit bbf6da32b5bd32018069e4eaeda59a02855903f2
Author: Orit Wasserman <owasserm@redhat.com>
Date:   Mon Aug 6 21:42:47 2012 +0300

    Add migration capabilities


> think they're all after 2012 aren't they?

We are ... by 8 months O:-)

> If so we can update to a more modern header.

/*
 * QEMU migration capabilities
 *
 * Copyright (c) 2012-2023 Red Hat Inc
 *
 * Authors:
 *   Orit Wasserman <owasserm@redhat.com>
 *   Juan Quintela <quintela@redhat.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2 or later.
 * See the COPYING file in the top-level directory.
 */

I put Orit and myself. Peter Xu has also done quite a bit of work here.
Rest of people have just added capabilities for its stuff.

But if anyone feel that they need/want to be added, just ask.

> Other than that,

Thanks, Juan.

>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


