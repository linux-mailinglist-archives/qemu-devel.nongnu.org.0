Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8519C46FC35
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 08:59:59 +0100 (CET)
Received: from localhost ([::1]:60474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvaow-0004f9-Jj
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 02:59:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mvaiz-0006fP-HB
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:53:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mvaiw-0004Db-LH
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:53:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639122824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPorsqy82aELovIE2ND5BpgnIxi9MqijokArojWf4+I=;
 b=cej8N3YVqLWZwNFNHUudWYeMoWbeb7ffE6sYRBOmpzgUCl14MoKTbqZG8V5kczERNaAdNo
 B6Wr5hpi2IID+JaXuK+Rd5Sb3vt/URaFX11FwS8DUluYOFD+4XIb0rXe16zwFwadw8UsLx
 vPymmXq8wmkVP/o88mwLbkSxSY0cE7s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-M6cAr-V_PJi7bdpl1HqJmQ-1; Fri, 10 Dec 2021 02:53:40 -0500
X-MC-Unique: M6cAr-V_PJi7bdpl1HqJmQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d7-20020a5d6447000000b00186a113463dso1967456wrw.10
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:53:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:references:cc:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=DPorsqy82aELovIE2ND5BpgnIxi9MqijokArojWf4+I=;
 b=e0iJvMCGQqKs/wPSL0J5tDhn2aMplF7K5r16iSxu3Qh3PK9rQw5/SXPUVukXcMNRfJ
 5+5YaT2SrpqzMAFP58XRSsoSKyhsXFkxzYmh5P0jEaBOLsXsBm5RivUscplYJB+AYb+h
 Mk0GFPdG1ufc6DLOtcnkohjF0EbH2uPE56vwF3XW0Ms+hzaTZGypW0rlWBBEL23RKN2u
 Pl9GEpl/1QkVPaa/xW8V9F8ozCglWZp0Erfr25PpTG60SMWsvSxlH6JYIvuqj47pTZIH
 JUafJ78lfhLKi0pZVJBxNcjhIL/nGDgxziI0qCOKQdkPDJg3p4dixyVSpnDy34oN3gkP
 a5Cg==
X-Gm-Message-State: AOAM531Y+/DA4SHFonkX0Dvyx1iJbXfhCFT2FoUvlH1c/HahIFHO2RPC
 Q4T1GTo5kC7aDMsrj9t54UVJfoipaYgnnObxsibw3M29WC/ljB71+irsNZGJOWvKzSXymXUxEHZ
 2gn4RtDPl+fO8snw=
X-Received: by 2002:a05:6000:156a:: with SMTP id
 10mr12082217wrz.87.1639122819458; 
 Thu, 09 Dec 2021 23:53:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwz671dom8gANeGs+yNV8tpb0Z/ynp9tbH0ojBda3KV1o4q+yVGguoTwmSdwt4KH4Ce2NCdMw==
X-Received: by 2002:a05:6000:156a:: with SMTP id
 10mr12082193wrz.87.1639122819184; 
 Thu, 09 Dec 2021 23:53:39 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id p5sm1920570wrd.13.2021.12.09.23.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 23:53:38 -0800 (PST)
Message-ID: <7da70e19-537b-9ca5-125d-f9bcf2d3f6df@redhat.com>
Date: Fri, 10 Dec 2021 08:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211028185910.1729744-1-thuth@redhat.com>
 <20211028185910.1729744-4-thuth@redhat.com>
 <e02332c0-7c4e-18a2-5c33-b00e8045f6da@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/4] Move CONFIG_XFS handling to meson.build
In-Reply-To: <e02332c0-7c4e-18a2-5c33-b00e8045f6da@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.317, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/11/2021 12.34, Paolo Bonzini wrote:
> On 28/10/21 20:59, Thomas Huth wrote:
>> Checking for xfsctl() can be done more easily in meson.build. Also,
>> this is not a "real" feature like the other features that we provide
>> with the "--enable-xxx" and "--disable-xxx" switches for the
>> configure script, since this does not influence lots of code (it's
>> only about one call to xfsctl() in file-posix.c), so people don't
>> gain much with the ability to disable this with "--disable-xfsctl".
>> Let's rather treat this like the other cc.has_function() checks in
>> meson.build, i.e. don't add a new option for this in meson_options.txt.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> I think we should just use ioctl and copy the relevant definitions from Linux:
> 
> struct dioattr {
>          u32           d_mem;          /* data buffer memory alignment */
>          u32           d_miniosz;      /* min xfer size                */
>          u32           d_maxiosz;      /* max xfer size                */
> };
> 
> #define XFS_IOC_DIOINFO        _IOR ('X', 30, struct dioattr)

I've now had a closer look at this idea, but it's getting messy: We'd 
additionally also need the platform_test_xfs_fd() function that is called 
from file-posix.c ... sure it's not big, but the XFS header stuff is 
licensed as LGPL, so it feels wrong to copy this over into file-posix.c that 
has a MIT license. Of course, it could be rewritten, or put into a separate 
file ... but that is already way more cumbersome for such a small benefit. 
So I think I prefer to rather keep my patch in the current shape that has a 
way nicer diffstat with way less risk of messing things up here.

  Thomas


