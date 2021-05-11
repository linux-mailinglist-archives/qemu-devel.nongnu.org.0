Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A7737A0F2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:39:06 +0200 (CEST)
Received: from localhost ([::1]:59918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgMyv-0000IG-Uu
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgMvt-0005ac-Kl
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:35:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgMvs-00030N-59
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620718555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WaUc9MabN98oyPiqjs5tZtqzQRlr4+x2sdK9Z5D4euU=;
 b=hf/EVmXOwIAAoNyLL2YI3dECscJfVA+8eVLv/0A5NVTNSxLKVl1kbnW9bcarqto01z6pTn
 bX/ME/9vo15lYC/h0XJksL7253evh4LnPT4ZKobId4KflObrr1BLaWWEMV9fQkZ+q3NjVK
 85QfxCJ4Ee6qrqwQaEg3O7bJUI4tP1M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-GXGPIVD6NCWwDjF0T_rflA-1; Tue, 11 May 2021 03:35:51 -0400
X-MC-Unique: GXGPIVD6NCWwDjF0T_rflA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l4-20020a7bcf040000b029014daf4d9d3aso410549wmg.1
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 00:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WaUc9MabN98oyPiqjs5tZtqzQRlr4+x2sdK9Z5D4euU=;
 b=FVTyJJVBqWujQUmn0fMkbzPuKS8xsKaYLM6U1bsrRlrunBaa5EeO/Dit58XyBy2ZjA
 t9KzyTRoUzzAy3/j+VtJmwTjgm0xJYptekhF4wiWETj5BjU/frPTd3LMnNzHw7TZs6gf
 7nCaa7sE2Si9UfpzytUYtBQl62RcN98YqfppYm0I5WluUl/Axq+K0AIRxYi6kKYDEYvA
 d3WVrZ668pBToQgpb1BRPd5HZNIM7GYqpx9KlH6rTYZibxM/1xsJrnLj1plyJn3nWZlz
 OpnKMKc/OYtk9T+sUKswseHCxp6+sFdWhwilWpzjhxc/M6M6K838KbhJTiiRNjMsydmZ
 PNtQ==
X-Gm-Message-State: AOAM533RDuDYHjfwKTwSCbLpnYqIxB1pBAykLoBejYDoQba0jBSxA3gM
 OUiBuy7MjyUMIF5WpNxBPZfboKZvv9hJDxS4NY5tk7/nmBaycdupNsks6nt1joseTsupW0F4ngs
 07U02GrMi9AWAe88=
X-Received: by 2002:a7b:cb45:: with SMTP id v5mr31917028wmj.48.1620718550314; 
 Tue, 11 May 2021 00:35:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb8cBIT7cKCm9UeZMXCmn9Fwx2CPIbCy39YioFipcRVSODHcrkLfSx0VWC+BgksxowHkwdDg==
X-Received: by 2002:a7b:cb45:: with SMTP id v5mr31917001wmj.48.1620718550101; 
 Tue, 11 May 2021 00:35:50 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y2sm2857657wmq.45.2021.05.11.00.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 00:35:49 -0700 (PDT)
Subject: Re: [PATCH 0/2] [RESEND] SEV firmware error list touchups
To: Connor Kuehl <ckuehl@redhat.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210430134830.254741-1-ckuehl@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4988c9d5-27e4-62ce-6f4b-96c3ca2de4d5@redhat.com>
Date: Tue, 11 May 2021 09:35:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430134830.254741-1-ckuehl@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 brijesh.singh@amd.com, thomas.lendacky@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial@

On 4/30/21 3:48 PM, Connor Kuehl wrote:
> Connor Kuehl (2):
>   sev: use explicit indices for mapping firmware error codes to strings
>   sev: add missing firmware error conditions
> 
>  target/i386/sev.c | 48 ++++++++++++++++++++++++-----------------------
>  1 file changed, 25 insertions(+), 23 deletions(-)
> 


