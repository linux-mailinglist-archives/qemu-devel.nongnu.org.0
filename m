Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A60638767E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:28:53 +0200 (CEST)
Received: from localhost ([::1]:33140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwy4-0003GP-Jt
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwpr-0006Uk-B1
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:20:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwpp-0005rU-LN
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:20:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621333221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bOU8G7Yedh47h3NHHrszRQf783jw2/i8OwRVv4lOCRA=;
 b=abOL+AhOLuARQzLuE9Lyk2squn+ZjwYeyay+DoLj9s/oJsn9T4b3aIWm9IZqfyqXgL4O9S
 iqJTSxOj5FXICpJRw/OKYzD1J13NOdqHt3WA7YbKaTobIvBD4GIi6lFW+iFuZEtUcsvmNQ
 5u+Mof3JCwNwJ8HpQLXv+KH+yVj1bNk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-W_a3PsvDPfKyqaVL8T0yXg-1; Tue, 18 May 2021 06:20:19 -0400
X-MC-Unique: W_a3PsvDPfKyqaVL8T0yXg-1
Received: by mail-wm1-f71.google.com with SMTP id
 l185-20020a1c25c20000b029014b0624775eso386648wml.6
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bOU8G7Yedh47h3NHHrszRQf783jw2/i8OwRVv4lOCRA=;
 b=JAy47/0jmATGDfJX1WTh8SJ1EkdssF9wpPM3ZXDBgpBeMs0KDgBte/AFqmkH5NZvXb
 RwVage7xPQNc3xKpPFI7wH6SVV6/mOalH3lqaBVsnR8HRM5Ompp3NQH9R5DttdmIQBiB
 tiGmc3VOimhGFHdmwoArU2eQELPN7Jxo97tkstvgs9IKiholU21JCLAk+0i0fE13fpQb
 MxX+/VSx9ubTCov7+vrxO+S2Ha+Fr3ZLhCAmRo6yYqVZ8iOWnPAfBoCEtAFkh4dTEVDy
 0pV7Ar6KK61BEPm53GsZMOSVxq60iQI6muMfqft2guCyahJBUCY3PiMjuf6W3cDpSQbl
 Bquw==
X-Gm-Message-State: AOAM531I1XPXXvrmsKIZba9gP10gLM2L6TOD+Dnw11zk2G8xZgdJSybz
 PYzIeFjsPsl7y0CPSpDJVIEFbYRC1VTDIwUDqjQC47W4rVPOm4pcI9W1oB8CrugK2LHJ7PA84n2
 LN+xlwELRCmJ1FWo=
X-Received: by 2002:adf:d20e:: with SMTP id j14mr5737806wrh.270.1621333217803; 
 Tue, 18 May 2021 03:20:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMtZ/ZKokJuLjb05pBwh8l3GQd65hJF3uci/Qt6jtX6Uq7NR2/mQuAbCZQJvkr6ZyxqPQwZg==
X-Received: by 2002:adf:d20e:: with SMTP id j14mr5737787wrh.270.1621333217580; 
 Tue, 18 May 2021 03:20:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f12sm14602712wre.88.2021.05.18.03.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:20:17 -0700 (PDT)
Subject: Re: [PATCH v2 47/50] target/i386: Pass in port to gen_check_io
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-48-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <98818cd7-351c-35a2-8a08-8696e8371f08@redhat.com>
Date: Tue, 18 May 2021 12:20:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-48-richard.henderson@linaro.org>
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
> Pass in a pre-truncated TCGv_i32 value.  We were doing the
> truncation of EDX in multiple places, now only once per insn.
> While all callers use s->tmp2_i32, for cleanliness of the
> subroutine, use a parameter anyway.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 55 +++++++++++++++++++------------------
>   1 file changed, 29 insertions(+), 26 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


