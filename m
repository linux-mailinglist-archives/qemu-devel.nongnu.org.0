Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B616D7E3D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 15:59:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk3er-0008M7-OP; Wed, 05 Apr 2023 09:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pk3ep-0008JI-L2
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 09:58:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pk3eo-0006kv-4y
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 09:58:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680703116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LqsuXxe/Z5XLffTixEM12s9BbKDHLxTBIOYkq2v0cck=;
 b=WvSoUnlEDkDzcUycfSb44K9vLhvuNygJetFmY30F+PF72hCaF1yze3SVwcczwclS0w7qBR
 Y4VkgFs1yhPDPjwCD9yvr5WPvso231ZtcbVi2zIPYe4FVBQeVVX4Ca0x/ivrlE8glAApsP
 atsW84055aEHIAlK12dm5yAwQzy+S1M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-NC8r7Au6OkmnT_e6dHWOGA-1; Wed, 05 Apr 2023 09:58:34 -0400
X-MC-Unique: NC8r7Au6OkmnT_e6dHWOGA-1
Received: by mail-wm1-f71.google.com with SMTP id
 o7-20020a05600c4fc700b003edf85f6bb1so19186180wmq.3
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 06:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680703113;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LqsuXxe/Z5XLffTixEM12s9BbKDHLxTBIOYkq2v0cck=;
 b=l1URL74B+Wa7Z8zEw1WAoCNL/+EOn4IPVVKt67Dm703KA53Qc82IDZ1oUkbOw36Pk4
 rt0YURjVxr1yUw+TUr370wQTmkFKl3lI1O/HPg3LGI1t4JwSLarH7FKhNBakVJ6J7Gre
 eOQB1kikm5mtpTlHX5e18axOa4yzbc5Rz+2EtI78hNQAZlA25uLJpq0NDOC0pPPutlJk
 n3cyoFdpycM2G7Z9BtNyiu4XyuDX/xYOFcD8f6A4WsIvExBY2DfwQ3L1maWhlfxGC9x6
 OTEQFsjcjYBo/SMk6c+eTz8otTXn7argrDl8eym8TXhct3BRHtP1PITdYHHxIvhIb9/S
 hj0Q==
X-Gm-Message-State: AAQBX9cPpOFthl5/sBVSRYXSh5OSSuRHPterZ427sqxIG7qUw+vBpE2H
 c2ll/FnzKFNC1dawD0rUpO31v+jfWmeK2wQu21PpjDrPa0FCS7NP7+OJGSGNsUMmFu03F3lOlfT
 nDUDeY5LkMdVsQdA=
X-Received: by 2002:a05:600c:2286:b0:3ed:e6c8:f11d with SMTP id
 6-20020a05600c228600b003ede6c8f11dmr4962780wmf.7.1680703113362; 
 Wed, 05 Apr 2023 06:58:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350bkCCH+M6chGhj4ie6beqrlImZ4bvyvGOAbCBFQ1kZ4saVboM5sfZzsv9qqopM5CuSp5HYxvw==
X-Received: by 2002:a05:600c:2286:b0:3ed:e6c8:f11d with SMTP id
 6-20020a05600c228600b003ede6c8f11dmr4962757wmf.7.1680703113054; 
 Wed, 05 Apr 2023 06:58:33 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:d00:ca74:d9ea:11e0:dfb?
 (p200300cbc7030d00ca74d9ea11e00dfb.dip0.t-ipconnect.de.
 [2003:cb:c703:d00:ca74:d9ea:11e0:dfb])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a5d5953000000b002e6a1bf2162sm13091653wri.16.2023.04.05.06.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 06:58:32 -0700 (PDT)
Message-ID: <9930c066-44bf-9365-9c68-aa5ff505c9ba@redhat.com>
Date: Wed, 5 Apr 2023 15:58:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5] hostmem-file: add offset option
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, Alexander Graf <graf@amazon.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Eric Blake <eblake@redhat.com>,
 Philippe Mathieu-Daude <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20230403221421.60877-1-graf@amazon.com> <ZCw16TyJf1iOS/1T@x1n>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <ZCw16TyJf1iOS/1T@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.355, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 04.04.23 16:36, Peter Xu wrote:
> On Mon, Apr 03, 2023 at 10:14:21PM +0000, Alexander Graf wrote:
>> Add an option for hostmem-file to start the memory object at an offset
>> into the target file. This is useful if multiple memory objects reside
>> inside the same target file, such as a device node.
>>
>> In particular, it's useful to map guest memory directly into /dev/mem
>> for experimentation.
>>
>> To make this work consistently, also fix up all places in QEMU that
>> expect fd offsets to be 0.
>>
>> Signed-off-by: Alexander Graf <graf@amazon.com>
> 
> Acked-by: Peter Xu <peterx@redhat.com>
> 
> I also agree it'll be nicer to split the fix into separate patch, though.
> The only affected part IIUC is multi-process QEMU since 6.0.0.  Copying the
> maintainers too so they'll be aware.
> 
> Corresponds to the tag:
> 
> Fixes: ed5d001916 ("multi-process: setup memory manager for remote device")
> 

If there are no options on splitting out the fix, I'll route this via my 
tree.

-- 
Thanks,

David / dhildenb


