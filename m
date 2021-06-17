Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027333AB344
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:07:30 +0200 (CEST)
Received: from localhost ([::1]:41060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqnx-0007Du-2h
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltqin-0006yK-Fk
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:02:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltqil-0000Te-9E
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623931326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTqaklNYwNKhN+9t2nWB1cm3aJuqYDzuWpnszxFI8R8=;
 b=eHkDQJQLN7VHtT8O6SzV7GUig+P+Dq4v4qwZoW27drcNqN276mLn9aa5XZe7LOLng9Nw36
 6jAQUAHz1u3pJW+XRa06rASlcybT6yOhJnoR+o5kSuTgbKgWsvCvPlRTrG5DnrpaG6LeSY
 hK35k7Nt1o7gB1BrBLN1B0MATMF3iDg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453--yZ6pHleOAm2mPnbiKXQCQ-1; Thu, 17 Jun 2021 08:02:05 -0400
X-MC-Unique: -yZ6pHleOAm2mPnbiKXQCQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 l2-20020adfe5820000b029011a64161d6aso2851459wrm.6
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PTqaklNYwNKhN+9t2nWB1cm3aJuqYDzuWpnszxFI8R8=;
 b=R4i9nprWaZa8giL4nxYM3mwEdU5s0nmFA3GIPFr195CUNp+6ZeQcbL5RUHLo35aDEY
 WSImjIEJ9w05SedK3tbqXGWjWtiIGdblNaf8sLSCNDJPv5iwrAdRdNVxkemWh+ApM2Ki
 hqeYoA6ea3X48g2DiezoFf7e1oNIoKs0cmi9A2tj9mUleletMWIBImWHcVaqR/t1LzEO
 N5UFaMhPaZBTusPIxP21snFDCJjcYhNRZWae4/3jfKELLKjUzbNWbJXNU6ACI6T4Xj/J
 Py9+WxKCNUVTuLvfxR4BT1jbRXELt+i9rLQB1ZpI4omExjgkYLraUddik/WS/ovIn6Rh
 K/ig==
X-Gm-Message-State: AOAM5309VsXedKmYdRsRlbhsLzLg5+7JV076eJamiKXXwxu9Pf4SYhye
 9qDFDISRM+Qf8ViW+hdJJMz4lhTjRIkhmNmUX12Lx9/XjlGAVQ1x2VDheJeyZwNoeOgKJ7HpivH
 ffWnm2hGrpiIZ4CC0eMb7jxD6GXk8dMAe4iKm2EPPiVt+hweV371bGGH/pX/XHqXv
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr5192657wrx.144.1623931323640; 
 Thu, 17 Jun 2021 05:02:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxV/xcDa/ZrJ1LS95VF12LjCVoM/LFiVI5sbyWpB9DsI2N4e/N4uzj4Nc9B6bGg4xTsJwgIBg==
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr5192620wrx.144.1623931323400; 
 Thu, 17 Jun 2021 05:02:03 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id k11sm7707700wmj.1.2021.06.17.05.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 05:02:02 -0700 (PDT)
Subject: Re: [PATCH v4 5/7] crypto/tlssession: Introduce
 qcrypto_tls_creds_check_endpoint() helper
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210616162225.2517463-1-philmd@redhat.com>
 <20210616162225.2517463-6-philmd@redhat.com>
 <55c03d12-3359-858e-8e71-7ba7a6fddad4@linaro.org>
 <bda6ced3-3299-f1ed-f5c4-b53ed61bde28@redhat.com>
 <YMsW+v4/7vuuAs7q@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0ed73b4e-88b8-743a-cb51-a6987d164165@redhat.com>
Date: Thu, 17 Jun 2021 14:02:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMsW+v4/7vuuAs7q@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.254, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 11:33 AM, Daniel P. Berrangé wrote:
> On Wed, Jun 16, 2021 at 09:21:45PM +0200, Philippe Mathieu-Daudé wrote:
>> On 6/16/21 9:12 PM, Richard Henderson wrote:
>>> On 6/16/21 9:22 AM, Philippe Mathieu-Daudé wrote:
>>>> Introduce the qcrypto_tls_creds_check_endpoint() helper
>>>> to avoid accessing QCryptoTLSCreds internal 'endpoint' field
>>>> directly.
>>>
>>> I don't understand this one.  Comment ...
>>>
>>>> +bool qcrypto_tls_session_check_role(QCryptoTLSCreds *creds,
>>>> +                                    QCryptoTLSCredsEndpoint endpoint,
>>>> +                                    Error **errp)
>>>> +{
>>>> +    return qcrypto_tls_creds_check_endpoint(creds, endpoint, errp);
>>>> +}
>>>
>>> ... doesn't match the function.
>>>
>>> The new function is a pure forwarder, and begs the question of why the
>>> caller isn't using qcrypto_tls_creds_check_endpoint directly.
>>
>> I tried to follow the maintainer/subsystem style (I was also tempted to
>> use qcrypto_tls_creds_check_endpoint directly). ui/vnc uses the TLS
>> "session" API and not the "creds" one. Daniel, what is your preference?
> 
> I think we don't need this extra function - just use the function from
> earlier directly.

Great, simpler :)


