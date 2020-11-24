Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC262C2BF1
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 16:52:05 +0100 (CET)
Received: from localhost ([::1]:34426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khabs-0005zK-PJ
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 10:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1khaZh-0004qW-OK
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:49:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1khaZf-0004hf-KR
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606232986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jrB8q7gh15Do0NOFXmutFn0qRh1M2nu4mfZzuZzdcVc=;
 b=SZTF9G8fb3iBJoqvIDYbU8klRV6476o1iWVUp1nmIWGzQoGnooh4MuddF9XFnfmEOwHErX
 pAKbR2WEzqNU4kPESyegzArI9ApNiSWRmLjMoFIe8y/hb5morhxulZv2cv4OfoTDLpXLNv
 FXOfWN9o1bScFvSFrbL0R/ccJY9OoIo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-EJZeTdwCNAauVpR6Q4fmLw-1; Tue, 24 Nov 2020 10:49:44 -0500
X-MC-Unique: EJZeTdwCNAauVpR6Q4fmLw-1
Received: by mail-wm1-f70.google.com with SMTP id j62so1374614wma.4
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 07:49:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jrB8q7gh15Do0NOFXmutFn0qRh1M2nu4mfZzuZzdcVc=;
 b=Cz/AOGskoa4z3927PdS3QUpuFYJdzz5MTcjEhElkzb3Pe/bf8ZAiEbmMytk5/w6hMy
 YHxx0zlZHbKoW75MM69Og6YXsIBLwUIVnmWjvYIG57sJFMXJVPursqx23OHjLFaUt0zT
 67d3/yyrASKz/kbAO/Gd2mZE1OVb1/I1V5q6lbmA/2x3JG0yTpRBLRZcFDFX6RXHpyJn
 b/Orz4oEY4gDjP/YA0FWZ8U/9TrrUy9ysJ2xmVYXnnFEZkxp5pOFHqrnFPVjURTGK9Sw
 coHlaSYnP/Yf1Nc8KcjaAMltVaKDzGJVfV9Dd4tqkrR10frDxH78zoSEFar0N4VeVkra
 tmeg==
X-Gm-Message-State: AOAM530MsJkKy/4IeOFFZVXaD8mQ1jIVSMdhUbG7IWAlYTaxR6Gr4euV
 3bsUgVj1klBqpsU6knKFMs7kSRos6rQmBJGOMrgLnHh9zt95dhWYsPZ+B/rY9NywIw6LQ7y4wxn
 F8/f6hA4+FhAvg+M=
X-Received: by 2002:a7b:c409:: with SMTP id k9mr5073148wmi.157.1606232982756; 
 Tue, 24 Nov 2020 07:49:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0YxMmnWp4X/JI/siivhTiQ83xmO+IN2AMMyAEkWIN8afm5sKirZA8Bg2CHRRdfD1tMzzOiQ==
X-Received: by 2002:a7b:c409:: with SMTP id k9mr5073129wmi.157.1606232982531; 
 Tue, 24 Nov 2020 07:49:42 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id j8sm26642335wrx.11.2020.11.24.07.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 07:49:41 -0800 (PST)
Subject: Re: [PATCH for-5.2] Revert "hw/core/qdev-properties: Use
 qemu_strtoul() in set_pci_host_devaddr()"
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201120130409.956956-1-mst@redhat.com>
 <f328f4c0-04b9-49e7-46f8-1435f8564042@redhat.com>
 <5b9724ca-cc73-e89f-0026-805b61f7cad9@redhat.com>
 <20201124150623.GP2271382@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ce671416-3e78-b3ac-a71a-f87e94be21cc@redhat.com>
Date: Tue, 24 Nov 2020 16:49:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124150623.GP2271382@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Geoffrey McRae <geoff@hostfission.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Klaus Herman <kherman@inbox.lv>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/20 4:06 PM, Eduardo Habkost wrote:
> On Tue, Nov 24, 2020 at 03:13:14PM +0100, Philippe Mathieu-Daudé wrote:
>> On 11/20/20 2:10 PM, Paolo Bonzini wrote:
>>> On 20/11/20 14:04, Michael S. Tsirkin wrote:
>>>> This reverts commit bccb20c49df1bd683248a366021973901c11982f as it
>>>> introduced a regression blocking bus addresses > 0x1f or higher.
>>>> Legal bus numbers go up to 0xff.
>>>>
>>>> Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
>>>> Fixes: bccb20c49df ("Use qemu_strtoul() in set_pci_host_devaddr()")
>>>> Reported-by: Klaus Herman <kherman@inbox.lv>
>>>> Reported-by: Geoffrey McRae <geoff@hostfission.com>
>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>> ---
>>>>
>>>> checkpatch will complain since it does not like strtoul but
>>>> we had it for years so should be ok for 5.2, right?
>>>
>>> Yes, of course.
>>>
>>> Paolo
>>
>> Which tree is going to merge this patch?
> 
> Sorry, I was expecting Michael to merge it, as it's PCI-specific
> but it looks like people were waiting for me to merge it.
> 
> I'll merge it and submit a pull request ASAP.

Thanks!


