Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B632FE3FB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 08:32:26 +0100 (CET)
Received: from localhost ([::1]:55870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2US9-0001n4-Q9
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 02:32:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2UNG-0007zM-97
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 02:27:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2UN4-0005yw-Mw
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 02:27:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611214030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kuRBfY316bu+rPk/o/xoEShIeY5OdTFwwTSZR0dof64=;
 b=RFXuPrGiDHuYnz+yQcA95ECTcCDgDtdGpzENa+2bkoX9++KrD5wb7QrunQByVNvOXzV8Ny
 FsXJCSdkDHwAp29UnhFo/Wb/01E0fioSI/89X7fvfI43vIl7+cLf0SbPVay/cEr+mzjdWw
 63tsd9flFbvaHu4HSMUA7BsXcoKIsMo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-BAXcfQZuOh6rFglxwzYShw-1; Thu, 21 Jan 2021 02:27:08 -0500
X-MC-Unique: BAXcfQZuOh6rFglxwzYShw-1
Received: by mail-ed1-f71.google.com with SMTP id r4so655480eds.4
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 23:27:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kuRBfY316bu+rPk/o/xoEShIeY5OdTFwwTSZR0dof64=;
 b=ibQcY2C8ccpTPySYn3iLj4MI4MkenzImpPOXR3ZI3jJhKz1jywuQ+xIGr/anj/xSK1
 gsWKrY8wWfq2TG+o7YAT7GR35A5fWaWJ7R59gNUuNmJTlvY/te5OOfURFZFjd5nLQkPK
 mlsKEhii+UOV8LRSau/4O+kzxeGWEj/YelOkzBW+6rNiyB9Fat40qS1G3Bf+pvmArtQt
 JyyRyT2bxY3DJJ6Vrnev/xbpyWCmWgOYv2LapYrxNU2NKREQ424+vCaCXTdGdWYgNDJA
 hMRwBjDuSdHt6NCbKJFP8x2vj2CVxXVw1F6eG2WD2v7PFVWvfqjUJT169x3DJ2GAcKW4
 FMIA==
X-Gm-Message-State: AOAM5332ubifVHlWcdcEry6IfnKJcSSgKVchPSloVL3evqxXr0QDcGaJ
 hGMviIrvRaEgco7T0eML8m9XGaEvMJOI9/HkfpnAN1m5PVsr0C64nL4UaVewwzGbNQZDs+7JFnB
 mrBHLcr9goZuSpS8=
X-Received: by 2002:a05:6402:1e5:: with SMTP id
 i5mr10462602edy.86.1611214027016; 
 Wed, 20 Jan 2021 23:27:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1EpSA58jtIoinJ6s2wyA3wADQHlgRhtzjub0bHdV1NlzRzZCiMrXyXyIk2Jh1wzEqvI6RLA==
X-Received: by 2002:a05:6402:1e5:: with SMTP id
 i5mr10462586edy.86.1611214026874; 
 Wed, 20 Jan 2021 23:27:06 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u9sm1845230ejc.57.2021.01.20.23.27.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 23:27:06 -0800 (PST)
Subject: Re: [PATCH v6 02/11] hvf: x86: Remove unused definitions
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-3-agraf@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ce1bd2db-36a6-0f34-ec77-063a97320e4b@redhat.com>
Date: Thu, 21 Jan 2021 08:27:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120224444.71840-3-agraf@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 11:44 PM, Alexander Graf wrote:
> The hvf i386 has a few struct and cpp definitions that are never
> used. Remove them.
> 
> Suggested-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>  target/i386/hvf/hvf-i386.h | 16 ----------------
>  1 file changed, 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


