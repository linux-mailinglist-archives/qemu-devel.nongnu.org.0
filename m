Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BF030DFC1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:32:36 +0100 (CET)
Received: from localhost ([::1]:44158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7L51-0006uT-Ih
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7L0m-0003Uh-6U
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:28:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7L0j-0003Ih-OK
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612369688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ffZYgMc721BhEE82tvIKaTbgMxEMJ9iMOqLFCcKCNsI=;
 b=Tc7ZAt3SkYrVnU3nA5laGi//zUtIkJfKQ+tUifx6Z95Jxwg5BS7P7qLUp3voiz1oX0eB9N
 9cxTuWpvWrqbGdk7lJghZ7+UfJW5OizbR+g9V4HEiDGfOL24rN0rzMP1B8nHQaHS7FWcl6
 R3TqXPtLNMGQeesL4HhiWzjfy85aahA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-DtzxIQqgOvaKFyDyI20y7g-1; Wed, 03 Feb 2021 11:28:07 -0500
X-MC-Unique: DtzxIQqgOvaKFyDyI20y7g-1
Received: by mail-ej1-f69.google.com with SMTP id yd11so29102ejb.9
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 08:28:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ffZYgMc721BhEE82tvIKaTbgMxEMJ9iMOqLFCcKCNsI=;
 b=Y1ntBS7+98G3JIXZe0UVdC1Y0rpGsFV4IBOKgs7VcJlyRvMLH3LMGA4vrXW+d/i1Ek
 WnNJO2cPiyfREt49PJM5ZhoS3WVwU5egxh/PY6JYZtSi7U5JXT5G6vsdb2oC6KfQtwVm
 +b/N/vQ/rMmsPhYrzOwbnwlUY4wHwFhzo/BILNzEOzFHorn8KPSnjXPyZ2xs7itUZ2gP
 S9lXFh58jn5Wf2vE9mK0PJxbDev5h+Q94wtmjxpQv9rq+m+083CQ4lw2qxwXke0P2xXb
 FCqUMDZEPqyc9el7kO03JQUUHP7rIEhLmiaO0oXkRT0zQnd7qi14l3yaxhxnzjpjIcAv
 4azQ==
X-Gm-Message-State: AOAM531AcW/9aVjwreWguejLgwNLLWHoHQxOtuDJw7fBu04JDa9pBwLS
 NpgLKiW8C9T+FJahNec+NEw5YmxYtk+u0PLRGKfwUYYDXBtpe0knxtEF2j2mXg/b1HBub/a8tyO
 Q6CIsX5IVvbK+wIZkUI/qTq5W0gEBj5Q1YgF0QzF9pY/9lTaXWMAPD3FnOtQfi5vd
X-Received: by 2002:a17:906:e15:: with SMTP id
 l21mr3924972eji.376.1612369685804; 
 Wed, 03 Feb 2021 08:28:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtzlR7BEidRap/6LPx22dNVdd2wH3qULRc44GLZghFPjPWMaP2A1b2ejBOJX9QoMkbyxzXNg==
X-Received: by 2002:a17:906:e15:: with SMTP id
 l21mr3924925eji.376.1612369685310; 
 Wed, 03 Feb 2021 08:28:05 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id p15sm1221945eja.61.2021.02.03.08.28.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 08:28:04 -0800 (PST)
Subject: Re: [PATCH 0/1] target/arm: Fix SCR_EL3 migration issue
To: avocado-devel <avocado-devel@redhat.com>
References: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <309537bf-6d2a-d004-4aa5-720982d944ff@redhat.com>
Date: Wed, 3 Feb 2021 17:28:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing avocado-devel for test idea.

On 1/28/21 3:31 PM, michael.nawrocki--- via wrote:
> The SCR_EL3 register reset value (0)  and the value produced when
> writing 0 via the scr_write function (set as writefn in the register
> struct) differ. This causes migration to fail.
> 
> I believe the solution is to specify a raw_writefn for that register.
> 
> Failing invocation:
> $ qemu-system-arm -machine vexpress-a9 -cpu cortex-a9 -nographic
> QEMU 5.2.0 monitor - type 'help' for more information
> (qemu) migrate "exec:cat > img"
> (qemu) q
> $ qemu-system-arm -machine vexpress-a9 -cpu cortex-a9 -nographic -incoming "exec:cat img"
> qemu-system-arm: error while loading state for instance 0x0 of device 'cpu'
> qemu-system-arm: load of migration failed: Operation not permitted
> 
> 
> Mike Nawrocki (1):
>   target/arm: Add raw_writefn to SCR_EL3 register
> 
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


