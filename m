Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E565377CD
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 11:47:29 +0200 (CEST)
Received: from localhost ([::1]:42962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvbzk-0005bL-Eb
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 05:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvbvK-00048S-T1
 for qemu-devel@nongnu.org; Mon, 30 May 2022 05:42:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvbvE-0005Q4-Tm
 for qemu-devel@nongnu.org; Mon, 30 May 2022 05:42:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653903767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JLG0vMQyB3kN8UxXmaBOKAyrSQXzPwwTK+tMaBfVSTQ=;
 b=BNd2ySX5AuabCFDIYFbDqo/RbgEtVoKSktyxDvn8Yca/cjc/xn7uqCM1sXMTjxR/WSjE8N
 M7UKs9iXwEOd/avEIuD9SyueaMn2eV4kUDeI9hCHwjqfJmFSbtZnHJKFpSDJlE2QGjHPuW
 PJwhrmAIoFtinO3gepZ0gUCsZbUpnhM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-zrVCU40yPTu4Lt56hlw6uA-1; Mon, 30 May 2022 05:42:46 -0400
X-MC-Unique: zrVCU40yPTu4Lt56hlw6uA-1
Received: by mail-qv1-f71.google.com with SMTP id
 kl23-20020a056214519700b0046200065604so7921594qvb.19
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 02:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=JLG0vMQyB3kN8UxXmaBOKAyrSQXzPwwTK+tMaBfVSTQ=;
 b=ZGzvNYLR09InypYafXQZ4e+bOJWDUaBGZMw9koJpBhfxMYQ9Y8IrHnBWXC0ltZNNUr
 rsLjMFgsOSGnjD1yCA4UPEJwthSjBCY2/IdtCM3DIHOOkBjmCEzwSitlkqNWTDs4LYwT
 +BMHSZG/0JS8WxphO4QSGySjW6r3xBLDk5629Dvg7OVRUx/anGZXZUitxSn/muWgfdp0
 2P60RHzFTmWOdP0iUXX6ThBy84m9ccd3XWFmzvTKPMeL0YVqL43wnXE1fjPWHB/tqlvu
 iYoLyX688+82HXyzE6r7aXEQiuLlGOJs0EewLfQBKVGE5T57Wx23hqVGEkKCZ4ert5I/
 crVw==
X-Gm-Message-State: AOAM533aqRWiCoC290GOZKNWzXpxaEIr8GrpYx4nTqwkkEeWfF8xvoWt
 2kfBu/liIiCfRTXQgPn0l1Hq8QerELESNhqy+JXnKkGRXu7AwwJWHI3GjdbLQ5WlkcGT76CzIsh
 Xv1IOqniRBbKJxtM=
X-Received: by 2002:a05:620a:28c3:b0:6a2:f6b8:d7a with SMTP id
 l3-20020a05620a28c300b006a2f6b80d7amr36215314qkp.440.1653903765824; 
 Mon, 30 May 2022 02:42:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9/oSNL1z4IIe5Q95xwn/00M4f2//P4Xx/QQxWgEDgmtSuzdwiLnV4MpEeu7kmQB3M3pqsYw==
X-Received: by 2002:a05:620a:28c3:b0:6a2:f6b8:d7a with SMTP id
 l3-20020a05620a28c300b006a2f6b80d7amr36215301qkp.440.1653903765578; 
 Mon, 30 May 2022 02:42:45 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-216.web.vodafone.de.
 [109.43.179.216]) by smtp.gmail.com with ESMTPSA id
 h8-20020ac87d48000000b00304b3c600bbsm1156449qtb.65.2022.05.30.02.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 02:42:45 -0700 (PDT)
Message-ID: <bbab97ff-c24f-7318-ed83-218e52481451@redhat.com>
Date: Mon, 30 May 2022 11:42:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Cedric Le Goater <clg@kaod.org>
References: <20220516204913.542894-1-mst@redhat.com>
 <20220516204913.542894-76-mst@redhat.com>
 <96abb644-4031-7d7f-db45-6376f8f74161@gmail.com>
 <de56b35-c77-e979-b8bd-17c439f4b56d@eik.bme.hu>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL v2 75/86] include/hw/pci/pcie_host: Correct
 PCIE_MMCFG_SIZE_MAX
In-Reply-To: <de56b35-c77-e979-b8bd-17c439f4b56d@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/05/2022 17.54, BALATON Zoltan wrote:
> Hello,
> 
> On Thu, 26 May 2022, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> This patch broke the boot of the sam460ex ppc machine:
>>
>> qemu-system-ppc -M sam460ex -kernel 
>> ./buildroot/qemu_ppc_sam460ex-latest/vmlinux \
>> -device virtio-net-pci,netdev=net0 -netdev user,id=net0 -serial mon:stdio \
>> -nographic -snapshot
>> qemu-system-ppc: ../hw/pci/pcie_host.c:97: pcie_host_mmcfg_init: Assertion 
>> `size <= PCIE_MMCFG_SIZE_MAX' failed.
> 
> Thanks for noticing this. I usually only test it during the freeze. Wasn't 
> there a test patch submitted by Philippe before? Isn't that yet merged or 
> included in CI? That should catch these before breaking it.

Seems like there is only the (primitive) boot-serial test so far:

$ grep -r sam460ex tests/
tests/qtest/boot-serial-test.c:    { "ppc", "sam460ex", "-m 256", "DRAM:  256 MiB" },
tests/qtest/boot-serial-test.c:    { "ppc64", "sam460ex", "-device e1000", "8086  100e" },

If there is a guest kernel available for public download somewhere,
it would be great if you could add an avocado test for this machine
(see e.g. the tests/avocado/ppc_*.py files for a template).

  Thomas


