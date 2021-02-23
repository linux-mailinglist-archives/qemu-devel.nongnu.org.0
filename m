Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 275B73230D9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:36:29 +0100 (CET)
Received: from localhost ([::1]:44218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcXq-0001rV-Dg
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:36:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEcWQ-0000lq-Oa
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:34:58 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEcWO-0002oc-IZ
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:34:57 -0500
Received: by mail-ed1-x533.google.com with SMTP id h19so3520745edb.9
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n7ZME13hWI4+kbYoqjEACc3oaTFcdkCbs46Bzo727NQ=;
 b=IPAn0oVYjDhwtuPc347V6+k3Jl+dUyLU25914K7SWWsvhMmNI7XM2SJa0gKTblHIjz
 CQy6VDHsHuZoqWJ2rqZ2KCwiJjaP0TMgONeLRcYL67J9WlkIWil9Ct8mkOJ+zpYsZ42b
 0JTIgoGnTFFjYRRdWdps+OtQQkbVh96uw/tXvxHxUEOa0T4b0oi3H1gVW3keoyTpFrJt
 GpDg5yISMAxF7TZ4zqcLyVWN2sdIYigNTDorbX1RVRuaIjCrCF8TRTLCWrmbd3IhfAec
 EzMob1eqHG018IMvCYpsGuFsN2UYsRzM7q8PtCzplwqgeU7Zf0WwH6SNluQ0EC1CNKm9
 L/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n7ZME13hWI4+kbYoqjEACc3oaTFcdkCbs46Bzo727NQ=;
 b=s9FH+oNxFL8CibsLk58Lpz3DwPFs6WIN5lcAEWJlaG6HnrzoANzg7Y4EV4Udg6kyj6
 n7Av1NmjYkqC0EPs6D5mC/Jxla7m64LLBf7VtQDx9/QxdwLynIv/GSeoF6D1ZycCNu7V
 lAuCNi8Mz1FLTb73/MHmP9k1fhhbEjSgQVMG77GuKUA+73bURNM5rHfl3ke2BvVkCryo
 NwuLNxkdnbZ+Atg0k2RBhp4IPdJdU6zHjSfszXmAtS7UoTU2b9h1OJJo01UAWXQILuKw
 jOTJEpg0VJXFAMtIHKKR3IUTbs70fskr4tjFAXEhpUEJDf5aAYzaJBCBGDtlyz2X3C0p
 5b9A==
X-Gm-Message-State: AOAM5315hTkELxwPIahJ8sUj6yNeqqJ2MVpq9UPb/WZA/ILcb2m74S0y
 aC4My7tBfBPIx2W1PLN+9vQwLp1EMIo=
X-Google-Smtp-Source: ABdhPJwb+J7rbn7qesh+JPMHQB6rJ+Kia+uwQHHx6ybSPGY4EVbqmnr6BaB1sA1ITJoyctZfzjxEBg==
X-Received: by 2002:a05:6402:3d8:: with SMTP id
 t24mr29302262edw.298.1614105294517; 
 Tue, 23 Feb 2021 10:34:54 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y8sm14419486edd.97.2021.02.23.10.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 10:34:53 -0800 (PST)
Subject: Re: [PATCH v2 25/42] esp: remove CMD pdma_origin
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-26-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b857f924-9133-c731-cf9a-e1c05d7c9867@amsat.org>
Date: Tue, 23 Feb 2021 19:34:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-26-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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

On 2/9/21 8:30 PM, Mark Cave-Ayland wrote:
> The cmdbuf is really just a copy of FIFO data (including extra message phase
> bytes) so its pdma_origin is effectively TI. Fortunately we already know when
> we are receiving a SCSI command since do_cmd == 1 which enables us to
> distinguish between the two cases in esp_pdma_read()/esp_pdma_write().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c         | 22 ++++++++++++----------
>  include/hw/scsi/esp.h |  1 -
>  2 files changed, 12 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

