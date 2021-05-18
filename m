Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AE93875B3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:50:52 +0200 (CEST)
Received: from localhost ([::1]:41490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwNH-0006Mf-1L
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livv0-0006X1-Km
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:21:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livuy-0004KR-E2
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:21:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621329695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f43d44ecZmCyp4lieXDFnE2ESyfrS5YggFtyiMWpLhw=;
 b=Pf5ZZpdtLIL4yNpPcdYU6YFsc4Upo4rojwQMGtQWm3YClMeG8nr1SSJlFNMnU9iZx+05hw
 zyaq6Wy3jY7y/ytHvvwfOx0q1fxft1sGc1t7chFB8xk+rdw9NclIhEJVR8GC1Vk1LWhBnS
 oj5NPpy6bLyxQnEYFAREqD2CGhIKUDg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-ba3mzGO0MqmAqM7ecEVe0w-1; Tue, 18 May 2021 05:21:33 -0400
X-MC-Unique: ba3mzGO0MqmAqM7ecEVe0w-1
Received: by mail-wr1-f69.google.com with SMTP id
 d12-20020adfc3cc0000b029011166e2f1a7so4342871wrg.19
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f43d44ecZmCyp4lieXDFnE2ESyfrS5YggFtyiMWpLhw=;
 b=Isev3BaoeQf4zHnTUGSv7qEDm5AXi8JptFjZhaiXwznbSuhL6rpGeQB5YN+MylxGQn
 RPmg7EmtnKQ9s2Mn/qMUDwzvn/kI3A1/hbDz8fkNdfAwnfXj/nr42xPybKSOF9LZKrF9
 AZFSB+tatnkQWU9FZeTAWfQYcEq+4W8CCKt8rmvm/LcGxf1S8S7A3HkqcRcOpmOim6A+
 LZu76C4fUd4m3nGrcWato/WQcqPZNRbpQtl0J+wdRcxGZfjmOwYrBMW8la8/TT0cC9Bh
 Jnr42jlyUo3qf+vTNp3uX9//8FifN4oRFfFWncx0/fUdetIQ+Hf7mey0UcfYa+Bpxugz
 sHBQ==
X-Gm-Message-State: AOAM532mxLkGrnJD2UJwXbSWqefNU4PV7j4A2Y9tuJDKvnq8o26HGjP9
 DRpBJ7szEazySKzACCaS06tU7AdhFWSu7pqGEcQ3NAEK1YA7gUDOYPCx4LpSFbLhzRmntFkWAgf
 0j1FrHztTD3kaYj0=
X-Received: by 2002:a1c:7702:: with SMTP id t2mr3968223wmi.115.1621329692738; 
 Tue, 18 May 2021 02:21:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmy5rokp+WTNvtxPBIBkxwq4cncwhs5hzXiTi+Y8tX8yu7G7Jb8fnRIypP3HEg2tMYiFk41w==
X-Received: by 2002:a1c:7702:: with SMTP id t2mr3968202wmi.115.1621329692525; 
 Tue, 18 May 2021 02:21:32 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x2sm7314951wmj.3.2021.05.18.02.21.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:21:31 -0700 (PDT)
Subject: Re: [PATCH v2 12/50] target/i386: Assert CODE64 for x86_64 user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-13-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4125c342-00eb-acc2-b91b-7c1e4befc909@redhat.com>
Date: Tue, 18 May 2021 11:21:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-13-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> For x86_64 user-only, there is no way to leave 64-bit mode.
> 
> Without x86_64, there is no way to enter 64-bit mode.  There is
> an existing macro to aid with that; simply place it in the right
> place in the ifdef chain.
> 
> Since we're adding an accessor macro, pull the value directly out
> of flags when we're not assuming a constant.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


