Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9403B956B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 19:24:15 +0200 (CEST)
Received: from localhost ([::1]:60902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz0QA-0004F0-G3
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 13:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lz0PB-0003Zh-Vk
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 13:23:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lz0P7-0001SM-84
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 13:23:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625160186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BnCDyuJujVvoTRmDiJ1q/FQvffVYTL4ZGKnSbbVNcj4=;
 b=DSpuZkvepp446uwYZO+/w8aDEFw1AaXTCyeD77HAbkMawqoSGDehuLOg99+0ITOHE1l3LE
 ug2KX7x+ji3QFZYjO6mhq9e14bbGO7myKBBZ822h1oP7k4br7C98U/n64XxhUj/fROheAF
 gHAMNzz9QyMmQaVh6AI3s5lY8cYwGuM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-LaePrkmXMnSAc4OqPTnLIQ-1; Thu, 01 Jul 2021 13:23:03 -0400
X-MC-Unique: LaePrkmXMnSAc4OqPTnLIQ-1
Received: by mail-pl1-f197.google.com with SMTP id
 4-20020a170902c204b0290121d3ad80ecso3193138pll.6
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 10:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BnCDyuJujVvoTRmDiJ1q/FQvffVYTL4ZGKnSbbVNcj4=;
 b=LBIwaUfITEwbPjCYG3z0d3zQryaieybgDVt6FEkN3nEfzTsym7zslOMAUKaq+dAz43
 ITxIi9RwvHAXSJgiXAOwJfarCygirGjK62TajzFlEJs67Cy8uxP4SHG03iq1G21YzZ3G
 HIRZVqPpGSbM4kQlyLqjwegE+y/+yNsQpBgFb992eMMXdMB0mqLWylUHTaIQbGtXdM6F
 RpMWlkQkIESnfAD+XRPlPAVKBMdQxpvhuC7baG2zGe4Kgn6vyvr1K7DphszrugY3AVRp
 vs1tjvFKqfPlBqXPjjXEozzfeDeZSLFvA5H/T/26xaAOL8ZIJmW4JpG+mq8TrEhgcb5I
 3Tzw==
X-Gm-Message-State: AOAM533vUqwzAIWgLSeHD2vWEFzVnBaNTj3DcQUXXAd810H5sp4jo9G3
 488ese3uybDOjJHgxRzVmEiV+sIzq6gi5uCViOS+Zi/C8lWMWQA71B9/9ngJ1r0dohFOQ0UMPSz
 efnXVilFLmmxr/Og=
X-Received: by 2002:a63:8f04:: with SMTP id n4mr607949pgd.317.1625160182736;
 Thu, 01 Jul 2021 10:23:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBRQfTbgjolsjCjKuD50smsCGMyHSNjjqm6iaOyAOjjMnph5wbg/3GfZsyUKyF8NkKSX+69w==
X-Received: by 2002:a63:8f04:: with SMTP id n4mr607924pgd.317.1625160182497;
 Thu, 01 Jul 2021 10:23:02 -0700 (PDT)
Received: from ?IPv6:2601:1c0:4600:3f84:cb33:5075:e7f0:7862?
 ([2601:1c0:4600:3f84:cb33:5075:e7f0:7862])
 by smtp.gmail.com with ESMTPSA id p3sm10474718pjt.0.2021.07.01.10.23.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 10:23:02 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210624102040.2015280-1-dovmurik@linux.ibm.com>
 <20210624102040.2015280-2-dovmurik@linux.ibm.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <a8af0753-9344-37ee-bf90-cc093680d6f9@redhat.com>
Date: Thu, 1 Jul 2021 10:23:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624102040.2015280-2-dovmurik@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 3:20 AM, Dov Murik wrote:
> Add the sev_add_kernel_loader_hashes function to calculate the hashes of
> the kernel/initrd/cmdline and fill a designated OVMF encrypted hash
> table area.  For this to work, OVMF must support an encrypted area to
> place the data which is advertised via a special GUID in the OVMF reset
> table.
> 
> The hashes of each of the files is calculated (or the string in the case
> of the cmdline with trailing '\0' included).  Each entry in the hashes
> table is GUID identified and since they're passed through the
> sev_encrypt_flash interface, the hashes will be accumulated by the PSP
> measurement (SEV_LAUNCH_MEASURE).
> 
> Co-developed-by: James Bottomley <jejb@linux.ibm.com>
> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> ---

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


