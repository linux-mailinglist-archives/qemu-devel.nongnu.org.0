Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7072862D4F5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 09:26:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovaCe-0007h8-U1; Thu, 17 Nov 2022 03:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovaCc-0007gm-Lx
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 03:24:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovaCb-0000sJ-6L
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 03:24:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668673491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c/PswGPFmkPH5dGV3nC9LaqLvWXla31ox88On977JPc=;
 b=caz77Fa7SEbpKrZw6kbzBon8dQn/gegSeRmSkT4NYAWU3Hew9mKWIuTEBi/XJVcFzhzPuE
 5MbJ4Nf40Q4JJPuCbVOwQAbU6SLzEU7UX3H5Nu5bkyXSy/Yy1IlhniBP1EfU5ZPGnNQvOT
 n0B5PPpUlDbBzhXlJlHdFp4B4TH+lGE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-159-lpn1deeFP_mdZbz4Yt6J4Q-1; Thu, 17 Nov 2022 03:24:49 -0500
X-MC-Unique: lpn1deeFP_mdZbz4Yt6J4Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 v12-20020adfa1cc000000b00236eaee7197so395657wrv.0
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 00:24:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c/PswGPFmkPH5dGV3nC9LaqLvWXla31ox88On977JPc=;
 b=eIfZ8wH5G/MlX67hDOaiel0tAkS9phBs0e84RLNKzLMuArsxogxSqUFgYmY5NnbMF6
 1tMZ8R0HQbEP1Agfjw6d0yBJafxaECFouefU/0bi6ygCbvHThjhxJTKy8vwQ4QMzCwxv
 m0p4NXRaLaagA65eDwdsNeVW6irY876nGr7ljJihA5VAfllCklNa8Er7uoegL8qi+tnF
 huUllZ+x2q+yHq8yWJmjdBdYsdljH3xF0Bm+cOAmq3bzkkPi4G8DGIci1WP2gl9N72Eg
 ofqC5bSGgBF8vJQPNL5t4BDseI4h3ax1wjPwlnDLqKzCcprNc3tddd2pi1QydwXBsOpD
 2CTg==
X-Gm-Message-State: ANoB5pm/csyzMO5atLWMNgAUo9DGHPUSDoyAZ3baGYrCvCN32oxnviEB
 cSyVeYKp5C07dr63YzjJRTNumj5QYkYajfn8fcS2R4kTrKGbfWtKSxkz7Yi6Pt84TK7WKp37gL8
 qf34WWmGvScoA0rM=
X-Received: by 2002:adf:dd10:0:b0:22e:4f2e:e57 with SMTP id
 a16-20020adfdd10000000b0022e4f2e0e57mr740454wrm.698.1668673488300; 
 Thu, 17 Nov 2022 00:24:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Ugn3mKgvrK5jatdXFQ686fmCksonXIjL/FUtBZMzEyX6m5mvsM72f3DzreGsa74sNsWSkpw==
X-Received: by 2002:adf:dd10:0:b0:22e:4f2e:e57 with SMTP id
 a16-20020adfdd10000000b0022e4f2e0e57mr740441wrm.698.1668673488033; 
 Thu, 17 Nov 2022 00:24:48 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-4.web.vodafone.de. [109.43.177.4])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a7bc7ce000000b003a6125562e1sm376018wmk.46.2022.11.17.00.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 00:24:47 -0800 (PST)
Message-ID: <0d802e96-6ce4-442d-779c-7c29eef5caab@redhat.com>
Date: Thu, 17 Nov 2022 09:24:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] target/ppc: Fix build warnings when building with
 'disable-tcg'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Greg Kurz <groug@kaod.org>, Vaibhav Jain <vaibhav@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au,
 clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Kowshik Jois B S <kowsjois@linux.ibm.com>
References: <20221116131743.658708-1-vaibhav@linux.ibm.com>
 <20221116162025.330e5a4f@bahia>
 <51b78663-2b5c-2599-da04-a0a18e8315b8@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <51b78663-2b5c-2599-da04-a0a18e8315b8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 16/11/2022 16.30, Philippe Mathieu-Daudé wrote:
> On 16/11/22 16:20, Greg Kurz wrote:
>> Hi Vaibhav,
>>
>> Nice to see some people are still building QEMU at IBM ;-)
>>
>> On Wed, 16 Nov 2022 18:47:43 +0530
>> Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>>
>>> Kowshik reported that building qemu with GCC 12.2.1 for 'ppc64-softmmu'
>>> target is failing due to following build warnings:
>>>
>>> <snip>
>>>   ../target/ppc/cpu_init.c:7018:13: error: 'ppc_restore_state_to_opc' 
>>> defined but not used [-Werror=unused-function]
>>>   7018 | static void ppc_restore_state_to_opc(CPUState *cs,
>>> <snip>
>>>
>>> Fix this by wrapping these function definitions in 'ifdef CONFIG_TCG' so 
>>> that
>>> they are only defined if qemu is compiled with '--enable-tcg'
> 
> Interestingly this config isn't covered in 
> .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml.

Why should it be tested there? s390x is not ppc64.

If you want to test this, you either have to do it with a cross compiler (in 
.gitlab-ci.d/crossbuilds.yml) or in .travis.yml on a ppc64 host.

  Thomas


