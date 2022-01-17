Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 363B049055A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 10:45:02 +0100 (CET)
Received: from localhost ([::1]:55566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9OZQ-0002wT-NI
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 04:45:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9OWf-0000lN-Qe
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 04:42:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9OWb-0007Ag-FG
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 04:42:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642412523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAGMPnFNso7dhLjbhkjmQTFs3Di4Pro5ysmINbgTdps=;
 b=F5ME/JobbRuFPjdKs74ruIr6g38e1c6bMXLcYDuLChZ45QDHirOUHrglUip9HkX5PFOeAW
 NH8ZM1kLJa1aVG5O2HZQWCs6xiQ+kRxeSbKvUPElW41ixefMH7VPXXiCJSCrgUfcsHQ4tW
 cYZYBLTHUrPDavIZNn98ls/ZesnqcW4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-Ba0LOmmsPYK_ED2hEjsVyw-1; Mon, 17 Jan 2022 04:42:00 -0500
X-MC-Unique: Ba0LOmmsPYK_ED2hEjsVyw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j6-20020a05600c1c0600b0034c02775da7so1200339wms.3
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 01:42:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CAGMPnFNso7dhLjbhkjmQTFs3Di4Pro5ysmINbgTdps=;
 b=JDvvyftiE4+Bp19QBm58bH7WoSpmVEeDHgy36jDFVYi1DvxgQIVU1MvOfmb76lrOdv
 BK6LLNQsbg9PUG3AzGr9yepo7B3ekxjDwE0AsNMS8CjTBKnLA3bKmEwIswUoZNct5hgJ
 W6ycdYwgMfE3+leXZ3Y91iCRVmv7RJRfzKIuvWwFl7yQEKj6OLSj3Le0DCJCpBlXM0It
 P13wIJI1uozvwO1HV0F9SwyaHPI4aZI8kaBdKcCkgB0eKECRB+tzbL5ujoN75pv3WZ+E
 W4yT5o6lDg0Je6juHCezaT8mwWT1k3OqJ877sTMA5MAzXMgccFwYBcpBUTgUBTHwSgzu
 nHXw==
X-Gm-Message-State: AOAM532jnNEnVP+57//SxycqZ4eisdl9o4U/xPkWIkdKg+ObY/Z/KwOJ
 7Qn+++uMNkArdTTjuywjI+H3TvCIcO4FEPbQAu3VaLbBCNcYsQZWnbaLNBxCxMLMBsyfqpgAMXh
 RlPRrTPpwete78ys=
X-Received: by 2002:a05:6000:2cb:: with SMTP id
 o11mr13449770wry.187.1642412519611; 
 Mon, 17 Jan 2022 01:41:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywJ4DpXyE46dC8W1PIxmVAaabVY0abnd5J3ZzUzSERGRF4Oct2R213UyAFSWViHei6i1FuNA==
X-Received: by 2002:a05:6000:2cb:: with SMTP id
 o11mr13449759wry.187.1642412519440; 
 Mon, 17 Jan 2022 01:41:59 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id o15sm13880427wro.70.2022.01.17.01.41.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 01:41:59 -0800 (PST)
Message-ID: <ef5e98d4-d8b2-fc6e-2735-53c075db3f3b@redhat.com>
Date: Mon, 17 Jan 2022 10:41:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: ui/cocoa.m compile error (Cocoa -> SDL)
To: Liviu Ionescu <ilg@livius.net>, Peter Maydell <peter.maydell@linaro.org>
References: <586FEC07-844C-4E1B-88E0-93B97FFC9010@livius.net>
 <CAFEAcA_=jn1G==9R1=LuU7GF0=LWPz92f1Qx9xO7w+m+TqL1Tw@mail.gmail.com>
 <F140E9AC-F44C-44A9-8670-F60E33046B83@livius.net>
 <574D1950-B892-430B-A450-23262C258950@livius.net>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <574D1950-B892-430B-A450-23262C258950@livius.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/01/2022 11.33, Liviu Ionescu wrote:
> I now have successful builds on all platforms, including on macOS 11 with Apple Silicon and macOS 10.13 with Intel, but I had to disable Cocoa support, and enable SDL support.
> 
> The resulting binaries (qemu-system-arm/aarch64/riscv32/riscv64) start, but I could not tell if the lack of Cocoa in the macOS builds has some disadvantages or not.
> 
> 
> Are there any emulated Arm/RISC-V machines that use graphics, so I can test my macOS binaries with?

Have a look here:

  https://www.qemu-advent-calendar.org/2018/#day-16
  https://www.qemu-advent-calendar.org/2018/#day-24

HTH,
  Thomas



