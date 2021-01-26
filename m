Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B84303B29
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:09:31 +0100 (CET)
Received: from localhost ([::1]:35490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4MDy-000846-S8
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:09:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4MCs-0007Jg-IT
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:08:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4MCo-0005Bz-Io
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:08:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611659297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZTTEpKcD+tbM7sw4amfOzJjfEAIOiUFF37U7DqbNnog=;
 b=gON1wTBK9leZwKUJLRWifDfcfsrFF0flJCi852Nm9pEBZQKd4HT19CYTD/cCAcKxXRs8pb
 nzRH6th7vicEBR1pDMc99f1Fb2/tAxAmoKo7/Lcby7I+IoHLTciOij6jci9hhcrbLCEEPX
 J7UxAUYZ/9O0JtFcQmYMYiXKDulfKp4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-ky0nRSWsPNOr-bzykjpaVA-1; Tue, 26 Jan 2021 06:08:12 -0500
X-MC-Unique: ky0nRSWsPNOr-bzykjpaVA-1
Received: by mail-ed1-f69.google.com with SMTP id w4so9189960edu.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 03:08:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZTTEpKcD+tbM7sw4amfOzJjfEAIOiUFF37U7DqbNnog=;
 b=IM0wieVV2XVte5/Q3ESsELA7cAJ++BHZ0lBF0J/Xp5jfh8sIEMvIfIePX0qJrzUQCu
 Jt2aBfB2MDLMf66NkvwJFJlV7UIekDgbRh+LtBnN78xnPXeujMOWxZ7Qn1Kmj3DS1DJ2
 41KulOZ/OF7ho5WYxWnzPNfLvOePPcIydYC03jfNWWq18IPDtws4/XdFlyD9wLQ261Mc
 y69+2byqQfMZd5/winOBwwURQil+ZGLIH2p/3egRHKo0Y6HCnkVTAMlh0+HDxB/05wa5
 irxhaEApdhs6NHB5P2unETZLFIqlmnLNlBYDpvvcTcWZ8V3TgNHAWZT4obbRSDjlcP4X
 t4/A==
X-Gm-Message-State: AOAM533ppM5ZjGlN+opvxFJZJFxcJGkCh7fYiAXsT050y01MTIg2Xk7x
 bm9fbB0c547QlEI1ib9uIC1wPIJUiaFgcQZsmqN4t8K/aaFO92uXoGy8VZtDHCr6lvqw9Nbwi9/
 D8FLe8l3RiZFpR0E=
X-Received: by 2002:a50:fe85:: with SMTP id d5mr4332902edt.140.1611659290846; 
 Tue, 26 Jan 2021 03:08:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4pGmc6d6UMD+pCMJKmlyICp6v5vIJSciVSFh5CUiK9HwMP2xb3IB9RduEBMbuhntW42ljaw==
X-Received: by 2002:a50:fe85:: with SMTP id d5mr4332893edt.140.1611659290725; 
 Tue, 26 Jan 2021 03:08:10 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u3sm7727042eje.63.2021.01.26.03.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 03:08:09 -0800 (PST)
Subject: Re: [PATCH 3/4] tests/qtest: Only run fuzz-megasas-test if megasas
 device is available
To: Alexander Bulekov <alxndr@bu.edu>
References: <20210115150936.3333282-1-philmd@redhat.com>
 <20210115150936.3333282-4-philmd@redhat.com>
 <20210115223952.w4ekl54zyfj3wxyc@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ea633892-952c-d7c7-baf2-56f0f11b629e@redhat.com>
Date: Tue, 26 Jan 2021 12:08:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115223952.w4ekl54zyfj3wxyc@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Hannes Reinecke <hare@suse.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 11:39 PM, Alexander Bulekov wrote:
> On 210115 1609, Philippe Mathieu-Daudé wrote:
>> This test fails when QEMU is built without the megasas device,
>> restrict it to its availability.
> 
> Should we just make a separate directory for fuzzer tests and have a
> separate source file for each reproducer (or for each device)? That way,
> we avoid confusion about what to do with new reproducers: they always go
> into e.g. tests/qtest/reproducers/device_name.c 

Yes probably. Do you mind sending a patch series?


