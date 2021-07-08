Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6438A3C19E3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:35:33 +0200 (CEST)
Received: from localhost ([::1]:36246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Zo4-0001N5-Ck
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1ZQB-0004w4-BV
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:10:51 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1ZQ9-0005Bh-WC
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:10:51 -0400
Received: by mail-wr1-x435.google.com with SMTP id i8so8807290wrp.12
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uqesvkkDe42nSpIQkIE6VbUZpiJ4j5QCW0bIXWozbyQ=;
 b=EMPOVgXkVr/U2bKMDQ31XvDZkkFBgxT1xDxhl3PzQb0bwyEuEthjaSYzRxTwt7tt2x
 Y/FXyb10AZ9h36IiwjaIPJKYTSYO7EdOnBYGJSZL5uL1MNMoYE1oDEV7DG3ObzWXQUZm
 tG1wLuJsXXJGfLvaOcRVMnSNB+ZGdK/mFEyatX+JMeH2B8lxPeooHRP6a7F0REDFUQb0
 DRvhXhFkc84YjhhKAJOmmt7O1mq8OVFcTfu8OaqU8WC326xGotf7EbrdW3cTuajKIOBp
 ziKSNOJuD6V1XHsQ/q+Z9vfEK872Nza1+Pm0xZ18yS1HasUnWTQz5qPxUozDYVquWt8x
 Uvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uqesvkkDe42nSpIQkIE6VbUZpiJ4j5QCW0bIXWozbyQ=;
 b=XhmcxWluno21eXlaMdk+L/YciRvAD8H2xES9+4k9+DErNi9Y/mrXEWqJwC9elEtxXq
 5/lLmuNn/qok3UPsBaZt4DHRXdbFG8AA3I6nvqdjXND2QRWgx75XmT9ALqo2kboDZDZt
 ZbVMmFAkxh9qqLGAPxqxhQ5TX6KYAqNTHAjXmJk3fRpWMC6FHx4ssjUUZ6ki2tCed3PA
 Y/zanQyvLt2oDf5KNuT1oWYOAq7IUIcw+85EbD8wqCJyhhQgnkajbKjy29aCzTOPEva5
 C5zaOU0jQzRS+laBZWK0+dsW3PkfTD01546j5WKy6iLSth0JXItj2l1GrGLgrmC8dwoe
 cI4A==
X-Gm-Message-State: AOAM5310rsC8O3yvQKzg+d3XQyLhjjq/FASOAJ++L/LF8iRb954ik4q7
 clFjr+KXHSfvADdleCc3QvRcOwBRFxE=
X-Google-Smtp-Source: ABdhPJzet4peqBPmEplIf7K7IWjR6BwdUhq8O/j1kFuuBz9MGISoYMkZZ7gfzZD2aXmtdgKCU/qAhA==
X-Received: by 2002:a05:6000:1787:: with SMTP id
 e7mr36049554wrg.167.1625771448457; 
 Thu, 08 Jul 2021 12:10:48 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f7sm498763wml.35.2021.07.08.12.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 12:10:47 -0700 (PDT)
Subject: Re: [PATCH 4/4] target/alpha: Use tcg_constant_* elsewhere
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210708182519.750626-1-richard.henderson@linaro.org>
 <20210708182519.750626-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dda2aef1-0cc8-275e-2590-ff1bbda5ab71@amsat.org>
Date: Thu, 8 Jul 2021 21:10:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708182519.750626-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-0.001,
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

On 7/8/21 8:25 PM, Richard Henderson wrote:
> Replace the remaining uses of tcg_const_*.  These uses are
> all local, with the allocate and free close together.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/alpha/translate.c | 46 ++++++++++++----------------------------
>  1 file changed, 14 insertions(+), 32 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

