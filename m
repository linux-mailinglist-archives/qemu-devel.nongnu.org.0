Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E882B19ED
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 12:19:19 +0100 (CET)
Received: from localhost ([::1]:57138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdX6s-00053r-3g
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 06:19:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdX5h-0003lf-Ue
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:18:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdX5c-0000qE-5J
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:18:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605266278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XTWw0Ele00oDA94ovqRiyW7RimoqODaWzCRNHen2pSw=;
 b=Q4os47LMJz5zyxAxgEms/dBbgD7UM6qXSz03e67b7YwpiWb0FC9uUHu/CPpDUkbNOSp5l2
 OyyVMqIAHBC+FCVx50Y/9D5lfGhbyktcP6VbWNOAY2QQ3LgG9Zbf2Tv7oAXvRaII1it/wi
 JYOheW/1V6lNHiO4NI4yhIPnLpU7m+M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-wCjuMuThP22onV_taKKe7A-1; Fri, 13 Nov 2020 06:17:56 -0500
X-MC-Unique: wCjuMuThP22onV_taKKe7A-1
Received: by mail-wr1-f70.google.com with SMTP id p16so3664978wrx.4
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 03:17:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XTWw0Ele00oDA94ovqRiyW7RimoqODaWzCRNHen2pSw=;
 b=NVU0/oyWGX0jyx0ybtzWInZbBixrI/zKTMgIaI6b72MFR1yTUrvCfkUE9/fRIMI+Lw
 gdxi7Vfg+fN2ywhQfA5eVcpCTNfHgjtz6X+xuOPB/LSSa1KIFPiP++pMBjK58rmA6TSf
 vvgsrTQOFBs86zcpEaTzlV5qrziWqNrhZdpUXCNDt2sJigkNz1uSINtG4C5sQc79vs+4
 ymOyaa/HseUhFc1T0cF5paj8OCliGJPME930xAX6Pf/fCnbn5bGuT+YFDR2hR4/vbCWw
 TC7ipgiA6ndWfpbIE+NtCZM3nIhAzV/UYkGGTd+kw/ppMVLkKyTYBQCeFTZwHmD+Fce/
 aW0Q==
X-Gm-Message-State: AOAM530NoeaegdjTJSWsRCfYVpY8AwUys888VuCKO3a9IDFa/pggU85v
 hBtKkl6YJAGQzD/ZEwuawLSgCFw3m6fnUHWp1z2czBtuGKLmV6DzxLeGyTl7v6cXrKupiO+qMgg
 D4o9oVGhlw101LrU=
X-Received: by 2002:adf:fa82:: with SMTP id h2mr2814252wrr.24.1605266275509;
 Fri, 13 Nov 2020 03:17:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOasXhpsAPZ5s3y2HxAnPGWPlxgGuMc3nMwnwpUFIYkYDjKzovZN8WWh3xXeHdmFPsFhKBiQ==
X-Received: by 2002:adf:fa82:: with SMTP id h2mr2814236wrr.24.1605266275338;
 Fri, 13 Nov 2020 03:17:55 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t13sm11073965wru.67.2020.11.13.03.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 03:17:54 -0800 (PST)
Subject: Re: [PATCH v2 006/122] m68k: do not use ram_size global
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201113101704.1438368-1-pbonzini@redhat.com>
 <20201113101704.1438368-6-pbonzini@redhat.com>
 <38677358-6eeb-830b-6248-343267eddc8a@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5b0d7a6d-0e17-527d-9b25-a1dd9cbad062@redhat.com>
Date: Fri, 13 Nov 2020 12:17:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <38677358-6eeb-830b-6248-343267eddc8a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/11/20 11:44, Thomas Huth wrote:
> On 13/11/2020 11.15, Paolo Bonzini wrote:
>> Use the machine properties instead.
>>
>> Cc: Laurent Vivier <lvivier@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks -- of course this was just an unintentional send, but I'll note 
your Reviewed-by nevertheless.

Paolo

> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 


