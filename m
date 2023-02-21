Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2422569E520
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 17:51:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUy5-0006dd-FE; Tue, 21 Feb 2023 10:54:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUUxp-0006KZ-Cj
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:54:00 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUUxn-0005OT-EM
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:53:56 -0500
Received: by mail-pl1-x644.google.com with SMTP id c1so5743149plg.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 07:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+JN1BOBwKN/nuIWMGdkhe4jlRrj/hpW7tALl2KAXk8o=;
 b=QJbowUa8MFIS1fpkC9JvN8GMa+F5dGejz8IXgVcIrlr8Dflq8DB/BfxJDGs9ODmtg1
 pz2xX8lQv13VFNP3pmmhxQiym+ykdBKHu2hPD26XCDQWAL23q6NDk8/TyHGmxyt0rCUz
 rp6oQD7FlU5LNj+/KglkVrHhh2JfJZ818+N/Xae1IdIutxWEYW1anmpLVVAwQr+IJA70
 r6JRRefTXGn8E7MZiJ4IL3fhWGeGIoJkpr54ikHSeB+dOFObjjH8TajhEu2ODDVVb8Gi
 Mbw1IvLRoDqQBSE3NeuRNK4GF+kUtMz+0TQzlRHTno1/qh8a16IyXl8AEoHJ+p/A+r30
 6RKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+JN1BOBwKN/nuIWMGdkhe4jlRrj/hpW7tALl2KAXk8o=;
 b=SZ7FQb3umjMonxAhahzUeVbkylFSe6BW0CCBxuDak79A90D51c/Ib99WVpsx7oguUK
 cr3FaYQ9dOjgLxUqiDNaa3hxmwjXo/M+lun9iGbxMeZSVwsFtCl5mUte147F0xJuRZD0
 RmiAHDTlgGFQXtiEwKaC4z52ymyr034Cytgw0YDbr+kfgsdH4Cy4XvXFlyUCgsebKY5N
 A2rB/nS2OU4CuGiN35ihh35tkrUHN72n3Rl8rSj0zVMlKiZGK6lSOUJITOJlFTpc1012
 2mLZgMqPGaSb7TOIwmRTdfyweypgYAcapCyWUV1ZKQWgPgb7xv7jxb7KGG+KahERfhgO
 CXYw==
X-Gm-Message-State: AO0yUKVk5jckuMBOOKXlKEv3tZEm3LD6G01GjdQ/fMCBJpyUtH8Lrw98
 USfFqTF9ZqPkTw9VhtRnPUgikRJMvUxdv1+ZM85QuQ==
X-Google-Smtp-Source: AK7set8QB7SUi6ac5cQJ4Uo2RKCgeAfGVn4jBRqHdxvx4mmIWLTIFl6Rw6234PQsPL51HRfvhCYm5g==
X-Received: by 2002:a17:90b:4b12:b0:237:39b1:7c88 with SMTP id
 lx18-20020a17090b4b1200b0023739b17c88mr16035pjb.35.1676994834046; 
 Tue, 21 Feb 2023 07:53:54 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 ei23-20020a17090ae55700b002343e59709asm2496303pjb.46.2023.02.21.07.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 07:53:53 -0800 (PST)
Message-ID: <11aea60d-4476-1115-a53c-1309c01dff4d@linaro.org>
Date: Tue, 21 Feb 2023 05:53:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 27/27] target/s390x: Enable TARGET_TB_PCREL
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
 <20230220184052.163465-28-richard.henderson@linaro.org>
 <0a437546-3b18-3a3a-6ffb-afa93a93c170@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <0a437546-3b18-3a3a-6ffb-afa93a93c170@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 2/21/23 04:35, Thomas Huth wrote:
> 
> FYI, this causes a build failure with --disable-tcg:
> 
> https://gitlab.com/thuth/qemu/-/jobs/3806828645#L1885
> 
> I'll add this to fix it, no need to respin:

Thanks.  I should have thought to test that.


r~

