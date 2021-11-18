Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE54455D96
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 15:10:17 +0100 (CET)
Received: from localhost ([::1]:37026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mni7E-0004Ah-F9
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 09:10:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mni5C-0002Av-UG
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:08:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mni56-00009M-6R
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:08:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637244483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4PsJUrAdwLOrtSTudZKXDw81fbgj03tAzTEfBYfaMI8=;
 b=LzdCYJnKrhnwIqOwVUa/F0O86B7uSNPTASmvuc5mxMA+I9cH1/+95RxJnt7p69pL/cApG4
 vmrJnCLJGuj/oneM7siv2Dic4aIklm+V2E0MOMqw9TGs2r0TmlIRzPi49r3bx8Fh5CcLV5
 OREjJ7j2cYl/uaYLoivskpMejnma4ss=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-24-_4L9jNx5P6SJB60WS87I9Q-1; Thu, 18 Nov 2021 09:08:01 -0500
X-MC-Unique: _4L9jNx5P6SJB60WS87I9Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso3167515wms.5
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 06:08:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4PsJUrAdwLOrtSTudZKXDw81fbgj03tAzTEfBYfaMI8=;
 b=q6TX+Hen9zXbar//6C/kJ1UNJfGl1lZA6UNS4cmWZAFvWLbZYfbw4QrMUsYdNqLFbt
 hZoyo481iyrWMdFPi/BjFKSlVUHGnUaT0xxhe5+96oM0g6OCdDbBd0aaUW2dZAwWE0TC
 n2gEELE8qHxKRREWcWGY/NYPyuS8jtSiv37mlMS+X1MyiJ74zmC3rpFv7TFrK8c7Q13N
 5v8xMqk+OR/tehyoozflJhcrTAPku0pLKvGxbP0uuIQ9m825TndGantuHCjTBIH/XCe1
 2HUfIkchxFJf7yThqmYQLZtZ7CHwa4OTGmTxbrBNzDJV0XOdf2xl5RSqqaWMa6nf4iqB
 BGhg==
X-Gm-Message-State: AOAM5307T9uz0o9c9UsY6tFJNtYDNTTCM6aSNA1FE93etjbUjPMUzB/V
 VLTDPzigvHJaZT2pAmwfvSndtsbHiKvM4s15cFXet5jD83f7w2I/IV1+nd4i7WHn3YLsqxRcc3i
 3oWv5pvnzl3Phymk=
X-Received: by 2002:a1c:f31a:: with SMTP id q26mr10060511wmq.148.1637244479359; 
 Thu, 18 Nov 2021 06:07:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBZ6bYmyGMjtjyjwagppF9foQG+WfuiQ4wf/jyKjHrWtyl8zPdUrCwk3GZIS/duX5+BljlCw==
X-Received: by 2002:a1c:f31a:: with SMTP id q26mr10060468wmq.148.1637244479086; 
 Thu, 18 Nov 2021 06:07:59 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t127sm9525809wma.9.2021.11.18.06.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 06:07:58 -0800 (PST)
Message-ID: <edbc5448-b60c-3132-b554-e9811897b7b8@redhat.com>
Date: Thu, 18 Nov 2021 15:07:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [qemu-web PATCH v2] Add Sponsors page
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20211118122912.4051779-1-philmd@redhat.com>
 <641401f8-378f-213d-1be8-5c704780ea40@redhat.com>
 <YZZcRjJLSBJfALLQ@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YZZcRjJLSBJfALLQ@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Markey <admin@fosshost.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/21 14:59, Daniel P. Berrangé wrote:
> On Thu, Nov 18, 2021 at 01:54:38PM +0100, Thomas Huth wrote:
>> On 18/11/2021 13.29, Philippe Mathieu-Daudé wrote:
>>> Add a page listing QEMU sponsors.
>>>
>>> For now, only mention Fosshost which requested to be listed:
>>> https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05381.html
>> ...
>>> +QEMU has sponsors!
>>> +
>>> +For continuous integration and testing, hardware is provided by:
>>> +- [Fosshost](https://fosshost.org/)
>>
>> Are we finally using the server now? ... the last time I asked, it was just
>> idle and we talked about returning it?
> 
> IMHO, whether we're currently using it or not is tangential.
> 
> The sponsor has granted / reserved resources for QEMU, which can have
> a direct cost for them, and/or take away from what the can grant other
> projects. As such we should be creditting them for giving us this grant,
> even if we've not got around to using it.
> 
> If we do decide to give up any particular resources, it is a quick patch
> to update this page again.
> 
> My only suggestion would be that we don't explicitly state /what/ we're
> using the resource for, just that we've been granted it
> 
> IOW say something more like
> 
>     [Fosshost](https://fosshost.org/) has provided QEMU
>     access to a dedicated physical compute host.
> 
>     [Microsoft](https://microsoft.com) has provided QEMU
>     with credits for use on Azure Cloud.

This sounds good to me. I will respin using your suggested
scheme.


