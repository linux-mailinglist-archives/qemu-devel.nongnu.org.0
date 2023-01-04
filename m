Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9C365D455
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 14:33:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD3sl-0001wK-AG; Wed, 04 Jan 2023 08:32:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@sifive.com>)
 id 1pD3sj-0001w9-C6
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:32:37 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ben.dooks@sifive.com>)
 id 1pD3sh-0000NK-JG
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:32:37 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so24008326wms.0
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 05:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JHIAqQFjdseuSO5Xj8Va0U4rDU9wVrF3zV4QV5k0OQ0=;
 b=ELXNsnO2tkBiBf00Pt4keaYLPLDTQMKU5tofwfFUx4mIFpWfn3zp3akvoB6gOfUGpw
 tvUhcDMoIONIeOloJDFf26CjBomPtCaXwfIoe5iPwzD7BmmdU+jGBzz0g9Dk5BTfxzLa
 xC7BmTLfcrT5qDdhddKAK1MfuMbsdvgHh9Bpf4syVh5ht3Bm0KpAMHtmSz5rwdR/jyDk
 G4WQrjPqDH53J40Dchhm12eT8J6Q6ixw80yno59w/6/ibyRGK9GlRX2e6NN1SwseG1la
 dCPv6aEU9+pkz9+bfwAOY1S72JJy06JuHl5HqtneJ1Vy6iKf+29B5xQ+8CB83lXOOXUb
 Uh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JHIAqQFjdseuSO5Xj8Va0U4rDU9wVrF3zV4QV5k0OQ0=;
 b=dHvOl1PMOSkbj1mQbWt4rMTmSlxDyaZdO1ELbOpO5A+s/p3wLPYYF9V0kVcPKA8JMx
 Ew/p7rEN8RPNbBpSFA5x9yXQGsicREhCWvHPPQTaU9oQWNlOtgmZgRP1fwD6/9BVkcay
 UuHRCMrPOREEZYThah3bHvkDpgHhJtuv6uIl8XuqihTiT6+K4RbW/S+HmgNUXemYDchM
 fmYNKwZfx24TS0FLRilAn1+6FQoJLHflcvBbqeJqtpKmBcbhxpRQkMluoW321evwVVT9
 NHTkkhEaiZsIU+jqvD5R+Ibs8LgAXZ7pjLkj30HbhuTzSfUmwxlrZnCu3xA8+SKTd/C4
 qM8Q==
X-Gm-Message-State: AFqh2krvbjhbgusxoIL3vcACAN6ugCfM+LZvYhhHfyukOtFsoY6heYzK
 TNAsUh47wsqGZ1UJz7xEC8dcyw==
X-Google-Smtp-Source: AMrXdXsimRVSdZdWKR0rI47B7MlBnHSdOwr4MsiFOBXkdDINDhjuB1yjQErj3jjFvV3a8Pmr0EH3dg==
X-Received: by 2002:a05:600c:c8a:b0:3d9:7062:e0b7 with SMTP id
 fj10-20020a05600c0c8a00b003d97062e0b7mr27968698wmb.33.1672839153568; 
 Wed, 04 Jan 2023 05:32:33 -0800 (PST)
Received: from [192.168.0.17]
 (cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net. [86.15.83.122])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a05600c161600b003cfa622a18asm47748410wmn.3.2023.01.04.05.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 05:32:33 -0800 (PST)
Message-ID: <1cb5fa4b-cca9-db6d-b0aa-f291f24b7026@sifive.com>
Date: Wed, 4 Jan 2023 13:32:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] hw/net/can: Add mcp25625 model
Content-Language: en-GB
To: Ben Dooks <ben.dooks@codethink.co.uk>, jasowang@redhat.com,
 pisa@cmp.felk.cvut.cz, fnu.vikram@xilinx.com, qemu-devel@nongnu.org
Cc: Nazar Kazakov <nazar.kazakov@codethink.co.uk>,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 Frank Chang <frank.chang@sifive.com>
References: <20230104122220.110412-1-ben.dooks@codethink.co.uk>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <20230104122220.110412-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=ben.dooks@sifive.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 04/01/2023 12:22, Ben Dooks wrote:
> From: Ben Dooks <ben.dooks@sifive.com>
> 
> Add support for Microchip MCP25625 SPI based CAN controller which is
> very similar to the MCP2515 (and covered by the same Linux driver).
> 
> This can be added to any machine with SPI support in the machine
> model file.
> 
> Example for using this when configured into a machine:
> 
> 	-object can-bus,id=canbus0 \
> 	-object can-host-socketcan,id=canhost0,if=vcan0,canbus=canbus0 \
> 	-global driver=mcp25625,property=canbus,value=canbus0
> 
> There is tracing support with --trace "*mcp25*"
> 
> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
> Co-developed-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> Co-developed-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
> Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

[snip]

OOPS, just noticed I forgot to send user.name and user.email in this
copy of the git repo and sent from @codethink instead of @sifive.

Will fix this if needed.

-- 
Ben



