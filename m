Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6513E23C9
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 09:13:04 +0200 (CEST)
Received: from localhost ([::1]:33560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBu2R-0004YB-GV
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 03:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBu10-0003eL-Qk
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:11:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBu0y-0006KI-9E
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:11:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628233891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HPM9OI+DzabABc13yHHWjHcCGI2Xi4wnB8ymY07vJ+g=;
 b=LWUaO4mr38xSbstIVZlKs+J7X8veObgW837jx0ReiOLldjdKfo8lGQbI2O/LU5nmiQw/5t
 tYVoWL5EyxozRu7MqPqWnko/mmsMihHTOiSlGhZa6olstsWuaaZH/y/n0FyPop7Tdpjf/e
 nGVtWz6OnWnSX+C11SnLYuV9oLXoxdY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-iQ4-mdpXNqqWDahrw2Z02w-1; Fri, 06 Aug 2021 03:11:30 -0400
X-MC-Unique: iQ4-mdpXNqqWDahrw2Z02w-1
Received: by mail-wm1-f69.google.com with SMTP id
 f6-20020a05600c1546b029025af999e04dso1699725wmg.7
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 00:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HPM9OI+DzabABc13yHHWjHcCGI2Xi4wnB8ymY07vJ+g=;
 b=Ysi18FPcEOKok/ScVj6ixUFBvNvVGiSkSzrYnEvMHzWVnm7gPL8gPX7DWVqrKeP7/Q
 rAEeamxkk74n6xGMQv9AvYpoqkVGFWsLnFBJWte+9UCQmrxVlOZyJOuV3ArvS1sGJD5z
 RWin1YZJLNZk17+EZXHxy4QXTr1H+hnMuITs8RuBeXKUDHGg0oqNyip1M56IaMA3KFNv
 EC+Q8nJxUkUPrgly7acZXnI8NEVcUiUYfTBEtue3TX37gtI7+COx2hg8w74VOU3gumYR
 S2Bg0vuVszAQMzJzLhtHsRWkD+mqTxd8vvtjFDk02C/ZiWmRTtW/7OppnmiHVacM40Qx
 b49A==
X-Gm-Message-State: AOAM530toPjfT9oE3dD0bDHPpGne3Se7QV89wX0nXg9Ni5mwbFxmtiuU
 kYUmdkdkjk7O0ECgwbn1fNqicMQ00xuUDvMi8/RZSgdJPXPzhCERlQIw+48j/RMkJjYOKKC/va+
 JxInkdgTa8BxB05I=
X-Received: by 2002:adf:ed4f:: with SMTP id u15mr8824057wro.423.1628233889137; 
 Fri, 06 Aug 2021 00:11:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyamkeB9HITUX6KUlKRiMPL9gjGcy9O8k1ZnLWUIC4U/kZFIJgPiATWMUbgPHDqUonWrqNvaQ==
X-Received: by 2002:adf:ed4f:: with SMTP id u15mr8824045wro.423.1628233889017; 
 Fri, 06 Aug 2021 00:11:29 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id a2sm8567559wrn.95.2021.08.06.00.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 00:11:28 -0700 (PDT)
Subject: Re: [PATCH v1 03/12] s390x/tcg: convert real to absolute address for
 RRBE, SSKE and ISKE
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-4-david@redhat.com>
 <33c1f057-fd79-d15f-e8d5-2d261fbd1255@redhat.com>
 <c5a589ad-f3ee-b0fe-1bcd-318989e3a23a@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2806b81b-4e80-6f85-5f0a-ce78bb6ee3c0@redhat.com>
Date: Fri, 6 Aug 2021 09:11:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <c5a589ad-f3ee-b0fe-1bcd-318989e3a23a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/08/2021 08.52, David Hildenbrand wrote:
>>
>> According to the PoP:
>>
>> "When the enhanced-DAT facility 1 is not installed, or
>>    when the facility is installed but the multiple-block
>>    control is zero, general register R 2 contains a real
>>    address. When the enhanced-DAT facility 1 is
>>    installed and the multiple-block control is one, gen-
>>    eral register R 2 contains an absolute address."
>>
>> Don't we have to take that into consideration here, too?
> 
> We don't support EDAT1 a.k.a. huge pages yet. If we ever do, we have to 
> further extend this code.

Ok, then maybe add a comment or assert() to make sure that we don't forget?

  Thomas


