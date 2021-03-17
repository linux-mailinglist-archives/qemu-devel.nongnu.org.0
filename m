Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E0533EFF8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 13:04:44 +0100 (CET)
Received: from localhost ([::1]:33460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMUup-0004cS-Td
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 08:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMUtp-0004Aj-IE
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:03:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMUto-0008Ei-0n
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:03:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615982619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GWNjBnBlLO6b2tHV2/N+n0DAxQyFYNcMPP+Ce59E0lk=;
 b=VoYIy+Rij4/PF0PyC3KKZSXOCTowm7jolRg9Nxw82UXIU4CslHJQX46gOjfpjvjEigd7O2
 rzUGRLwaNYFfJtKXUiOtdatd9SHYyq44afeT86Y7CAwexx1ZaC2YZd5O1OfYJOVU2nxpNU
 nrdsXbKd3AM/MnK0Pl2972MT2G+cQLs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-fIrZ_GSxPs29EDJ44ksazw-1; Wed, 17 Mar 2021 08:03:37 -0400
X-MC-Unique: fIrZ_GSxPs29EDJ44ksazw-1
Received: by mail-ed1-f70.google.com with SMTP id t27so19196649edi.2
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 05:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GWNjBnBlLO6b2tHV2/N+n0DAxQyFYNcMPP+Ce59E0lk=;
 b=MYhcaI//nmRiURr4K0zOYSQxZ4vgVCI2XxmHhLJpWElnXZauWMNQjAceHZaxPssnOA
 obeKfygsq9BcSm3REDcqw3P9j8NDJIZtdpJji9lnZSlZkIa+ipyqjPBzYXbwlF8UaBL7
 qio6AYdy+wEdhPuFCgyPQz7iFQXqfTsXBR5HSQdRW+oTlqzaG1Ks03MVHW0M9/fHFWpq
 gNWjVjDcZnNhIpKaYxEmkqa7BdJrc6+HfVG3dHtuslry0y+eHppYT5anhDgZ/swa34UV
 E7spD5M9w6YERcKHKR3xlCfl/xIhUmGkq6nlEaCxbrBTGHuf3UbUzWhpzM9AgLIWoEnJ
 jEXA==
X-Gm-Message-State: AOAM533EqZSJf7KKl25JVP1t42NAiZ0eNUhbssF7zT8WYgo/tzsdAowm
 GmC84mzxRO7OUgQpDILqVT2HVdt4NOtV7ZOMi8hSwEcmekynZ4WyOSBZrXuUDF/UjSK6xEWrVWN
 prkgrbjqMPhcvzaM=
X-Received: by 2002:a17:906:f9d8:: with SMTP id
 lj24mr35053504ejb.200.1615982616510; 
 Wed, 17 Mar 2021 05:03:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPQSHjzEWr72ysPodsxCHf3ZHfmDcKGW+M+lB39QV4hTmehIw7vlC1z5P2xoMchNOXU+XYmA==
X-Received: by 2002:a17:906:f9d8:: with SMTP id
 lj24mr35053488ejb.200.1615982616386; 
 Wed, 17 Mar 2021 05:03:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gz20sm11465744ejc.25.2021.03.17.05.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 05:03:35 -0700 (PDT)
Subject: Re: [PATCH 1/2] configure: Don't use the __atomic_*_16 functions for
 testing 128-bit support
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>
References: <20210317110512.583747-1-thuth@redhat.com>
 <20210317110512.583747-2-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6d2426fd-ca0e-2b29-5baa-97054a14b1d3@redhat.com>
Date: Wed, 17 Mar 2021 13:03:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210317110512.583747-2-thuth@redhat.com>
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/03/21 12:05, Thomas Huth wrote:
> Looking for they way we are using atomic functions in QEMU, we are not
> using these functions with the _16 suffix anyway. Switch to the same
> functions that we use in the include/qemu/atomic.h header.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


