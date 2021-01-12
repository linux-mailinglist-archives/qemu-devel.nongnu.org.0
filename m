Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1706F2F3B3B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 20:55:17 +0100 (CET)
Received: from localhost ([::1]:53258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzPl5-00024v-MB
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 14:55:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzPjS-0000S2-If
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 14:53:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzPjO-0008Hy-3Z
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 14:53:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610481203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IiVoVniIeESikz3S8RZLitqUijNFQztvFnLP8yaHdAM=;
 b=MuDpILDH9nLKeYzAIjZEwTMGdzmEpBMB4qStXKFTywNTH+PUnqKgjQTEt5E/UTVQYjtTje
 Wvawm15y2Vrpxz8oZCgVFIHjHuEfXijCVU4XvSwEjNp+YkCl/0ReNnRyVIFboP2PCItWow
 4PrKV3tVmS1Z5JfyEjDdidBB7Pz3Ges=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-G5uA5oKKPPOKQfwVeumxzQ-1; Tue, 12 Jan 2021 14:53:20 -0500
X-MC-Unique: G5uA5oKKPPOKQfwVeumxzQ-1
Received: by mail-ej1-f71.google.com with SMTP id h4so1411592eja.12
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 11:53:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IiVoVniIeESikz3S8RZLitqUijNFQztvFnLP8yaHdAM=;
 b=TNo3R0VUkrmOnWrVUmEkP4XIX2FwMdJ8jV9xSC8pXAW4XRoZlcVjrK7NIRfHI7pMmi
 nvJvtm4AzGSIPsMjnGIq+9ZexL72F2SWbtwX4/tTx3TvXc5QinSkM4FtXWr2QmHgt1gu
 Euod8bV+ueoeJ2NUKQB3TdxazNts3oRc0i5OMI209bhiXrJwI0qaFaZ+OiV53XHjs21w
 WPwsga73qBmMVT7fipyGrlNe4vd9KEM2a5wcAwf2+tT1lU64/uw6BVZEzwhvsBZQNycc
 0oBjht7aqOtTLYkau/ZIop+UK8kM1OHLnzcpY+OJdG23n/g48uXBZ/lqQs2OVVRYg4sZ
 hWgw==
X-Gm-Message-State: AOAM532yJ7quYZIVWKpfqGhE+CMwSYlWHz9s7GU22rB2znj/dGJjC92M
 Jd/NM86V8sYV+sWux3VFFCmVibpzI/7I87CMoi/IAhWtLoMPbudASAeeIYesPx6avFukLDfSBib
 bQovmkNVm9/4QpyAzc6pdiyxAR+aNh1Xm0IuJqTFD3u8q7OmHbM29uUbK9eyt8y2a6rg=
X-Received: by 2002:a17:906:4e53:: with SMTP id
 g19mr309500ejw.454.1610481198947; 
 Tue, 12 Jan 2021 11:53:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuXZBzT7Jc/wJPg8fUygFx8OrcdzSwM0fu9JS4up/n7sRTpL32PSQaM4ATjnwIX/6ocCTCYg==
X-Received: by 2002:a17:906:4e53:: with SMTP id
 g19mr309490ejw.454.1610481198650; 
 Tue, 12 Jan 2021 11:53:18 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c16sm1573815ejk.91.2021.01.12.11.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 11:53:17 -0800 (PST)
Subject: Re: absolute firmware path made relocatable in qemu 5.2.0
To: Dave <dave@0bits.com>
References: <abd662c1-9a4a-9c77-6533-875ab1924695@0bits.com>
 <c9b36f34-8783-9c11-ffb9-afd25fdf9ac0@redhat.com>
 <428592f1-a5fd-7e6a-f181-28f31343518a@0bits.com>
 <CABgObfaZECGDvgsvebx44h84okDMKWZFw1ZtqcXk8W9SaD38Zg@mail.gmail.com>
 <3ab19db3-7339-79d5-9f4f-aee7165b531a@0bits.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <536bbda3-ebcb-e098-2625-5de4db08422e@redhat.com>
Date: Tue, 12 Jan 2021 20:53:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <3ab19db3-7339-79d5-9f4f-aee7165b531a@0bits.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/01/21 18:04, Dave wrote:
> Thanks Paola,
> 
> We are still in testing and that's the only thing we've uncovered so far 
> with the new 5.2.0. I will post if the ops guys find anything else.

Hmm, that's weird though.  The path to the default bridge helper is 
relocated:

net/tap.c:        helper = default_helper = 
get_relocated_path(DEFAULT_BRIDGE_HELPER);

Paolo


