Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133CC3700CF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 20:53:25 +0200 (CEST)
Received: from localhost ([::1]:33994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcYGS-0005TQ-5M
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 14:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcY6l-0008Ou-LB
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 14:43:23 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcY6h-0003ee-Mp
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 14:43:23 -0400
Received: by mail-pl1-x634.google.com with SMTP id s20so21252758plr.13
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 11:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y9LUtAPUj7c6tG6fcB8JTUjA4OIWaOuqh4ACGTLg24A=;
 b=Yk4u6w0lSuKhvHcL7uzMLPkrl+xSmT8OwUOBjA6oV+0hnmhR49Q1xRp38yBHn2LRd2
 pDiYUIAIjqV+QPWXQQbY7oTPhbNJPOoE3Kf1aHT10YW3FWtDvcR9QuyNUoRGokc2U6eo
 XcoG/bbSzIF+qgdzhzGJ3yyS2XF6KUcA0LSYon2zvuGbKgXPUN3AXuH8gGKYjE0EAeWS
 VeKJ4021n7U2i4ePcgT+z2I84b/0ow9YFurL4IRLxxgY91D5K9Ve8DX0WlboSj7dQFBh
 1HdWM5z6wwFvhpecECcWMT7pJ7Qwcy2u8ZcA4MLSKM1RkNX5jtR+WHvSlipl3Iz9oEoG
 hlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y9LUtAPUj7c6tG6fcB8JTUjA4OIWaOuqh4ACGTLg24A=;
 b=hHakWI0NA5KmHK+2ABZiZCJtdk8MTNAEhdY3LyEjSux5m9T+02AOV7LF62/0xjB5we
 71q8GDgSMWJLUzz+reMZoxYTT1ztWJFrfJh7Kl0RC2NGYDsG/spxDHtW0Pjni3R2N53J
 kVkoGSMyzhw6IhIRNMYNYPIPa5upgadBuZ+dF4+a34OU+mZgFDssr7KvFSIhdirybrtV
 ZR4uiv5Goqx0G4nh6ljdRZkh3eVUo6M2p3otgUU1knuZcgFclKs7aA2ZRSGF3a6k/BcK
 ms/lpqfOsC8Cy2muq+ZHBldbp5DH/IkmgRI6nL/rqZ580qbw+HRii2RMY4GTWtm5S3Qx
 uYwA==
X-Gm-Message-State: AOAM531MW6G3q0JPEUPS/AeyGVZ58WSuaCPj66timoIMJ0ZyZ0P8dAWe
 PcYvPHuIhdQDphNEtgfVIJKsrA==
X-Google-Smtp-Source: ABdhPJxJBlBGgrGlh78vr2XzEQZRebPq5UwbrZqZqH0H+wQxP87KPzjIq5DdZF8D/cMLpsgOs4sI/Q==
X-Received: by 2002:a17:90a:77c8:: with SMTP id
 e8mr16918208pjs.69.1619808197918; 
 Fri, 30 Apr 2021 11:43:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t1sm2523848pjo.33.2021.04.30.11.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 11:43:17 -0700 (PDT)
Subject: Re: [PATCH v3 25/30] target/ppc: Move ADDI, ADDIS to decodetree,
 implement PADDI
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-26-richard.henderson@linaro.org>
 <0ed61faa-327c-68a9-d449-541a6a9f3224@eldorado.org.br>
 <b1c975ec-d698-e055-3166-68f8bdf4fbee@linaro.org>
 <34531538-03a7-1fd7-c80b-439a2822e0be@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <84b07c09-4245-58d6-0761-8c0928ff51b8@linaro.org>
Date: Fri, 30 Apr 2021 11:43:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <34531538-03a7-1fd7-c80b-439a2822e0be@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 11:02 AM, Matheus K. Ferst wrote:
>> But in this case ADDI probably doesn't use PLS_D.  You could use
>>
>> static bool trans_PADDI(DisasContext *ctx, arg_PLS_D *a)
>> {
>>      arg_D d;
>>      if (!resolve_PLS_D(ctx, &d, a)) {
>>          return false;
>>      }
>>      return trans_ADDI(ctx, &d);
>> }
>>
>> making sure to use int64_t in the offset for arg_D.
>>
> 
> We'd keep trans_ADDI with the same signature to avoid creating an arg_D on the 
> stack. Patch 4 added type specification, maybe we can define an arg_D within 
> arg_PLD_D? I'll play a bit to see if it works.

That starts to creep, with e.g. ADDIS now requiring arg_PLD_D.  You'll want to 
audit the other D-form insns to see what other special cases there are.

r~

