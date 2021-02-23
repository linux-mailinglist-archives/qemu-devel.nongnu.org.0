Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E4322981
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:30:26 +0100 (CET)
Received: from localhost ([::1]:35434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVtZ-0001F5-OK
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:30:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEVsT-0000mV-Bn
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:29:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEVsR-0005eG-EX
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:29:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614079754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SRBfLMwX/CzBktAoVnJTgLk0cL5u4EEQ5L+FIc24cCM=;
 b=SDAsch8DoH+fRXgK62BP91pCV6n1n8NEPhsdAFvp8nfye1gcWBa+5/oBYKVEMFcbYCF6aZ
 bvEUZKYyTusgZ+MdZ/X6j2W6Gch7wyVPTYqDYq6qDVQAWEr0BFg2uJNtzWgIFrCqXcP4u0
 HxdMMsbdQX9o7e+1W752gsHyn2nY1NA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192--hLjpJhaMpyxkmJe-vH4YA-1; Tue, 23 Feb 2021 06:29:10 -0500
X-MC-Unique: -hLjpJhaMpyxkmJe-vH4YA-1
Received: by mail-wr1-f69.google.com with SMTP id b7so2526978wrv.7
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 03:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SRBfLMwX/CzBktAoVnJTgLk0cL5u4EEQ5L+FIc24cCM=;
 b=VN3l0M/Q2/RkmKXZD7YJRm9ZdTbCUvTgLynH+3YE2k6wq4HEr7CXBGqRLLZdvLBJOz
 vrW1jmZLtj28f70SeAICOCpPpIocJ0k2DQS8BUfaCabown6tqwkUOVAZ7Hlp/j6676p4
 jwIBYHneWx7CyjDlU+Kiy+qxwqpBXAeJcd+RFic82nk4C8QzIzf27kKww1wy9BTbouc5
 1TMAOWsy9qSX1D4mGDxaOznrQ8KuhjlE8camA0YlfhwrJsGzKPkdqORI559bbd70rzKE
 DOa0Zc+11oUg4pQ/ps4Ng2716qXDxwsJ/6QGkekf0sO+riX15HSjQo4orvoidbV1O6R3
 ZoNA==
X-Gm-Message-State: AOAM530DGBNrgkTxrrNJReKF4atWKlWpflW++oZqo/ec7LXQO52ggaxE
 qLt+layH1kp7ezg0xCgV4F3xO3RrMhOwFKTOMUiHCGoZ+9liBZVqCk+g7oDn3bS8GqcD1efnQkR
 XqfGgobTF7B7Fse2mhD9j5BdTDxdHVz2hZw3QK8Jl/9/fICRSOF9izk5a8a8bgOHI
X-Received: by 2002:a5d:4d10:: with SMTP id z16mr11014611wrt.263.1614079748912; 
 Tue, 23 Feb 2021 03:29:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcAf+5DRyK8X2iMFayabPfzhCmJfhExusLIFYx+XnvEF1he5ppMjrcQChOYGm++LZJwasTDQ==
X-Received: by 2002:a5d:4d10:: with SMTP id z16mr11014597wrt.263.1614079748707; 
 Tue, 23 Feb 2021 03:29:08 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k81sm2372672wmf.10.2021.02.23.03.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 03:29:08 -0800 (PST)
Subject: Re: [PATCH] docs: move CODING_STYLE into the developer documentation
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210223095931.16908-1-alex.bennee@linaro.org>
 <CAFEAcA-v51sgBiNs5hpHwyQx0X=rYdmaWYPesJ0pGy=+ufyi4w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2ee6c3b3-7b90-e10c-8950-bfd07c963558@redhat.com>
Date: Tue, 23 Feb 2021 12:29:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-v51sgBiNs5hpHwyQx0X=rYdmaWYPesJ0pGy=+ufyi4w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 12:07 PM, Peter Maydell wrote:
> On Tue, 23 Feb 2021 at 10:02, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> There is no particular reason to keep this on it's own in the root of
>> the tree. Move it into the rest of the fine developer manual and fixup
>> any links to it. The only tweak I've made is to fix the code-block
>> annotations to mention the language C.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>> diff --git a/README.rst b/README.rst
>> index ce39d89077..f5d41e59b1 100644
>> --- a/README.rst
>> +++ b/README.rst
>> @@ -66,7 +66,9 @@ When submitting patches, one common approach is to use 'git
>>  format-patch' and/or 'git send-email' to format & send the mail to the
>>  qemu-devel@nongnu.org mailing list. All patches submitted must contain
>>  a 'Signed-off-by' line from the author. Patches should follow the
>> -guidelines set out in the CODING_STYLE.rst file.
>> +guidelines set out in the `style section
>> +<https://qemu.readthedocs.io/en/latest/devel/style.html>` of
>> +the Developers Guide.
> 
> This is the first instance of a qemu.readthedocs.io URL in the
> tree. Do we really want to have our references to our documentation
> be to a third party website ?

We can use https://www.qemu.org/docs/master/devel/style.html:

$ curl https://www.qemu.org/docs/master/devel/style.html
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>302 Found</title>
</head><body>
<h1>Found</h1>
<p>The document has moved <a
href="https://qemu.readthedocs.io/en/latest/devel/style.html">here</a>.</p>
</body></html>


