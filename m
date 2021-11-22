Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E485E458CD4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 11:58:18 +0100 (CET)
Received: from localhost ([::1]:40254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp71e-0007my-1P
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 05:58:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mp6nY-0002Mm-Ei
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:43:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mp6nT-0007lb-N8
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:43:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637577817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLZX75B5fgr8MgsphElsYjdhalZ6ezFsowpxr5UWbVI=;
 b=heOP+4bXAs1lKUE2C0TEyMRUjKD20GeGWSJ4BKcxm8xRHnC0Aqcl29lWHTP/DVpkT8+Xni
 Am2EFbp1hSlJ8qmh5H3moDLxM9as8wMbt0SRwbo9VyPX+O/Z1GswbxInCm052qQvsqEskj
 etNbYx78JlKxnFki9ptsh5JfgO678WE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-binHNC85NvqAlTinvBg55w-1; Mon, 22 Nov 2021 05:43:36 -0500
X-MC-Unique: binHNC85NvqAlTinvBg55w-1
Received: by mail-wm1-f71.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so9159277wms.7
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 02:43:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XLZX75B5fgr8MgsphElsYjdhalZ6ezFsowpxr5UWbVI=;
 b=7v1f0TdPNKTB625X9vC8q5HhN0R3sMa+Pe0aJl5SJD+bTAdUsLdtPWu2IUIeOqKlMJ
 4qn0wIpZYpCdVDox7I6jhA4oUdDeORAXDxKi/pvSJZxv8N+I3NHioRMqDXD9WQwA/Ry5
 NTMIF1+4avMfsdcHtRrvvTdnti5NI1EPlJpUgeinNO+PPJgQnkgcDFKK9vyOxa6MVlB7
 irE8CHwanx37MNdk0+ITciUlMkDnO+TqwQDJisaGlhTrCX550SMnxAzWg/9Bj2vhNta7
 BZ8XZNLM7YLBv3UBfsy+fLoKfy05pC0N2zCMGJqX+XhCa2UZhPLQfKI6cHmKkBgOSDCW
 SsDg==
X-Gm-Message-State: AOAM532g/gCqjboBX/YiUw4Gr4fb4ixOYdvfs8E2xmIDq62eH9zayT8o
 wT/J98lw6EeZ9vuepETKyWiueFVfP3CFQMTWuZBginNVSf6BApBc59tngu5BgN/FAstBLyhfjsE
 DS9weMAGeVqfjTSM=
X-Received: by 2002:a05:600c:2297:: with SMTP id
 23mr27487847wmf.73.1637577815238; 
 Mon, 22 Nov 2021 02:43:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjyslzWhSrW697w4dGpdHU4huD0YzZPqI39U8qDu3ChGVLln9fvUSssSUFiZYRFRiRbb69QA==
X-Received: by 2002:a05:600c:2297:: with SMTP id
 23mr27487819wmf.73.1637577815033; 
 Mon, 22 Nov 2021 02:43:35 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id l7sm10298396wry.86.2021.11.22.02.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 02:43:34 -0800 (PST)
Message-ID: <3a0d2ef9-6175-c735-44c2-048991a00a24@redhat.com>
Date: Mon, 22 Nov 2021 11:43:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-6.2] Fix some typos in documentation (found by
 codespell)
To: Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20211117210702.1393570-1-sw@weilnetz.de>
 <2130deed-8f14-05fb-5da1-3c86744bbffb@redhat.com>
 <37b8b2dd-89c0-ed8e-1c8e-cd591b133b7d@weilnetz.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <37b8b2dd-89c0-ed8e-1c8e-cd591b133b7d@weilnetz.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/11/2021 11.15, Stefan Weil wrote:
> Am 18.11.21 um 00:27 schrieb Philippe Mathieu-Daudé:
> 
>> On 11/17/21 22:07, Stefan Weil wrote:
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>> ---
>>>   docs/devel/multi-process.rst            | 2 +-
>>>   docs/devel/qgraph.rst                   | 2 +-
>>>   docs/devel/writing-monitor-commands.rst | 2 +-
>>>   docs/hyperv.txt                         | 2 +-
>>>   docs/system/cpu-models-x86.rst.inc      | 2 +-
>>>   docs/system/devices/nvme.rst            | 2 +-
>>>   docs/system/gdb.rst                     | 2 +-
>>>   docs/system/ppc/ppce500.rst             | 2 +-
>>>   docs/system/riscv/shakti-c.rst          | 2 +-
>>>   9 files changed, 9 insertions(+), 9 deletions(-)
>>> diff --git a/docs/system/cpu-models-x86.rst.inc 
>>> b/docs/system/cpu-models-x86.rst.inc
>>> index 6e8be7d79b..884b6d20fb 100644
>>> --- a/docs/system/cpu-models-x86.rst.inc
>>> +++ b/docs/system/cpu-models-x86.rst.inc
>>> @@ -49,7 +49,7 @@ future OS and toolchains are likely to target newer 
>>> ABIs. The
>>>   table that follows illustrates which ABI compatibility levels
>>>   can be satisfied by the QEMU CPU models. Note that the table only
>>>   lists the long term stable CPU model versions (eg Haswell-v4).
>>> -In addition to whats listed, there are also many CPU model
>>> +In addition to what's listed, there are also many CPU model
>>>   aliases which resolve to a different CPU model version,
>>>   depending on the machine type is in use.
>> For a non-native English speaker, this is clearer:
>>
>> "In addition to what is listed"
> 
> 
> I agree. Maybe Paolo or whoever applies that patch can change that detail.

I'm currently assembling a pull request for doc updates, and will add you 
patch there (with the "what is" fixed).

  Thomas


