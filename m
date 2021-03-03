Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133E332B45C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 06:19:26 +0100 (CET)
Received: from localhost ([::1]:54150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHJuv-0006DO-4E
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 00:19:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHJto-0005Vh-8r
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 00:18:16 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHJtj-0006To-HM
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 00:18:16 -0500
Received: by mail-pl1-x631.google.com with SMTP id d11so13377670plo.8
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 21:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4uVHlZNbZcE2Cvvdv/RWu8xEn9Wz9eUBRzWWJ/NNpuA=;
 b=IzHU2gMEW6+G+HK19k+gbZqm4AGTLJGQegpBwEtRhajjiHX5XIkF0gaPSWAL8oO+1v
 DWsLU+SZyjY6k+D4sPsZKwiLk6zAIpkUhfxfoMnpYNDDgSctzm13BMszfAlWnSGX32Tb
 IBMmAQ1pgzbSE7zjnViugyCwxAU6759qWbtdeiNTc6r51rmU8QnDDYzgQGfod+5zXR4j
 n4L3cGTgcnMLV7L4uxtZGmP+LQ3hItt4MiLGqEiut81yDw5wZerDIedaFOrpEMSCuL1N
 5yobfE92WuT7LkVWGP5BvKyOi082t051kAp5Vj/DJDFX8LQNq1TM7vYwzPl+ihvbRCr4
 GFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4uVHlZNbZcE2Cvvdv/RWu8xEn9Wz9eUBRzWWJ/NNpuA=;
 b=kRUfswCcg//252/9c7knN7lM5K6jMfP7xGaYhtaxC2cxVn9ibvNZ855U1xGba2FSS8
 FF1aDZJN/44FDhmST4k8agoq4fWO1wlPjfh+DvN0sMtyupkxI2mjtWnlLmqwyjazqG6J
 CFM7ly5riULwiAcCiZXVsTOtg03hBFue0XoLkfGjm12tK5z5tHOnjBpXxam+sUJhU0B2
 Dr8ccZXPiNilPPpteftN7hbzS3pW2ui50zwZ1Wv0CfafBFi3fnS5iW1WxO2hwF03SIHu
 9R2qXb/VqyYhtqo0fsezjSayMQ4OXteytPERQBaTdxvlMk6NrohXTCKaEBMR/4icBxDM
 LafQ==
X-Gm-Message-State: AOAM533oTnEr/Ogqlv5FPIvP4rsnU3lA/g6nN1pogl9UCECb9gNRnfU1
 ZZfYCKvBBSdzzBw+DlY1gxP7qg==
X-Google-Smtp-Source: ABdhPJwz+61Con5/jPcUXcTXucDezIVmIHEdMZ6biJz9zoJHDglHA31VKNet9fHJ7jd6m9TPq81DVA==
X-Received: by 2002:a17:90a:788f:: with SMTP id
 x15mr8335208pjk.70.1614748689249; 
 Tue, 02 Mar 2021 21:18:09 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id q15sm5885510pje.28.2021.03.02.21.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 21:18:08 -0800 (PST)
Subject: Re: [PATCH v3 07/27] cpu: Introduce SysemuCPUOps structure
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210302145818.1161461-1-f4bug@amsat.org>
 <20210302145818.1161461-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <26555b24-cba0-3c3c-daee-142b16176fd8@linaro.org>
Date: Tue, 2 Mar 2021 21:18:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302145818.1161461-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 6:57 AM, Philippe Mathieu-Daudé wrote:
> +static struct SysemuCPUOps alpha_sysemu_ops = {

const, for all of them.


r~

