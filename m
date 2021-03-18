Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECF5340BF7
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:38:08 +0100 (CET)
Received: from localhost ([::1]:59208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwb1-0007iJ-Go
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMwXT-0005b8-IE
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:34:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMwXS-0002Ld-1i
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616088863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9QAKW9oNdJebagLmySRxHWHbmseo+DRoz33ElRoddqQ=;
 b=Bo8wOutCZvvMOvK2k4NsxlnFiXen4O8v9uaJ7Nb5NweTRAG4oeQdOG100E5fuiGnwUeN9q
 WsUW9ZDNn7Jx7kU8cLNuxuEvXTeo5fCMjClZW2Rv/jQ0gYYKqNRtjuQ0nk1x1liJuUkHTD
 6XhgOp5yWMjxsg2MQ7eRaU/Q/IZzS8U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-f4IG_B0RNIa43C53n_cpxg-1; Thu, 18 Mar 2021 13:34:19 -0400
X-MC-Unique: f4IG_B0RNIa43C53n_cpxg-1
Received: by mail-wr1-f70.google.com with SMTP id r12so20476592wro.15
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 10:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9QAKW9oNdJebagLmySRxHWHbmseo+DRoz33ElRoddqQ=;
 b=aNUCX/8qY7r76lPbxGC76Q6S9wEcW4ush1HqZKVUs5I2Ku8F16i1q4nplxIfjo4c9c
 FTEz6pCJUtox9q6zi4s+x5XGOKPfyNh6koIm0+82veB9tJRSyTaUt+n3BICoc7+2b26l
 KdisZZbLYqo4SKZW4dmYl/sWwKDHF0aEqppojKqjPVPP2rEpstcItP0zSAAtTjR77G/N
 l7jr3PErKixEWi200tshiyyYwUrsEuu981sFh7fc5kxGok1O0eVa6mkF71leuXNS75Vr
 2HV4TMUbMF+yprMDHBtkmq/x3Bc6OEfcfTEWwK0gXDJA9aPzY8C6F0xFgZr1nJsVFCv1
 uOOw==
X-Gm-Message-State: AOAM531egS+imuPJ+mOxjzXqEi/h1wyA8WANz/Zf+rZ+KkzZzML1oiOw
 aYyhEbsT6/LZgs2E+7boSyo02otJ4kBDa03w1xJR+koyeG1w8AHGEquvyBxBsnrnsIZxp7oEIwA
 GhI0mgq4ja8FAYz0=
X-Received: by 2002:adf:d1c5:: with SMTP id b5mr430028wrd.126.1616088857818;
 Thu, 18 Mar 2021 10:34:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBJJsVpyBrF6FyBhoab3CEMybEk5SGS4RRjk0AnE2Pwhi1f0UmzcPjMt4Iqk+gNdyzBBsWjA==
X-Received: by 2002:adf:d1c5:: with SMTP id b5mr430014wrd.126.1616088857602;
 Thu, 18 Mar 2021 10:34:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x11sm3571766wme.9.2021.03.18.10.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 10:34:17 -0700 (PDT)
Subject: Re: [PATCH for 6.0 v3] hw/intc/i8259: Refactor pic_read_irq() to
 avoid uninitialized variable
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210318163059.3686596-1-philmd@redhat.com>
 <e48ce6e7-74bf-f105-4962-b124974712e5@de.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <32a0250b-6d09-e092-af22-939fd5295cf6@redhat.com>
Date: Thu, 18 Mar 2021 18:34:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e48ce6e7-74bf-f105-4962-b124974712e5@de.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/21 17:34, Christian Borntraeger wrote:
>> Some compiler versions are smart enough to detect a potentially
>> uninitialized variable, but are not smart enough to detect that this
>> cannot happen due to the code flow:
>>
>> ../hw/intc/i8259.c: In function ‘pic_read_irq’:
>> ../hw/intc/i8259.c:203:13: error: ‘irq2’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>     203 |         irq = irq2 + 8;
>>         |         ~~~~^~~~~~~~~~
>>
>> Restrict irq2 variable use to the inner statement.
>>
>> Fixes: 78ef2b6989f ("i8259: Reorder intack in pic_read_irq")
>> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>  Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>


Queued, thanks to both.


