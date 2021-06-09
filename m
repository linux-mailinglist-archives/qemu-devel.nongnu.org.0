Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF413A1BDB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 19:35:33 +0200 (CEST)
Received: from localhost ([::1]:50366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr273-0005oF-0t
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 13:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lr26B-00058G-L5
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:34:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lr269-0004sc-6X
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623260076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KYcTxM7cTkwne5PGLzsxjmIOjR5Z6PoKftlAWPaiiw0=;
 b=SN8Wvtux8xWtWAn6cHvcURzfHn/zXnnXFZVGf+UKA9Ah68BN7n1AgPY5KDKSD4JEjOU3Ww
 vr2nZldsNHom/8FnXRiEmsU1kymmosPHFY6t6RDLZTPcmyLgrdzdu3Ox12hLI3f44/pUyT
 Zr3RebgYDKfutZyjMxRhLyX6CI5MzrM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-ej2cMXhJOHG4dX8-B_ZRaw-1; Wed, 09 Jun 2021 13:34:35 -0400
X-MC-Unique: ej2cMXhJOHG4dX8-B_ZRaw-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a05600c1c85b02901ac8b854c50so2188027wms.5
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 10:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KYcTxM7cTkwne5PGLzsxjmIOjR5Z6PoKftlAWPaiiw0=;
 b=eGoz0aSFIQ88RUP6sJ3fLG0GZ9Dd9dsMjPh/M/qXqMFekxaFWr7dYTMoPsYKFiDl+x
 0tWqax9edWLR/DRPTdcDEySqEfNx459gJMhQoGQ2ADFdmu2Yr6t5nIQgLi5YLE/PBvxo
 I1L8JLzw/xYnKpklsMWC+MZuZmSLCQvbHvHOs5cHaUImei+v8nmpTKgbkNJasDqgjEaN
 moxs8/C8rERikzWMbJ+3FpUFNxzbTpKKidQWVdc5tBM8L5NbHdPdSw0P3mZsfElLpIfx
 dLvKTkGRU90jOTHsoz5O8WH4X+Q0yesgNL+8o9LITWgjPiMBbWLuH1Vs0nhUwNBwiUX9
 2Qkw==
X-Gm-Message-State: AOAM532S38n3etEQ/Y3ImZcOMPeTUG8UNczI5vJDR7LO6vu3nlyx+D42
 6WmliPlLIxsGNH425LQ1tK2AI5+dForrTDVpfGBBpiog2bce9l8lfJjylbqs9UsGNPXBc0B3Ipu
 D7i6PhPhGnvocwu0=
X-Received: by 2002:a5d:54c8:: with SMTP id x8mr969066wrv.109.1623260073945;
 Wed, 09 Jun 2021 10:34:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4E2kP6vyoX/loB2B0F2XJjr22ojl/cVTEMKQez/bDYcJXbLUkfii4cmUEWTlT5lOEuZ49VA==
X-Received: by 2002:a5d:54c8:: with SMTP id x8mr969043wrv.109.1623260073773;
 Wed, 09 Jun 2021 10:34:33 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id l10sm626160wrm.2.2021.06.09.10.34.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 10:34:33 -0700 (PDT)
Subject: Re: [PATCH] tpm: Return QMP error when TPM is disabled in build
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20210609152559.1088596-1-philmd@redhat.com>
 <CAJ+F1CL0ZdNUdcgTR8gv3w-+p++tDfvtFVYPm6NgoU_b03VgRQ@mail.gmail.com>
 <2ebcd286-cc73-e8da-53ef-2424419822ff@redhat.com>
Message-ID: <d73d226b-557e-d619-10ba-e547fc51ad9d@redhat.com>
Date: Wed, 9 Jun 2021 19:34:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <2ebcd286-cc73-e8da-53ef-2424419822ff@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 7:27 PM, Philippe Mathieu-Daudé wrote:
> On 6/9/21 6:01 PM, Marc-André Lureau wrote:
>> Hi
>>
>> On Wed, Jun 9, 2021 at 7:33 PM Philippe Mathieu-Daudé <philmd@redhat.com
>> <mailto:philmd@redhat.com>> wrote:
>>
>>     When the management layer queries a binary built using --disable-tpm
>>     for TPM devices, it gets confused by getting empty responses:
>>
>>       { "execute": "query-tpm" }
>>       {
>>           "return": [
>>           ]
>>       }
>>       { "execute": "query-tpm-types" }
>>       {
>>           "return": [
>>           ]
>>       }
>>       { "execute": "query-tpm-models" }
>>       {
>>           "return": [
>>           ]
>>       }
>>
>>     Make it clearer by returning an error, mentioning the feature is
>>     disabled:
>>
>>       { "execute": "query-tpm" }
>>       {
>>           "error": {
>>               "class": "GenericError",
>>               "desc": "this feature or command is not currently supported"
>>           }
>>       }
>>
>>     Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com
>>     <mailto:philmd@redhat.com>>
>>
>>
>> Why not make the qapi schema conditional?

Using your suggestion (and ignoring QAPI marshaling error) I'm getting:

{ "execute": "query-tpm" }
{
    "error": {
        "class": "CommandNotFound",
        "desc": "The command query-tpm has not been found"
    }
}

Is that OK from a management perspective?


