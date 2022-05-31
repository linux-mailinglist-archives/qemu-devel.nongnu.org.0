Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2014D538F1B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 12:34:46 +0200 (CEST)
Received: from localhost ([::1]:45500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvzD3-0007Rs-7f
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 06:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nvz6k-0002i6-CB
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:28:19 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:34512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nvz6i-00021f-VP
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:28:14 -0400
Received: by mail-ej1-x632.google.com with SMTP id q21so25762826ejm.1
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 03:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2Gm+neZj0Jy09JTZxRnVXBNyybRZalocMV3wfMnMTeA=;
 b=KCg758ZhwRVZmau1P87JwuJiMQ+kL2CQb+EYknMrMpQ77gnUnxjXVV6vYSWKO7oPpo
 4skLGhkXCsMoPpI7FR8iQbcA7yl/qaTPug6Z6uCqBCZDAT4pmDPQnRLf9PoR4ISkadbU
 c7N4qsmu6Xzyr5EE7EoeodlXTQjIkTdSvTebdtioMp9JlrbvX1hCNfj7YYeBnXyZIbUu
 lPrGvtMhIv1zASOmJeIClbhFK8tCAEn6rAMBpaskGpbhYJSxpEz8gaMIf34s1d4G0n8S
 skKDhY0MyNyVBoNPS8iX6zZrz/h57BAZgTfTbj2MxQwOxJZeT/rLxZJMfruHW0cjKZuV
 nenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2Gm+neZj0Jy09JTZxRnVXBNyybRZalocMV3wfMnMTeA=;
 b=q7P/M/JhkWgVOP9wzkFS+QfmcJ08VQ2lsLKyzQuhXGDOrl6sqJ85ppTiL2fpPMHgmJ
 mEgJjtB/5GPS3W3eUs76KOf/iXnLhC/NK1B0UnXC1IIRmY7MAxNY625ONGIso0WtyxYC
 TFIOaS75INRBP/okJ1PfoFlPMCSURZF8kJrkQrLW4fcfx10B09iK7kqPa7ECsd9nTfnI
 eRj7oPQu88d/aNSaBro9avbx2/MTP3tPej4qDg/haKOcrS3sprBlUR5Q7bXkCfFbZw6z
 u2Oku/bW3fvyAsMc/HHNSleOTn5jcUstvyuh8sLMpvdiJRlmhxf+Pg+CgOhg6Ywn9gB6
 E1nw==
X-Gm-Message-State: AOAM533ptr7RdcapZz9sdCcXSe7KKUZCDKQzlMUAyb8IFJN/n/6b87+A
 NI6XdMitsQUrKHZJwtIw9h7YwyV9x8qE0A==
X-Google-Smtp-Source: ABdhPJw7mISm/KLt0RRKfqRHJDVZNUWVAnuiCDO7fvXt59VRoKbdQv5QNYZkWuJgYZoP/jXiREA9fA==
X-Received: by 2002:a17:906:9b8d:b0:6ff:16a1:19c0 with SMTP id
 dd13-20020a1709069b8d00b006ff16a119c0mr25112366ejc.122.1653992891422; 
 Tue, 31 May 2022 03:28:11 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 by21-20020a170906a2d500b00703671ebe65sm255566ejb.198.2022.05.31.03.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 03:28:11 -0700 (PDT)
Message-ID: <bf87f61f-b2de-909c-c2df-5dee0459bfde@redhat.com>
Date: Tue, 31 May 2022 12:28:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 05/10] cutils: add functions for IEC and SI prefixes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, dgilbert@redhat.com
References: <20220530150714.756954-1-pbonzini@redhat.com>
 <20220530150714.756954-6-pbonzini@redhat.com>
 <5207e134-b00e-11c3-2046-8717aca6ccbc@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <5207e134-b00e-11c3-2046-8717aca6ccbc@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/30/22 23:59, Philippe Mathieu-Daudé via wrote:
>>
>> +    assert(exp10 % 3 == 0 && exp10 / 3 < ARRAY_SIZE(prefixes));
> 
> Can we add parenthesis to ease code review?
I'm not sure where...  I thought about using two asserts too, but 
checking both % and / seems clear enough.

Paolo

