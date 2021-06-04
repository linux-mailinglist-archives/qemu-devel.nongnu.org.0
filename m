Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7F939BC2F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:47:10 +0200 (CEST)
Received: from localhost ([::1]:38648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpC2P-0006sc-72
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lpC1F-0006AP-CE
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:45:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lpC1A-0002y3-QX
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622821545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=948DVSaUJR2O3HvBMonUIIDQQ1bCevSaWFZ846LZhHU=;
 b=V4oc+bm+gw/H0a9cXN/ofvY6ekabmri2YH8Bev7vEHsGAO+B4Yb1nhuZKry1xFBqYXy24e
 CQOV5D7+PZdFP1PUzjzGKceLju+zk78N9+J+Ge1nHRvh1/faUk7hi7a6S1dMEz7ll46iwD
 tJwCzkLSkJ9NicTmfnHrvhftQy0GSd8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-N5GQtEwANXyfFfg7ep5P6w-1; Fri, 04 Jun 2021 11:45:44 -0400
X-MC-Unique: N5GQtEwANXyfFfg7ep5P6w-1
Received: by mail-ej1-f71.google.com with SMTP id
 bw21-20020a170906c1d5b02903df8cbe09ccso3602198ejb.11
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=948DVSaUJR2O3HvBMonUIIDQQ1bCevSaWFZ846LZhHU=;
 b=edWAFbajKPM7uLMPUOTqexQOmERliay/ObhrrBEWWUcHgVM77NrykDvtzSc3vPfvON
 duaVe5MSBWiYjhLmx+C0PoSJvpMIvZerM8I9IqEw33sZTz1o3Dx4F6Wr79XnpCBr8dxN
 0JRvEitFgnxvtVhP9zXoTPIrVA4qTiuWSPhgRxLiT5y4GPVkaMWP4Hq+s0DcsMqNfSoA
 P6vptIT2iJfknVpLuapp1B+sft6KXe1OyG2/EymB1DAhkQqUGNSKO7Q+zQ88XMO1GW8P
 7krYtf+L17p0VHB8erxCl+SI5GRz8zeeahreFmP4H3Z9XVpPtVTvDOQit9lhyjLZFSU8
 Dt6w==
X-Gm-Message-State: AOAM530IAjaFydIHsTzwn3EYNkCeJWDwbEqLQr16lDFuLcBRLQE728a8
 JXO5XV/1qHIUJCVqVANy+JByoKsYMMYkxeZvAoU61cpCNRtlW3trmymKYU5FrIozWndvuAHIXkb
 m3k5zOsu9CPWlipEGhGABZT5cZ7kW6ji6cJeLSBbSE9+Vu02lVn0VdqyLkObZpxql
X-Received: by 2002:a17:906:26cb:: with SMTP id
 u11mr4877857ejc.385.1622821542965; 
 Fri, 04 Jun 2021 08:45:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbRwpT5sp++HnNUtcNrJAVUC+E7YQED9xP6viKMNbPxKhdwhL+KVBYaQ6nkciPG/G9gvS5DA==
X-Received: by 2002:a17:906:26cb:: with SMTP id
 u11mr4877836ejc.385.1622821542652; 
 Fri, 04 Jun 2021 08:45:42 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id bm23sm2942651ejb.92.2021.06.04.08.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 08:45:42 -0700 (PDT)
Subject: Re: [PULL 07/28] qtest: add a QOM object for qtest
To: Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
 <20210524164131.383778-8-pbonzini@redhat.com>
 <20210604153716.5doeeoiaxgh6ots7@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c5bdbfc5-706f-4c2e-fda1-05791dfc8103@redhat.com>
Date: Fri, 4 Jun 2021 17:45:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604153716.5doeeoiaxgh6ots7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 5:37 PM, Eric Blake wrote:
> On Mon, May 24, 2021 at 06:41:10PM +0200, Paolo Bonzini wrote:
>> The qtest server right now can only be created using the -qtest
>> and -qtest-log options.  Allow an alternative way to create it
>> using "-object qtest,chardev=...,log=...".
>>
>> This is part of the long term plan to make more (or all) of
>> QEMU configurable through QMP and preconfig mode.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  qapi/qom.json   |  17 +++++
>>  softmmu/qtest.c | 185 +++++++++++++++++++++++++++++++++++++++++++++---
>>  softmmu/vl.c    |   5 +-
>>  3 files changed, 196 insertions(+), 11 deletions(-)
>>
>> diff --git a/qapi/qom.json b/qapi/qom.json
>> index 4f48035831..f7ef30f940 100644
>> --- a/qapi/qom.json
>> +++ b/qapi/qom.json
>> @@ -644,6 +644,21 @@
>>  { 'struct': 'PrManagerHelperProperties',
>>    'data': { 'path': 'str' } }
>>  
>> +##
>> +# @QtestProperties:
>> +#
>> +# Properties for qtest objects.
>> +#
>> +# @chardev: the chardev to be used to receive qtest commands on.
>> +#
>> +# @log: the path to a log file
>> +#
>> +# Since: 6.0
> 
> Do we need a followup patch to correct this to 6.1?

This hasn't been merged, so since Paolo will repost,
maybe he can fix directly?


