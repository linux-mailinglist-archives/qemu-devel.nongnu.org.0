Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 588446EC192
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 20:25:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqeNc-0001HL-5Z; Sun, 23 Apr 2023 14:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pqeNa-0001Gz-86
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 14:24:06 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pqeNY-0006s7-EL
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 14:24:05 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-246eebbde1cso3197340a91.3
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 11:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682274243; x=1684866243;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zl0ud7mOIII0nZJcBr1JpioW/TxpCqcZLSfEwJd2j+8=;
 b=F4f5sM71yPSXHJ4K6M2LmTmBiriErxVUr3lV4nPFO56jMEb3rpej6UcN2q0B8cd3au
 uzUK6Inlyh83Jz8kFoU7YnRvjdzi6iY6KbQnK6MEDEAcdXS16iIGlqqYmsQMjxLZp6eh
 kMt1jeMgUSY/5DcJ9LuiqGi/Um44kbyMxBopZQeQXYaLTfeOdrV7ULv/W4zdm0/r4FAV
 rOiY9aqw4w/6g6he7MQ7d59XvfbnYXuMxReVH5f3Eqn0OHmPt50aAwBBszhQBK61BbMz
 Yli+HqsP0OJ0OiqVgQqbb4A8QvuXXCDdbPnuOrOIkJRsOLhVIHMeRaTM0J7YjXCaEsli
 4XoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682274243; x=1684866243;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zl0ud7mOIII0nZJcBr1JpioW/TxpCqcZLSfEwJd2j+8=;
 b=KflIJiBNKhKUkLuUSfvwTMfCK0dlgdbD6zjxYgWoAGzkzJOyZpbqAyd4kS1vakPnVk
 7Vg9wA9xu4GxA/W+DF10ik8n1KaK6LQeNwbf3KDNX0aVF/SmSkXAQniASRWQQ/g4uC1l
 xlwwuuOkYu25cCBSNm/thPLrCrNqyll3UXfPiaqOygOQce1iQyAdWz++Gw/cS/Y3328C
 7IK9DbVz8FAoHylCfQ8jv3bqrD5xqYAR/HwpVn1eWcfEpJ4S/pSdLnXYHa4S0Su6YwU2
 LiG9U/VinhzNXfXEeHEvald+RwwGJnBkyhfAsBfvuxtWTp1l6OU6Ut38MKsZAM7ZwNI0
 fjSg==
X-Gm-Message-State: AAQBX9fW+jmJPU6uXrgzIg8gFu363dg7Ocrjzy0M0ivz8JMYVoVBa42j
 h4RNdDJPQMSg2vaxqcbgGFk=
X-Google-Smtp-Source: AKy350aXBrmnPKWdcqnCh/YRBW4aoOJ5oAhIU7nr0VuQMQznwXYpaxDK98baDbgyTTwC/DaI/umTDg==
X-Received: by 2002:a17:90a:c251:b0:24b:a862:912 with SMTP id
 d17-20020a17090ac25100b0024ba8620912mr2888140pjx.14.1682274242824; 
 Sun, 23 Apr 2023 11:24:02 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 gw13-20020a17090b0a4d00b002470b9503desm7012520pjb.55.2023.04.23.11.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 11:24:02 -0700 (PDT)
Message-ID: <dfa9e438-d1be-caec-6320-c5f196ced2f5@gmail.com>
Date: Mon, 24 Apr 2023 03:24:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: get_relocated_path: the configured paths are not looked for?
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
References: <7f96ff38-2268-07d3-23a3-d46bf036b711@msgid.tls.msk.ru>
 <20e76562-b1c7-3574-a277-7df6260226cc@gmail.com>
 <a01a470e-891e-bdfc-aefc-00701a6a0413@msgid.tls.msk.ru>
 <63948283-d7dc-924b-c19a-6e376096daac@gmail.com>
 <30817af4-5b21-b1ff-293c-f39196842077@msgid.tls.msk.ru>
 <fa344795-07c0-b6a2-5666-9a44e1671b38@gmail.com>
 <bccc8256-30f9-95e4-68a2-793ba4bceb0a@msgid.tls.msk.ru>
 <c5568089-d8e4-36da-4a77-92ccc350f003@gmail.com>
 <0803ed60-9ed6-26aa-f5a8-c955c8ca085a@msgid.tls.msk.ru>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <0803ed60-9ed6-26aa-f5a8-c955c8ca085a@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.143, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2023/04/24 3:10, Michael Tokarev wrote:
> 23.04.2023 20:39, Akihiko Odaki пишет:
>> On 2023/04/23 22:22, Michael Tokarev wrote:
>>> 23.04.2023 14:47, Akihiko Odaki пишет:
>>>
>>> https://salsa.debian.org/qemu-team/qemu/-/commit/e017f53a8550d0bcaaca81c6dacac8ec34295cf0
>>> fwiw.
>>
>> I seriously think you better consult GCC and other package maintainers 
>> to have consensus on handling this kind of scenario. Otherwise you 
>> don't get the behavior you expect from other packages.
> 
> I know no other software which does this.  It's interesting you 
> mentioned GCC, -
> I've seen it is doing that for years, wondered why.  But it works just fine
> when moved elsewhere - I just tried compiling a hello.c program by
> /tmp/gcc, it works exactly the same way as compiled by /usr/bin/gcc.
> And wast majority of software available on linux does not do these funny
> tricks with relative-to-executable paths (I can't say for *all* software,
> but it is definitely uncommon and I know no other examples).  Only qemu
> is broken in this context.  The patch above fixes this breakage.
> 
> /mjt

Well for me GCC can't find cc1 as I pointed out earlier. The below is a 
simple reproduction case using Podman:
podman run --rm -i debian <<EOS
apt-get update
apt-get install -y gcc
cp /usr/bin/gcc /tmp
cat > a.c <<EOC
int main()
{
}
EOC
/tmp/gcc a.c
EOS

The output ends with:
gcc: fatal error: cannot execute 'cc1': execvp: No such file or directory
compilation terminated.

This is because GCC uses relative paths to find cc1 and other files.

Regards,
Akihiko Odaki

