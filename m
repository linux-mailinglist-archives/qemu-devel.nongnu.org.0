Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5621B32518E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:37:58 +0100 (CET)
Received: from localhost ([::1]:48720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFHm8-0000nt-VP
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:37:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFHk6-0007pP-TS
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:35:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFHk5-0006Rh-D5
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614263748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c7Z/QEVPkbUFhJjMrR/ePFYpI2Exz098BZak69kMYss=;
 b=JPPbjlwQzUj4VxEJJ+clGKL9yPddP4swxb7lUSQFnZJV1JN2xskPVzGSLntYQu2bCBodkN
 4hp/jv3e1UXvRLfu7HmYvh9LdqEEDg48dQOR9tibjRUjJhy6taW8P66YB3fuatVbfN9ilo
 PMT+e0Lefr7/nv5brJcTDZh2na2hgJs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-fGnsbyqcMWmFsubTLDDCtw-1; Thu, 25 Feb 2021 09:35:46 -0500
X-MC-Unique: fGnsbyqcMWmFsubTLDDCtw-1
Received: by mail-ej1-f72.google.com with SMTP id w22so2505220ejv.18
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 06:35:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c7Z/QEVPkbUFhJjMrR/ePFYpI2Exz098BZak69kMYss=;
 b=jo7ujdoZ7TBadCB+EGKAp3y+gCOxMOKG/hBlmV0hcVqIpNx8HXNpOX3vFZxaDW2XPg
 KmuGiT3mKuFd7E+XVwy5s4Q1EEojP3Y0Z4lzLQ1zCbjAqKaSxx8eLjp9RcabHku1aPgg
 TV+E8m12PuJrj8/b/TdPSt3Bsy59uF2Mgxn6LS9Bae3jMb19BBVCKEWnKd30iDNOgpp/
 zVnCcft3IJfW4+QSi9IdSfUh+DDZm7oqjM9xyojVCxZPe9xFOkWWq/w2SlHuuEVgx/Eg
 sHzOZuNfcUGxiNrrfhPm3IX1tWU3VyoI+2lzUauKK9u9CUG/qOquMm1FmZIiJpRxiEbc
 uPGw==
X-Gm-Message-State: AOAM533FsHIpDSEDfne5oKsMA9nnGssvJ4Iq78D5SVVEMrvuTbYdPd9R
 nE0jV1H71+eMLCRBPBHxBlV1VudUgc9JPmqKQ9uIpxl0JWTIe3pIPHTTLiTageNp1E69qh26qGc
 xT+4k0g9/uZmQ4hM=
X-Received: by 2002:a50:cd8c:: with SMTP id p12mr3275863edi.114.1614263745365; 
 Thu, 25 Feb 2021 06:35:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGcNLRA27uYMRSfdQK0ipq7DWuVAfO7UzzGiDIWWOBcBA2ZjzkfbnVwQt7pl6oN1yY/XWUGg==
X-Received: by 2002:a50:cd8c:: with SMTP id p12mr3275854edi.114.1614263745280; 
 Thu, 25 Feb 2021 06:35:45 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g3sm3790741edk.75.2021.02.25.06.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 06:35:44 -0800 (PST)
Subject: Re: [PATCH 6/6] tx_pkt: switch to use qemu_receive_packet_iov() for
 loopback
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210224055401.492407-1-jasowang@redhat.com>
 <20210224055401.492407-7-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e10b2217-a894-804d-9e9e-3ab5927a2d37@redhat.com>
Date: Thu, 25 Feb 2021 15:35:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224055401.492407-7-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 6:54 AM, Jason Wang wrote:
> This patch switches to use qemu_receive_receive_iov() which can detect
> reentrancy and return early.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/net/net_tx_pkt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



