Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F6D5EEE18
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 08:52:17 +0200 (CEST)
Received: from localhost ([::1]:48056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odnP4-0007UP-Rh
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 02:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odn7n-0006MS-4i
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 02:34:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odn7l-0006gR-1K
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 02:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664433259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dM7yLzXK1uaWhK+TkZbJz9kO3fibSTERbsfdllu4OoE=;
 b=aNG3lSg8V4zsCSvfibw8ZDvtV2awGXY+6U/Is8h11DimbyH99cM4ZHEOMzkWtzKX1wAgHD
 7gNjsHxr1G27fj2/L/bpLw4Po5a4cFUlUEiwQl1Z1ldTudYpBIxlu8SWXgHt91ACmWJV69
 gW+KGPmpF6Sp9E7nMM4Yn59vWtgvDs4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-488-M59DhmQyO8CFZvg3w2kLPQ-1; Thu, 29 Sep 2022 02:34:16 -0400
X-MC-Unique: M59DhmQyO8CFZvg3w2kLPQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 u20-20020adfc654000000b0022cc05e9119so124001wrg.16
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 23:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=dM7yLzXK1uaWhK+TkZbJz9kO3fibSTERbsfdllu4OoE=;
 b=Cii94FL2zYAAHvqAO6b6CEJvmNsPD7kB0TU44cMJpiD5dc/vl6v+U002LPyQM7idXb
 JvL/p/XGACZCKIdmDg6PT2wFZRYZFumcyVNfDDVGSp68S6/yu2GF1mzYb8ANSU+H8cV6
 8F3/SS9E7W3SGUerag9Kn3ib8ybs8lIbF7qPcwN+BVwT/233ZxR1F/PdNPoO5B14+wJM
 liasMapcdnASJZSEeigwm0H5aT/0SOd32Uw6OdOrFQCTQ9Fw+CS9wOcPANkUG3fYCZro
 wjt3dsAA2wgQt4qlKb8+ALDLXgyazxFr+n9YBtjIJqgC4vro3uRn9zMgKZs+aL87dTNy
 L1Jg==
X-Gm-Message-State: ACrzQf1Du7zLpjLVj6f0wgOBQSRJFkxkqjN+vY+wNd1z3s4lUstfVb1N
 v4E8abQYwczZjTCjmofDO5QGiX0ogX+qnFuYIwBKJdsQeXuA/4y5dyKOKwunAruCFUYJYxUygT6
 w0XLUnYcCYPqaFLY=
X-Received: by 2002:a05:600c:2949:b0:3b4:85b2:c1d7 with SMTP id
 n9-20020a05600c294900b003b485b2c1d7mr9339966wmd.183.1664433255712; 
 Wed, 28 Sep 2022 23:34:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4koBE8MeTiLLM9wJcfXL+ZZOcjQbc0VQm1wylDLOqnKlQQftNQznzrsHr36nNjog8OyOpo2g==
X-Received: by 2002:a05:600c:2949:b0:3b4:85b2:c1d7 with SMTP id
 n9-20020a05600c294900b003b485b2c1d7mr9339942wmd.183.1664433255424; 
 Wed, 28 Sep 2022 23:34:15 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-55.web.vodafone.de.
 [109.43.177.55]) by smtp.gmail.com with ESMTPSA id
 8-20020a05600c22c800b003a604a29a34sm432268wmg.35.2022.09.28.23.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 23:34:14 -0700 (PDT)
Message-ID: <a25c238b-dabd-bf20-9aee-7cda4e422536@redhat.com>
Date: Thu, 29 Sep 2022 08:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-discuss <qemu-discuss@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <a7da7e40-6f7b-79a4-709b-da0e71def650@redhat.com>
 <93033078-221d-23d2-23e7-13eab59cd439@amsat.org>
 <CACGkMEsQSn_GOBcs64JEDUHt3T7XOBL3LLM7yvqwwR5xvvD2dg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: If your networking is failing after updating to the latest git
 version of QEMU...
In-Reply-To: <CACGkMEsQSn_GOBcs64JEDUHt3T7XOBL3LLM7yvqwwR5xvvD2dg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/09/2022 04.32, Jason Wang wrote:
> On Thu, Sep 29, 2022 at 1:06 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 28/9/22 10:27, Thomas Huth wrote:
>>>
>>> ... it might have happened due to the removal of the "slirp" submodule
>>> from the git repository. For example if you see an error message like this:
>>>
>>>    Parameter 'type' expects a netdev backend type
>>>
>>> this likely means that the "user" mode backend type is not available in
>>> your binary anymore. To fix it, simply install "libslirp-devel" (or
>>> libslirp-dev or however it is called) from your OS distribution and
>>> recompile.
>>
>> Thanks for the hint Thomas. I'm afraid many developers will miss your
>> email.
>>
>> Jason, Marc-André, could we improve the buildsys check or display
>> a more helpful information from the code instead?
> 
> It looks to me we need to improve the build.

I'm not sure there is anything to improve in the build system - 
configure/meson.build are just doing what they should: Pick the default 
value for "slirp" if the user did not explicitly specify "--enable-slirp".

But the error message is not very helpful. It should rather say something 
like (partly suggested by Daniel in IRC yesterday already):

  Type 'user' is not a supported netdev backend by this QEMU build. Please 
check the spelling or whether it has been enabled at compilation time.

... or something like this.

Someone interested to write a patch?

  Thomas


