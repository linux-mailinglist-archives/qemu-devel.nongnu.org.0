Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864366EA3F1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:41:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppkS0-0004Yp-MR; Fri, 21 Apr 2023 02:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppkRy-0004Yc-OB
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:40:54 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppkRw-0006Lh-U8
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:40:54 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f193ca059bso1040135e9.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 23:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682059251; x=1684651251;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ktTp8mkp4iJ8dicxg8ubhdkAnDG2z1wbMADiJ5dRc/I=;
 b=D2VZbhpXMgpxdpznVLvOdINTCfGESIdSpPGNcbqJfpVj9FMGJ3SmI649Yb1xwYgEa6
 sGFCN31RLVYJY0l8E/+alix97+4OzyRgz7YMNlI6osR70xadmZPCv7YBVjc6MgKo6AfL
 C7/ehvVw+CRUDjvjKxF8VqLRqyUB+FevNr6ZSxvP6nQBSJnn7ndefEV+NO/dBJEB+Vmv
 Kr/Mb3/uFXDnr0vuC3osC7dIDlBP3uJ3GxmffAGX19U7n0c/BPyJZA+oIjeBSCCJewG3
 1iEDUVfx8Fj4XFXutO90LMDJrWY1N+I0tFiG1hhrHai6Q1+tjeV0n/LVW6nzY8oH4wyQ
 f40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682059251; x=1684651251;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ktTp8mkp4iJ8dicxg8ubhdkAnDG2z1wbMADiJ5dRc/I=;
 b=eP582o11+cNoMcBr5MPHxWJuz8aON6j2PlweM8HN4RvwRnCxjXgzkLY6ekIp3Z3Uyb
 6C2WZcVYBcj6daXIEHSfKr7FsNRZvPBQaj82wbWBEc6UnZGkj4XbynVDk6OralwinHLc
 aVjJuhzPi3Re2BR6enmF6C+7pdDv3TSs5MF9FTJ0hsRYkdRUgXhRwMGrUZ5mfS8b+obY
 Jo2h46TyZcNXJ/vM2ei96hSj+GrG0Je+z9f/4dq7uLT4Q/4RZQsru/hBokaBm7hq6BME
 knV/Y8YsKtTt0uP4PTM/KU4TlK2/W/CLIz5kyxtwuZc4lR/kP29M0CfGKbYglBpMLfz5
 //Wg==
X-Gm-Message-State: AAQBX9dhkmeZA1xxsaSKnSS5Z/U3t9LBA2FCoctTLg3hgCjlVymuJWhq
 SxekrPuzHJO1or2k/bq5xW4EFw==
X-Google-Smtp-Source: AKy350YT+q0NTX10R0N1br4JWfxdKhQgxJpNKIkWKeuQfuEvt8FfatryWyk4cAKxQgg272dxOAuBxA==
X-Received: by 2002:a5d:4f8e:0:b0:2f9:d629:48f1 with SMTP id
 d14-20020a5d4f8e000000b002f9d62948f1mr2748504wru.26.1682059250814; 
 Thu, 20 Apr 2023 23:40:50 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 f4-20020a0560001b0400b002ffbf2213d4sm3662290wrz.75.2023.04.20.23.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 23:40:50 -0700 (PDT)
Message-ID: <b76e7dd3-34c1-60fe-f2ec-70264986308f@linaro.org>
Date: Fri, 21 Apr 2023 08:40:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] docs/specs: Convert pci-serial.txt to rst
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230420160334.1048224-1-peter.maydell@linaro.org>
 <20230420160334.1048224-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420160334.1048224-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 20/4/23 18:03, Peter Maydell wrote:
> Convert pci-serial.txt to reStructuredText. This includes
> some wordsmithing, and the correction of the docs to note
> that the Windows inf file includes 2x and 4x support
> (as it has done since commit dc9528fdf9f61 in 2014).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/specs/index.rst       |  1 +
>   docs/specs/pci-ids.rst     |  6 +++---
>   docs/specs/pci-serial.rst  | 37 +++++++++++++++++++++++++++++++++++++
>   docs/specs/pci-serial.txt  | 34 ----------------------------------
>   hw/char/serial-pci-multi.c |  2 +-
>   hw/char/serial-pci.c       |  2 +-
>   6 files changed, 43 insertions(+), 39 deletions(-)
>   create mode 100644 docs/specs/pci-serial.rst
>   delete mode 100644 docs/specs/pci-serial.txt

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


