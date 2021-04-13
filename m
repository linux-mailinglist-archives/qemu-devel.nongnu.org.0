Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADEE35D8EE
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 09:33:42 +0200 (CEST)
Received: from localhost ([::1]:58294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWDYL-0006eQ-17
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 03:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lWDXI-0006DH-LX
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 03:32:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lWDXE-0001AV-Fv
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 03:32:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618299150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FtiNGWTvt6kcmwfh+WYzC8aiZsy1IrfrPaHUH1+1cic=;
 b=b8CxuuUaBZdQx97qYm9Iua7wAHmigJks0mGNU/Vaee+wSOredQXbHFI8uWBgZKepKJo+yp
 gqcIdh2H3ApwGKOfsiKQPIVZJQO2vijCVAowiefpMC3T+m0Qo3szWsqqQoxJD2A4E0WJk3
 Z8FFSjy3VsbSCdlqH7e4jX5Cspv39HY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-wrYcWhvsNM6DdVjIQNN_DQ-1; Tue, 13 Apr 2021 03:32:25 -0400
X-MC-Unique: wrYcWhvsNM6DdVjIQNN_DQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 h13-20020a05640250cdb02903790a9c55acso799559edb.4
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 00:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FtiNGWTvt6kcmwfh+WYzC8aiZsy1IrfrPaHUH1+1cic=;
 b=LF43eYRKHFcP3vqVOcUjcuxNpwCxNLXPheg+GoyHqiyCDYPj8/htPuyhgPHb9cthW7
 GBNelAvLWHrlr9g7o8dmYK8B0X28ngpQ2oM61YLsxslrQg99d0VR6Cuvh0+ca2bw0mjy
 1P2qpkKy7yh3auZ2/bfd/bemEAXM8MCO/CBMEiv0FpPDLxkq7J7jTdM5kx5lL0Z0KAm9
 2vUGF9kYz/np7kM7XRt0IKxPP4RJ1nqwn/KCxuf0akdAFCEHiR6DMGB6ptTXW06/PN52
 jPUuQSYJhIjQlUAJhBzApvak3IGsBXa7jFI4ceEUaebH6pIjFDDg8p5QW4EiCeEz9/dg
 B4GQ==
X-Gm-Message-State: AOAM533bzMGynqF4vqTni4RFN7MGMyZ5tmmimfMLlQ0JqvJkl57vbcqy
 jsOKQONYH8Ax2dCoCQMkSdd91+aqUrDneaNHjI1vxjW4yfXwRk5SwyrHrY1FuddWqNs5rJtwczC
 DigMrCIS7o53ZQeQ=
X-Received: by 2002:a17:907:7745:: with SMTP id
 kx5mr30419463ejc.3.1618299144543; 
 Tue, 13 Apr 2021 00:32:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvWu71vGq9sPcXGJybtZO2NF9GXDOCQIHJMoNIDtttrQTHPY+VD1x9mAm4gqhjNcSBRgysqw==
X-Received: by 2002:a17:907:7745:: with SMTP id
 kx5mr30419443ejc.3.1618299144319; 
 Tue, 13 Apr 2021 00:32:24 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z20sm8733620edd.0.2021.04.13.00.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 00:32:23 -0700 (PDT)
Subject: Re: Better alternative to strncpy in QEMU.
To: Thomas Huth <thuth@redhat.com>, Chetan <chetan4windows@gmail.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <CAPPKfOGwK7JDfHaTT-e4Z7bFkYoWu=dHvF-fT+QdqJhnwCLvOw@mail.gmail.com>
 <162f832d-ea91-a8f4-6f1d-56cda086f481@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1d9b49b5-a771-8b5e-1220-ba82efc9572e@redhat.com>
Date: Tue, 13 Apr 2021 09:32:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <162f832d-ea91-a8f4-6f1d-56cda086f481@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/04/21 06:51, Thomas Huth wrote:
>>
> 
> I think this is pretty much the same as g_strlcpy() from the glib:
> 
> https://developer.gnome.org/glib/2.66/glib-String-Utility-Functions.html#g-strlcpy 
> 
> So I guess Paolo had something different in mind when adding this task?

Yes, I did.  strncpy is used legitimately when placing data in a 
fixed-size buffer that is written to a socket, to a file or to guest 
memory.  The problem with using g_strlcpy in those cases is that it does 
not write past the first '\0' character, and therefore it can leak host 
data.

What I had in mind was basically strncpy plus an assertion that the last 
copied byte will be set to 0.  It can be written in many ways, for 
example strncpy followed by assert(dest[destlen - 1] == '\0'), or like 
assert(strlen(src) < destlen) followed by strncpy, or of course you 
could write a for loop by hand.

Once you do that, you can split uses of strncpy in two: those where the 
reader expects the last byte to be zero, and those where the reader does 
not.  (I don't expect many cases of the first type, because the reader 
always has to think of how to handle a malicious data stream that does 
not have a zero termination).

As long as you avoid the accidentally quadratic behavior that Peter 
pointed out, any way is fine since performance does not matter on these 
paths.  Making the code nice and readable is more important.

Paolo


