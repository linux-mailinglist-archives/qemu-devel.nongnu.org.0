Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0C33219A0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:01:29 +0100 (CET)
Received: from localhost ([::1]:60886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBmC-0005mj-HQ
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:01:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEBkS-0004kR-8W
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:59:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEBkQ-0002nt-PD
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614002377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=As54Nb14qDwrMSDpWbgeJnvXe8wWb5Z2+0KbZ7PFUuo=;
 b=Uch+DOpgkHWtagBi4+af9r3ea2HhHfMEMLWMVTdhOvq4NPkTDU8TO65x1A+dXITkFn6CpT
 rSbqvePD8nFg5ZrKn/eXVflAD6woEi3KPpEQq1icyTpP8hL7j8dWKsYJFlQ2sQC9TFmkg7
 YPGT3/GcaZsT2NBLi4EMgEttvntUmuc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-yqKgZVniNZyJWbqluef2qQ-1; Mon, 22 Feb 2021 08:59:35 -0500
X-MC-Unique: yqKgZVniNZyJWbqluef2qQ-1
Received: by mail-ej1-f71.google.com with SMTP id m4so4009001ejc.14
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 05:59:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=As54Nb14qDwrMSDpWbgeJnvXe8wWb5Z2+0KbZ7PFUuo=;
 b=gLUMFROHnA2BlvMJabyyV9f0aZcLfCbaNmO5ejK2t588XN4Ac5FkBQ2zx+wmgB7ACU
 zJaedtXy+IHBTsRXk2Gk7bdlAs2YLqC7xvumUpYVHcshVd06yoyYob9Xg4Z3yjCzXVhO
 waK2wLFZPk2xgEGQCQxyAlZbZZ94yJMl4WBICH6eBgvchD2M7I2IZPt377sw57HALzmE
 2gES91Az2osMxlmYuoa6OYcTH9qFIgVH/YkFAbnytql4mEB13ZuzQOX8UBfQm1cjmObT
 d8ru5sv3BQ1DGOuHGR9fYkGBzIUgnelVOD+64owXZZEF34xfz5plYnHfcmpATD0fJeEU
 deJQ==
X-Gm-Message-State: AOAM533HjDmBH/F7/rDXcsMLidSvEKMJsPe6VYZMt2feilxxRpvwFSza
 pOm9iVnc4Kp69yxWN+jSePXTPDjMtiFAg3BBGUqUS4cQnLQbsrfb7pHYgkC+amtE98K0Bxz45VT
 xdH1SL6LwVp7DQ2M=
X-Received: by 2002:a05:6402:26c9:: with SMTP id
 x9mr22777115edd.365.1614002374238; 
 Mon, 22 Feb 2021 05:59:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyeE2HsY0gURaAMH/UL0N0fY38OfEHlwF8YIUfGXuL2MmhC6kTuUVuSNSulzumwvFFW92gvBw==
X-Received: by 2002:a05:6402:26c9:: with SMTP id
 x9mr22777102edd.365.1614002374120; 
 Mon, 22 Feb 2021 05:59:34 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i13sm10267218ejj.2.2021.02.22.05.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 05:59:33 -0800 (PST)
Subject: Re: [RFC PATCH v2 2/3] hw/pflash_cfi01: Correct the type of
 PFlashCFI01.ro
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210222090747.2310104-1-david.edmondson@oracle.com>
 <20210222090747.2310104-3-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e446d959-a612-d919-fc19-486eebc87666@redhat.com>
Date: Mon, 22 Feb 2021 14:59:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222090747.2310104-3-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 10:07 AM, David Edmondson wrote:
> PFlashCFI01.ro is a bool, declare it as such.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  hw/block/pflash_cfi01.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


