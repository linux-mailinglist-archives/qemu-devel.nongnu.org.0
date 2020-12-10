Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E182D593E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 12:32:55 +0100 (CET)
Received: from localhost ([::1]:52224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKBr-00051F-1X
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 06:32:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knK9q-0004Tc-Vs
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:30:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knK9n-0000zY-C0
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607599845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4SviQHGe/ji3mNg6gpdNpjky4QY5zlJfqfJjs3BUorY=;
 b=Gh0KgZnaCB12Lj9IL6EdeA+RS+R0PP0QqOdBm3HAbIsvtH9rhEGg/Cm1oMgDrVpS6GfsZd
 OQzDww6X488YpC9/Rnz8GjyfeaXuvXC3fBWXQsqppRI6WspZvo6ctBCuLXPwncxYlasF4d
 u6xWsIk2JEPxMpZ7xkExHpKIZRq2j8Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-q6_kef07NsW2hfaRpbi0LQ-1; Thu, 10 Dec 2020 06:30:42 -0500
X-MC-Unique: q6_kef07NsW2hfaRpbi0LQ-1
Received: by mail-wm1-f70.google.com with SMTP id w204so1101625wmb.1
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4SviQHGe/ji3mNg6gpdNpjky4QY5zlJfqfJjs3BUorY=;
 b=I5A2YE7FlcrZZXeSQiCbh9YSI4e93z+nGf9FhA3aJCqrLDdue8EWyImeMnj2KDy1S2
 0AWflUs4RFhzgtzsw9bd+4Og82r/gMkMXzF8XjRMIXZ/5dCaXP6SHFJca4aRBOAo5FdP
 3tr5Oc+yTB/39CX7wdrYe07GX0b8KCKbgpRJar06IXtQkGXmAIe1m67vhSIp8h582YIh
 4rQXlTyzJF2UR4+2cqCFLzh1kgUBelhmPHXqj2iDC/MUIN/Kx41YHfv813xgGYSHzlVG
 KWVl0TDcnJTmS5dabb7EzAkcXEMYdan5DLcVbU84OgrBiycdNwqki1QUba90zWW4n3/V
 uw7w==
X-Gm-Message-State: AOAM531+3snLDWfuu5gWC90690IO3b/lYUQXWMgiibXu1Lj/G49s9ifx
 KdVDbX97Klk5R5/6VqQ392p4pkbW/LTmb218lRHumMfrBDxyuNCU05nxu5+fan1obZAyZWH1gfv
 qPeT/uxkWgfKkeN0/OQ6XxJTmngdsz8yu8hPhGb+MbXPMYQaEjsfiMRGBxvVeCRua
X-Received: by 2002:a5d:4a06:: with SMTP id m6mr7979161wrq.189.1607599841335; 
 Thu, 10 Dec 2020 03:30:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5cYQ9J21r1MubPB4sFZBd1ece8Q/7vsItMyXHfKJDny2GKCYPQ8nGzOW2w2rsSc4gZUHlgg==
X-Received: by 2002:a5d:4a06:: with SMTP id m6mr7979135wrq.189.1607599841099; 
 Thu, 10 Dec 2020 03:30:41 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id v1sm8457960wrr.48.2020.12.10.03.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 03:30:40 -0800 (PST)
Subject: Re: [PATCH 1/1] trace: Send "-d trace:help" output to stdout
To: Stefan Hajnoczi <stefanha@redhat.com>, Doug Evans <dje@google.com>
References: <20201125215245.3514695-1-dje@google.com>
 <20201210112540.GE416119@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1143378e-3c44-228b-4c20-85cbc43fbd8a@redhat.com>
Date: Thu, 10 Dec 2020 12:30:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210112540.GE416119@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 12/10/20 12:25 PM, Stefan Hajnoczi wrote:
> On Wed, Nov 25, 2020 at 01:52:45PM -0800, Doug Evans wrote:
>> ... for consistency with "-d help".

Do you mind replacing the '...' by the subject:
'Send "-d trace:help" output to stdout', so the
commit description makes more sense?

Thanks,

Phil.

>>
>> Signed-off-by: Doug Evans <dje@google.com>
>> ---
>>  trace/control.c | 12 ++++++------
>>  trace/control.h |  3 ++-
>>  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> Thanks, applied to my tracing tree:
> https://gitlab.com/stefanha/qemu/commits/tracing
> 
> Stefan
> 


