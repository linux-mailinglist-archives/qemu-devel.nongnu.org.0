Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B360C2F6483
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:29:09 +0100 (CET)
Received: from localhost ([::1]:58838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04Ye-0008K5-Mi
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l04WN-00073J-KM
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:26:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l04WK-0003HZ-AU
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610638003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yuwGDPtOsOa9wz811rkZAqVYND87rb6tdCjHtJER2tE=;
 b=BzCtNOXmIOa+90MEhd2JuOmhglrYGzrlGhP1WG0oRskThREDQpPV6SuBzMnR3ZCgi8Yli2
 s+VbT2+YYe6l6ELm9SaFC+PC5E3jdcqKjHVWhyrRk46TaWRfn7kFRcy5WiQ2HXgzaUzvKZ
 GuMkPor82kVS4GX12i5dx/39EpPFprw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-VqVKio3kOuSM37XGjrQdYw-1; Thu, 14 Jan 2021 10:26:39 -0500
X-MC-Unique: VqVKio3kOuSM37XGjrQdYw-1
Received: by mail-wm1-f70.google.com with SMTP id r1so2015708wmn.8
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 07:26:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yuwGDPtOsOa9wz811rkZAqVYND87rb6tdCjHtJER2tE=;
 b=nGa1i0FmhpSgsdqhtFI+ZSyYpjpfySUtln0sk8xFFNBf/3EEMlkIJxJ93vRj/vE4i0
 drw6jlrqQcy3mwLwIDRCYsrbeTBjv1D2b3eUSQvStEtG7xu6vM5dbXYoiRmQHUbKW0OE
 ls88uGlnPGThzy0cP3HvrfeVPJV6Z/N+dZ81qK/WS3Zrh9Eh6XGf7JLutmYNaazkZCVy
 r0Zcyybr+PTgwLD3gjGPS4Vby3zCVEM4onAU7x2uEywpHq2MSBamplR1h1SEucWkPbFo
 kGyS3iEEpMRWHuEqH/LcwND9wFcH+x5uhg8Xu+NBmYkWT/VbbmM3BbUR9AxycbA4y97i
 /ttQ==
X-Gm-Message-State: AOAM533WjmIBsHu6xfonov4LLL29bbsUlRNcW15iD8XPA8q5PFBjW4ip
 tHUn6cIt9LNjoaV6+6J2HuWQ4uG9c5Af/WhlP8TnVW8SplxalnOWj5N7Wqw6Jn6p4VSkHAUOWEc
 wGZxQWZWlBARCsqw=
X-Received: by 2002:a1c:9ac6:: with SMTP id c189mr4464212wme.137.1610637998743; 
 Thu, 14 Jan 2021 07:26:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAGdsbPmTY+PaYJ/kVxCVptHT15aLKjxRnSVfOszU+6yDoX0cFwt71xnHRrhohrxIvicVRiA==
X-Received: by 2002:a1c:9ac6:: with SMTP id c189mr4464201wme.137.1610637998612; 
 Thu, 14 Jan 2021 07:26:38 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id h9sm9646376wre.24.2021.01.14.07.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 07:26:37 -0800 (PST)
Subject: Re: [PATCH v2 1/1] security-process: update process information
To: P J P <ppandit@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
References: <20201203142902.474883-1-ppandit@redhat.com>
 <20201203142902.474883-2-ppandit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <73cb359c-164e-13ed-dccf-1706e03ea52b@redhat.com>
Date: Thu, 14 Jan 2021 16:26:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201203142902.474883-2-ppandit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Petr Matousek <pmatouse@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Prasad,

On 12/3/20 3:29 PM, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> We are about to introduce a qemu-security mailing list to report
> and triage QEMU security issues.
> 
> Update the security process web page with new mailing list address
> and triage details.
> 
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  contribute/security-process.md | 154 ++++++++++++++++++++-------------
>  1 file changed, 95 insertions(+), 59 deletions(-)

What is the status of this, is something missing?

Thanks,

Phil.


