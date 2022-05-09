Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0210551FE7A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:38:46 +0200 (CEST)
Received: from localhost ([::1]:47792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3b3-00035U-2j
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1no3NL-00084B-5a
 for qemu-devel@nongnu.org; Mon, 09 May 2022 09:24:35 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1no3NJ-0008FQ-ID
 for qemu-devel@nongnu.org; Mon, 09 May 2022 09:24:34 -0400
Received: by mail-ej1-x631.google.com with SMTP id ks9so20375984ejb.2
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 06:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1ON9wKcgwQldS63b3iCY7AVTPQB4gv883MrGSKKiFqI=;
 b=WrLxqp2k+Xlr6i3K8KadEPgVBkd2AJ6AxcX9/c1wmjSgMWR73LV2X3N8uUA61QqoMI
 JaJtdoq0WJfqQN93LNO0/s4TdrFDI5m81LzC7s1JM+fW+kEEZNm90i/e7cKUP6/PsAqC
 THR1AReOcMX/dAyg8xWKxFxYqvVLS5dFOLPNRZ26XeGnLXF6BsYhhjAFm7tr5I3TvgNO
 +Bypk6T6fb56OlNiMzoAA9JKexJulSmLjr584rs8VB7WpJLHTLPk0zVsVHqYJSAzezUY
 mthI5qQCYsVqTuU5EcNPLtM1ztjUFVBMvMH6aJLABOrTNfWoiGiCiM+J40FOEitR/Qr7
 FsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1ON9wKcgwQldS63b3iCY7AVTPQB4gv883MrGSKKiFqI=;
 b=6AiHZHthvoj06GtjYZVtda4P2ZdQkGJDg8ig8MJb7jJwwwHp/vZjX2D7AoNtwgQd6l
 Ey5Myr4/YVPErUvNsYCbIYUsLOVqlrwEctFAbJLpdycpZ7QTNFLxVT4OKob5aaB+6RIZ
 Sxg4oNkBSEuVDhAoZQGVb+fwQroro8a8w3ntAjdg/QxoIDLc99ay72njOwXbsFAXG1dL
 rpOZl71UHBV0FGn76DYND8Dz5s4DUvRmQozrhTSxklnsL2C48e5/lpQC4o5zAjPu2a06
 UgepsiFqs5dlaeoi6Y0vO53TcxU2iGVx37DKIKo14b58TOSAO0qOmuJs2T5Kr4/2oLMm
 NLhQ==
X-Gm-Message-State: AOAM530raP0/qpF0Sgh1z1zqL2LVCuCh3UBitZ7Kuf8AckHr94dA2tQF
 mR32xB5ojxd4Rq9Z2ccSCLo=
X-Google-Smtp-Source: ABdhPJyw2kwhYrc05IfLkuMDwW3IeXqtOnXjKTb38KK5bqLlnEGkFojd5wwA8H/3AMXJKOF5BDGScw==
X-Received: by 2002:a17:907:3f8a:b0:6f4:3f00:b1e9 with SMTP id
 hr10-20020a1709073f8a00b006f43f00b1e9mr14696431ejc.59.1652102671796; 
 Mon, 09 May 2022 06:24:31 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 mm9-20020a170906cc4900b006f3ef214e48sm5151885ejb.174.2022.05.09.06.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 06:24:31 -0700 (PDT)
Message-ID: <9f01eaed-b1fd-e436-f067-bf7787e01625@redhat.com>
Date: Mon, 9 May 2022 15:24:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] crypto: make loaded property read-only
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220509101907.212687-1-pbonzini@redhat.com>
 <YnjukuIbHbuk36zj@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YnjukuIbHbuk36zj@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/9/22 12:36, Daniel P. Berrangé wrote:
> On Mon, May 09, 2022 at 12:19:07PM +0200, Paolo Bonzini wrote:
>> The ``loaded=on`` option in the command line or QMP ``object-add`` either had
>> no effect (if ``loaded`` was the last option) or caused options to be
>> effectively ignored as if they were not given.  The property is therefore
>> useless and was deprecated in 6.0; make it read-only now.
> Why read-only, as opposed to deleting it entirely ? Unless I'm missing
> something, nothing will read the property either

Just erring on the safe side; qom-get could read it but I guess it will 
always be true.

Paolo

