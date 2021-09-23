Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09331415C08
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:36:00 +0200 (CEST)
Received: from localhost ([::1]:54234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTM59-0002hM-0g
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTM2C-0008K4-Du
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:32:56 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:39685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTM2A-0007FM-RK
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:32:56 -0400
Received: by mail-ed1-x52b.google.com with SMTP id x7so7569615edd.6
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 03:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G4qTUawN0gZlXZkvwjmnPGaV3sAK1udKaKVlHQOJ++M=;
 b=LLRZZ5cU0Bs1+QzNARFFpYZ84jc5LrYvUrAiROdP7QoPM3sSVnXh3wby+MknO4DEnQ
 PCTaO8wcIlU55JPhreF+7iKKo1sJnUPce4ztYGdrS3nhqsEoNAyhQn2yHxsPrz0OjDMz
 k7gk5hmMM5XCKo8OHMoue51QztQqf7lFKkmPGBWmq2D7XWnBkRqU7IupYAmW1zr+cOgy
 Cz8EkOm+3SZuKzU3Fpi1f4+JG0qmRXDdWRMke+StQU7bJgyxx5Kh9+Di2dAAyxuFwcKN
 v2taF1jsmBDS4YWsihw32Pe84MwCyVYVI14tKdHyjRI23EXpK05kSl29NbILpR4ZOZj1
 TwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G4qTUawN0gZlXZkvwjmnPGaV3sAK1udKaKVlHQOJ++M=;
 b=mXQALyRORDssdbyZon67dhYglTHb5hOhI8tXr8ouA4bIWr3bT1AgVgy7IuerLmzTb4
 nJP60Ijvbd4IB0HNJ1kVGat5Vxlb96oaZ9Aep/602TjLYcRPkPmlYdBHEZdU2L2988+m
 ZKY+xp5PeLMNBV7b6vrONdkpu4p6J1mcBGCYHKDjglbsfY8p3qRrwAqzZavfjWHjij/h
 21w/x2/iEFcoAjuW4CEE/aUY5BMGzgCXWlnR4eTJp65OvqPlc+/BnkcdlZHo/UK2J8zg
 l0dFc7toDpeXTwbWH7Ni+c0IwCXFj22g6/VXrThpvFk0/8JUi4O9rnNtNIKEcYainMtB
 R0sQ==
X-Gm-Message-State: AOAM530i9RVuM+JNiLNrVDL4M2behMvbQE5+ggCqHSQYRyFSU9J8UIk8
 MmvYj1FnFejGFMgtgUIx//qPK0+WLPw=
X-Google-Smtp-Source: ABdhPJwk2GWVLVSja2R846zEMdnQuk0DQx7+vj2Y7LXPK9jUX7IB46ymiicZ9Vj/iObzKsRkhUrVUA==
X-Received: by 2002:a17:906:2887:: with SMTP id
 o7mr4109244ejd.425.1632393173160; 
 Thu, 23 Sep 2021 03:32:53 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id n16sm3163999edd.10.2021.09.23.03.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 03:32:52 -0700 (PDT)
Subject: Re: [PATCH] tests: qtest: bios-tables-test depends on the unpacked
 edk2 ROMs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210923081555.3648310-1-pbonzini@redhat.com>
 <YUw5Pglv2lcS2Nz6@redhat.com>
 <aac1894b-e515-cbc7-5b51-aaddc6fc3de4@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <02853d4e-a708-5141-f38b-0dd48329f305@redhat.com>
Date: Thu, 23 Sep 2021 12:32:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <aac1894b-e515-cbc7-5b51-aaddc6fc3de4@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/09/21 12:00, Philippe Mathieu-Daudé wrote:
> See also "blobs: Only install required (system emulation) files":
> https://lore.kernel.org/qemu-devel/20210323155132.238193-1-f4bug@amsat.org/

Nice and makes a lot of sense.  Regarding "there is probably a nicer way 
to do this with Meson", I would do without all the variables and do 
something like

foreach target : target_dirs
   if target in ['...']
     blobs_ss.add('...')
   elif target in ['...']
     blobs_ss.add('...')
   endif
endforeach

directly in pc-bios/meson.build.

Paolo

