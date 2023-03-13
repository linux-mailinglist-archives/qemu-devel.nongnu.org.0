Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A0B6B7D40
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 17:18:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbksS-0007lq-Rx; Mon, 13 Mar 2023 12:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbksQ-0007ke-De
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 12:18:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbksO-0003GX-Js
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 12:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678724299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSo4xVo5ehPbyf2cRBm7ZiNYdv/t7XfvXGro2zIAOjA=;
 b=Dn6wj8smCbhkcDcYgbDtPw40rvgzF7IYFY70BJzL58ozWegYzbhj+Zt0SF3i+lPcfLR1OW
 uBce8S09fOuKnJyClEu3xmqpfi8zaYRd/rc4nZRN60mSchDSyw5G3FgCsGhvDa1k1sbnZW
 wZGb95vPpAfdqvjetJTlZV1TY8LSVs8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-EqSOZh5wO6ahCqGhCb16yw-1; Mon, 13 Mar 2023 12:18:17 -0400
X-MC-Unique: EqSOZh5wO6ahCqGhCb16yw-1
Received: by mail-wm1-f69.google.com with SMTP id
 m28-20020a05600c3b1c00b003e7d4662b83so8028474wms.0
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 09:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678724296;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uSo4xVo5ehPbyf2cRBm7ZiNYdv/t7XfvXGro2zIAOjA=;
 b=W2bG14Sop897FbednwrVw/z0vwPadl9My6W4A02bS98fhcSVFy7zRx4GJ3fRu3pdPH
 XTT005mU4+MoGjh7p58/W4AePvgfVC7A5tZ/EBQZeReZLoTiONptGH+tfcgXMbTroMEe
 +sn93xwnUcgMcms7Pc8AHhraD03sfADDtGs7cSDd5aU8X5EjHAX+42VzQK7tT4NPLQJ+
 LGdB8+aId5qVwW+V3P6xRIMW5ee0muAVA9rbV7SVw3mT1m/2bkCiqgI5XjbLFKLC276Z
 2f3/96BaTOqjARTLPvCGoyJHMJRFTpvWCP8zBoUxVi6gmNWomLz1OE+YJtBIHvwmeRLk
 OglQ==
X-Gm-Message-State: AO0yUKU8X3o47ZIcgOs0oA20ZovZ1RsIMMRF8AZrixcpicFZ/wcPAZm1
 46FT+jn7eCwraOjJqM3lSfgmbSMNJlM8uf2IgaeTKP182R4U2/4r+OKjll0z/YV5EAWcb7XdMzG
 UWaLn8AFG/hRoeDk=
X-Received: by 2002:a05:6000:111:b0:2cf:e29f:d7f5 with SMTP id
 o17-20020a056000011100b002cfe29fd7f5mr1708700wrx.25.1678724296469; 
 Mon, 13 Mar 2023 09:18:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set8fWtfqnuVkV7FetIkDmab08nMCX2O0V+CtUObDZ2n8z5Z01sUlxjDb37wAbyEdj3pcEBL9hw==
X-Received: by 2002:a05:6000:111:b0:2cf:e29f:d7f5 with SMTP id
 o17-20020a056000011100b002cfe29fd7f5mr1708678wrx.25.1678724296233; 
 Mon, 13 Mar 2023 09:18:16 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-26.web.vodafone.de.
 [109.43.179.26]) by smtp.gmail.com with ESMTPSA id
 s6-20020adfecc6000000b002c5534db60bsm8388501wro.71.2023.03.13.09.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 09:18:15 -0700 (PDT)
Message-ID: <58b400ee-bc9a-d762-5b34-b564e8edd6d5@redhat.com>
Date: Mon, 13 Mar 2023 17:18:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v7 0/6] memory: prevent dma-reentracy issues
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
References: <20230313082417.827484-1-alxndr@bu.edu>
 <c61ecf23-d055-01a8-b2d7-37367c4c1f63@redhat.com>
 <20230313145228.6hcgsuobgaxbyr5o@mozz.bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230313145228.6hcgsuobgaxbyr5o@mozz.bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/03/2023 15.52, Alexander Bulekov wrote:
> On 230313 1502, Thomas Huth wrote:
>> On 13/03/2023 09.24, Alexander Bulekov wrote:
>>> v6 -> v7:
>>>       - Fix bad qemu_bh_new_guarded calls found by Thomas (Patch 4)
>>>       - Add an MR-specific flag to disable reentrancy (Patch 5)
>>>       - Disable reentrancy checks for lsi53c895a's RAM-like MR (Patch 6)
>>>       Patches 5 and 6 need review. I left the review-tags for Patch 4,
>>>       however a few of the qemu_bh_new_guarded calls have changed.
>>
>>   Hi Alexander,
>>
>> there seems to be another issue with one of the avocado tests:
>>
>>   make -j8 qemu-system-aarch64
>>   make check-venv
>>   ./tests/venv/bin/avocado run \
>>     tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_raspi3_atf
>>
>> ... works fine for me with the master branch, but it fails
>> for me after applying your patch series.
...
> Do the avocado tests exit on failure, or do you know if there are any
> other test failures?

I noticed it in the gitlab-CI, the test was hanging and got marked as 
"INTERRUPTED":

  https://gitlab.com/thuth/qemu/-/jobs/3922243532#L214

As far as I could see, this was the only new failure there. There is another 
one in the avocado-system-fedora job here:

  https://gitlab.com/thuth/qemu/-/jobs/3920337136#L307

... but I think that was pre-existing and was caused by one of Philippe's 
reworks, hopefully to be fixed soon ... Phillipe?

  Thomas


