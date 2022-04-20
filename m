Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70223508AF9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:44:22 +0200 (CEST)
Received: from localhost ([::1]:46364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBZ7-0002uO-HT
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhB09-0006u0-Sh; Wed, 20 Apr 2022 10:08:13 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhB08-0003FD-2Y; Wed, 20 Apr 2022 10:08:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w4so2407092wrg.12;
 Wed, 20 Apr 2022 07:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZK4MtT5HRqIyef5sIQTGAbK+buPilaNi8U0U4ithJc4=;
 b=lH2eHL4wTrnr7qiqyYJQe75i0cHsJuDRmV9sFSPAbn9//nA+RReHVUgtz7DdRV1HAm
 9Rh8rVCpEpmCpDnnBbQV5on4m/TPcIQq411ESwEiW64cuxeYWOazuKNdlseeBul1DWBC
 K0wLp9ziykFQ3LF57QoXZc1nkltjZ6KiQy9xiv6JUkvsVHTtK8CTZUTpCAtGzSvFgYVg
 dH+pleFfaxTgm7X8QLm6McnkkHBAWC74zIJ7saiaMZKmqc8KIAfckKx0pOzZO9OqrJIp
 Rl4jUQK+tmVU77bfdvEkW3unzxyWoCJLkTIFXoeL73S5iQAg/X1ZokervUg74J1YRXFb
 IAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZK4MtT5HRqIyef5sIQTGAbK+buPilaNi8U0U4ithJc4=;
 b=6b6r36V6hJvp4YPo9TxeRwHPD++lL9YLmlyx4qdFMzNIg2ctkOaN4Ley5pRkcv127X
 IPGvy7JffH4e5AC2GYoMg/73kGZXjWTUZkdR5BYcSIJce0dpUyH3oEaO3hhvDwr/IZXl
 FUcqyjyomyAD3DbmKXZnt1/AhcCvW4aDo0O1Ri09qed+HDQaaYZb3A3yN2CYanojN6ae
 RY1yHNvcWoMXS+Fg7dblP1zqOVN8cbtjZHq43yKQP5xl2wBg7qSFTyPvXHpsOrWx4Rpf
 SDVfeWCcHj+ZPST3lTNpu7HyNWZtqtFkrfc5SO2JXa6IB/8xjhfsipkqQUkDC3PtjbYs
 ARsA==
X-Gm-Message-State: AOAM530JduVGCuEK8FwFlMg118s7DXYRGiYVAxHaS+pe58EWkpiBn1y5
 eIHaAF211A811S3fRG52Taw=
X-Google-Smtp-Source: ABdhPJwXrapTGLeuzF9xojTH8RgJwtB8O2k16NOB1pO4Mb0nJWH3XFzgJ6oyE3LLjBCCfN4PzoNb7Q==
X-Received: by 2002:adf:f943:0:b0:203:b456:c71d with SMTP id
 q3-20020adff943000000b00203b456c71dmr15830200wrr.568.1650463690123; 
 Wed, 20 Apr 2022 07:08:10 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 az30-20020a05600c601e00b0038ebd950caesm18456167wmb.30.2022.04.20.07.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 07:08:09 -0700 (PDT)
Message-ID: <cc3ab0f7-0c7f-b9c8-6492-dec75886e138@redhat.com>
Date: Wed, 20 Apr 2022 16:08:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 07/26] block: add missing coroutine_fn annotations
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
 <20220415131900.793161-8-pbonzini@redhat.com>
 <20220419185041.24syfi4glf4fk7o5@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220419185041.24syfi4glf4fk7o5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: kwolf@redhat.com, hreitz@redhat.com, stefanha@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 20:50, Eric Blake wrote:
>> +int coroutine_fn blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int bytes,
>> +                            BdrvRequestFlags flags)
> Long line, worth rewrapping differently?
> 
> The functions with_co_  in the name are obvious, the others might be
> worth a comment why it is okay.

Or perhaps should be renamed to have _co_ in the name.

Paolo

