Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EEE69B2C3
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 19:58:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT5vN-0007R4-K9; Fri, 17 Feb 2023 13:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pT5vM-0007Qo-4y
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 13:57:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pT5vK-0008S2-Lr
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 13:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676660254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t6ROWSIjVF1DpUHydtrU5JMxqvnOdLEF5CYHu22z/To=;
 b=McG5Edf3oLQ//fOREn2BQue/I7oebQ37FIVbtYkb1mJdbdWb7SSaKDtoIWT0FWXivwXDDH
 G6wVl0+vYeY0PvQvWLwMpxGpFDLrTGrTgjYoIPwstB1xGXDpn9I4dYDN1KUN8kXCFIj2Hn
 64cKJEdOujnrSQWyVK5uDyCjkBxbtbg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-335-6xpBwZ9hMpm2_vSxjko4zA-1; Fri, 17 Feb 2023 13:57:32 -0500
X-MC-Unique: 6xpBwZ9hMpm2_vSxjko4zA-1
Received: by mail-wm1-f71.google.com with SMTP id
 v6-20020a05600c444600b003e206cbce8dso1106053wmn.7
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 10:57:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t6ROWSIjVF1DpUHydtrU5JMxqvnOdLEF5CYHu22z/To=;
 b=Py4KzUkgDPtrtcBrbF2a9JjlqXFpl4HJfwczanuC1FGX0HOX2cgT/x2ERzf127Vegr
 T9dXejpkkTnw5xlaAz0uDFmgPL/2cmmCNN++9KjHaH81bA/aCB6TAOhF2ye5/Wc7xgTe
 F+qWsimmKzuM7MyJJ0rB7V9dfC1S3KDNzVrniJcsg1+1dis097onr4D1NzFgUYmnSB18
 jiNlkjzo1zBvcGa5XzjQcecMtMlPo4SnqNiDQeHhbUoeu7KRJBn6i/8FYJzzmdR5DoyQ
 4iq/VraqlUJH1GJlb2DjqZU3pERdwrPvAYMlEg+iekNoXOmBmoanV2honyOKi52s6wcF
 Z1WA==
X-Gm-Message-State: AO0yUKWaVAmFVL0gXwm7Ss8F6XsrsuQjd5mkXNWJiBv/L84dLS1YRi+F
 5a122w0NKCOKjz+mjZsjsNcYGqDNaw+64w7Z5GppiefSHBjcvTA+Su4s4t1qcD+gGJ/t62vcx4E
 PfYQp0qp2slU9EiU=
X-Received: by 2002:adf:f749:0:b0:2c4:873:16b4 with SMTP id
 z9-20020adff749000000b002c4087316b4mr1897452wrp.16.1676660251825; 
 Fri, 17 Feb 2023 10:57:31 -0800 (PST)
X-Google-Smtp-Source: AK7set9jDKuyLS6QEtdUE5bC7qQrGycOV8iwpZxX3PJh31GQFn+LfQxQ+qbUC1h2QeMdOIol1xRagw==
X-Received: by 2002:adf:f749:0:b0:2c4:873:16b4 with SMTP id
 z9-20020adff749000000b002c4087316b4mr1897435wrp.16.1676660251582; 
 Fri, 17 Feb 2023 10:57:31 -0800 (PST)
Received: from [192.168.8.104] (tmo-110-21.customers.d1-online.com.
 [80.187.110.21]) by smtp.gmail.com with ESMTPSA id
 x8-20020a5d54c8000000b002c5503a8d21sm4938510wrv.70.2023.02.17.10.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 10:57:30 -0800 (PST)
Message-ID: <113c15a8-689c-de03-7543-5548b7c658e6@redhat.com>
Date: Fri, 17 Feb 2023 19:57:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 Stefan Weil <sw@weilnetz.de>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Brad Smith <brad@comstyle.com>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <87a61cbmti.fsf@pond.sub.org> <Y+9bSHshiNnek31J@redhat.com>
 <b55b506e-5a73-329a-24ee-14eafc5a95c1@redhat.com>
 <72bd7694-9d37-1f9b-db4e-6d5818f7c55c@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <72bd7694-9d37-1f9b-db4e-6d5818f7c55c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 17/02/2023 18.43, Philippe Mathieu-Daudé wrote:
> (Cc'ing Huacai & Jiaxun).
> 
> On 17/2/23 17:38, Paolo Bonzini wrote:
>> On 2/17/23 11:47, Daniel P. Berrangé wrote:
>>> On Fri, Feb 17, 2023 at 11:36:41AM +0100, Markus Armbruster wrote:
>>>> I feel the discussion petered out without a conclusion.
>>>>
>>>> I don't think letting the status quo win by inertia is a good outcome
>>>> here.
>>>>
>>>> Which 32-bit hosts are still useful, and why?
>>>
>>> Which 32-bit hosts does Linux still provide KVM  support for.
>>
>> All except ARM: MIPS, x86, PPC and RISC-V.
>>
>> I would like to remove x86, but encountered some objections.
>>
>> MIPS, nobody is really using it I think.
> 
> 32-bit was added in 2014, commit 222e7d11e7 ("target-mips: Enable KVM
> support in build system"). I'm not aware of anybody using it (even
> testing it). I don't have hardware to test it (neither time).

Could you maybe suggest a kernel patch to remove it, to see what happens? 
... if nobody objects to the removal of the 32-bit MIPS KVM kernel support 
and the patch gets merged, that would help us in the long run, I think.

  Thanks,
   Thomas


