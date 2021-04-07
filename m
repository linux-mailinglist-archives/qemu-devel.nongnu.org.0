Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F51E3576C8
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 23:27:34 +0200 (CEST)
Received: from localhost ([::1]:51472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUFi1-0001iB-EU
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 17:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUFgD-0008J4-IH
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 17:25:41 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:41608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUFgC-0000gg-1b
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 17:25:41 -0400
Received: by mail-ed1-x535.google.com with SMTP id z1so22585383edb.8
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 14:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gxo+t0Ft9qmN4LKsu2j/lcMf/U2E33U/D6dWxJ44tG8=;
 b=IEixdz0RqAFcN+C9CQqHgwnjzXXxhECGcCmFMqWh7+RKZygBkfZPJqmawdSQsyES6R
 GRe52XADOJQKSJsWCh/1Tp9521ddB6EXqnM3jaHeUJNA2XsfZn0eAZ0WWq3XSNussMJy
 vxRs1vPs0jMVf/JhpSgo34Zdx0RzywGDCbW5lnyYD2kXHnG4G1tdI32RSKVytcEtswdL
 sQwC/jKuRADu8Bx72+qcmgHb2GiYGRSNLcDPjycFt/vV8I58r/2WO5HebzG8Iw4F3LVc
 QHD8OO0Jf8oa5nESn0IcAmBsuJA7JhceqvwAcxL+Smr6MRdxJ1uMkU41E6PypTBS5IUp
 IHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gxo+t0Ft9qmN4LKsu2j/lcMf/U2E33U/D6dWxJ44tG8=;
 b=sJn/KpdQL8p4b2Nj4jOeEiDQmQDYdghppPLlDgk7fddFCAsIBPONeiuoX8v92fIOMM
 q0KgEh7tXR7T7WRn5Nm1CJwNC8HqA/xYCn1Y6sfs/zz+MulGJWkAEsiBc1da8Jek0pEr
 pbYfaPQfxNxdHaqO3/YMUf+3pavpeFmLO3gzuTjXwpGdzXbKIKbRnUDMVaLgDRUMLtt2
 YdsVHdM2HmEMQnVxc5e2OwWJxnxrEZlH+8I9mpbHRF2n6i22CWEq3l42AP8tCUouLAnk
 HHRp7vHAipbOY5J3u70ebjZ96HbMLoUShMNgjINeLnSvfRYVc/udlt3bklKNS8AN2gvA
 Wu6A==
X-Gm-Message-State: AOAM533LOP3/GjwGiCb2KG30rTE2hPbrqWQyLrP1uW9+VH0PPmMuToDF
 OMya0MswoQI1db5v5s7E+X4=
X-Google-Smtp-Source: ABdhPJwUNQPuKxtwai1MA/gNNxKs9VcgQ+4e2TIEYV4MA+iW5GbTWtHZBOYW894+XVHXMUYoqKn4Vg==
X-Received: by 2002:a05:6402:280c:: with SMTP id
 h12mr6702281ede.332.1617830737668; 
 Wed, 07 Apr 2021 14:25:37 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id w1sm8478502edt.89.2021.04.07.14.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 14:25:37 -0700 (PDT)
Subject: Re: [PATCH v4 for-6.0 10/12] esp: don't reset async_len directly in
 esp_select() if cancelling request
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu, laurent@vivier.eu, pbonzini@redhat.com
References: <20210407195801.685-1-mark.cave-ayland@ilande.co.uk>
 <20210407195801.685-11-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f41433db-68e8-407d-379e-f541d54211f2@amsat.org>
Date: Wed, 7 Apr 2021 23:25:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210407195801.685-11-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/21 9:57 PM, Mark Cave-Ayland wrote:
> Instead let the SCSI layer invoke the .cancel callback itself to cancel and
> reset the request state.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Tested-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  hw/scsi/esp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

