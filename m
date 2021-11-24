Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBB145C017
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:02:04 +0100 (CET)
Received: from localhost ([::1]:49422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpruU-0003O5-Ox
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:02:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mprs1-0002aA-2i
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 07:59:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mprrx-0003Zn-U5
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 07:59:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637758765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2v0RZyQ2ex1dLuCff6zydGX96rL9uklFMfekO9B0xuw=;
 b=bVn0Fp3xNxFDOJGcCh8XxX3P0E60KNgj30Os7wPdWcfFgjoenaxFxET04KwATpKJ9rlgJ1
 X+jSHNcDTliLaeE+2uKV8+ehx1O/YSYtvcpN9xDq+ob/5Mos8xDb/sazbk2buRCgjNw8jr
 kQfDtol8kCuwcXI8MkLlES8GrhqQCHU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-618G9zjIPO-MLBrXuw4J_g-1; Wed, 24 Nov 2021 07:59:24 -0500
X-MC-Unique: 618G9zjIPO-MLBrXuw4J_g-1
Received: by mail-wm1-f71.google.com with SMTP id
 a64-20020a1c7f43000000b003335e5dc26bso1293265wmd.8
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 04:59:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2v0RZyQ2ex1dLuCff6zydGX96rL9uklFMfekO9B0xuw=;
 b=IbPKiwEi81qZrBxHpuCIyz83pfUpXRMhs7kaL59zQAAXlwN8HtS8uCUrGUGyV1aTFn
 ITH43xzf/12cB7Hl/ax2QxEtSKbJS1kfqO/Sss3frMlxeugU46hLaSpgSXVTNqI1hMjg
 n4ZMhj79bDkoWEdpvTVars6CD2HKtjwNNrN6K3ffPrCzwkuMdgGsYQ+zBr9+GWPWo9En
 1mdOB+s11/ACR0Jtoy/9FrOLzWuqnVTF/PEsy+cZUFcnP4DGpo+aiyxsvgWdsUj7TtAh
 WoUL45ar19tb6Xr9EUtbtm6LlJghloUCJ2aZwXQHmnA9MjEbUwzu8//t0pA9CAbjzIQD
 F5tQ==
X-Gm-Message-State: AOAM530Is5ANUFQVBQXAkT43O08GAxF1B/HfxDrch+m5FosGxCUFB1tf
 fVEoiF7dZwDEfaunKbFv5ODQvx2fGhtqo6vkzEIUs1f+SVff2/Ut9uazGJzqjw60slK4TAT/Udl
 WImcqurbAqWOLECQ=
X-Received: by 2002:a5d:53cb:: with SMTP id a11mr18198913wrw.357.1637758763156; 
 Wed, 24 Nov 2021 04:59:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbcNxJvq1vL/kTQwbjoMGnf9PaYmlyU5QHgWV/e32Wo7cKeCIRvCQBXuUYahEMIVUkd48jRA==
X-Received: by 2002:a5d:53cb:: with SMTP id a11mr18198868wrw.357.1637758762884; 
 Wed, 24 Nov 2021 04:59:22 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p5sm1104748wrd.13.2021.11.24.04.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 04:59:22 -0800 (PST)
Message-ID: <8c6f8f6b-7098-c4e7-2f8e-836d1459763e@redhat.com>
Date: Wed, 24 Nov 2021 13:59:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/6] tests/docker: Update Fedora containers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211103144844.1285634-1-jsnow@redhat.com>
 <YZ4tuO2tJKdT7FP3@redhat.com>
 <9fa0d8bb-9f64-539f-c579-f26d6013207e@redhat.com> <87lf1dhg19.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <87lf1dhg19.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Alexander Bulekov <alxndr@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 13:51, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> Cc'ing Alex.
>>
>> On 11/24/21 13:19, Daniel P. Berrangé wrote:
>>> On Wed, Nov 03, 2021 at 10:48:38AM -0400, John Snow wrote:
>>>> Fedora 33 will be EOL before 6.2 ships; Fedora 35 was just
>>>> released. Update our various containers to test on F34 and F35.
>>>>
>>>> Fix a minor code warning issue that surfaces in a new version of Clang,
>>>> and fix a small deprecation issue for the latest version of spice.
>>>>
>>>> In testing, I found that oss-fuzz was more likely to time out on GitLab;
>>>> it's unclear if this is a performance regression or just getting unlucky
>>>> with when I test.
>>>
>>> For me it times out every time on Fedora 35. In fact if I run it
>>> locally, it doesnn't even finish after 24 hours ! There's a real
>>> bug in there somewhere.
> 
> Is there an other spin of this series coming? I saw there were some
> comments to address so I didn't look in detail myself.

I meant Alexander Bulekov for oss-fuzz :)


