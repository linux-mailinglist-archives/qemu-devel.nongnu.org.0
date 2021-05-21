Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379A438CB41
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 18:44:44 +0200 (CEST)
Received: from localhost ([::1]:39632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk8GQ-0006zs-LT
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 12:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk8EG-00066Y-3J
 for qemu-devel@nongnu.org; Fri, 21 May 2021 12:42:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk8ED-0003xR-I5
 for qemu-devel@nongnu.org; Fri, 21 May 2021 12:42:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621615344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mhHG5G1FMCXxDy7PlP/KgbkTgbu2/8IbFz49ZNvq8N0=;
 b=QWOadd+TA/qG5f1rGdmxFgRmb5AARYiSw390FKhdoUkKgT9QXaj5XISkHGyxJE3kguP4cC
 RoPxR5Aa1aZeJejjyiv89i/DkNB9VaQ8JJ+/3aky69wwyqCvz0N8qaKHbk/Pt/NrUUoys7
 BKqlFXKz6GnKpCSriK7y55k7jzXaYK8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-u8AA2NBLMIeZDJU6XRztrg-1; Fri, 21 May 2021 12:42:22 -0400
X-MC-Unique: u8AA2NBLMIeZDJU6XRztrg-1
Received: by mail-ej1-f70.google.com with SMTP id
 p25-20020a1709061419b0290378364a6464so6417100ejc.15
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 09:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mhHG5G1FMCXxDy7PlP/KgbkTgbu2/8IbFz49ZNvq8N0=;
 b=W8wrgtun1MKbMiIoux5dlSWlnCJDIcPZ5nEc0OLi3LW4ghgbaQpfVJl1LJetgaPBCQ
 TDdu9K2tI11BXoIexxqoM027TJFHK8r0PgRYrvCc2wzMd084f9h30lvZx2rI4FkFHEND
 /iaEEBXvIwbMuabqJb2a2aVKUpX3DlKE6cuY9X42h7pnsFIhfI375otF+uknZY+P9wrC
 eTGAaR7FTKBycrrP8UqFKmDJvFu+w+EwluPRnSYnlGe4Hn8l8beLrGKRmxe/eGkKgr0c
 B/2xpxdoLCKqGaMQuUrK6/XXsXVrewlaHqIPiTi90qFNAII39ZKjH8dzkiY7dZbEiawM
 KVmw==
X-Gm-Message-State: AOAM533TdyZkbXDEA8Dx6GxnXZj3sIIFsmQXi0FIDulybZckuMcONn9l
 oiO5rgdody1td8aYF1GqBaku+oI7Lo1QtF/Rs/1Z1361iUx1S1JgsPS1yKy/Hz7iUH/eI8ywoPk
 cprmILkQ1MHelIDI=
X-Received: by 2002:a17:907:3e06:: with SMTP id
 hp6mr11307286ejc.273.1621615341160; 
 Fri, 21 May 2021 09:42:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze27cq9zzE9MBxmw2ZM7PfNcK77YYCXhvmOPN/SJZp2FDeMm6HNi2hqLdRZvQqSeFHt8iz+w==
X-Received: by 2002:a17:907:3e06:: with SMTP id
 hp6mr11307258ejc.273.1621615340834; 
 Fri, 21 May 2021 09:42:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r10sm3899109ejd.112.2021.05.21.09.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 09:42:20 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] qemu-config: parse configuration files to a QDict
To: Kevin Wolf <kwolf@redhat.com>
References: <20210521102104.3271053-1-pbonzini@redhat.com>
 <20210521102104.3271053-2-pbonzini@redhat.com>
 <YKfbJZVb22MoZXU3@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <102ae121-3ef6-1284-3ab4-9ef3ec645f99@redhat.com>
Date: Fri, 21 May 2021 18:42:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKfbJZVb22MoZXU3@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: armbru@redhat.com, qemu-stable@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/05/21 18:09, Kevin Wolf wrote:
>> +    qemu_opts_absorb_qdict(opts, qdict, errp);
>> +    if (errp) {
> This doesn't do what you wanted.
> 
> *errp would be be better, but you also need ERRP_GUARD() then.
> 
> The other option would be using the return value of
> qemu_opts_absorb_qdict().
> 

Uff, you're absolutely right.  I'm a trainwreck today...

Paolo


