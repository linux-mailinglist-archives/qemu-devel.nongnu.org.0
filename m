Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFD84294C4
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 18:49:00 +0200 (CEST)
Received: from localhost ([::1]:41158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZyTy-0007eY-VY
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 12:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZyRY-0006GO-7Z
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 12:46:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZyRU-0003F0-R4
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 12:46:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633970782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V3XoFUtnylDUgTGPO4vxRn7dq9T7k8GjxyjbqJ+oWqg=;
 b=SAQ4qxCYy2hOsnXN3vYU//UCvalX4XU/hRY/29obP3I3R1PJbTl3noIpUvsV9p8TPi4o7Q
 KYrpF6onm3faPpkAxoIKv+Yo+dgSLWTRPXzSXi/pJwF4HJ+FY6034I9q0x2QuJuRb7lypK
 G3XrsU6yu7FkUogGXDegzlNR1gxSQHg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-Ic-lMXkKPROt7zKrhdVkmg-1; Mon, 11 Oct 2021 12:46:19 -0400
X-MC-Unique: Ic-lMXkKPROt7zKrhdVkmg-1
Received: by mail-wr1-f69.google.com with SMTP id
 h11-20020adfa4cb000000b00160c791a550so13552688wrb.6
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 09:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=V3XoFUtnylDUgTGPO4vxRn7dq9T7k8GjxyjbqJ+oWqg=;
 b=2yMtSqaGtUdFRdEpf9JFNORUAWVgl4aDTyBlcHET/bC2QZLt/tZswnxqT6PcBuV/Sx
 9umn//7Y/bRH52cBp+BznlhNacPh1NiRQdZc+D0CyxHQXx159B6Noum83Mu+h4DzIaZE
 g8kaVsTx5NAQhxwtdSO51eX75o51NnPvbIPTo4g/5Mzu4ERXyrPBEuCmUJpDbh6CegwN
 rRdfe0glvEYclGGfBYqj1nQODPxuFV5qaIemrMZPpvkbsxdvIQXT47foUaIs904jAWq2
 C2tCB1a8ve26Z6FmjvXe5rqA+gbl/oXbxuSLtD8lyYlW8++M6i78LQRj5H7S26AG+R5J
 uYLw==
X-Gm-Message-State: AOAM530khwDKnDbrpX7VxzYKYoDzTGXJ6Qr6q+hDId4tjrrxzdPlS2wS
 JygXxBWewKtyrRE97Z+fArC3PWne66uC1q4u6P7eVmmx5DhSykSxvPl6jo4dyD9ntOM5BxRNWAo
 +dZQVRsuyjlTj2u8=
X-Received: by 2002:a05:6000:1acc:: with SMTP id
 i12mr25525870wry.249.1633970778460; 
 Mon, 11 Oct 2021 09:46:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxc0ueP89RvLeVhdFeaauCGkecGs9yrT2IKiz9k4HWC5cZ8CavWaB6/Mu/583Fchkl+p0zy/w==
X-Received: by 2002:a05:6000:1acc:: with SMTP id
 i12mr25525840wry.249.1633970778281; 
 Mon, 11 Oct 2021 09:46:18 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ba.dip0.t-ipconnect.de. [91.12.100.186])
 by smtp.gmail.com with ESMTPSA id t18sm8448740wrm.81.2021.10.11.09.46.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 09:46:17 -0700 (PDT)
Subject: Re: [PATCH v4 0/7] util/oslib-posix: Support MADV_POPULATE_WRITE for
 os_mem_prealloc()
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20211004120208.7409-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <b51f5845-4779-1bf3-4444-93085a61c62e@redhat.com>
Date: Mon, 11 Oct 2021 18:46:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211004120208.7409-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.10.21 14:02, David Hildenbrand wrote:
> #1 is a preparation for improved error reporting, #2 adds support for
> MADV_POPULATE_WRITE, #3 cleans up the code to avoid global variables and
> prepare for concurrency, #4 and #5 optimize thread handling, #6 makes
> os_mem_prealloc() safe to be called from multiple threads concurrently and
> #7 makes the SIGBUS handler coexist cleanly with the MCE SIGBUS handler
> under Linux.
> 
> Details regarding MADV_POPULATE_WRITE can be found in introducing upstream
> Linux commits 4ca9b3859dac ("mm/madvise: introduce
> MADV_POPULATE_(READ|WRITE) to prefault page tables") and eb2faa513c24
> ("mm/madvise: report SIGBUS as -EFAULT for MADV_POPULATE_(READ|WRITE)"),
> and in the man page update [1].

Paolo, are you planning on taking this via your tree (POSIX)? Thanks!

-- 
Thanks,

David / dhildenb


