Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94BE458BA4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 10:33:49 +0100 (CET)
Received: from localhost ([::1]:41796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp5hs-0007Ah-Ei
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 04:33:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mp5fV-0005gt-8L
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 04:31:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mp5fQ-0006Dp-Sh
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 04:31:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637573474;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KTOKSkkTjhsjo7MaNXFckHuai+sLd4nuhpoWYqaTDE8=;
 b=LpkLzVJWb/ccBVDZY9LabC8/+9+T8BVebHfWQmqRlzEVsbsvidYnAaZ7N5jccnxdhM5xEb
 xvltBeGPx4jxP6a2CyCKVj70aMzYcOqCtTSSoe+5d6PmRd/YQ9cw9SiKDQ8DFv9b899RiZ
 wKfp+eImvL6AASWo0nn2kbgpPqNT2VQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-jBt48bLVP_aySoRQdRCMOg-1; Mon, 22 Nov 2021 04:31:12 -0500
X-MC-Unique: jBt48bLVP_aySoRQdRCMOg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so6532176wmj.7
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 01:31:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=KTOKSkkTjhsjo7MaNXFckHuai+sLd4nuhpoWYqaTDE8=;
 b=IqrYDMi/SrCtHd26JvrqsZvk/z53rlSs2AeMfFYg9twFyce7gTHGgyaayg1UCW7D5B
 x/zQ9suzr6jU6OrsjGN5pLMiv4hAtSfEdEEqOCR8l+83DoxnXccUnz9y51fpRyxkDHto
 80W3GCCXTxrUPLe8F460txW0MwIYeEornfYFGwtHHLGFVBAFpEy6Ybm0n0dlBWnEpqy2
 Z6OmNou5NXKAbUiHtZZc7AvWNXDMl0vTvI53kuIW67EiqbzDBOjyYPoQHeUOT5BWz5SN
 a4PwWpaSjciHSD+FDqQXU0VEOXj29p2P5B0LzdiQfLSOk3Fr4/iSaycauZSWzsN0UmdJ
 yXTw==
X-Gm-Message-State: AOAM5312N4oSKJnfbc9hIJK357AltHh7hLlCNdB/6Dv6eGrZ4sroRFcJ
 WqvoZ1JceesaNjT2VDL9FFlf4UzVYeedLy8DWew9TTMMQp+kxP7/uZdvb++uInYgVOcYaYZc2hs
 xPMTZ1UUeVtE4P5w=
X-Received: by 2002:a05:600c:1f0e:: with SMTP id
 bd14mr19862038wmb.3.1637573471605; 
 Mon, 22 Nov 2021 01:31:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysc186ciWmLVFHkwywy2gtETN3a5EF0ivgSVAkApT156EtwKEHdD0It6BnNyD6TufjbvDwXQ==
X-Received: by 2002:a05:600c:1f0e:: with SMTP id
 bd14mr19862004wmb.3.1637573471397; 
 Mon, 22 Nov 2021 01:31:11 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id d7sm8133760wrw.87.2021.11.22.01.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 01:31:11 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 06/11] migration: Move iov from pages to params
In-Reply-To: <6977e283-a5d8-75b6-a0a1-c51e0d3b75e0@linaro.org> (Richard
 Henderson's message of "Sat, 20 Nov 2021 13:31:42 +0100")
References: <20211119165903.18813-1-quintela@redhat.com>
 <20211119165903.18813-7-quintela@redhat.com>
 <6977e283-a5d8-75b6-a0a1-c51e0d3b75e0@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 22 Nov 2021 10:31:10 +0100
Message-ID: <87y25gpme9.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> wrote:
> On 11/19/21 5:58 PM, Juan Quintela wrote:
>>   static int nocomp_send_prepare(MultiFDSendParams *p, uint32_t used,
>>                                  Error **errp)
>>   {
>> +    MultiFDPages_t *pages = p->pages;
>> +
>> +    for (int i = 0; i < used; i++) {
>> +        p->iov[p->iovs_used].iov_base = pages->block->host + pages->offset[i];
>> +        p->iov[p->iovs_used].iov_len = qemu_target_page_size();
>> +        p->iovs_used++;
>> +    }
>> +
>>       p->next_packet_size = used * qemu_target_page_size();
>
> Compute qemu_target_page_size once in the function.
> Hoist p->iovs_used to a local variable around the loop.
>
>> @@ -154,7 +162,11 @@ static int nocomp_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
>>                      p->id, flags, MULTIFD_FLAG_NOCOMP);
>>           return -1;
>>       }
>> -    return qio_channel_readv_all(p->c, p->pages->iov, used, errp);
>> +    for (int i = 0; i < p->pages->used; i++) {
>> +        p->iov[i].iov_base = p->pages->block->host + p->pages->offset[i];
>> +        p->iov[i].iov_len = qemu_target_page_size();
>> +    }
>
> Similarly.

Done both.

Thank again, Juan.


