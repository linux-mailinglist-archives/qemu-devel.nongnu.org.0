Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE1932D4CB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 15:04:44 +0100 (CET)
Received: from localhost ([::1]:59400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHoap-0000fl-KG
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 09:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHoWX-0005eX-1t
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:00:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHoWS-0002OQ-8B
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:00:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614866411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6o+jcZZN6eo4AqcV0HKBitsfBYNJtOY3nbuWiDlz60I=;
 b=KKDU/zBGxeb9TGtMXEqBbWWN98kXvVwNsIDNWQpW+G/Cq1xaiNwASwGT8RwwWwbpwJhCIc
 YExijGtZXCrhvzbWJMsomuqIOlQGhMf1FJKN17YqGxd97raMFT/LlmKJWDwJO5a/kJdWJb
 6SUPMCwRSFC7zPe6MVMtCo4D3a2B6Tk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-IhCn1oQNMbGTDOydHrgkjQ-1; Thu, 04 Mar 2021 09:00:07 -0500
X-MC-Unique: IhCn1oQNMbGTDOydHrgkjQ-1
Received: by mail-wr1-f70.google.com with SMTP id f3so7579870wrt.14
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 06:00:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6o+jcZZN6eo4AqcV0HKBitsfBYNJtOY3nbuWiDlz60I=;
 b=liPhHKJDznXR+NOrPkn7C0hXJJugZGDkxy3AJTaEtCFeI2NpqsQjE5NC8/Kf0Hxj1S
 8BJrBy+Hf1JfYUrxbmBh0qV51iAXi0dCej+HjgiO2alqDHnDxfiClhkG7+EQ8R6MScN2
 RMYvnvBxrwFNwKXAFTxDU7oQTWN+G4fiqAKnRtD0aDVAh8r/6XbfHpBvo293/KYTg4rF
 Q0qjP3EIEzqqthBjN1Za2M3JlwLGrJ91NOnkbu4PjOhbzkXEQ+n6SpzRBLt55WAsAg/w
 xXDYtKwo0GMEJpIPPsp2PRcYNpC2r9GynJDzToArIVC0gOEwMOhsmf0IAj0HFZBdTAKx
 lWBg==
X-Gm-Message-State: AOAM533Tc540ZS+AucjExn3pD7I06rYyCx4MR1e7oAhm2nViCd3HWEk7
 shVrDZRhqrVkBu0lO3lk3sGtSCEDUdesotb3XKFHzf4fBvf9ap0wpdW1r3YqNoR6nGW0lDC2jYw
 nipbPe+d2rrp3D1Y=
X-Received: by 2002:a1c:3b43:: with SMTP id i64mr3289307wma.43.1614866406480; 
 Thu, 04 Mar 2021 06:00:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwd22pQxwvmwtxk87QDUxzsceni/sl4hBGqYfBxkmNoCVovnpETORanp1e5otpPIHWrdlydnw==
X-Received: by 2002:a1c:3b43:: with SMTP id i64mr3289291wma.43.1614866406326; 
 Thu, 04 Mar 2021 06:00:06 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c9sm9794850wmb.33.2021.03.04.06.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 06:00:05 -0800 (PST)
Subject: Re: [PATCH] docker: Base Fedora MinGW cross containers on the base
 Fedora image
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210303124222.1485332-1-philmd@redhat.com>
 <YD+FJarhR1yTWI0G@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <138832dc-9340-2a9f-1dc8-b20cc0637c5e@redhat.com>
Date: Thu, 4 Mar 2021 15:00:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YD+FJarhR1yTWI0G@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 1:46 PM, Daniel P. Berrangé wrote:
> On Wed, Mar 03, 2021 at 01:42:22PM +0100, Philippe Mathieu-Daudé wrote:
>> The only difference between fedora-winXX-cross.docker and
>> fedora.docker is the specific QEMU_CONFIGURE_OPTS environment
>> variable. All the rest can be inherited from the generic Fedora
>> image.
> 
> This is relying on the base Fedora image already having the
> mingw packages installed. My series to automate creation of
> the container dockerfiles removes those entirely, so we have
> strictly separate native and mingw images for Fedora:
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg03123.html

I'm a bit confused. So instead of having one single big image,
you prefer to have multiple ones.

I stopped using the fedora-winXX-cross because they lacks ccache,
and the "big" fedora image contains the mingwXX toolchains.

I'll wait you respin your series and test the new created containers
to see if they fit my needs.

Thanks,

Phil.


