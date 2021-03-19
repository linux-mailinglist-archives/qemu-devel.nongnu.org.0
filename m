Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6C0342374
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 18:37:06 +0100 (CET)
Received: from localhost ([::1]:56276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNJ3Y-0003qy-Tk
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 13:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lNJ28-0003KA-NC
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 13:35:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lNJ25-0006uH-AK
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 13:35:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616175329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aoo5DWNRCtLoRGxLuCNWqvZCer/UGebp5QKZNjpByXM=;
 b=h1527dzVrqc+KMHwimA559LA5PsT1aad4dkNkjTP+z5yl6C/KqA/9Crg2o6MxNSPDu9EOW
 GENr5xNnPwK0Ne5i9KMWrgwo0kYREakXAufxHA4NH4nA8yLZrbp7+oCxYtKDJ04UoCXXqy
 WgyyA7QgzHRRL5BCK7E3Ywnoj/njSao=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-aWT05G2xPqS9QLqAB6vogA-1; Fri, 19 Mar 2021 13:35:28 -0400
X-MC-Unique: aWT05G2xPqS9QLqAB6vogA-1
Received: by mail-wr1-f71.google.com with SMTP id 75so21969784wrl.3
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 10:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=aoo5DWNRCtLoRGxLuCNWqvZCer/UGebp5QKZNjpByXM=;
 b=LXvMHpK8Xdp7vzVCjxAFVGN0VefHe9xuawgCUblBv52T29CLWjVQQg8AL7lPUoQG9N
 Y/G54vEPFttD2ljbFPzYuB5QWmSFQrk2HHboIcO5GCYin8bpuIZLRZag/+oqPhJm+MtR
 fd3xLG9cUAbqiPWDeZriMEcd6FVNzo9n8G00GLs/FLj4UiZ8/A7PnqzdU6ORlpsjTT5B
 XBeyRljv9yMlFjfVseWxwMK7QURc8eTWUFiE+4PsQtVRxUHzp8/p8zCR8IbNIJFt2PN6
 Nz10+j3jSvqF4r7WQ8z1rkGoryWbcqguFEcn0y4VpOcykwy44Xi2X/60G1nXsrhfiAaZ
 iGeg==
X-Gm-Message-State: AOAM532tOvoY7G52yDuk0VmUg8mwHolR6c74koDgt0c+prHecp1Z5Mi8
 QFHDlaf3cFwPZP+s7XXXZuVL/FkuPqtJnOmSI+5xiRg19NY3dVEB4xGAjSF+LAs4SMT2kfwnhuA
 GHVZDqA76W/+pnME=
X-Received: by 2002:adf:ed49:: with SMTP id u9mr5659190wro.337.1616175326934; 
 Fri, 19 Mar 2021 10:35:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmAbpQ4Xk+FIFuaN74mstyHYBOtSasg7KhqHN7ecYawx32XhpKCsoNWZ0USPkLWo7ywNlWVg==
X-Received: by 2002:adf:ed49:: with SMTP id u9mr5659179wro.337.1616175326742; 
 Fri, 19 Mar 2021 10:35:26 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id g15sm6620860wmq.31.2021.03.19.10.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 10:35:26 -0700 (PDT)
Date: Fri, 19 Mar 2021 18:35:24 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PULL 18/76] optionrom: add new PVH option rom
Message-ID: <20210319173524.rnrxslpmdjck6uxv@steredhat>
References: <1549390526-24246-1-git-send-email-pbonzini@redhat.com>
 <1549390526-24246-19-git-send-email-pbonzini@redhat.com>
 <e3d925e6-a48e-07b9-6418-05c5a4d2cd36@redhat.com>
 <f33bf6fa-1fa3-4e33-bd8e-843bec2d5638@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f33bf6fa-1fa3-4e33-bd8e-843bec2d5638@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 19, 2021 at 06:03:59PM +0100, Paolo Bonzini wrote:
>On 19/03/21 15:06, Philippe Mathieu-Daudé wrote:
>>>+
>>>+/* Search RSDP signature. */
>>>+static uintptr_t search_rsdp(uint32_t start_addr, uint32_t end_addr)
>>>+{
>>>+    uint64_t *rsdp_p;
>>>+
>>>+    /* RSDP signature is always on a 16 byte boundary */
>>>+    for (rsdp_p = (uint64_t *)start_addr; rsdp_p < (uint64_t *)end_addr;
>>>+         rsdp_p += 2) {
>>>+        if (*rsdp_p == RSDP_SIGNATURE) {
>>>+            return (uintptr_t)rsdp_p;
>>>+        }
>>>+    }
>>>+
>>>+    return 0;
>>>+}
>>gcc 10.2.1 "cc (Alpine 10.2.1_pre2) 10.2.1 20210313" reports:
>>
>>pc-bios/optionrom/pvh_main.c: In function 'search_rsdp':
>>pc-bios/optionrom/pvh_main.c:61:21: warning: comparison is always false
>>due to limited range of data type [-Wtype-limits]
>>    61 |         if (*rsdp_p == RSDP_SIGNATURE) {
>>       |                     ^~
>
>This is probably a different bug, but I'll also add that uint64_t is 
>supposed to be aligned to 64 bits, so you need either 
>__attribute__((packed)), or use char* and memcmp.  If you go for the 
>latter, it would fix the issue that Philippe is reporting.

Yes, memcmp maybe is also more readable, but being baremetal, I have to 
implement it right?

Thanks,
Stefano


