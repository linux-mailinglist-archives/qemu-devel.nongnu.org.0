Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F383FD9E7
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 15:01:24 +0200 (CEST)
Received: from localhost ([::1]:47784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPrn-00065A-Np
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 09:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLPhp-0005NH-6V
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:51:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLPhn-0005rH-MT
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:51:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630500662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qUKVhy3DTX3HUn6xlN2hSAUQAG2LA0pXlqtWKW3/UDk=;
 b=Ao/MTv81ZoPZahxunqjyixcdI+uePVacTfMvqK7GxtvhtIcIRio+DehJLyXuA6KYZPwyoR
 XqJrm/+F1xTgD6AsnhowzDXKeSZSPA1Vq38+1xBs7oZtgSyduaN38ofKMV7HfbNGh/COBB
 GlvPsB5pL1j8eEnnMQpPG7B7jHl61fo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-CVGp_ZrYOPaYeetzSQpQUA-1; Wed, 01 Sep 2021 08:51:01 -0400
X-MC-Unique: CVGp_ZrYOPaYeetzSQpQUA-1
Received: by mail-wm1-f71.google.com with SMTP id
 y24-20020a7bcd98000000b002eb50db2b62so984145wmj.5
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 05:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=qUKVhy3DTX3HUn6xlN2hSAUQAG2LA0pXlqtWKW3/UDk=;
 b=TUzg61xi1eCqYfs0hCiPV/PJULutMxa2U2jpS3srvsuPKwavOxYr0hyMOxTkByVDx8
 YvmQtJWTR+NuxptJzLa8VHvqBuHYbjmamZfU2y+P/gcIKETC2E3Wb+zdOFGCPXrBA6Ov
 zccemF2BHMzaEWu5QkBlOrcKGWiVf2hOx63BtAILlk6Fdciocnq/OnjfBjZvi91pthSh
 ipEPPgeA3oAFrVmjZAGHgXFCgSerWFoNwBD45nDkcEPYElmk8lOJs3Ikts5dbbLAOdOi
 SdRIasDbVzdfxh3KAdayUfBOnrc+ZNKNDL7YCxesg4IK+2DUMCKWGqxLlv/QJziVg7CS
 RQig==
X-Gm-Message-State: AOAM533fipoNGx9KWI8EmWsnUwUiBwhB19eVK1YByrJJK4NQEdDfNAcB
 vGhV79bQ0j3XN5iavDUHjC2GXll5wrlglcLFWcekWJlv30FH+YzVhnKCUq+yhUfzF2XGcAE5yvr
 GERvb00WBA+gNrJw=
X-Received: by 2002:a1c:2042:: with SMTP id g63mr9750098wmg.27.1630500659890; 
 Wed, 01 Sep 2021 05:50:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzRG+OEsKYt8sp1zBhvpUa60n9k9Ge5WtLkSU7/UVLcGf4LB1vHTYBlHIqAlG8cNzoG4mjbg==
X-Received: by 2002:a1c:2042:: with SMTP id g63mr9750086wmg.27.1630500659717; 
 Wed, 01 Sep 2021 05:50:59 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 o5sm21041632wrw.17.2021.09.01.05.50.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 05:50:59 -0700 (PDT)
Subject: Re: [PATCH for-6.2 v3 05/12] job: @force parameter for
 job_cancel_sync{,_all}()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210806093859.706464-1-mreitz@redhat.com>
 <20210806093859.706464-6-mreitz@redhat.com>
 <4dab108e-0dd4-955a-7877-73895e388413@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <d0834fbb-dac2-2fa1-e0fe-f44d77834b81@redhat.com>
Date: Wed, 1 Sep 2021 14:50:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4dab108e-0dd4-955a-7877-73895e388413@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.09.21 13:04, Vladimir Sementsov-Ogievskiy wrote:
> 06.08.2021 12:38, Max Reitz wrote:
>> @@ -726,7 +726,7 @@ static void replication_stop(ReplicationState 
>> *rs, bool failover, Error **errp)
>>            * disk, secondary disk in backup_job_completed().
>>            */
>>           if (s->backup_job) {
>> -            job_cancel_sync(&s->backup_job->job);
>> +            job_cancel_sync(&s->backup_job->job, false);
>
> That's not quite correct, as backup is always force cancelled..

Good point.  I think functionally it shouldn’t make a difference, right? 
– but it’s better to be explicit about it and only use force=false where 
it actually makes a difference.

Hanna


