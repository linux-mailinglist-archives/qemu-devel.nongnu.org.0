Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B7154D1AA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 21:33:18 +0200 (CEST)
Received: from localhost ([::1]:53720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1YlR-00059D-LG
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 15:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1YgG-00009W-3E
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 15:27:56 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:35800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1YgD-0003Yk-M1
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 15:27:55 -0400
Received: by mail-ed1-x529.google.com with SMTP id x5so17647323edi.2
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 12:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+5sAdcymCVqBOX4OUbTfSjHpcVAnXuMzhDpZ5+JFeCw=;
 b=JeQQ1qQFprJzVDiZAAUZyKqiiUjEwXiDkhSSIH9j8SnS750y2uvKLCEQWPOQ3tiQCd
 nYI02KdrfKFyGE2GtBA1tiPMFFeevuZkC13riFUgZDfwcyVbXfcZO99cRFCiqTf5iLo8
 4lCM5rkZPSE7xXpxEehNsHfD1FYS7i0a6ClebF7ndyNDnBZn2vOE5ZTqrRfVyJNldQKx
 xLKv2Kp0KbCysf5xyzFly9oWHAtKCkDC6Rm0vCg36eIsNd3Xu4hKeXjQikLJ/UyIKrO3
 6nxaOeW/a5DK8VB0VmzU2EoultBDjtQjzlo7evMlqjtSrk9tF02I7NEMaLlVr39+4kAi
 ji3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+5sAdcymCVqBOX4OUbTfSjHpcVAnXuMzhDpZ5+JFeCw=;
 b=KyLK7kyK1vhuBWjivoTYPhRtjATQwcGRSY/O/7jydpgaA9XOls28L1aJBFJ2EIkTUZ
 b9GR5lHo0/S5k3ICU8WGwVxUXbOGw2+2bB83tn6pZ9D/s1NYy2yCmpku4VMWliegVHNI
 anfXaSE99GaiVTJ6jRyH8l+rf9ggUUjlfeKgPer/qGSkcCfidY1GIKNvj/vRn5lX+kxq
 q2EaSNylqBTGKQZbIjNuLbsskYTO7ZSwFqwnDp7xAuj27gyRR4UePQEpnVmBHHyeElR6
 bY0rm4SlqtqxwMrrYfcU26xmFnPLO5wDfzjTYBNMtX5IqUm7pCmFfVzNs3uxdihl9M1q
 VBUQ==
X-Gm-Message-State: AJIora+nOyVrhfP7ZISSxHmNzp6gtzdbXScWTrBGGYudn2XO/2qx54Lp
 QWBEW30ozHI3dTgZ17n94SI=
X-Google-Smtp-Source: AGRyM1vsYB0cD70M3JEvJ0rWj2kmlsQedylb2Ma0AZlZHJRtig3XE/OWLnsdCyafH8jecQCK2gWOcw==
X-Received: by 2002:a05:6402:2999:b0:434:edcc:f12c with SMTP id
 eq25-20020a056402299900b00434edccf12cmr1662336edb.96.1655321271900; 
 Wed, 15 Jun 2022 12:27:51 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 f4-20020a05640214c400b0042aa153e73esm33768edx.12.2022.06.15.12.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 12:27:51 -0700 (PDT)
Message-ID: <6edab96b-9585-5a37-d992-68d717be2c63@redhat.com>
Date: Wed, 15 Jun 2022 21:27:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 0/7] cutils: Introduce bundle mechanism
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20220615155634.578-1-akihiko.odaki@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220615155634.578-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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

On 6/15/22 17:56, Akihiko Odaki wrote:
> Developers often run QEMU without installing. The bundle mechanism
> allows to look up files which should be present in installation even in
> such a situation.
> 
> It is a general mechanism and can find any files located relative
> to the installation tree. The build tree must have a new directory,
> qemu-bundle, to represent what files the installation tree would
> have for reference by the executables.

Thanks for prototyping this, I think this is appealing.  I'll take a 
look later at using meson introspection info to build the preinstall layout.

Paolo

