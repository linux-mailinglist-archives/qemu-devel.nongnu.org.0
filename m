Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B6C42ED57
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:14:36 +0200 (CEST)
Received: from localhost ([::1]:60514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJIS-0006q7-2S
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mbIep-00053T-RT
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:33:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mbIeo-0007sx-9I
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:33:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634286815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KQFGELZsbSX12Ga/U/DEJ+9p2fzxrZGyfKfA6/nYq50=;
 b=J9qOe8pfh/0HY7++0cp+9wn04b0Ko3unymLa/IuW9qwjzKSL7iQuSHTWXp8aSZDv/0sr6b
 CbOqyB/WSYjlEKc9yR5B1GhXJDctFHF2m+MqgLvx88e29/jPMXs2G6GG/8rR3oOpa9vjCs
 7mQicq0AlVz3GRo0YMSvPHO2v23H1Pg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-N5OjDCsLNVaW45rCovUtng-1; Fri, 15 Oct 2021 04:33:33 -0400
X-MC-Unique: N5OjDCsLNVaW45rCovUtng-1
Received: by mail-ed1-f71.google.com with SMTP id
 l22-20020aa7c316000000b003dbbced0731so7587452edq.6
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 01:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KQFGELZsbSX12Ga/U/DEJ+9p2fzxrZGyfKfA6/nYq50=;
 b=eIE0KlK0IxQqAQr7owPCfByvxpq0ETdL3I3I5TTaxd/E0NXW1aq0GgVgQZ6CYRmjyh
 FZgopWg3ZeZ3klJ2Dwlg8hrUBa1X91N0P5c5dw3rjnNuSIITIgIgDC6NUlZTN1mXODrz
 Wy4iPNTdKS61NoVUq8Jsu6B3ftWDaQj46HlHVsj6bgy8DFri7AaDbyoYc+ZCORagmkL0
 dxWehiSvT9kyNIsFzKiSDDTXw7x1asgR5ibKFmP/AlRFGWS356UYoRKx3CnjofvKlwjS
 uHikVg1BUnAeag46LGx0V/nfn6TwB2C3wHNGDL/KLLCiI+DFuHBdSXPEdACD+KHCHmu/
 Bk7A==
X-Gm-Message-State: AOAM531jVZ9LtINt6h4GrMCNd9qqBeze5pkK6+r3erC+ZlWZtmdV+er9
 txizG7dlD+yxhYLxlpw6LtRDDOYSMgBm+CnXq1Z0tw0VPU+b2OEhaZ4OuM04XpqikmizLZTOC4R
 r8u8iWd82TksS2FI=
X-Received: by 2002:aa7:c941:: with SMTP id h1mr16309712edt.128.1634286812717; 
 Fri, 15 Oct 2021 01:33:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOGb0KO5bCPcMqEaDmHjjPfK00CfurWG6dfLWfesjdaPGtYeCtwXKFVBk0DlYD1a56lHGcTA==
X-Received: by 2002:aa7:c941:: with SMTP id h1mr16309686edt.128.1634286812527; 
 Fri, 15 Oct 2021 01:33:32 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id k23sm4075009edv.22.2021.10.15.01.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 01:33:31 -0700 (PDT)
Message-ID: <cdb65b5e-1c37-4ef6-5d19-532b7ccf6f56@redhat.com>
Date: Fri, 15 Oct 2021 10:33:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 0/2] Makefile: A few fixes to tag generation
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210804132328.41353-1-peterx@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20210804132328.41353-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/08/21 15:23, Peter Xu wrote:
> I didn't squash patch 1 because they fix different things at different places
> (patch 1 removes the "meson" dir warning on master branch already for gtags).
> Patch 2 is the same as posted previous on the list.
> 
> Please have a look, thanks.
> 
> Peter Xu (2):
>    Makefile: Fix gtags generation
>    Makefile: Fix cscope issues on MacOS and soft links
> 
>   Makefile | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 

Queued, thanks!

Paolo


