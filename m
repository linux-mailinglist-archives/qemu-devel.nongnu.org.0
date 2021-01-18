Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEC42FA1AF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 14:34:43 +0100 (CET)
Received: from localhost ([::1]:46666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Ug6-0000U8-CG
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 08:34:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Uf9-0008TI-FN
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 08:33:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Uf5-0004mg-3c
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 08:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610976817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QpPCHWB5wVDg5QRgly2wVwsfgyJhmhHOpb64LCuIzrA=;
 b=HPwUf1X+Lg24+UV6wCXnSUvZ6kSOJnqFJSlNDMq8PvaqK6YAA/jwR2vPPre92xifKk5nWr
 fXiO3eSyj7tr/eh61aggkxOnTF1uqAmutDFm79yOz9AgjvW29u5WlUcql91mPDU1ILAHyX
 wbgv1wsdON+9OJZxWMmdXQr0fVTf5AU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-XDolpabOPYy-99B3xNYdSA-1; Mon, 18 Jan 2021 08:33:33 -0500
X-MC-Unique: XDolpabOPYy-99B3xNYdSA-1
Received: by mail-ed1-f70.google.com with SMTP id w4so4123868edu.0
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 05:33:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QpPCHWB5wVDg5QRgly2wVwsfgyJhmhHOpb64LCuIzrA=;
 b=ES5+8ZVyZgJjoJFkLHOR0DEoh2+Q2KAX5WktHeY98tsMaTH0Y+7ody2ETt4xepjbLP
 ckvdKcbLKvhsHSir7YXTH5JZdH7JEQ5MjU7NnVCgqUGGznXr51lUW/MlCJUi8845TKoE
 HvVEbaAdNyLiVgFX0RYazXfoYCH8xsHL0nVMwGF0o4inMK7dpkjODw1oGEtIA5/KcoKk
 f68hxu4SAgPKV+1FloTR/0MkeKDgM29vs7Be35LkXofQmfaeJ+Uv6hXtLW3cWLaLV46n
 7+kcCnz/grBnqxXYpvXz9uH73fFF0RMkt77xKrvKPAjhXeW1v2uMD507dQFrLkDh+ogj
 huhA==
X-Gm-Message-State: AOAM533AUoOq6aFZ7f+9+IiJuq3d+M8fx7PsZT+csCUWO+emKqB6wA/6
 9k//+D/l2FqqYLd1ZF0iTPIT0KGUky5MNvhRsVexuErIFIzHQdlhapjBj2UWTcUK1qVesWSHrlZ
 onJYPNLnN18AZz5jxmiXX/dYWfwYrx9vT/Ik348Wi9lK2jmtjS5MzJlX1NLGv6wU+
X-Received: by 2002:a17:906:5285:: with SMTP id
 c5mr18073397ejm.17.1610976812330; 
 Mon, 18 Jan 2021 05:33:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4NTaS+/qEWN46LOu8cmBClBbykdTE8scjtAxU/T9sZccTb8ltca+L/YUi5XnB70IetX1fxw==
X-Received: by 2002:a17:906:5285:: with SMTP id
 c5mr18073358ejm.17.1610976811504; 
 Mon, 18 Jan 2021 05:33:31 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s19sm11018144edx.7.2021.01.18.05.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 05:33:30 -0800 (PST)
Subject: Re: [PULL 00/30] testing, gdbstub and semihosting
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <CAFEAcA9HzF_-HyGZDxLN+2-Ay1rtijqOOh9WJPFS+yyDKLERPg@mail.gmail.com>
 <871reiwi7k.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7e22d425-7e9a-afca-e035-f7e56837518d@redhat.com>
Date: Mon, 18 Jan 2021 14:33:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <871reiwi7k.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 1/18/21 1:18 PM, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Fri, 15 Jan 2021 at 13:08, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
>>> The following changes since commit 7c79721606be11b5bc556449e5bcbc331ef6867d:
>>>
>>>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210113' into staging (2021-01-14 09:54:29 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://github.com/stsquad/qemu.git tags/pull-testing-and-misc-150121-1
>>>
>>> for you to fetch changes up to be846761ca8b5a7e2e7b7108c8c156126b799824:
>>>
>>>   semihosting: Implement SYS_ISERROR (2021-01-15 11:12:34 +0000)
>>>
>>> ----------------------------------------------------------------
>>> Testing, gdbstub and semihosting patches:
>>>
>>>   - clean-ups to docker images
>>>   - drop duplicate jobs from shippable
>>>   - prettier tag generation (+gtags)
>>>   - generate browsable source tree
>>>   - more Travis->GitLab migrations
>>>   - fix checkpatch to deal with commits
>>>   - gate gdbstub tests on 8.3.1, expand tests
>>>   - support Xfer:auxv:read gdb packet
>>>   - better gdbstub cleanup
>>>   - use GDB's SVE register layout
>>>   - make arm-compat-semihosting common
>>>   - add riscv semihosting support
>>>   - add HEAPINFO, ELAPSED, TICKFREQ, TMPNAM and ISERROR to semihosting
>>
>> Fails to build, netbsd:
>>
>> ../src/gdbstub.c: In function 'handle_query_xfer_auxv':
>> ../src/gdbstub.c:2258:26: error: 'struct image_info' has no member
>> named 'saved_auxv'
>>      saved_auxv = ts->info->saved_auxv;
>>                           ^~
>> ../src/gdbstub.c:2259:24: error: 'struct image_info' has no member
>> named 'auxv_len'
>>      auxv_len = ts->info->auxv_len;
> 
> I've:
> 
> #if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX_USER)
> 
> around the code so it won't build for the *BSDs.

CONFIG_LINUX_USER implies CONFIG_USER_ONLY, right?

Maybe long-term this can become:

#if defined(CONFIG_LINUX_USER)
#elif defined(...BSD...)
#endif

(maybe worth to fix if the pullreq isn't processed,
else not a big deal).


