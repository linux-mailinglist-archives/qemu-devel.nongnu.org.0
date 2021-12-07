Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC6A46B575
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 09:14:51 +0100 (CET)
Received: from localhost ([::1]:52416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muVcf-0004AA-Vf
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 03:14:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1muVb7-0002dX-KG
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 03:13:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1muVb5-0006QH-LH
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 03:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638864790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RNFsm9fF5na6yaqsgl5uA0KPfotBTD1NH1PWPtjVzQA=;
 b=gDLm/taopUAcpUDVB+p3jk7Vw7aM+IJtUcXlrAN+WjRirOU+m+RM+dp6QbNZo3wupa50qt
 Us561nUznqL+dfAUeHbZPVp/8I/Z6cbSBBQlLzAvf1eczPdNyVSgXRVCmo7AuKQ+pjSLl4
 VIDcGGvUWn42dtqxozdsfcr4kI4LIbM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-87-V2KVCXQoMhqQiU0zt8IlVw-1; Tue, 07 Dec 2021 03:13:09 -0500
X-MC-Unique: V2KVCXQoMhqQiU0zt8IlVw-1
Received: by mail-wr1-f69.google.com with SMTP id
 r2-20020adfe682000000b00198af042b0dso2628985wrm.23
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 00:13:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RNFsm9fF5na6yaqsgl5uA0KPfotBTD1NH1PWPtjVzQA=;
 b=6sXTGhDyFQs5lITtzpnOUUN02PuVZrKo3pm0e8sNEvjM5FYuZwyjfTJzGx5giDAnkY
 WWxAEXcPRvPVacrk1rS/HuaNI58JNsDKzFNeT/bKntlOWccSY0eH0y1jT/d9xmj1YQ/E
 R0PiRIA2YmDnQpnudEsrspJIXBRjRlhb2vGDzZUTAu627p+ich38kdAN8g+sa5+LzpgQ
 dw5rJZSW61tkUK9opeI9sfjZYLuTU8kOWIevy/hn1Ba+SaxyiFMYmHdWSt5yZXByDd13
 VaIfHI43AFr9gUG8WKDGl5Kx8iJt48V4hVxKJoBxNWKN6I/PksW4n6m/pNcRdrzZ2Xey
 bu7A==
X-Gm-Message-State: AOAM532qz0Jt0uDNOtSZY0pXc/6sOCPYPORYe4VIRw/JdlIvqrnyaD24
 IqgTKmbuGuPv6B+Wxre8jkRbEvz7RT6oO6hHGNIlXIQYSqPr+xr8T43MKKdCa4T6HOOESrWTXSc
 2bY1v05pmQ3Th+uU=
X-Received: by 2002:a7b:c155:: with SMTP id z21mr4967395wmi.107.1638864788383; 
 Tue, 07 Dec 2021 00:13:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzEpKelEXw+qoBvjJw7SNwJs7Ug6E4WS4Byp+rcbqNovrp5ogy8aeWreRkWLVToLvjSd1EhA==
X-Received: by 2002:a7b:c155:: with SMTP id z21mr4967376wmi.107.1638864788214; 
 Tue, 07 Dec 2021 00:13:08 -0800 (PST)
Received: from [192.168.3.132] (p4ff23e57.dip0.t-ipconnect.de. [79.242.62.87])
 by smtp.gmail.com with ESMTPSA id
 z14sm14075897wrp.70.2021.12.07.00.13.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 00:13:07 -0800 (PST)
Message-ID: <3af46862-7c8d-dcdd-9ca8-8ace4f3a554a@redhat.com>
Date: Tue, 7 Dec 2021 09:13:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 2/2] osdep: support mempolicy for preallocation in
 os_mem_prealloc
To: Daniil Tatianin <d-tatianin@yandex-team.ru>, qemu-devel@nongnu.org
References: <20211207070607.1422670-1-d-tatianin@yandex-team.ru>
 <20211207070607.1422670-2-d-tatianin@yandex-team.ru>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211207070607.1422670-2-d-tatianin@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: imammedo@redhat.com, pbonzini@redhat.com, yc-core@yandex-team.ru,
 sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.12.21 08:06, Daniil Tatianin wrote:
> This is needed for cases where we want to make sure that a shared memory
> region gets allocated from a specific NUMA node. This is impossible to do
> with mbind(2) because it ignores the policy for memory mapped with
> MAP_SHARED. We work around this by calling set_mempolicy from prealloc
> threads instead.

That's not quite true I think, how were you able to observe this? Do you
have a reproducer?

While the man page says:

"
The specified policy will be ignored for any  MAP_SHARED  mappings  in
the  specified  memory range. Rather  the pages will be allocated
according to the memory policy of the thread that caused the page to be
allocated.  Again, this may not be the thread that called mbind().
"

What it really means is that as long as we access that memory via the
*VMA* for which we called mbind(), which is the case when *not* using
fallocate() to preallocate memory, we end up using the correct policy.


I did experiments a while ago with hugetlbfs shared memory and it
properly allocated from the right node. So I'd be curious how you
trigger this.

-- 
Thanks,

David / dhildenb


