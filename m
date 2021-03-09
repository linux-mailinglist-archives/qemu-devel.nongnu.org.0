Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AFE332FBB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:18:03 +0100 (CET)
Received: from localhost ([::1]:45124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJinq-0006Yh-Gj
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:18:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJh33-00063U-OA
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:25:37 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJh2z-0000TL-Aj
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:25:37 -0500
Received: by mail-wr1-x42b.google.com with SMTP id u14so17648544wri.3
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 10:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f0BMsR/OLrIq+XTThQnJJBWU8/FbV6em/iiXxIQGMbo=;
 b=LnwRq59nqkbXiSMVii9fSXmfQ18K00hJqWrelTpGDLUEXctaYepKuSvACBa9742Ivx
 w9W9FJlu4c9RLhhjl09KljnV7ezuVFN7P+ONrrdvCSaudQpR0m2WN2w2QW7O5IbTXd19
 Uocfn9/jruY5/nzv2dYOTHwAiA9T0uA7iA7Em7B7ORWx2yvcWTCBLndr0fEyYPS/wxZ7
 REhOhJh31civIymsB02UOEItZdVuSXdLLJpvpjmoeccpOK9753cBcLtKUEF8dHjoofXD
 tMGBZ3+enj/YCnexeulIuEKTJMMu2OE7542vG3mD2jV0CQClV1S+zvADyx5yWXPoAGr7
 cqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f0BMsR/OLrIq+XTThQnJJBWU8/FbV6em/iiXxIQGMbo=;
 b=Ib7kNDrb8OiPCyXqWKgwbCh0eXA9SsHT2AftBX4lv2GV4sKb6rN3jYNKSPKaHCJRLF
 ZDHQRLTPhd2U1UO2KhV7t5pUSsrR0fGurxrbb49ZWpjyWRiBDrv9UIKyxzy5J0sF/Csz
 MdngPQejUq42eWPR+aw6Sq8/I66AcS144s+ixt2WX0O12HIIWO+A2ecMuwztd7hJZgY2
 9zvJ0JtFOnb8raM6zDDvwpIa2plpYesd2DvPID3J3OaVp7uU8tsy8Y3GDUG3Dt6i9zor
 MdSZQdWXTIrlag5pmCR2KjaT1bJcBjl9/vpD9PwFbOjcVYm65Xuy+7jwTJvim8NP4ITT
 Ndfg==
X-Gm-Message-State: AOAM530AH4HPmR5sRxCF93BZTfsswiH4wBj58qtFwg6w3xMYmSYZ9OYN
 uiRj9WFrNwlPdo7SQ8bIfeCi5w==
X-Google-Smtp-Source: ABdhPJzpO0xJwKP6OwMNq7zfbwuO+nvXJbv656jgWks49cH+GV6exeB7YyKQ2vCoY6LdCEZMEmm0XA==
X-Received: by 2002:adf:e603:: with SMTP id p3mr30223836wrm.360.1615314331354; 
 Tue, 09 Mar 2021 10:25:31 -0800 (PST)
Received: from [192.168.103.34] ([185.81.136.17])
 by smtp.gmail.com with ESMTPSA id z2sm30047107wrm.0.2021.03.09.10.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 10:25:31 -0800 (PST)
Subject: Re: [PATCH v3 3/4] fdc: Inline fdctrl_connect_drives() into
 fdctrl_realize_common()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210309161214.1402527-1-armbru@redhat.com>
 <20210309161214.1402527-4-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ebe654b3-aafb-658d-ba80-ebc3e60d59a5@linaro.org>
Date: Tue, 9 Mar 2021 12:25:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210309161214.1402527-4-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 8:12 AM, Markus Armbruster wrote:
> @@ -2565,6 +2551,7 @@ static void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl,
>                                     Error **errp)
>   {
>       int i, j;
> +    FDrive *drive;
>       static int command_tables_inited = 0;
>   
>       if (fdctrl->fallback == FLOPPY_DRIVE_TYPE_AUTO) {
> @@ -2604,7 +2591,13 @@ static void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl,
>       }
>   
>       floppy_bus_create(fdctrl, &fdctrl->bus, dev);
> -    fdctrl_connect_drives(fdctrl, dev, errp);
> +
> +    for (i = 0; i < MAX_FD; i++) {
> +        drive = &fdctrl->drives[i];

FWIW, the declaration could be local to this loop.

r~

