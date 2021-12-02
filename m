Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F7246694C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:41:18 +0100 (CET)
Received: from localhost ([::1]:59116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msq57-0005QE-DA
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:41:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1msq2a-0003kJ-3g
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 12:38:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1msq2S-0008OD-Ba
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 12:38:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638466711;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8+m6sE5xxlcs/k3TODGqEDkBdKQwnFcsv4OnZLqL9Eg=;
 b=WvDfUO9vZGoIJXUFTkYbVoLZUvh+NS2FYmDrTH4utgzPKdGbnSGo+liPuX93YwQ84iMG33
 /xnt3Yk/8iw+T6bXzkj/+WVThTBKF7FbY/aR858x9yUyZb6YoHavBaj3u5lA3NBlFiPEwP
 SuvufugeYLRMzPtUwYLpq7yMocGvk0E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-w2wLb2YJNy-HP27Oo-1VnA-1; Thu, 02 Dec 2021 12:38:30 -0500
X-MC-Unique: w2wLb2YJNy-HP27Oo-1VnA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so138729wms.8
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 09:38:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=8+m6sE5xxlcs/k3TODGqEDkBdKQwnFcsv4OnZLqL9Eg=;
 b=PAu+y4Gx+Xgw0dLxl//6PX2aBRzEVcYVMXto3xziGMjf2qhD1unEAm9PkTso1dFfaM
 EnMg+AiRnxIdI+Gw9vDcNGktby1kdApUtnP5HjfOOVk7D9rFQZHiQ4ZAnsWzSj/BoWXS
 7qkJBDQVu1kg8mpaL/6www05FKOHgSyn1TleRWcGon/CPbMqMRviKVRJgND/xxdt+ugK
 352g+c83W7ha12oZsVKmeFcOLGGgnvqzTqFfIfAOe0QX3YvgrDZfA95wKjVhnYHAE3II
 LPS1HTt2uu0D/BkE5oG7BrdTGwPgxbwR1WQypV6C7TsPcLukASpUeDLY3kZOK8/OUsw0
 gd2Q==
X-Gm-Message-State: AOAM531JfqIjta4VSEPdzcl8kU/XrE9Gd7GuNnAKnboE2Jh3QRayUCaF
 pG5h1K0lFTK6cZ0UZxxRcAB5DGaAus3ZeEvN6P9tYdAh1kYwbMObavJO0V/A9ag3WBfP7XEdKwU
 YWDC7MVV/z4CZSwI=
X-Received: by 2002:adf:ab53:: with SMTP id r19mr16033786wrc.584.1638466708911; 
 Thu, 02 Dec 2021 09:38:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxAPmwctsVGURw5E/idODhgA3lHu6dZ3NxhAJnRsdceGZ4ls4JgyFxP8D9PLKpvCo2GR+gcQ==
X-Received: by 2002:adf:ab53:: with SMTP id r19mr16033760wrc.584.1638466708691; 
 Thu, 02 Dec 2021 09:38:28 -0800 (PST)
Received: from localhost (static-58-87-86-188.ipcom.comunitel.net.
 [188.86.87.58])
 by smtp.gmail.com with ESMTPSA id o12sm390630wmq.12.2021.12.02.09.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 09:38:28 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 23/23] migration: Use multifd before we check for the
 zero page
In-Reply-To: <Yaj+V6LstcnNERaZ@work-vm> (David Alan Gilbert's message of "Thu, 
 2 Dec 2021 17:11:51 +0000")
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-24-quintela@redhat.com>
 <Yaj+V6LstcnNERaZ@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 02 Dec 2021 18:38:27 +0100
Message-ID: <87fsragb58.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> So we use multifd to transmit zero pages.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/ram.c | 22 +++++++++++-----------
>>  1 file changed, 11 insertions(+), 11 deletions(-)
>> 
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 57efa67f20..3ae094f653 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -2138,6 +2138,17 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
>>      ram_addr_t offset = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
>>      int res;
>>  
>> +    /*
>> +     * Do not use multifd for:
>> +     * 1. Compression as the first page in the new block should be posted out
>> +     *    before sending the compressed page
>> +     * 2. In postcopy as one whole host page should be placed
>> +     */
>> +    if (!save_page_use_compression(rs) && migrate_use_multifd()
>> +        && !migration_in_postcopy()) {
>> +        return ram_save_multifd_page(rs, block, offset);
>> +    }
>> +
>>      if (control_save_page(rs, block, offset, &res)) {
>>          return res;
>>      }
>
> Although I don't think it currently matters, I think that should be
> after the control_save_page.

This needs to be improved to be compatible with old versions.

But .... if we don't care about RDMA, why do we care about
control_save_page()?

Later, Juan.


