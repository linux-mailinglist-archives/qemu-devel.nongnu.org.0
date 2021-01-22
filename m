Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4423004EE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:10:26 +0100 (CET)
Received: from localhost ([::1]:39812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2x8r-0004G1-Bs
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2x4D-0007kD-2i
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:05:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2x49-0003Ur-0Z
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611324331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lXvivTBs6urIs51UZ/p8WPzWgz4ilXPEe5RXv+enYxs=;
 b=dz3sCZPOSWpnWi/EZlVrBSLDAY/n2tIriXdHylJPbzaMZAaZ6IK7vvR4t5SimRVeem9I0e
 ZDkM/UxKTi9MnaWZsYWnW2BY3yuwy3mGmghUobfZBGn5+O0pcsnAKYS/MD/A+4ZAgT9P4D
 +BVpRnmDelGEdPxmKVkq0VYWnxsut6g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-q64RdE9SM7mfopc6x3wEBw-1; Fri, 22 Jan 2021 09:05:27 -0500
X-MC-Unique: q64RdE9SM7mfopc6x3wEBw-1
Received: by mail-ed1-f72.google.com with SMTP id w4so2963103edu.0
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 06:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lXvivTBs6urIs51UZ/p8WPzWgz4ilXPEe5RXv+enYxs=;
 b=Qv5L9uTHmgiTUzbTbcZ0/ImdNO+SZWY8Z6J8LhGHr2N18WDCz472LtKPDuTBE/yG/7
 87qgfBaAiHNAS8IQ5vLU7JbL6KS2SDIsnUQ9d5cTbv8Mf5yZxaCE3jciu8iondkHUzRS
 FbRWRwhH86KeCJBP/EhsX0/t+OPqokUiwgEdRZ9ehqEVxwCsKEjdg1IzeBJm7QR76UsQ
 rK8jIWm0A68EPHhvG54kJ0HsQ4sjJjDB9xGSoIs4+FZyz3VKDY8tlZ+hShXSKITF+abK
 Luk2F1jVDcDy6vvPPsw5o4xbtUSxo0uPRcZZqofdwdwu+tG4InYSmvEdGfGGDdEoqAA1
 F50w==
X-Gm-Message-State: AOAM533h78ClDoPhQz4iQTPH62/YRCJp3l4RC0XYosD27DOP4Xv4olSt
 AlXZz3xTkKprQd7+F+eeVzLbt2STemGLizhr4htQqERqC5f7YRoaRJa6F968etjLXmD7m9A9Rls
 9nVugiY/RWyPJgqA=
X-Received: by 2002:aa7:d045:: with SMTP id n5mr3340650edo.306.1611324326531; 
 Fri, 22 Jan 2021 06:05:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzit2PwRP7ICT1VobfUfVVZIr3x0TUOw2gjgG2vYtxGuZKOrdNY3fFGx4OJNBETNIm0kzZCGA==
X-Received: by 2002:aa7:d045:: with SMTP id n5mr3340637edo.306.1611324326380; 
 Fri, 22 Jan 2021 06:05:26 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id p26sm5482329edq.94.2021.01.22.06.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 06:05:25 -0800 (PST)
Subject: Re: [PATCH] util/log: flush TB cache when log level changes
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
References: <161130982491.1038646.15688151175539344664.stgit@pasha-ThinkPad-X280>
 <87y2glry84.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2447642f-6e8f-61b2-13ba-929ff640e80f@redhat.com>
Date: Fri, 22 Jan 2021 15:05:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87y2glry84.fsf@linaro.org>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 12:42 PM, Alex Bennée wrote:
> 
> Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:
> 
>> Sometimes we need to collect the translation logs starting
>> from some point of the execution. Some TB listings may
>> be missed in this case, when blocks were translated before.
>> This patch clears TB cache to allow re-translation of such
>> code blocks.
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>> ---
>>  accel/tcg/translate-all.c |    8 ++++++++
>>  include/sysemu/tcg.h      |    1 +
>>  stubs/meson.build         |    1 +
>>  stubs/tcg.c               |   12 ++++++++++++
>>  util/log.c                |    3 +++
>>  5 files changed, 25 insertions(+)
>>  create mode 100644 stubs/tcg.c
...

> I would call tb_flush(current_cpu) or first_cpu here. But two things:
> 
>  - I'm not sure you have a CPU at all times qemu_set_log is called

Indeed, with QTest accelerator it is NULL. I also remember
some odd cases when running commands from the monitor.

Regards,

Phil.


