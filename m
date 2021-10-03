Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06CA420273
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 17:53:37 +0200 (CEST)
Received: from localhost ([::1]:34200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX3o0-0007h3-2j
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 11:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX3ly-0006cO-5u; Sun, 03 Oct 2021 11:51:30 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX3lw-0002BZ-NU; Sun, 03 Oct 2021 11:51:29 -0400
Received: by mail-wr1-x429.google.com with SMTP id s21so25620707wra.7;
 Sun, 03 Oct 2021 08:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zFQ2nKa2KOJyH2DOZbbujp5Uank75QAx3md+yXvqijM=;
 b=O3dXTUBFydpwhgGTLTOETHqYT+OFnIKTOJ763SesmHfD53CbNoVsXAX62OewJ0TvKl
 b/wRH140R2HjBTqQ3+S1wwLPwY6/6GNXtugXUQTZYZZkgjwPYj9m06gU+yeqFgj0KMWJ
 0xH9fXT4BbFAPZcMjDGiDlZNnxrJUbshsbnh5IdlcLpLMYPw90A2kIS0SC9GQfwhypj+
 AHWQd5jAH9C7+E2Xd28a8lIPymg+DjWYKWl720J6o4wSFNhPnlJJ4Gj0dxyQUqlfbcUZ
 gJCdRWStOv7sV35b9yBbETUL+vKHZMhC8XvyK2yHryr5wmdIGf4sX6gCZyMQLENzs2yd
 zJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zFQ2nKa2KOJyH2DOZbbujp5Uank75QAx3md+yXvqijM=;
 b=2cUahynKdZd+PViIJluntMbNkIv1AS/QTl3PkgYoylhfm8FKJ8a4nHBplkWld11eBx
 cnyNP3Fk2I3CKQWeIe1s+P6tyIl5WTVHkeo/ATsgY4QOuG26PLU4aT+ABV3dqSkRBA87
 qlaFJpyb5EkUOkctmHKPQmIgtbgfZ0NkgZ51tHFjHS9X3fcQSo54+EeF9/ytCggGWOO9
 k7FgRQW2g6dd6So3aexAymGw/QapmKrx5EVO3S7b/FSNoe8/yZmw20fEcKRAPCaI3S8q
 WI065RzTAffAbiMkofs2u6cteHGOhxOiGv0NDEu9sr8+aFE+Q0M7Bkre9W0MX0BIp3/A
 MXTA==
X-Gm-Message-State: AOAM530b36i2YmeOFGVaQj5dJqgVuumvNC8nSQc/tuSuZGjN6Ba1EfoA
 jGLvFdYPQtXSr7aqy/sznto=
X-Google-Smtp-Source: ABdhPJztqZsoIAV9FEBQUF2VrSLzRYROWTVx8kopRg9+EabF6y9OGhucyzwf2yG4v3JY2x79BSadow==
X-Received: by 2002:adf:e604:: with SMTP id p4mr250573wrm.79.1633276286440;
 Sun, 03 Oct 2021 08:51:26 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c17sm13502822wmr.15.2021.10.03.08.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 08:51:25 -0700 (PDT)
Message-ID: <e932c4e7-cf29-f053-577c-c626e35f72a2@amsat.org>
Date: Sun, 3 Oct 2021 17:51:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] target/s390x: Optimize save_link_info() using extract()
 TCG opcode
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211003142922.3678039-1-f4bug@amsat.org>
 <5e484c8f-23be-9162-7fcc-97528e25b830@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <5e484c8f-23be-9162-7fcc-97528e25b830@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 17:31, Richard Henderson wrote:
> On 10/3/21 10:29 AM, Philippe Mathieu-Daudé wrote:
>> -    tcg_gen_shri_i64(t, psw_mask, 16);
>> -    tcg_gen_andi_i64(t, t, 0x0f000000);
>> +    tcg_gen_extract_i64(t, psw_mask, 40, 4);
> 
> No, the result should not be at bit 0, but bit 24.

Good catch. I was no sure about that one, should have tagged RFC.

Thanks for the multiple reviews!

