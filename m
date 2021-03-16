Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D9933CE89
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 08:22:43 +0100 (CET)
Received: from localhost ([::1]:46270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM42M-0005FX-JD
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 03:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lM40q-0004af-2J
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 03:21:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lM40n-0008P3-5J
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 03:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615879264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sjJss5PokEuilDJn1gUrfnqgmByEuQ15RAsR8lbSaho=;
 b=dY14CHBtbJm1oF7JdtrXzMH2KZ9nG1Re5nOWoK9MJGrpGAqZVzh5tWQd3H3x8hrcKa9Ek5
 uLsLeK+GoWFkgz9kIS0STfpxRV4+izPKXpuaqwgmk29+srOAna/qvsa3qT7v9HC03JqrUU
 n/QTAy5f7WgVT5/MYK98QRswdh0SR5o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-N5h51rsRP3qGFe_Z1OH0Uw-1; Tue, 16 Mar 2021 03:21:00 -0400
X-MC-Unique: N5h51rsRP3qGFe_Z1OH0Uw-1
Received: by mail-wm1-f71.google.com with SMTP id i14so9171374wmq.7
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 00:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sjJss5PokEuilDJn1gUrfnqgmByEuQ15RAsR8lbSaho=;
 b=aTqR7e6zkmZBRZZBtSdbUcrDCPpY1l1nf05l+G14Uxz43za8XfMAEdLmA9gszJLEc/
 kgHGW9Gs55lWtGxa2hhAsrsxpnGgudiBpTFm21DOhTciSMr1PkJs+3ipahZTvLyOttrU
 dnpDE22RpVeuWpUKDm77u8GRXC4Qep0QTSpfaGIJ7E7Q/Ps6JAi1cPacxirquyv4ZM1u
 BAQCawqyhMxivFzctwceObifDDCkQvaNJ83WWwHBELyGUqztgW0zRaos7gB9llU/MS6U
 I1FiZSCvI2IEW1qHBJjVYOvJ0B9HV4AXtBQXnsK13OiATGhVrLlYVJFTSaFgujRiEWHw
 VxZw==
X-Gm-Message-State: AOAM532Nwt5EXgJpUBgRh9VXwkBXCTh6nknKAS34S9twwss/vdPL7TVg
 EbWd4fE8EsITWLenVL8rCfQuoX3NJmLDqqu9Er3wuk95KIqmZjiZuCLbcA+8h2iZwLiSQDT1Lnf
 0fPZ929Pj6QN3wyCOboX9rmyuNYN7urUtBX4Ey8zCfJQJW/h+HLD6pBGnhAumR9HGjok=
X-Received: by 2002:a1c:6543:: with SMTP id z64mr3251252wmb.50.1615879258684; 
 Tue, 16 Mar 2021 00:20:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpCbeNF/mdTHzpNQ1aZh254mqsC9PAQOLwd86Ha3cktbH/0jgfMZA19tvFN6J6sYmRifFujg==
X-Received: by 2002:a1c:6543:: with SMTP id z64mr3251231wmb.50.1615879258504; 
 Tue, 16 Mar 2021 00:20:58 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g202sm2293048wme.20.2021.03.16.00.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 00:20:58 -0700 (PDT)
Subject: Re: [PULL v2 0/5] Meson version update
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210315173912.197857-1-pbonzini@redhat.com>
 <CAFEAcA-XrOsZnUmxTCA+YbaL3rXxLMMmW5-bXJkRc0h_7v2E+A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <27654af8-54c1-b270-7d71-4d698abbfcc2@redhat.com>
Date: Tue, 16 Mar 2021 08:20:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-XrOsZnUmxTCA+YbaL3rXxLMMmW5-bXJkRc0h_7v2E+A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/21 23:04, Peter Maydell wrote:
> ../../meson.build:1:0: ERROR: Value "true" (of type "string") for
> combo option "Localization of the GTK+ user interface" is not one of
> the choices. Possible choices are (as string): "enabled", "disabled",
> "auto".

This probably dates back to

     commit 0e8e77d487b3d8ae33158e61c30e1fe5c753a114
     Author: Alex Bennée <alex.bennee@linaro.org>
     Date:   Thu Dec 10 19:04:12 2020 +0000

     configure: move gettext detection to meson.build

     This will allow meson to honour -Dauto_features=disabled later.

     Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
     Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
     Acked-by: Paolo Bonzini <pbonzini@redhat.com>
     Message-Id: <20201210190417.31673-4-alex.bennee@linaro.org>

but it should be possible to work around it.

Paolo


