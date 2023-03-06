Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6DC6ABF39
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 13:13:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ9i1-0000A8-4N; Mon, 06 Mar 2023 07:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZ9ht-0008WC-7X
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:12:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZ9ho-0007tQ-ED
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:12:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678104759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lNRC5KeZgVIm2t34gtnh/F1Mql0HJ/48tnxQknNqR1w=;
 b=gh2LxmKg52KW3yRR7xe1D9jE5JKuiZapRSZLX3MKZlCXJkTM8plLoGA2SgiUAXNAf553hi
 XcwpXgoRsO6DyDEDznAiThJaBHhnfJJf3GXwYlK+Ra875sHMFcYlC1OwJEPL+ELe1avU99
 nMbLAJ33vuAcQ42XsINs4ysUvKq2nbY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-rlzzGfj_NyKPYKxAjheijQ-1; Mon, 06 Mar 2023 07:12:38 -0500
X-MC-Unique: rlzzGfj_NyKPYKxAjheijQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 15-20020a056000156f00b002ca79db6d42so1425216wrz.18
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 04:12:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678104757;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lNRC5KeZgVIm2t34gtnh/F1Mql0HJ/48tnxQknNqR1w=;
 b=3jyFQVzWLQRsGdbd729myAa8Oyz0gTSFM4zMM28hct+AOaTfjgSd8VN27rt5bk7vt4
 9Ktwo8PVKLPj1m66YsykRmNHpBlsaagrLr6Z1XTGXiO1G4ZPfY5h3f0c/Wf/IAKXffLK
 yuP7IPl9Y1ygBcMIV9DMnnNZpSvpwHUk1EBcOMOpkHc8XPRVXASPrDd25EEH2euV41b/
 om6afjsQ4EWwGxXKDuhs3SEXgTxn1sFEswL8Ur8AWFXo7UrWIaUgbaw6Zx3X5ztv/bAw
 SL+rvhK5uSJkjGyqBrpZXKA7TV60iBXF+MjwCV4NXQT5HiAH0JEUySKR/xyOH95UtFmm
 ThrQ==
X-Gm-Message-State: AO0yUKW+FeESXnt0SkHz+jktcMmUiBg67klwNO2dQwr317i0UAvFy2la
 Dx58XLMfG8jePuH13+aHeQL2DnlM/K3c0fq+mRpAg3pRmoDP6Ds17nTSBsPmnlM4F8yHd08tf3A
 A1EPIkDPT/yaMObc=
X-Received: by 2002:a05:600c:4f09:b0:3eb:42fa:39d6 with SMTP id
 l9-20020a05600c4f0900b003eb42fa39d6mr8956890wmq.14.1678104757036; 
 Mon, 06 Mar 2023 04:12:37 -0800 (PST)
X-Google-Smtp-Source: AK7set+3TjxhIrw26JuONkGZ4H+IAlKLfoRgpbfn5zeSD5Xygxyg4AUZoahvjPYCBYE4hAYj6dLlYg==
X-Received: by 2002:a05:600c:4f09:b0:3eb:42fa:39d6 with SMTP id
 l9-20020a05600c4f0900b003eb42fa39d6mr8956874wmq.14.1678104756766; 
 Mon, 06 Mar 2023 04:12:36 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-59.web.vodafone.de.
 [109.43.177.59]) by smtp.gmail.com with ESMTPSA id
 p10-20020a5d68ca000000b002c59e001631sm9924661wrw.77.2023.03.06.04.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 04:12:36 -0800 (PST)
Message-ID: <bfd4dc1e-0472-483a-1195-37b6c2ca37b4@redhat.com>
Date: Mon, 6 Mar 2023 13:12:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: jrossi@linux.ibm.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Cc: frankja@linux.ibm.com, jjherne@linux.ibm.com
References: <20230221174548.1866861-1-jrossi@linux.ibm.com>
 <20230221174548.1866861-2-jrossi@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RESEND PATCH 1/1] pc-bios: Add support for List-Directed IPL
 from ECKD DASD
In-Reply-To: <20230221174548.1866861-2-jrossi@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/02/2023 18.45, jrossi@linux.ibm.com wrote:
> From: Jared Rossi <jrossi@linux.ibm.com>
> 
> Check for a List Directed IPL Boot Record, which would supersede the CCW type
> entries.  If the record is valid, proceed to use the new style pointers
> and perform LD-IPL. Each block pointer is interpreted as either an LD-IPL
> pointer or a legacy CCW pointer depending on the type of IPL initiated.
> 
> In either case CCW- or LD-IPL is transparent to the user and will boot the same
> image regardless of which set of pointers is used. Because the interactive boot
> menu is only written with the old style pointers, the menu will be disabled for
> List Directed IPL from ECKD DASD.
> 
> If the LD-IPL fails, retry the IPL using the CCW type pointers.
> 
> If no LD-IPL boot record is found, simply perform CCW type IPL as usual.
> 
> Signed-off-by: Jared Rossi <jrossi@linux.ibm.com>
> 
> ---
>   pc-bios/s390-ccw/bootmap.c | 157 ++++++++++++++++++++++++++++---------
>   pc-bios/s390-ccw/bootmap.h |  30 ++++++-
>   2 files changed, 148 insertions(+), 39 deletions(-)

Ok, the patch survived my local regression testing, and it also looks good 
enough to me for inclusion, so I'll queue it for my
final pull request before the QEMU 8.0 soft freeze tomorrow.

  Thomas


