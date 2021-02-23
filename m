Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5633230B5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:27:52 +0100 (CET)
Received: from localhost ([::1]:53640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcPX-00020B-55
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:27:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEcNZ-0000bJ-Fl
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:25:49 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEcNY-0007KU-66
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:25:49 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d11so4213919wrj.7
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1TDjmsCV00852dknn475h3oGMzSAE9eebqDYWNKd2R8=;
 b=a9HVuszqfqByLB+8kCuEa953xQ3DUSsf1/KpOqYfQHoGfs9HbB2N8omf8f4/glBd5G
 wIXd8NOqsVR5ym5YwC0LLHYC9i+499PM/wduUbKMmtZXC5mEyl1f+0EMYfuzIbuCqh0S
 k95oecSE2ujzOnqOi46WZtq8K/CifE7yBGELFgCkSq4OnleXT0/eSssoxJiWshQMCi/3
 E+sok5xF8cccOmFxtMZ6RQGdV1JH1iNBVrjy64KkTz3STjLPIbWnlyoMmcVZcKIvYqyK
 fxyLfVWzcBM/tpaYAJn7oBtXwlVKY6peG0ypvZhMXveBItmeFQhkE0S+YrhAQgwrt4d/
 sveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1TDjmsCV00852dknn475h3oGMzSAE9eebqDYWNKd2R8=;
 b=YJIj/YDvD0N1LxdENKqKrHkGIETQWPi+8drxry5O55OTwiOAN59SKQWmEQ6vcsHN1u
 9tTJ55APzaa37a5g/qFmvfjWI2dSDtrro84aWd/OIOqZGfFNyMxpZUjyRiDJ+augZsDz
 A/HxVPheRwHrRzH64FbSO7t06+8ArqeQ1GDbkiXBp47tt6RaUGrerlZG2duw6z5H2lO7
 H/TF8svS4CqlywBHLpuhGcfMYqiayozKXnN2cfL8VCpa/P/sWCvkbG3OvqAO3/xxjHFQ
 pWU2i3Hm1w50oOc29vBpnQD/PmRiz8yWBPn2BZv4XWOoznp7VCDGSfDIti4hAvvbZ8MH
 iKFw==
X-Gm-Message-State: AOAM5338onKzlnv6CIo9QdKxX9F/aef8Z3BlkC42Mp3+OJQkytFq+vRh
 xzBlbtzuEPy2GadLUScahIJFPZshLXM=
X-Google-Smtp-Source: ABdhPJztgydxqbuDRL0Vl/eHG8oDWkEwbTnhvLjkJX+h4LrI41StTyQJJ1H3fBT/iOCnoLklhZgpiw==
X-Received: by 2002:a05:6000:146:: with SMTP id
 r6mr27108394wrx.239.1614104746872; 
 Tue, 23 Feb 2021 10:25:46 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z11sm1429573wmf.28.2021.02.23.10.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 10:25:46 -0800 (PST)
Subject: Re: [PATCH v2 16/42] esp: use pdma_origin directly in
 esp_pdma_read()/esp_pdma_write()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-17-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8a04846b-06d1-9cd5-30e5-88d965656cce@amsat.org>
Date: Tue, 23 Feb 2021 19:25:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-17-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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

On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
> This is the first step in removing get_pdma_buf() from esp.c.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 34 ++++++++++++++++++++++++++++------
>  1 file changed, 28 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

