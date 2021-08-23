Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C673F516D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 21:41:07 +0200 (CEST)
Received: from localhost ([::1]:42104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIFH7-0000qc-78
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 15:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFFC-00084Q-H5
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:04:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFF9-0001ok-U3
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:04:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629745463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s6azossO70ZeKGdG3ddTZqMsgn9VE+bvA2VK/PPLQXg=;
 b=gaE74BzMQjnbgJp87JKPoQfwO4x5J1+xjZo+ouk1ofUWF5mAJSJ5hm8EEWCXhWNabz7mUz
 07F601Vckr1ZCgy62PU5Oidz847gtc5kvlXcBxQOwPMeV85RsHQPFbE9z8fvLPScqaOwFV
 TnIQhSGW/bM+dPP+nxjL18dBc7Gepi0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-A2W9QPyiNxecHyfKmASGjw-1; Mon, 23 Aug 2021 15:04:22 -0400
X-MC-Unique: A2W9QPyiNxecHyfKmASGjw-1
Received: by mail-wm1-f69.google.com with SMTP id
 i204-20020a1c22d5000000b002e74466ad9bso82524wmi.4
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=s6azossO70ZeKGdG3ddTZqMsgn9VE+bvA2VK/PPLQXg=;
 b=nPnD2y+zkCGnbDgdOfZgeMvJNEm67BUPFWAe53HBQc2nN/OniUG2QSx3zqm1RVvdc/
 FmePIn67iKgvvXH9lHXGuZI8h3OHgNIC7V3q7tr5DIvFLin8RmnfU2btbTXSF+TdrBDE
 0badFtZGNN3N14E+YOAUEkGm0nvvYQxrVj5FQQhE2uVx/x3Tr6wmMwwPjzhQ7nRgsS2L
 CFicJtbErmXNDYM/2+l/kcUG4tafqKxanXVkNOO20jJCmiHTo/DzXHBOwBlgncOc1dZc
 gTTP0SSJsUQTMjUybf3yj1V+fW8270lhjZiQRkO51Qlk1RAAuDzFBu/Jm9Z3XtiUv/YK
 jvjw==
X-Gm-Message-State: AOAM533LVMLF/92YMWXg2si4Rc2woKRO84VCO+7T2oac2uy3KL0xRqbf
 boG469SlEQmL3Hn13w4P72TH0ebH05/CwyzTRNMN+NMhOiHXzb1TmRpgugjoK2skz/+cA3DCA/U
 YDvh3x9jFskm6oGc=
X-Received: by 2002:adf:fbc9:: with SMTP id d9mr15188508wrs.152.1629745460852; 
 Mon, 23 Aug 2021 12:04:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDvPPMwkRhzZDEh2IJyo9sYy/vQfXCNCS8BQBZU8cPsOs4PL2sAAI6c/emzQWANfvKy/SCvw==
X-Received: by 2002:adf:fbc9:: with SMTP id d9mr15188484wrs.152.1629745460711; 
 Mon, 23 Aug 2021 12:04:20 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c60c6.dip0.t-ipconnect.de. [91.12.96.198])
 by smtp.gmail.com with ESMTPSA id
 z13sm15969870wrs.71.2021.08.23.12.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 12:04:20 -0700 (PDT)
Subject: Re: [RFC PATCH v2 3/5] exec/memattrs: Introduce MemTxAttrs::bus_perm
 field
To: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-4-philmd@redhat.com> <YSPr6dN+iKKFlCxy@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <922195af-f70d-eaf6-2aa4-b924f8196076@redhat.com>
Date: Mon, 23 Aug 2021 21:04:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSPr6dN+iKKFlCxy@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.08.21 20:41, Peter Xu wrote:
> On Mon, Aug 23, 2021 at 06:41:55PM +0200, Philippe Mathieu-Daudé wrote:
>> +/* Permission to restrict bus memory accesses. See MemTxAttrs::bus_perm */
>> +enum {
>> +    MEMTXPERM_UNSPECIFIED   = 0,
>> +    MEMTXPERM_UNRESTRICTED  = 1,
>> +    MEMTXPERM_RAM_DEVICE    = 2,
>> +};
> 
> Is there a difference between UNSPECIFIED and UNRESTRICTED?
> 
> If no, should we merge them?
> 

I'd assume MEMTXPERM_UNSPECIFIED has to be treated like 
MEMTXPERM_UNRESTRICTED, so I'd also think we should just squash them.

-- 
Thanks,

David / dhildenb


