Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C334389716
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:53:49 +0200 (CEST)
Received: from localhost ([::1]:53482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljSGK-0003aP-7I
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljS3d-0005nf-ST
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:40:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljS3a-0001hi-31
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:40:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621453235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XNNFitmQukr6KREaaFu1A25c34+1+Lle815efBcVMrM=;
 b=ZjwKEanHRn9i/03KRF7fYnchLABnbVwsaxCvITZaDijqlPoy3tER+c02JFZO3QXnsz+Bog
 BvrLOLyl3NMu0ZDLTEs8kzKV/eRS69J80wtI/ciBi+H2KoPWMh0PTApQ0lbgWlykHnbXkI
 ZyjGqNzB3Nt0gQsyZigoIP2U7u9H1nE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-E8n6VVGkPoi7zwN3KdZVLA-1; Wed, 19 May 2021 15:40:33 -0400
X-MC-Unique: E8n6VVGkPoi7zwN3KdZVLA-1
Received: by mail-wr1-f72.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso7590512wrh.12
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 12:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XNNFitmQukr6KREaaFu1A25c34+1+Lle815efBcVMrM=;
 b=LIneO8sHC56TYqhEcZCs2FczT/J8uKb5GMQXb/nqJGcaPEZMzwqdKmFrsoPuX4DVyN
 5efy924fJyajllGj6UDQdmUA4GpjqXMqnkCVh0uQjXQE/7YzBp6zaLae2NuFJDdcfrMh
 eEvDvET8+pg4G2TF3rp5O6f3DvicKkxkybc4/JnmJP8/zdvFx4YLVYHTsMQi9ao/ILQA
 O3VHz3jWEeYOp1YenBoIbW4iG5uIuN9suyGFec92MEqi66pc3ce7Sif+oyyfhKbECAXs
 iDmgstCivXvbv8tKNrOQMVYp9xURSb79fgehwPfuNFTHffRvVaA4lCdLOXS5+3HmU76w
 xBwA==
X-Gm-Message-State: AOAM53358kufAFgIFUQXpwMeERoAJBxTR5OtoWJDHSduzVmbmZwWs1q7
 OTRw/fIMhq0mge5/QBtAY/Unc17uI5eE3A45QKswkA42mVoLLAXxUneqXlZNVVICLpZjTCsv6D3
 oioZQO1LYcgJcOj8=
X-Received: by 2002:a5d:670c:: with SMTP id o12mr512588wru.223.1621453232725; 
 Wed, 19 May 2021 12:40:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzeuLAxvWpu/bZn8mJuwHIOc6FPAQJk/rx+x1aXlh086Jo9C52rIph2+ro/8qbb1PhsDrrfw==
X-Received: by 2002:a5d:670c:: with SMTP id o12mr512574wru.223.1621453232547; 
 Wed, 19 May 2021 12:40:32 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id q186sm354659wme.20.2021.05.19.12.40.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 12:40:32 -0700 (PDT)
Subject: Re: [RFC PATCH 00/25] exec: Add load/store API for aligned pointers
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210518183655.1711377-1-philmd@redhat.com>
 <c4f5ae75-b0a6-7d70-b563-c30ad2415ae4@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7365be66-48b6-1484-7f96-32cafb1651a7@redhat.com>
Date: Wed, 19 May 2021 21:40:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c4f5ae75-b0a6-7d70-b563-c30ad2415ae4@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 9:20 PM, Richard Henderson wrote:
> On 5/18/21 1:36 PM, Philippe Mathieu-Daudé wrote:
>> The series is decomposed as:
>> - cleanups (1-6)
>> - clean ldst API using macros (7-13)
>> - add aligned ldst methods (14)
>> - add aligned memory methods (15-16)
>> - similar changes in virtio (17-24)
>> - use the new methods on vring aligned values (25)
>>
>> There are some checkpatch errors related to the macro used.
> 
> I think we should emphasize the atomicness of the access as opposed to
> the alignedness.  That's the only thing that's important to virtio.
> 
> Thus s/aligned/atomic/g and use qatomic_read/qatomic_set.

OK.

Do you think patches 1-6, 17 (Use correct type sizes) could
go in meanwhile, or should I repost them separately?


