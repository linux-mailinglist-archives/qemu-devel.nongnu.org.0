Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76833B9852
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 23:49:12 +0200 (CEST)
Received: from localhost ([::1]:50038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz4Ya-000226-1A
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 17:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lz4Vg-00085W-6A
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:46:12 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lz4Ve-0008AL-RZ
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:46:11 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i94so10002413wri.4
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 14:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kFEShNxUZrk7oemUa4yIjBiGqWrg7+0jIhVRD3cMJOg=;
 b=suhYXhB/a8QO+tsJj5mACBFXm1iKnmgtLJggSElKChC4AItf94aW3dSayToP6oADo5
 hZa+aE3uT15V43F1ALUJMhcQ4V3cnCAB3+XH6OKfJu1U/4lAnLa/Ch5JgPB+YoosGE4c
 muVR8isLvOo/vhEvhYixsyHs4I3ZsSjP+935tVKU9J5RWLvPmqB24j6o7Vc62EVMKG+8
 9Kchh9mG9l8JlUZkKqz9041L6oTCAp+zksPAb+A6PfmHoKzanXpHlK+5XsLMfThrB62X
 qNc8n8Wv2FMhM23Fta5vh3lqYhKJHNMq28AOs0EPL7A0rhp98xJq9lpvBdUwxwnLwC75
 fLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kFEShNxUZrk7oemUa4yIjBiGqWrg7+0jIhVRD3cMJOg=;
 b=IUXANp2gu9vMdMwdvOUcAIMk6fH+cymPdO6cb3zCvOwbDGk15RVfJQBjrC/4DlWHrE
 El7LQQD/HA5IVPOPe1IVOmO+kMrbKiefcSO4brvbxuh12VYA1qcp/wyksM7EPmFZur8K
 13rnyBSwPqOwg3dR/dOeofNDjMa4Tq6ybDA5i6oyKn1dGIJYYoDw6eHVA2c/Qo4BE8ez
 9DbP4/pg6unkoEoQPhiixtYGaiszXUHxJwKxfMwwFh1n3nRtg+t1EU1EZPafJromQfuz
 TVvZRXn9x1aKWfmR0pCZphNtHaU4I2UdNalNcYVuBJunUFRiRVoy2edQjx5gVGdmf/Fb
 1j8A==
X-Gm-Message-State: AOAM530JlUC8S0tajF75YffrJc7zONwEsAyQCAgzMdd1VqTsCd+xsV9S
 r4IPK0UGzH+weComCRzYIN8=
X-Google-Smtp-Source: ABdhPJzveKuALDHrT/U+OOj19lQkuqNKH9oTYgH12CNjbGwPsu4dBEpDs7y6GmUccWO+ad040AFO/Q==
X-Received: by 2002:a5d:630b:: with SMTP id i11mr1931927wru.175.1625175969580; 
 Thu, 01 Jul 2021 14:46:09 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-151.mobile.abo.orange.fr.
 [92.184.108.151])
 by smtp.gmail.com with ESMTPSA id t83sm10444338wmf.36.2021.07.01.14.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 14:46:09 -0700 (PDT)
Subject: Re: [PATCH v2 06/10] qemu/bitops.h: add bitrev8 implementation
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, jasowang@redhat.com, fthain@telegraphics.com.au,
 laurent@vivier.eu
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
 <20210625065401.30170-7-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <61e0d65c-21ad-eadc-d98c-38a32a935687@amsat.org>
Date: Thu, 1 Jul 2021 23:46:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625065401.30170-7-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 8:53 AM, Mark Cave-Ayland wrote:
> This will be required for an upcoming checksum calculation.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  include/qemu/bitops.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

