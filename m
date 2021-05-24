Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D8C38E380
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 11:45:06 +0200 (CEST)
Received: from localhost ([::1]:57776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll78y-0000Mg-U7
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 05:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ll76M-0007Ig-TJ
 for qemu-devel@nongnu.org; Mon, 24 May 2021 05:42:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ll76K-0007Ps-R9
 for qemu-devel@nongnu.org; Mon, 24 May 2021 05:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621849339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gkLa83eAm3ErNSzZclQfi0fA82J5NQhMXyvRMqGiSAA=;
 b=QJGJaoDt3qvgjXTrk+jNx07KOlHBDREtMCJOdnvpXPSOoPDRlTbsqcj0i+EBsnpxfd0Qu1
 02brZ4kUA4dGmYaIPPOYalW3pi/Emlrovo7HQvkj9E+ieY9DHjsj15cHbOcQMjV4u/v5Z4
 ULWepphdnnrhdmwE0dDjiHajFP4tJwQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-22uppBLhMWyWixGwctI37A-1; Mon, 24 May 2021 05:42:15 -0400
X-MC-Unique: 22uppBLhMWyWixGwctI37A-1
Received: by mail-ej1-f72.google.com with SMTP id
 sd18-20020a170906ce32b02903cedf584542so7368655ejb.9
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 02:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gkLa83eAm3ErNSzZclQfi0fA82J5NQhMXyvRMqGiSAA=;
 b=aVJULERIA2KwxnYuDRP+b9ABoKgFH0dqQl3gJyDV9l2kzA1r99dHG7JlrliE3k/tiV
 C7+8bRa6P1V7VJkHSOrgKoGhmMkDsa4liV1/+wyJKxwurkbh89b2BeHevWaVnMnvaXgl
 hS+UVhOoNoqR0vcCyRi3CcmZgJaap8E7PiECVLNREBfur1Y7v5p3vGzRcECLbcvO+mic
 r97xaXkfbQwifcw3T96uOZBI2xdbTtb5HPcz+VbJGKUGQDGDYXTidf+AI6mvpbGsdEt8
 jA954p9YL01Egjei06fRDhcWS3ZTR7Ewb+sWMpiSIZzXw1ZOkEWZfPlDhdiw+DgXELOb
 qqbg==
X-Gm-Message-State: AOAM532F65io5iHVw/uQ73GmLS3NF2BsEZSeJ+Kbn4lrkdSVxijHsPkZ
 gjd7ISxok0iy/0KbdyjB/aNMyMwg5oh0IWJZmxwo5pNbp/y1cRjCKXwN3Ysk7Gg/qguPWSoqnDR
 4cZtGI5O/r3oHOFkGlNv6o1ngEYIrr5g+6oa4zKeuO9jMaOTKb3fU+S8nmGGo2DXlcJs=
X-Received: by 2002:a05:6402:1a:: with SMTP id
 d26mr7859182edu.105.1621849334349; 
 Mon, 24 May 2021 02:42:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGQFVsQCegQdATTXVqskJaVpuxEy4ER0SU4BKKoiCl9y4A7LKK4Nwx01hkapPDI/RtV59yNg==
X-Received: by 2002:a05:6402:1a:: with SMTP id
 d26mr7859156edu.105.1621849334115; 
 Mon, 24 May 2021 02:42:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y25sm9012040edq.75.2021.05.24.02.42.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 02:42:13 -0700 (PDT)
Subject: Re: [PULL 00/26] Misc patches for 2021-05-20
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210520082257.187061-1-pbonzini@redhat.com>
 <CAFEAcA_MV=UiHW4Kp3Zb4iT_5BHgqVwj9Qem1xjmp1AJ++K=sQ@mail.gmail.com>
 <7775729e-e217-f469-429b-a966996a1ef3@redhat.com>
 <CAFEAcA8CbJyJaooT9xS+Tg+omPCz+w_6rSJER49_MMhHt8h7rw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8bca2f80-b911-f608-5a0c-4e798bcbe57e@redhat.com>
Date: Mon, 24 May 2021 11:42:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8CbJyJaooT9xS+Tg+omPCz+w_6rSJER49_MMhHt8h7rw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/05/21 15:44, Peter Maydell wrote:
>> What OS is it, and is there any chance of updating it?  ninja 1.7 was
>> released in 2017, and I checked that all the supported OSes for QEMU
>> have 1.8 before sending the pull request.
>
> It's the gcc compile farm's ppc64 box, whose /etc/redhat-release
> says it's running "CentOS Linux release 7.9.2009 (AltArch)".
> I don't have control over system upgrades for it.

I see...  Too bad, there is an updated ninja for that distro.  But 
anyway, CentOS 7 is going to be dropped soon from the list of supported 
distros 
(https://patchew.org/QEMU/20210514120415.1368922-1-berrange@redhat.com/) 
so switching to bullseys is probably a good idea.

Thanks,

Paolo

> I do notice that there's a newer ppc64 box in the farm running
> Debian 11 (bullseye), so maybe we could just switch to using that.


