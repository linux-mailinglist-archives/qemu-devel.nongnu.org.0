Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDF03230C1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:29:29 +0100 (CET)
Received: from localhost ([::1]:59510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcR6-0004QP-JB
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:29:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEcPm-00038N-AO
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:28:06 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:38166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEcPk-0008JQ-PY
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:28:06 -0500
Received: by mail-ej1-x633.google.com with SMTP id n20so10054088ejb.5
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aBofIekUYEX532QyhvWCQae3AFFZasIgMabvHb+CZTw=;
 b=sZE87Nj80RbqLLRkg59KD341p+i7iaUu4MkkdEPPBBba7yp2XLobW6WjyKbimvbm8c
 SCsbc+U6MdAVDALPcYPtzCEzorxcy5I1yPKJ5DJbew/8ahLPU89nYAzJaOE9TY56aO3w
 rAVM2hRH9Ex/ilnDhcMpK+DF59LnCMvaN0r8zzSxMenGm2pwji4IYiPam+PRIbPVRlqb
 6dOekj4/mBxCiDawzXuETnaCiTXu2oPsg0eXRQk2eNTVS8xGU6Sh4FJRRYMhTw8hdfUI
 XFUCQZflhp42RerrCMb/Ngc50SxR8fxry9zgS2JbbUHcPlgabB+7UQzvL9gkAWhp2i3f
 TeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aBofIekUYEX532QyhvWCQae3AFFZasIgMabvHb+CZTw=;
 b=XsppYN1jFDuAHcdAxGPye+wCaf0fiStoXYmNq/l1nZWXP7TUKdzTUxcpxAat335J0A
 KyHzgj4lFUI9/fuAZy24JfZ1oDMzcat6m2YCx0e4A6WTYaM81LPhJOLwV93NDTqOz/Op
 jiI9nMqoTyAfRPmi8HzMFUdL2GS9pMPxcYFs367NJzrN3Rw9rRFKx8yulh4HovQHvhMi
 npa2gpwhfe1ENwBOMFNNxK6ZHSVPBh4xhITSSbBtz0iexGe0bscy6LhrixmZkeJ9OY/a
 gjLV4BEv4fUpMZ8SI4IjNK1ofwMEpiCzikZE10bMMKrHig5idqxFtXYStxDIm4adOBk7
 3Icw==
X-Gm-Message-State: AOAM531lWv8b9o45z3cn8FxeQXlxh3z0QhQ9YyGgS1FTu9F5o1tYSiOf
 Mm++1iS6h/tcCR3dxwkEF10=
X-Google-Smtp-Source: ABdhPJzkLc9k4pWBMkg4f8CWsCE7iBFmfPa6SVMbjHKK+l2Qhwhofh5opDxY8qe7VGro+AySXkdTsA==
X-Received: by 2002:a17:906:4159:: with SMTP id
 l25mr20403544ejk.422.1614104882783; 
 Tue, 23 Feb 2021 10:28:02 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f22sm13182268eje.34.2021.02.23.10.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 10:28:02 -0800 (PST)
Subject: Re: [PATCH v2 19/42] esp: remove buf parameter from do_cmd()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-20-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <69ab7287-e463-85cc-37c6-9a8b73d83583@amsat.org>
Date: Tue, 23 Feb 2021 19:27:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-20-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
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
> Now that all SCSI commands are accumulated in cmdbuf, remove the buf parameter
> from do_cmd() since this always points to cmdbuf.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

