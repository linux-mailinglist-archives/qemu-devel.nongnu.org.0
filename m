Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2A745C536
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:52:46 +0100 (CET)
Received: from localhost ([::1]:48772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpshY-0004bt-Ny
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:52:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpsPn-0005Wm-0U
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:34:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpsPj-0001Tj-9f
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637760858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zyuxGUPz/cBMkm2iJ/3PgSI3EYAxkQYPzAkarKaheYI=;
 b=Wff5+BnRj6q8w0Tid7Qk1hYvtpjWs/jY8Zi1YMzPG9YQz2Er2qUrzgNbaNgD2srr4BJ/w9
 SRbyrdrDUY67KTfy1cHstaXqiQyLClgWfmy58YNIouu/abVyU2fVJPQu4yQGvFj67aQHJM
 wTfWbQF6ANltFv5U39yyoxTM2JNbe3Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-gN9db3UIPMSyka091yYCFA-1; Wed, 24 Nov 2021 08:34:16 -0500
X-MC-Unique: gN9db3UIPMSyka091yYCFA-1
Received: by mail-wm1-f72.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so3023875wma.5
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 05:34:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zyuxGUPz/cBMkm2iJ/3PgSI3EYAxkQYPzAkarKaheYI=;
 b=JCQypmkUXuAnIBs2X9ZgyLvi3Ce2XCS6qXSgbmfa96v3MSkcJBCOO98FGHq9gz6pFX
 oukcMzKQYQHdzq79xj6TynaRn7C2QV7/sablKgloGFqrfSHIXFRqRxuwvSutiez61RQd
 AfyJ6Igdc7NbaoDBLri/rzIt60q532kiy6R8DdPnrT/vRmtx+c0ytM32uli31ChjXYHe
 vdzOh2qr5IC9f6xP2k+lvK/4w6V6BUlwjB/kx0vrCjlmmq9H5MfPqwOSj81AGFj351YM
 6JNOq5JRwKrpagRCYnt1Hv4CQb2knyJOgNjC0/ZHAWoen85jTXwVwRv4gp+Am+7r5rDV
 kW2A==
X-Gm-Message-State: AOAM531nmVXwPGvmq+L+rQx2fqrhKZRcU6Io7xDhgd7pR/O/d6Gm8CHC
 9Ee4HDpSxn+yTf6UNVbDKV4V+ZE9IXqtt1tLaPVbcOMuB1Si17pAc1KPdudnZywa+XR37sv10nO
 iwQGr958xEeq8I9c=
X-Received: by 2002:adf:8b0e:: with SMTP id n14mr16736379wra.281.1637760854469; 
 Wed, 24 Nov 2021 05:34:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBl/G4wszNbiLjj4vLGUIurJj7rmKUAftDLonZDEl6tzasN02opA9mGZoXRG/Iv3YyLTS/5w==
X-Received: by 2002:adf:8b0e:: with SMTP id n14mr16736316wra.281.1637760854149; 
 Wed, 24 Nov 2021 05:34:14 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x13sm15232393wrr.47.2021.11.24.05.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 05:34:13 -0800 (PST)
Message-ID: <6e56a08f-7b8e-d1b1-5aa3-fe62926a0b57@redhat.com>
Date: Wed, 24 Nov 2021 14:34:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 02/18] spice: Update QXLInterface for spice >= 0.15.0
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-3-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211124130150.268230-3-berrange@redhat.com>
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 14:01, Daniel P. Berrangé wrote:
> From: John Snow <jsnow@redhat.com>
> 
> spice updated the spelling (and arguments) of "attache_worker" in
> 0.15.0. Update QEMU to match, preventing -Wdeprecated-declarations
> compilations from reporting build errors.
> 
> See also:
> https://gitlab.freedesktop.org/spice/spice/-/commit/974692bda1e77af92b71ed43b022439448492cb9
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Missing your S-o-b?

> ---
>  hw/display/qxl.c        | 14 +++++++++++++-
>  include/ui/qemu-spice.h |  6 ++++++
>  ui/spice-display.c      | 11 +++++++++++
>  3 files changed, 30 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


