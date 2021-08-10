Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4930D3E7C10
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 17:22:40 +0200 (CEST)
Received: from localhost ([::1]:35694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTaR-0007ar-B7
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 11:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDTYy-00053T-4E
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:21:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDTYw-00038Y-Gg
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628608865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F90fKUWLCQBNWj2jG9vzqCrtj0qXJCPOh3117u+sOyw=;
 b=Qafb8+ea8RYQH7E2VjnUZgTyqANYKaSGBiawXfVIAxINr7/tcKtsyCWA9bQz6mjf6A5qCR
 qu5SkYiR2PkLo0y8FXv8on/DXQ+MUOxXnEGxEG8cBeHySXHzgHRJwCc8CjQgHw74R5X9DR
 mOCQ7q3a8qKPM+ctB1CLkoFKbEk6EzE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-8NgbUvb0MBC6oFrF_xbxPQ-1; Tue, 10 Aug 2021 11:21:04 -0400
X-MC-Unique: 8NgbUvb0MBC6oFrF_xbxPQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 z10-20020a5d440a0000b0290154e0f00348so3067673wrq.4
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 08:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F90fKUWLCQBNWj2jG9vzqCrtj0qXJCPOh3117u+sOyw=;
 b=JtgqsSidzYWvlo/4TFTROW64VA8pASvxfYmlCqFAUgsxHID807MHvdygxBlH0iaGGX
 JTxMnwxzen1oriWdO/EZ/X4BKGcsgpgm1pHJD/Tm2JtlNIexTVpp39F7TyysnZjOm/fP
 kap930Q5FYbD8lAkZ6JCuvbT+q+qaqzG0myi2quBTMpTBixQYxcpm6vtPDkl2tB2Qgb0
 AGxdhIXtVDXfI7rnWgC2vPPPzIFQ+DEfbr09Td18G0AO3jeiwK0OVv96mzGiaEA3eN0m
 hN6jLFTb6NV1FzTi3mPUAqaohDcJgAViTKPcqW0uPEuPw4m7i08MKsEIa2WaujzbAZ0Y
 oDNg==
X-Gm-Message-State: AOAM533vFmfkN5b5+URYYctZrQ1e1bIN5GRwZRCSvEpL0pcdCgjhC6ah
 A+vghqEY432WJ6XOyTtVvLy5iXVuPeF8UVNs0Mv2FEkjRtB+oilF5FNBnUXLl8tgjz1RdQ8ECAP
 ts27UjoZfK/vcvzyOQkY4OkSotRxdbaEU4MZe7Pltrx61lWomx3Hgf80xOqH6BphF
X-Received: by 2002:a1c:f008:: with SMTP id a8mr3700505wmb.83.1628608863030;
 Tue, 10 Aug 2021 08:21:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6ymsLxzG61wFJGGWv+JcvJJgyfijD/NEPGRUXkFCy1m2aXu6PuOCQWO3fcacaMVyIHVVG4A==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr3700485wmb.83.1628608862826;
 Tue, 10 Aug 2021 08:21:02 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id y3sm12670001wma.32.2021.08.10.08.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 08:21:02 -0700 (PDT)
Subject: Re: [PATCH v2] MAINTAINERS: Name and email address change
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20210810140411.173369-1-hreitz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3b7400c3-0d7e-4111-4102-9b08d40a84a5@redhat.com>
Date: Tue, 10 Aug 2021 17:21:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810140411.173369-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/21 4:04 PM, Hanna Reitz wrote:
> I have changed my name and email address.  Update the MAINTAINERS file
> to match, and .mailmap in case anyone wants to send me an email because
> of some past commit I authored.  (As suggested by Philippe, I put the
> .mailmap line into the "preferred name forms" section, considering it
> counts as a git author config change.)
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> v2: .mailmap update
> ---
>  .mailmap    | 1 +
>  MAINTAINERS | 8 ++++----
>  2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


