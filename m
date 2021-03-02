Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E58329B1C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 11:52:46 +0100 (CET)
Received: from localhost ([::1]:36080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH2dx-0005KG-UV
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 05:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lH2d0-0004tH-Mu
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:51:46 -0500
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:38895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lH2cz-0006bn-3D
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:51:46 -0500
Received: by mail-qk1-x72c.google.com with SMTP id f124so1510619qkj.5
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 02:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q8hHbWC03zNN4V8I3Ho8yNp4e3TBYmjD67Qt4rHkiX8=;
 b=NsUaB6pQJ+4DbMOxRIWh2aT6HJ1r9AVCwRlJ+veWE0qZ+clsHExrWkhebGMvwIMyKo
 ObGXFHVWYzxNkE4+oHlkCbfmSMzQ5SOSikTVuy9pGxAuTDrDldkH/zb98Z32QRrjAkSq
 qG6dBq3T+0vx6NolErL+Qp3siG99WDFz3fRklYOFeYDlc4sjIdZ3v1j3fWByX3mXzgPA
 lDcd+hZW5nRFSqUTbVzpuksfPCSjuucDTXfbjulPPJW1G8DSnoudZqPqHSNYFC3jlw4m
 gOlwLAM5mGpAzuTMhmbVTUARJm8gbeEafUPxnmHCUlGzFRtRDHDCezFzTjvzAoBW8Onv
 YuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q8hHbWC03zNN4V8I3Ho8yNp4e3TBYmjD67Qt4rHkiX8=;
 b=mJ3vsQwoJvkLeLYZ9ShkrCigkrhRd/UhgkdCq0YBFQZ8aY74uA6mtRv4IWCUTnGHRS
 EdJISUL+BYv9Q916/iP4gJ4YktXltcFAhmwyqgBno5/zXxCmN+f68ui4vOEPz/xUKYsb
 q3tOivtpA0LABJmNcwMhRwp8miqDefl7VrdhfanKlN9chZxA3URkTbC2b1pWriMFTJXe
 AGEEq/jLaBCi9w2wFHdQju3MNaomzUgb2WcQ6nxMKdVpFM1Qzc1pStaTDwgHiY8cCYN8
 tg9/fwCfgLw9xbDBsfS5Ce5QnOKyojSj2MBqAw+rLJyJMTq6a4cnPOzuX5eX4V15BEqX
 5bWA==
X-Gm-Message-State: AOAM530HHKB/J4Tk6OGa5nT4Lo+FRMaaFol/AOhKVZUipXkn3UgqwrO8
 VJcTFmQm5Ese4zHRzlLhPjg=
X-Google-Smtp-Source: ABdhPJyXiGHOVxW5c7Mp7lm+QdfyKbk5zfcQoaA/+pllX+OWD6HLb/w9hQ8V0FjxSRhlCFB2Bp8Y7Q==
X-Received: by 2002:a37:96c4:: with SMTP id
 y187mr19948519qkd.231.1614682304010; 
 Tue, 02 Mar 2021 02:51:44 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:1670:7849:4614:f4b6:4112?
 ([2804:431:c7c7:1670:7849:4614:f4b6:4112])
 by smtp.gmail.com with ESMTPSA id x14sm13242046qtq.47.2021.03.02.02.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 02:51:43 -0800 (PST)
Subject: Re: [PATCH v2 0/1] vl.c: fix trace backend init ordering
To: qemu-devel@nongnu.org
References: <20210105181437.538366-1-danielhb413@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <635eb0bb-f5fc-d3a0-924d-dd417d16cd45@gmail.com>
Date: Tue, 2 Mar 2021 07:51:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210105181437.538366-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, Stefan Hajnoczi <stefanha@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping

There is at least one user in the Libvirt ML experiencing the same problem
this patch is fixing, using QEMU upstream compiling with the trace backend,
and it seems like the daemonization is still not working.


Thanks,

DHB

On 1/5/21 3:14 PM, Daniel Henrique Barboza wrote:
> changes from v2:
> - fixed a typo in the comment block
> - added Paolo's R-b
> 
> 
> Daniel Henrique Barboza (1):
>    vl.c: do not execute trace_init_backends() before daemonizing
> 
>   softmmu/vl.c | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
> 

