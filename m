Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 643C34C7E1E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 00:08:22 +0100 (CET)
Received: from localhost ([::1]:50416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOp7s-0001w0-Tz
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 18:08:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOp6B-0000kB-57
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 18:06:35 -0500
Received: from [2607:f8b0:4864:20::102b] (port=37585
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOp69-0005Ku-PX
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 18:06:34 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso513353pjj.2
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 15:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=IH91JpTTc96Z5EATs+gV+MuUZUfLcVqOyF5gW2eB/AU=;
 b=l1qrldSsZDY95OjLYT3l1gyYAom8du/U3Ia46IsgK3LKXJls9HuY0VrsO5BV1gvit1
 k79T2muU+L9ktZoEdpQqlKPE25DvToDjEip86Auza9Vc1Y9mhOEq6gITmbESgTkZso2P
 6gBSVjvkd4DWz+Pgl2cidlIFdrg2g//IEm4XkKEvJaEziGDH+xhB8nNR8DBUatDaFC5q
 WMLC/nOQLMt2LGXD/T9BdK2CHXR+LqKa0U2awZiF3/0N6aJeuMdOARfMTOMg/fnNgMyf
 e32nTg06DErxTsCvCkpHX/Gx/buUHs1GAaJBuPv1l/tpIjhZOcZPKDosXTbZhTMB/qOK
 MTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IH91JpTTc96Z5EATs+gV+MuUZUfLcVqOyF5gW2eB/AU=;
 b=VwQI4muWzQVDveJtlGfwV0ouzD7YUIiWDZ/mfs0Z2JpOEusEKs3xxzygSzLRjj5/WM
 PKX5PKO5fP0zCM4Z92WXc2oLMrkBi+TqooZiMtuiSjDigtlXIUOW6lE35jsXCjOAloau
 n4UXV88zaW9XQv++qp56Mcwxi9K94fFsdvtYpPx7d9Y7tAC9k1W/8iHzyGxtNgJtcLJW
 vUDA3QUhiLclV0Gk64WE9wLu0sVcJvKO1Eaju1/KuJ2Zo3joA4ZcAPiFFlhThInYHNdK
 6FUEhB0PbxDLNtLSPQxLHKhWGsuuSzwPELAvqV0sn35rE14SBQq89Ct+bh2vf0w3VMNq
 EUdw==
X-Gm-Message-State: AOAM531tc7AvHLdzGleDvT60pmXGp+p5XUay1JIjD3ez3LebdEGorBi0
 o78S5zAZ+CTjx5zEgfYtQB0=
X-Google-Smtp-Source: ABdhPJxgj9L/P7vR8Zdh+CCTY3WUSdtxMPAY69tmzhHPzXhyoKxrnG4OLK9SN38ih/DZgQ98xHM/LA==
X-Received: by 2002:a17:90a:a78d:b0:1bc:d11c:ad40 with SMTP id
 f13-20020a17090aa78d00b001bcd11cad40mr18970486pjq.246.1646089592210; 
 Mon, 28 Feb 2022 15:06:32 -0800 (PST)
Received: from [192.168.1.115] (133.red-95-127-186.staticip.rima-tde.net.
 [95.127.186.133]) by smtp.gmail.com with ESMTPSA id
 o10-20020a056a0015ca00b004e0ff94313esm16013089pfu.91.2022.02.28.15.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 15:06:31 -0800 (PST)
Message-ID: <3ac2cc78-2177-6434-7328-3b1d0b42ecb7@gmail.com>
Date: Tue, 1 Mar 2022 00:06:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 06/10] esp: introduce esp_set_pdma_cb() function
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 pbonzini@redhat.com, fam@euphon.net, qemu-devel@nongnu.org
References: <20220228222527.8234-1-mark.cave-ayland@ilande.co.uk>
 <20220228222527.8234-7-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220228222527.8234-7-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/2/22 23:25, Mark Cave-Ayland wrote:
> This function is to be used to set the current PDMA callback rather than
> accessing the ESPState pdma_cb function pointer directly.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/scsi/esp.c | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

