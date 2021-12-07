Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502A646BEAB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 16:07:57 +0100 (CET)
Received: from localhost ([::1]:38082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muc4R-0002Xq-KX
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 10:07:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1muc2R-0001qJ-FW
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 10:05:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1muc2K-0000bx-Gy
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 10:05:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638889543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jx/cXssXv8RuxMm30cimmvnfsZKKcpIG9WUajUgXuqg=;
 b=QZTfRZ1/qDdqvT+SqJNLSNx4iA1dC+8CVErVpuCnDCcpvzfgjSVd1GWLpi42aHjTmEEOZw
 0n8DAJLLizqahX6YLeh7MMYeAHZZhmF32SFCWyxIoAuy1pno/btiMGdq0nPM9eZ4TDFMMs
 t408nWkvOPOoBWqLzurQrXoGVRTk/Ug=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-IYeIaEkeNTC2ZY5g2CayOg-1; Tue, 07 Dec 2021 10:05:42 -0500
X-MC-Unique: IYeIaEkeNTC2ZY5g2CayOg-1
Received: by mail-wr1-f72.google.com with SMTP id
 h7-20020adfaa87000000b001885269a937so3071556wrc.17
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 07:05:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=jx/cXssXv8RuxMm30cimmvnfsZKKcpIG9WUajUgXuqg=;
 b=eaynTzw9qr+C5DAN5wVFMXcmvAQ/+s+H4ad2L/kzYhpsTjbteiL136DWfrg56wquor
 llJfQTMk4GlM7RfunCtxw/9VuntEwU0PnQESMnZI4jSIItmblckJ5/74EUqXNzDw83UC
 nX/hCCIZyufIypOmaMxWJ12fnVKzBgF8ULCzX8W/ITMEBrF6aQ+2gY09VcvkubV3cjey
 x2MYqfXO15ehsAWmJNWudLQH57ak2a2Ja9OdJF8Fe70mZB+XZGRcMJ2x2lVjSWrG/O8E
 9m8i0dPZ4b4iZdf4ZHp9q5in2Ic3zAMQkQFFoMv+QvXqQw+4TYGCq/ob1SwzhcvPRDbu
 hMvQ==
X-Gm-Message-State: AOAM530Hu+ZPd3js4ptAHc77Hj+W+tuFyezkN1dHjvO/X1jqgevN16Os
 +i92h+5CaESLsx3h3aH5pDZb4aEheo6VncoU5aKB5cOvE93ISoyWh/O0F96j6buJLyCUWd6I3on
 o58J0NCPQm09eM+E=
X-Received: by 2002:adf:db47:: with SMTP id f7mr52748994wrj.113.1638889541055; 
 Tue, 07 Dec 2021 07:05:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkdYWSk2WTIflnfYOOENh/yCB4S3c5mJiNj/WDp/CstmJGmn7Ed72H5y8gW5+1nXqf4tMtRQ==
X-Received: by 2002:adf:db47:: with SMTP id f7mr52748962wrj.113.1638889540850; 
 Tue, 07 Dec 2021 07:05:40 -0800 (PST)
Received: from [192.168.3.132] (p4ff23e57.dip0.t-ipconnect.de. [79.242.62.87])
 by smtp.gmail.com with ESMTPSA id
 u13sm3268142wmq.14.2021.12.07.07.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 07:05:40 -0800 (PST)
Message-ID: <d40efabf-25d3-56d5-7e5b-ae6a70b5edd1@redhat.com>
Date: Tue, 7 Dec 2021 16:05:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Daniil Tatianin <d-tatianin@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211207070607.1422670-1-d-tatianin@yandex-team.ru>
 <20211207070607.1422670-2-d-tatianin@yandex-team.ru>
 <3af46862-7c8d-dcdd-9ca8-8ace4f3a554a@redhat.com>
 <227321638883575@mail.yandex-team.ru>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 2/2] osdep: support mempolicy for preallocation in
 os_mem_prealloc
In-Reply-To: <227321638883575@mail.yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "imammedo@redhat.com" <imammedo@redhat.com>,
 "sw@weilnetz.de" <sw@weilnetz.de>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.12.21 14:58, Daniil Tatianin wrote:
> I believe you're right. Looking at the implementation of
> shmem_alloc_page, it uses the inode policy, which is set via
> vma->set_policy (from the mbind() call in this case). set_mempolicy is
> both useless and redundant here, as thread's
> policy is only ever used in case vma->get_policy returns NULL (which it
> doesn't in our case).
> Sorry for the confusion.

Hi Danlil,

not an issue, the man page is really confusing ... so I was similarly
confused a few months ago until I actually started to dig :)

-- 
Thanks,

David / dhildenb


