Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E4D5B55DC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 10:21:53 +0200 (CEST)
Received: from localhost ([::1]:35676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXehS-000473-NC
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 04:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXecG-0001Xq-PB
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 04:16:30 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXecB-000549-IJ
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 04:16:28 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 i203-20020a1c3bd4000000b003b3df9a5ecbso5706935wma.1
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 01:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Yz00z1fEIKXxF7DXUKeODferhZObpHegLNazYJgNLPs=;
 b=TIyUpEKsZXISw/srspRQC0fs910ARX3qcRKUmkmWZeIy0nuwx3AtXtvde7Vt9XlPU2
 zJ4aDimKMLziP+SmIY9xHamy96Tie6gs/AG6rdU7SBypmrrWfgzczDWvD//+tnk4cEwp
 qwsGOkwvA4Joe+oIOJPVohOaDNbA/Eczz0Gvg4HkhHwgSYlMTkjwtUxKmCXEsilz211o
 xQqJsn53okFIPh1+oNZ+OUP1jrsLXK/+nLM6rESzyqe0c6AqxuRQ4YGTniP8hcsEKKkB
 ch6gxV3PljlhlFi9+mG8lnx99YEDrQFEfbgnarrOcmZLPAYWyeG74/2SlNdfmI9jA8x4
 8nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Yz00z1fEIKXxF7DXUKeODferhZObpHegLNazYJgNLPs=;
 b=IGQLi3uF4uPLISpqCHH2PElnb9u2nrdb81+Hw6m7XBTYacQfDycjMmS00yaTp/bvNj
 NMLgdTZimTNTgHl25S1N3ig8957epnx0d4A7gD2uFITmPdRxo58pIgf222b9RxJr98OV
 ALk8PYjAdl3yXjMogGrbcj61P9SaBs0aqQnYqIPZUSeDCYdkMTlGnVGRIV2Wsqk0IrDm
 Buk6WbQ8zJeMCqHMibA33cWdt6a666+dXuzcpm3lJ97JPF+yXpTVvFp2hJbIVxbYu+ra
 1PPptOkg+RN7rszVGReLk93SLMciyOVZYfks4HtJRvavA7zaDdObs+e+19eaX3H+gvtV
 eRug==
X-Gm-Message-State: ACgBeo22T8JYyn2Oj03Z/XqdOIVB2jzb2SlnWakf8Rqq4Jd00rAA0Ohq
 b5NUy1O7vMUUwYtth6wQz2Hg6w==
X-Google-Smtp-Source: AA6agR69hqNVNRn3k8h+GR6xVRuIumekqy10pmUtgyeOWLNXP7/fHJv6VT5FR0rFRis6Bd+0gIB2ug==
X-Received: by 2002:a05:600c:1e08:b0:3b4:8fef:d63c with SMTP id
 ay8-20020a05600c1e0800b003b48fefd63cmr918504wmb.158.1662970581817; 
 Mon, 12 Sep 2022 01:16:21 -0700 (PDT)
Received: from [192.168.44.231] ([89.101.193.70])
 by smtp.gmail.com with ESMTPSA id
 c16-20020adfef50000000b0021f131de6aesm6575833wrp.34.2022.09.12.01.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 01:16:21 -0700 (PDT)
Message-ID: <64c0fed5-56e7-ceb1-ca53-483c3271f3b0@linaro.org>
Date: Mon, 12 Sep 2022 08:58:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] target/i386: cmpxchg only overwrites ZF
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911222630.338330-1-pbonzini@redhat.com>
 <20220911222630.338330-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911222630.338330-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-4.101, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/11/22 23:26, Paolo Bonzini wrote:
> Do not set all the flags, they are untouched other than ZF.

Um, no, second sentence:

# The ZF flag is set if the values in the destination operand and register
# AL, AX, or EAX are equal; otherwise it is
  cleared. The CF, PF, AF, SF,
# and OF flags are set according to the results of the comparison operation.


r~

