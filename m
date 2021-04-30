Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB00436F44E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 05:14:13 +0200 (CEST)
Received: from localhost ([::1]:45866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcJbW-0005c9-5O
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 23:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcJaV-000514-5F
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 23:13:07 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcJaN-0004Wh-G3
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 23:13:05 -0400
Received: by mail-pl1-x634.google.com with SMTP id a11so4981415plh.3
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 20:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+GoX7PdG/628H+TzhmwFytC1Uv/He/fSKNL0uMxk4mY=;
 b=U7wrFslSbwTLocrWG6IvwnZT1rV8qdgSkcpf2l++ZOglADjGvnePrS5qqzNZSB4ciq
 7NE6+9LzihX6d4STotDwHCJo7yJf+2HGh/mbHiQHCXN751cGOAjoR8FUIIJdU7tA0kqS
 AHuFhWf5gDIF6Eid1aJaNUg2twU683O/YGKDZfZ6z0HrT0xzIv3fS4ziwC5Ho5WtGKNL
 mooSp+EhK8Dt3C58Qmag2Mx6hcmUHVkjP1CRF49lYMOeb6A0QMJuogLAonKu6EgFYSxo
 d5sh0ZuMZ3lMOMmbKNUC/J3dOBMtlWNjksPqIL4FvkXNGLSb/QWBb+0kYrg5SX8DJ0GR
 IiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+GoX7PdG/628H+TzhmwFytC1Uv/He/fSKNL0uMxk4mY=;
 b=claYTMJtjWFBj/N3T7OFiuZ1zolA6YLqjnx5/47DYGQ1RAnacpIMpd+oauu4s2Rqcs
 c39i3NleAy3gmR2r4zHACKZSOA8OyRtEWA7RYKIdD69Z7znl62PxTrNIG5tZzXN2iAjj
 kcVTLaAE3aRgTkl/U1tR9C6CKTLPMIJoYxjSErmAtheIWjlHVy76kciMEolvrvrSOZvL
 hcV9I++LbjdsWgxE0sHTt2wwKN3VYQ1xwffHxlIC1jEAetqR4NI+qIW2vmgZi4CwQ0d/
 wjf6NUkbMy2GeQzbsVVCxdXFZ93/6epo4paJNXwNLelJKvfKowCHYzhf4aQrMf6AjcjD
 9U3Q==
X-Gm-Message-State: AOAM532GV6Ift6Bakyv62urUEO5FTwDla4pGP+3lZ5vtvLgCGr4QMmqG
 q0oUHXS0hudfA88oH32utkji+Q==
X-Google-Smtp-Source: ABdhPJympsH7HJ5yzvGEBKEtuzjSw7aIWfevoTKNtPLwcKcRDxTT7ERJU9sokj676oumbkpjM0J6tQ==
X-Received: by 2002:a17:902:6b43:b029:e6:3d73:e9fb with SMTP id
 g3-20020a1709026b43b02900e63d73e9fbmr3190049plt.37.1619752377394; 
 Thu, 29 Apr 2021 20:12:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 15sm1324663pgb.61.2021.04.29.20.12.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 20:12:55 -0700 (PDT)
Subject: Re: [PATCH v2 0/7] target/ppc: untangle cpu init from translation
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <72bbf3a7-4fdc-1a71-2f13-f953db5be8a4@linaro.org>
Date: Thu, 29 Apr 2021 20:12:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: farosas@linux.ibm.com, lucas.araujo@eldorado.org.br,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 9:21 AM, Bruno Larsen (billionai) wrote:
> This series requires the patch proposed in
> <20210426184706.48040-1-bruno.larsen@eldorado.org.br>

FYI, for the benefit of tooling, use "Based-on: message-id" which will allow 
patchew to construct a patch repository.

As is,

https://patchew.org/QEMU/20210429162130.2412-1-bruno.larsen@eldorado.org.br/

reports "Failed in applying to current master". Compare that to

https://patchew.org/QEMU/20210416210240.1591291-1-richard.henderson@linaro.org/

(which, no coincidence, is the first one I could think of that uses Based-on).


r~

