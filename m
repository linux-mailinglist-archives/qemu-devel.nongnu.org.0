Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60236F5AB8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 17:12:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puE8l-0007CD-59; Wed, 03 May 2023 11:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1puE8g-00076O-Vt
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:11:32 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1puE8f-00050A-6u
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:11:30 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-63b5c830d5eso3743335b3a.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 08:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683126686; x=1685718686;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IK4RKn772XuE9DmFRHuIR+81zYQN8HAkbugsJ5Rn9fo=;
 b=qhEDbEk94MP7KohNZ0JLhBbbDFYjcFI7ZNeB7Rcuv20tP+6eW5NVgPhbKOFd+kpg3U
 6Xiv65DHa6oJr0yi1C+zMKpcZ8Ega/aorV1MbCvhbjdrdiCauOFCmvhuykYcxvtAJLFn
 R3BHPC18f7sX1PR+St2VGw9M3dl6Lf6CcsaekKo/4wDLOjjrbNPdYGNh8m62YwivYos4
 igaao/ykY2oSdZHCOkp3JcZUrOMhnEzEIZWK3BV+d+VbackywT2SaTNApPDrkMBDjNk7
 mVWEBKlYuyhM+2WPpMQQaSw8y4kpVv2ckJFsF5q2BsVZTJiNt3kOkgjNWhFD67aThjK8
 tK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683126686; x=1685718686;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IK4RKn772XuE9DmFRHuIR+81zYQN8HAkbugsJ5Rn9fo=;
 b=VD6im53oEHKWinQtj7sVS6RSdQXAsb9/VDvavF9nrS97h2Hs0VejHUpWa0rqWfRmiS
 IzgzpoGxGpEwME3zOkNbk4tZSF1R1wwUUeSz+DLNk8C9WanUf011O7ZsrRbo+0Xjg3ku
 Y+wyl/4Jhd/0w+kMc2sAc+IUWgKplogfcG/BdRWy6cV8Mmf1bhtamQ7aW5g5rXkHxcqy
 WoMk+xy5uCgyTEZXTcrCgx4Bf5GknCJkvk1aZNdCEes2dcfxuDTnkUn1MeO1eoIaI+3L
 YmLDoJu5RGW9Y+vdXS08BVbeAxAG2szKFxmn+dROIoDBDPCuwTmj+Iw336IFKhgXe+sO
 zDMQ==
X-Gm-Message-State: AC+VfDxHGasooMWmJVDCRG5hOTmx+Tc3J37oPeyZ4j/hM8mpo2sjw0kv
 vBhkIUPQibTujLWEqrSFasS3ng==
X-Google-Smtp-Source: ACHHUZ7l/IHUc5FgrYWGque1+fvAjzmhKBOQ7VgHMozktCGGKAl92uhzDZphNPl4UT8g4WGpH1iBWg==
X-Received: by 2002:a05:6a21:1185:b0:f0:1ae9:f221 with SMTP id
 oj5-20020a056a21118500b000f01ae9f221mr23019670pzb.12.1683126686540; 
 Wed, 03 May 2023 08:11:26 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k128-20020a632486000000b00502ecc282e2sm20660920pgk.5.2023.05.03.08.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 08:11:26 -0700 (PDT)
Message-ID: <918fad48-4c0e-f68b-7144-9ef7822cd218@daynix.com>
Date: Thu, 4 May 2023 00:11:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/2] igb: RX descriptors handling cleanup
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 "Tomasz Dzieciol/VIM Integration (NC) /SRPOL/Engineer/Samsung Electronics"
 <t.dzieciol@partner.samsung.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "jasowang@redhat.com" <jasowang@redhat.com>,
 "k.kwiecien@samsung.com" <k.kwiecien@samsung.com>,
 "m.sochacki@samsung.com" <m.sochacki@samsung.com>
References: <20230427104743.9072-1-t.dzieciol@partner.samsung.com>
 <CGME20230427104750eucas1p1158eee5a37c71cacaea021a7abbd6ace@eucas1p1.samsung.com>
 <20230427104743.9072-2-t.dzieciol@partner.samsung.com>
 <DBBP189MB14338337B5EE87A7280E553795699@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
 <000001d97cfe$800e79b0$802b6d10$@partner.samsung.com>
 <DBBP189MB1433AA631D3115FFE5D449E7956C9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <DBBP189MB1433AA631D3115FFE5D449E7956C9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

On 2023/05/03 16:46, Sriram Yagnaraman wrote:
> 
> 
>> -----Original Message-----
>> From: Tomasz Dzieciol/VIM Integration (NC) /SRPOL/Engineer/Samsung
>> Electronics <t.dzieciol@partner.samsung.com>
>> Sent: Tuesday, 2 May 2023 16:01
>> To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>; qemu-
>> devel@nongnu.org; akihiko.odaki@daynix.com
>> Cc: jasowang@redhat.com; k.kwiecien@samsung.com;
>> m.sochacki@samsung.com
>> Subject: RE: [PATCH v3 1/2] igb: RX descriptors handling cleanup
>>
>> Not Linux/DPDK/FreeBSD for IGB.
>>
>> Change here adds additional condition (RXCSUM.IPPCSE set) to enable putting
>> IP ID into descriptor, besides clearing RXCSUM.PCSD (required according to
>> Intel 82576 datasheet) that was not present in the e1000e code.
>>
> 
> Yes, we can't even use ethtool to set this field.
> My suggestion is to not add/maintain code that we cannot test. I leave it up to Akhikho to decide if we really need to implement IPPCSE.
> The default value of RXCSUM.IPPCSE is unset, so we could as well ignore this field until there is a user who sets this.

In general I won't reject a patch to implement a feature not used by a 
known guest, but I don't recommend that. It just doesn't make sense to 
spend time to write code that can turn out so buggy that it is unusable 
in practice, which is often the case with untested code.

