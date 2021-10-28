Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36E843E6E1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 19:11:28 +0200 (CEST)
Received: from localhost ([::1]:38002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8w4-0003DB-3P
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 13:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg8tx-0001kQ-TP
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:09:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg8tw-0002XE-GY
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635440956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c/4uPvbJhv1eESm224CILAFWOHiTC4r+s4Bx1ONRPzI=;
 b=Vl7mhEKL4YYhmlENotqacajJ+7N2CPPFiVldpL7bjvvt9J+K4E6KzEzjgGvPVrJmDuzsl0
 CSGW2JzolLkfQsmIq3zme7lYw06fiCLOQt2sMrjnTBCVRPidbQp6VGALvUrE8OmArgnDhD
 41qUzTVYaSy6nSgz+Xdfoi8iLFq06dg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-mMcr7x1WPcuO-8y_vj7lgw-1; Thu, 28 Oct 2021 13:09:12 -0400
X-MC-Unique: mMcr7x1WPcuO-8y_vj7lgw-1
Received: by mail-wm1-f71.google.com with SMTP id
 o22-20020a1c7516000000b0030d6f9c7f5fso2633349wmc.1
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 10:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c/4uPvbJhv1eESm224CILAFWOHiTC4r+s4Bx1ONRPzI=;
 b=VpN1qKWqO8pELLqMm4+2W+IFEaERGaXounmyguXlZgg4IYqm7sHWbtXCevz5FM5EL2
 R9AkMOslw/DrhdbD8c8agn/pT0sdzFYqscG8jgEJqAL9PY0Jbjhv4vQN8cHxj4ZagFka
 jxfkbv86oX92zvn6Hl2fCvYVzMQrij43WSKFV8YG66N/srl5vKxxZNrwsxPG3Yksogr/
 ZpsvPMeQplZZvdkDsYxX1+2sVKFNuesUuCNXIbcmhNjWtx6ZIpYBr+qicH2k3+37NIXg
 /cIeNyeOD15KGGQpmUptgUOj+SRksQzKzgPutfRHuXVCsQ6j79mEYE71deM3phV+9wRY
 2EDg==
X-Gm-Message-State: AOAM530/W1+o5kBNC4gtXmAC1h1rOJw5utjclb0gubSpus3SPHQMFKHG
 fSRDQhqfCr7UM4TmEFTrGVf7mYQQkxqsRgwuYPHzk8AK25wj2MXAAiImMKZzlpMVKwXjsv9qj2U
 JUVsM+D4pj+HQXws=
X-Received: by 2002:a5d:500b:: with SMTP id e11mr7178618wrt.205.1635440951488; 
 Thu, 28 Oct 2021 10:09:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5HUo6PQwhIhjkX2fNc3jwaWIxWDTICs3ZHdf8j5fE8BiRwCZXfwXKnQwMflRv02yySC8R2Q==
X-Received: by 2002:a5d:500b:: with SMTP id e11mr7178589wrt.205.1635440951356; 
 Thu, 28 Oct 2021 10:09:11 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n7sm1926199wro.68.2021.10.28.10.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 10:09:11 -0700 (PDT)
Message-ID: <d15406e7-5974-e4f2-1786-f97931b88608@redhat.com>
Date: Thu, 28 Oct 2021 19:09:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 03/22] docs/devel: rename file for writing monitor
 commands
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-4-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028155457.967291-4-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 17:54, Daniel P. Berrangé wrote:
> The file already covers writing HMP commands, in addition to
> the QMP commands, so it deserves a more general name.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  docs/devel/index.rst                                        | 2 +-
>  ...riting-qmp-commands.rst => writing-monitor-commands.rst} | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename docs/devel/{writing-qmp-commands.rst => writing-monitor-commands.rst} (99%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


