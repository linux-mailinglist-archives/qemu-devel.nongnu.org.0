Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7296486FC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 17:49:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3gYh-0003wu-99; Fri, 09 Dec 2022 11:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3gYc-0003tB-VE
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:49:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3gYb-0007jp-6n
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:49:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670604544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ekjR4d2ZQGpLPdATrj5isXl0tACN/HAJUB3OfCNcEAw=;
 b=WUwqB50EM4iexULPppxDcoZziN4hODzu6ptBYaaB16AIy74jDH8oAR0TIqEHASYJ0M6vO3
 bosBBcH/Fu6Z74oLt2Wmc+BHEJJdMrnp/ANCXdvoY/B2YWm+/gCl+Xs8U5fOchJeQE+9mx
 e5lG6JWi1YxX3Sd1hOXsJaQr4HPgTMg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-180-Etr0yHRsP9iMxEmhal6A7Q-1; Fri, 09 Dec 2022 11:49:02 -0500
X-MC-Unique: Etr0yHRsP9iMxEmhal6A7Q-1
Received: by mail-ej1-f72.google.com with SMTP id
 ga41-20020a1709070c2900b007aef14e8fd7so3439292ejc.21
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 08:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ekjR4d2ZQGpLPdATrj5isXl0tACN/HAJUB3OfCNcEAw=;
 b=KNYT50v3kVM0HYbZfmjWYfqR+gvibGEJt5/YJ0iGYMMS6e/QWzBKuo/xDoI2DGJWGL
 SruIHlv7De0EAqd/COb8pEwb1WL43rclz+evKKinWvZ9PNy7oYaedIRPfFtaaVZLMslK
 4wbpqJo3wiIPSdvPfBteIG2qP9xnGw0gamOE9hoTkjK5stvDB/F0tZPxdt5zaa7cL6pA
 hUpFbbJwM40UNzXeZrm/7DAVNtewXCtGsowionyhodkLWDl4dl+cIpFkAQHbLgunBMc+
 pRYrmj2cipnmcyN7ZKC0zlFGhiPAZLh6nBqJY0AX+Dw+QDZXPCk3RNr2nUk/QVgw8gNX
 wnuA==
X-Gm-Message-State: ANoB5plvxh0wHnRKfCptG1IGlIuj/CZfrZBQ2sxFv1Fy9V+/59FdZ9BD
 LaxPOVqoE7gs1IotS5RscgOkDHzNurSBJdRiqnDD692lVTcTcRsGXMvmNQG9KpcNFKWszxUMINY
 BdazUrLZ+Y4adFEw=
X-Received: by 2002:a05:6402:2949:b0:460:ce2e:30ba with SMTP id
 ed9-20020a056402294900b00460ce2e30bamr5378510edb.10.1670604541824; 
 Fri, 09 Dec 2022 08:49:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5rGRk7JuNjYEgEEe3JXhxkhGdkgc3/0Dj7PNH4eH5l8Qc28W0GjHK8lIFbCHMZ4pN1Lq8AEQ==
X-Received: by 2002:a05:6402:2949:b0:460:ce2e:30ba with SMTP id
 ed9-20020a056402294900b00460ce2e30bamr5378498edb.10.1670604541653; 
 Fri, 09 Dec 2022 08:49:01 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 f5-20020aa7d845000000b00461a6997c5dsm820883eds.83.2022.12.09.08.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 08:49:01 -0800 (PST)
Message-ID: <fc83b2bb-c115-af96-ceed-c83d610a2044@redhat.com>
Date: Fri, 9 Dec 2022 17:48:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Target-dependent include path, why?
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <87edt9gnyz.fsf@pond.sub.org>
 <e797bb33-6f27-d20a-6a35-9372366bd4f5@linaro.org>
 <87v8mlez92.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87v8mlez92.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.288, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12/9/22 09:51, Markus Armbruster wrote:
>> Because of where [pixman] is added as a dependency in meson.build.
>
> Is it added where it is for a reason, or is it accidental?

Dependencies are usually added near the .c files that use them.  That's 
a bit messy of course if you have an "#include <>" in a heavily-included 
QEMU header.  You can consider it a way to discourage heavily-included 
headers.

If you have a dependency in multiple unrelated .c files, specifying them 
in multiple foo_ss.add() invocations doesn't hurt.  In fact it is both 
clearer and more compact, because it removes the need for "if"s.

The only dependency that you don't need to specify is glib, partly for 
historical pre-Meson reasons partly because it would be everywhere.  For 
the others, if it makes sense to add them to multiple source sets you're 
welcome to do so.

Paolo


