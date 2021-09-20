Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF14E41152A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 15:02:10 +0200 (CEST)
Received: from localhost ([::1]:43156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSIvx-0006uz-Vm
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 09:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mSItP-0006FA-04
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 08:59:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mSItN-0007vP-JK
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 08:59:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632142768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uaWzMgr8udi7pc4hhZutUb2H5Z9m5uZHRD4yFoSu1BQ=;
 b=HOz7DXUsGASjP4VUQttemV4PIQNH9//akNpzP6TTnTyFsYZcSmsWnPJ8U6TNCKsJYLbyIK
 T8KuvCk2sgcbGOP0vxFBspU7Qe43zX0r+wkgDLrpC653D7YbfzPnNe1LW0gFuDQ/bn8X5i
 2YIn/LGi/CGxD2chcFGymNSExMlldWA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-htcw9GKrPiuPj-jLgF7LKQ-1; Mon, 20 Sep 2021 08:59:27 -0400
X-MC-Unique: htcw9GKrPiuPj-jLgF7LKQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 z6-20020a50cd06000000b003d2c2e38f1fso15532334edi.1
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 05:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uaWzMgr8udi7pc4hhZutUb2H5Z9m5uZHRD4yFoSu1BQ=;
 b=s/9DV8A1rqOVM5GWlFPF3znysu9XOBzPYlpd9U07ZnjGW9XdOpiDIeAHb5gfaxz0vz
 WmA06pTrBg1QSmpBeEqCuuEf21Lr+lROh6uzhZpZ/SaZ+o8agQETFg6/PstVnJHftqq1
 Xp/jWKFnmMV+vR0ct72UHZ6qiEO8VBePRMECAXDyylKs0PiO6EPZQe+kVeaMVoV5CZh6
 bA+ntU+MO3FnTvn+VX2zVNqRRcnJU07ba7A6Ewh8rLuiSwToLtBFYCY1iCm9N2to5QDX
 sKLf7rs2YmdtJ6mLqPQhgKm0n8ABjOcSGfd7GLAoIKcW11j4lvPyOtS9XEc6JiHf64tU
 Nszw==
X-Gm-Message-State: AOAM533rxYV3u/w1p8142TzGq8/zQrKbs7rpL77ge/EFka4Wltprfjag
 G52/HVzebtFXGL0PqimOJPcoTxZohHKeP0UDnSI8Z1ZcaKvhBhuyW3UomalcjdlNsnLQvvYJdEb
 wu7lUIjJloqPqTxw=
X-Received: by 2002:a17:906:b7cf:: with SMTP id
 fy15mr28680323ejb.397.1632142766049; 
 Mon, 20 Sep 2021 05:59:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvuKGSVFG9CfGEZuR2rB3p5FoqrucaJiL0FjSN4g55RAVxmPyTHj2m67yFmzuwa6iXx4klag==
X-Received: by 2002:a17:906:b7cf:: with SMTP id
 fy15mr28680306ejb.397.1632142765878; 
 Mon, 20 Sep 2021 05:59:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id yc11sm6176550ejb.59.2021.09.20.05.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 05:59:25 -0700 (PDT)
Subject: Re: [PATCH RESEND 2/2] memory: Add tracepoint for dirty sync
To: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
References: <20210817013553.30584-1-peterx@redhat.com>
 <20210817013706.30986-1-peterx@redhat.com>
 <43b42f6e-f2a2-6341-0c53-bcf1586fb191@redhat.com> <YRveXqqR+DELQVSe@t490s>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <920ce1be-9914-8742-ae39-18d7ef9f2e67@redhat.com>
Date: Mon, 20 Sep 2021 14:59:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRveXqqR+DELQVSe@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/08/21 18:05, Peter Xu wrote:
> 
> I'm also wondering whether kvm-smram needs a whole bitmap as I don't know what
> RAM would be touched within system manager mode (as I thought it should only
> touch a very limited range and should be defined somewhere), but that's
> off-topic.

The kvm-smram dirty bitmap will include all memory touched while the SMM 
address space is in effect, so not just SMRAM.  The two KVM dirty 
bitmaps end up in just one QEMU dirty bitmap (the one with id 
DIRTY_MEMORY_MIGRATION) but they are separate at the kernel level.

Paolo


