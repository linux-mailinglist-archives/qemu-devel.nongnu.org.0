Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826E5432166
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 17:01:33 +0200 (CEST)
Received: from localhost ([::1]:47362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcU8q-0000yu-DD
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 11:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcU6q-0000AB-3U
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 10:59:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcU6n-0004k2-Mi
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 10:59:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634569164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZTX7HP4sQsdGpTTE4gNp4BP8+lc11FaAWNqxzYpvKE=;
 b=Pz30OTB6TLmRRCZJa2Y4MsaSSzh5L9Ml93bZ1BbMpUdv+YmRbMSmtyEB/BST9oa15GB8Vb
 kyN1/vxq25vcbG/bKETbFWKQ4UOLNPrG9alUBtNKYC73ftHZjPOxVmE3B4QYV25Q3POl2V
 qc4F6F/2kwwD3muHO4x/yfRLqoP/rD4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-DPZjOyG2O9iWOGeURlvCNA-1; Mon, 18 Oct 2021 10:59:23 -0400
X-MC-Unique: DPZjOyG2O9iWOGeURlvCNA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k9-20020a7bc409000000b0030d978403e9so2162522wmi.7
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 07:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mZTX7HP4sQsdGpTTE4gNp4BP8+lc11FaAWNqxzYpvKE=;
 b=K/Zvhw19HCZ2Uh0lpuTPtLzrki98dGFT5C3MPFez/csV6swl3sSBGOdexhCG0ir/Pw
 vzZN30hViFhPnXfVS5lJ444ai4znHX1OLVjgsFRqRhNXd+dejSzVsgJh0KWIF3c6MttL
 8gEbAZCPfExLFRRzR6S8zEQNpVrglWj13cW2R3nIVjM9xzygqc8+H8sZm4c//VA6seYd
 z836MSd4JPyJQhkweCl5Do31wOOv20xhJJldLP+eqCBAf7EcV0Uzb4eLgpb2nlsORBP2
 zi1JBbKr5wJvQvLWbOdWOyAAPdBEEitDxDBtH6YgXRx4fdAR/bz83tXWKB3oitEu6lUJ
 O3pw==
X-Gm-Message-State: AOAM533Qcgp4sjz32KuSMfOSmC4MO03JRZgFEVdwKmyUMECIGph41stu
 ho6NIjH25Ii55xsRqzKyxwA++vZTdXQG+/yBbFOb7RM3HDNtcIl1YQH+0zyhW5Bk+pCHS+dl1TD
 TrqLjlLj/X0gmTww=
X-Received: by 2002:adf:a18f:: with SMTP id u15mr35342595wru.183.1634569162111; 
 Mon, 18 Oct 2021 07:59:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwq6sbuGZgRxJUZ8pdlFgb4SwalLWlRdweECYr6phnV8SprbZgjWEtxQVdV2/YExd3yvh8Jig==
X-Received: by 2002:adf:a18f:: with SMTP id u15mr35342572wru.183.1634569161906; 
 Mon, 18 Oct 2021 07:59:21 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm12783187wrr.75.2021.10.18.07.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 07:59:21 -0700 (PDT)
Message-ID: <726ce2e3-71e9-639e-df62-6f1cdbf8c1fc@redhat.com>
Date: Mon, 18 Oct 2021 16:59:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH] chardev: don't exit() straight away on C-a x
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211018140226.838137-1-alex.bennee@linaro.org>
 <139066ae-053c-8e55-da76-2b69f51f0717@redhat.com> <87sfwyz8n8.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87sfwyz8n8.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.junger@greensocs.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/10/21 16:53, Alex Bennée wrote:
> 
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 18/10/21 16:02, Alex Bennée wrote:
>>> While there are a number of uses in the code-base of the exit(0)
>>> pattern it gets in the way of clean exit which can do all of it's
>>> house-keeping. In particular it was reported that you can crash
>>> plugins this way because TCG can still be running on other threads
>>> when the atexit callback is called.
>>> Use qemu_system_shutdown_request() instead. I did a gentle rename of
>>> the runstate stub seeing as it now contains two functions.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Reported-by: Lukas Jünger <lukas.junger@greensocs.com>
>>
>> That won't work with -no-shutdown, but you can just call qmp_quit()
>> instead.
> 
> How does calling qmp_quit() fix --no-shutdown? Isn't it just a thin
> wrapper around the qemu_system_shutdown_request()?

It first undoes the effect of -no-shutdown:

void qmp_quit(Error **errp)
{
     shutdown_action = SHUTDOWN_ACTION_POWEROFF;
     qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_QMP_QUIT);
}

Paolo


