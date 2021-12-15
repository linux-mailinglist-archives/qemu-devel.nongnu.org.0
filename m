Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE28B475636
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:24:39 +0100 (CET)
Received: from localhost ([::1]:55016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRSg-0007aX-9M
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:24:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRR5-0006Fh-MS
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:22:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRR3-0005nV-Mk
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:22:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639563773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FcCXJ3jMrOjMB7jtZtpVKkBWAF0a4yr7DiPVTj5QjaA=;
 b=akkzj8Pkj00k1f5adp8vVDGi0svbY9nZbPP5gM9P81+f1huROjg+LMgPajajLcOoHNifgI
 po1ND5KvXuWNJc/+ztnegZbASRezZZA+aoIeI4QFiEXTYtcnAOLdf1iilcOjmIzIqZonJ9
 KOjFGD0q7x0XwekAB4rYCoDXqmtwFt0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-Rpw_KTwoORmlk2GqOuJCfA-1; Wed, 15 Dec 2021 05:22:52 -0500
X-MC-Unique: Rpw_KTwoORmlk2GqOuJCfA-1
Received: by mail-wr1-f70.google.com with SMTP id
 x20-20020adfbb54000000b001a0d044e20fso1471142wrg.11
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:22:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FcCXJ3jMrOjMB7jtZtpVKkBWAF0a4yr7DiPVTj5QjaA=;
 b=HVIQ1pjA/bq1FIvlIcmDahqvRApAJxD4xYo8udKByGYjAJafObE15CN/dRGqbAtVZe
 Yr5UGR6P6zBq5k5W32BXjNBN0UYG0wwI2mQFHbHS4Yb3fqeAsCXCg5bg5mhB8gaXE6rU
 7CUelWthN4dY0VcPNbZsXIacBiE7sdz/s6hU7o8UxhipP4TPowTZPgEoqj58GzZUvWrX
 ip8RqlLU/EsNl0z/40DkJ8sqgREi3QNWGfN/7tAxk13BoIloGQaxjSd0k2FaYNBSI9OG
 +ogzu2SPx+Q74P1fzbrwumK1EguNtSUJzGhiiN6PtnUzgdbKw7EYwfAuFRnrshr3xz31
 gLhw==
X-Gm-Message-State: AOAM532vo88/NmVtC+0X0VYT72d7CaisUXQdS+kDWPGYWOm1WSNnxNqU
 +CUaNyDwBVFjy5eQ0sVZzYpsLeAEbXIZWnHgE9UvbkwM0rjvMP5ov4lC8xcEnmDowy6ycUZ0Opn
 E/tdxjAC3XaMoslY=
X-Received: by 2002:a7b:c388:: with SMTP id s8mr3840805wmj.73.1639563771354;
 Wed, 15 Dec 2021 02:22:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMDcoP3Ug8ndfK9fDQxGb75T8FRfkWBLn1cU8ebUm31UJxpb/WX/uxwduW0MM9C4AQeHpzug==
X-Received: by 2002:a7b:c388:: with SMTP id s8mr3840784wmj.73.1639563771171;
 Wed, 15 Dec 2021 02:22:51 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id v8sm1511253wrd.84.2021.12.15.02.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:22:50 -0800 (PST)
Message-ID: <af65daf5-c1c6-14c8-c91c-f63f2bd603af@redhat.com>
Date: Wed, 15 Dec 2021 11:22:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 01/18] ui: avoid compiler warnings from unused
 clipboard info variable
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-2-berrange@redhat.com>
 <f3ca85e6-822d-1004-3875-4d3dbeb16855@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <f3ca85e6-822d-1004-3875-4d3dbeb16855@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 14:33, Philippe Mathieu-Daudé wrote:
> On 11/24/21 14:01, Daniel P. Berrangé wrote:
>> With latest clang 13.0.0 we get
>>
>> ../ui/clipboard.c:47:34: error: variable 'old' set but not used [-Werror,-Wunused-but-set-variable]
>>     g_autoptr(QemuClipboardInfo) old = NULL;
>>                                  ^
>>
>> The compiler can't tell that we only declared this variable in
>> order to get the side effect of free'ing it when out of scope.
>>
>> This pattern is a little dubious for a use of g_autoptr, so
>> rewrite the code to avoid it.
>>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>  ui/clipboard.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Could we get this patch directly applied as a buildfix?


