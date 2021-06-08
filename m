Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A990E39EC44
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 04:41:47 +0200 (CEST)
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqRgY-0001XO-PI
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 22:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lqRfn-0000hq-Lp
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 22:40:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lqRfm-0001Rd-2b
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 22:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623120057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TI+sWTxSRFOQOQPFVdQGbS+0S7BO9SEAzulTk9FrzsA=;
 b=aSz9TBiB9tUkt1hvoum2IpsjvOQm2ZyXaUeM9Fj9XyuODCoufCRM+b+XsVQun5RZM7jiOu
 TxGB3CnSLHbl074BE4uvCkuWebU5lVxQqmP3nYPsLSF7eeOrHoSeGc28jjM30cNwE3nFIJ
 yOKnIoqImce3smx9KtJSYU1G1kjbZPg=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-NKRh81J0OvGSXeMs0DnW9g-1; Mon, 07 Jun 2021 22:40:56 -0400
X-MC-Unique: NKRh81J0OvGSXeMs0DnW9g-1
Received: by mail-pl1-f198.google.com with SMTP id
 2-20020a1709020202b02900eecb50c2deso8996135plc.0
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 19:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=TI+sWTxSRFOQOQPFVdQGbS+0S7BO9SEAzulTk9FrzsA=;
 b=L3jLLvmWX28UmBcSnNR3v7GA7U5eUI+SSecPjhOIP9JWihGX59D47UFHn16yAMuHpa
 HO1fQlaxwrFVDLbPxpgF+/q6kRHDuKu2M9ktksl4N4gsy3RTqws9+nxAQeuLD3CT0WcS
 5Q1Ma2otcULBCOmFwweL9HRmY0rvQ0irrGSwLErtdYHB555FA5okhE7z/F0GawtKrcw5
 EAg8gO3P8dvX/NgczuUpPJsgQ9o0t8Ft4gR9LzEwL42Q0UA62JkOxLUUg2Z81a1cdCRt
 5ZhOduKHlH9216S1ZdgKo99o1G58Dr5XheC5/mZ40DxgSVUUfzpj2bL5ytYnk6d/hM1B
 DMXQ==
X-Gm-Message-State: AOAM533Z2PmoMZftGUZyTxFJBnXpc65ngsiClgZTxQC9JYOhsaFoxlUS
 RMorDW5CHYxev1gEgWtaUQyExOPRUN4UTRNOpV5ZMvQp/rX/rXwDFHqc3ZZIVJZPsD39NnWrhTP
 NGU2mbdvUbCeZW0ZS50wyYUOG5TKa03+rxnLyS6fBo0IitHK4Y3rO7HipeZrRGyGMUBo=
X-Received: by 2002:a65:5802:: with SMTP id g2mr17024935pgr.129.1623120054742; 
 Mon, 07 Jun 2021 19:40:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpQl9UE6FXabj5dMjS0cYzO9Yg9ALlB17s93SI5ezbrOiO5wyqG5DsmW17oeRev5HBenJtQA==
X-Received: by 2002:a65:5802:: with SMTP id g2mr17024916pgr.129.1623120054509; 
 Mon, 07 Jun 2021 19:40:54 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id r9sm9453309pfq.158.2021.06.07.19.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 19:40:54 -0700 (PDT)
Subject: Re: [PATCH] netdev: add more commands to preconfig mode
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210511153955.506577-1-pbonzini@redhat.com>
 <YL4rtVfpOcWyqE5u@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cec993c5-abcf-6bc5-ca45-cbcfc5340552@redhat.com>
Date: Tue, 8 Jun 2021 10:40:47 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YL4rtVfpOcWyqE5u@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/6/7 下午10:22, Daniel P. Berrangé 写道:
> On Tue, May 11, 2021 at 11:39:55AM -0400, Paolo Bonzini wrote:
>> Creating and destroying network backend does not require a fully
>> constructed machine.  Allow the related monitor commands to run before
>> machine initialization has concluded.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   hmp-commands.hx | 2 ++
>>   qapi/net.json   | 6 ++++--
>>   2 files changed, 6 insertions(+), 2 deletions(-)
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>
>
> Regards,
> Daniel


Queued.

Thanks


