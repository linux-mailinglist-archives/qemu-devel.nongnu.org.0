Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5F7308DCD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 20:58:41 +0100 (CET)
Received: from localhost ([::1]:48206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Zui-0006zO-L7
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 14:58:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5ZtQ-00069e-2h
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:57:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5ZtO-0002EM-D8
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:57:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611950237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k+ytV5042leeZD2NRTmxAMQeyKzlBAjq9ulmmLFOnRA=;
 b=JzcbNBD6flJhYzGYDVXBrU8WVzUUp9L4HwFxMp1AF0M0qLLNAAe2kbx3gb5FDQcqKNT/MK
 id8hDxqVlm7zMuMpv6y32CpoHO4re9QBGigRy8JsEAstkKtO95cUjgpk8Shl2ADLr4fmAO
 F6Y9f/basriVp/K70ONRfYIB3aJ3MMU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-mrPDldlUO6eB-z7viw4uMg-1; Fri, 29 Jan 2021 14:57:15 -0500
X-MC-Unique: mrPDldlUO6eB-z7viw4uMg-1
Received: by mail-wr1-f72.google.com with SMTP id h17so986469wrv.15
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 11:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k+ytV5042leeZD2NRTmxAMQeyKzlBAjq9ulmmLFOnRA=;
 b=HkUrdp3tFwPKpGWXEfg89U2mK1kk5ulr3wtjkfg3e7+Ft6FmyjyeQW2ZNc25Gtq/kG
 5amOn+uvcDzXz/v1wHFvGoYn7c97Gt2F/AWUfcrwpjHuBCnGzvuB4CPe6qAILEhX6G1h
 /k6Zhiy7xTTDTkDZvqBTlVIlorwovybTW6gxTCNiDklKw1YPyIcDl458mYLl3NK/nZaS
 Wx5G5kvEzJheYEFdLafY6uIaAWkzVinpzQmgZwjzyhFXDyg64jcXdNb8Div/F7K3fTZk
 0k1Ru15RZyL24P9iGDfnBV0FrD56A8X8zSVO5hNqMOMNQBbkf23knlN0MmLoIOuMHMRQ
 PnmQ==
X-Gm-Message-State: AOAM533RtG3DnSjjsQfjGnLWNs4jew+1yGJeFzhJGv43w689xMxmp2Pi
 KRMWCRNT7v0yX9vi+KIk/BUvmZ0/uqKK2JdZV922krhpHKjwvhJ+x3JU/uvI2abMXqON18Hoqfq
 Kd2XVo4sRhMBlc8c=
X-Received: by 2002:a1c:9609:: with SMTP id y9mr5209212wmd.75.1611950234500;
 Fri, 29 Jan 2021 11:57:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxT+MdG6hpVlf9IxAfdmu6UjZcrZCZh/3nQNTPVCuDImfAhrFbtVKa/L3+2NaobaVU1tutWmA==
X-Received: by 2002:a1c:9609:: with SMTP id y9mr5209202wmd.75.1611950234332;
 Fri, 29 Jan 2021 11:57:14 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id d17sm6996645wma.2.2021.01.29.11.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 11:57:13 -0800 (PST)
Subject: Re: [PATCH v2 2/2] pci: add romsize property
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210129192838.582771-1-pbonzini@redhat.com>
 <20210129192838.582771-3-pbonzini@redhat.com>
 <ee924cca-8b90-df77-b544-c6405f6b761@eik.bme.hu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9aae8014-8f86-ad1c-1a67-f08312aeb8d9@redhat.com>
Date: Fri, 29 Jan 2021 20:57:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <ee924cca-8b90-df77-b544-c6405f6b761@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: mst@redhat.com, lersek@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/01/21 20:51, BALATON Zoltan wrote:
> otherwise the BIOS emulator in the guest firmware crashes and this works 
> so I think romfile can be empty and it's a useful feature to have in 
> this case for example. I don't know if this patch changes anything about 
> that but the commit message saying that romfile cannot be empty may be 
> wrong.

The empty property value configures the device not to have a ROM file at 
all.  The commit message says that ROM files (if they exist) cannot be 
empty, corresponding to this code in pci_add_option_rom:

     } else if (size == 0) {
         error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
         g_free(path);
         return;
     }

Paolo


