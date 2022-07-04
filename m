Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91888565E76
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 22:30:29 +0200 (CEST)
Received: from localhost ([::1]:39002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8SiC-0004Fi-E9
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 16:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o8SeQ-00007m-MO
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 16:26:34 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o8SeP-0004uX-4Q
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 16:26:34 -0400
Received: by mail-pf1-x42d.google.com with SMTP id a15so9746679pfv.13
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 13:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AGwRvWCCXxaNyzavWyqNngeZRBKVx4fqE5pni+I28Y8=;
 b=oKjCpLuE4IAP4vSAtCd3XH09gijYQ59ZKq0Nga0TAGCN36u8S8nT+3KnodDhAOZV/6
 mkuu8nThC6F4zUN/OCJIoOHfM7D3fYItMozSRLq4CyLtnthDSOXWyo2vsTxyvPr8j3hb
 2tdKJ5nGOOcvY+h03flq7aHT1moe4V3XiATqnqGmtcECuvlpY+WFgW0pVzX8q8xzYNSS
 N+/wv+IF81e2EEMQS6NRdI7CLNNZsYdgtTxCIXA+EQ83NJuzUNKivMiQDzOfCJqNZmSz
 Zj+jQq8Q2wIaXM0rpYIFIJey9rPklnmcwZWTwZm/HYcZBdKEAV/A8MO1GYZk76o6uNsc
 hxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AGwRvWCCXxaNyzavWyqNngeZRBKVx4fqE5pni+I28Y8=;
 b=a1Nz0IiLUNbxKgRKnMBq6nLKEKbz/jNFwpYiAr6uOjuVRmgJlewGsuo21xZk65cBTg
 Y4Eq+SX445FFG5tgDsoKp2uPe/IE8hvrYlnIssYdgqZW1KkRIiSBspHf3YfUGhwi0As9
 WvQi+Oeg2Ri4j+/pWZ61LWOUosAV+hKK8HD+Y20Asd9+mQ7g9uC6vIe2l/veehkBn2J3
 GvPOj5iEwRqXVIYE9ECld0lBOwWE1jDXCDnkpJUMDKs6B57vXBiOgxTRQh6Otpp8ILwG
 3IxWhXWO3wr2NLCLhhSmotrJWkqlB0LOjBz31Hp/u+xy3c7k5/tCO630hSSIRtfwacjb
 05BQ==
X-Gm-Message-State: AJIora8yIcvJPEmuLRFODJwphGB5wI0S8zuyF+kkBHq9ZGmxKeW/eSxF
 UItXgUokA4ALk13dqeTrDcU=
X-Google-Smtp-Source: AGRyM1vBuurZ1e8WHBsDB0dHh+TO9PRWklP9Sq9N7LukPN12b/pMhmUuj4uq5Po+DhGXhzyadAurwQ==
X-Received: by 2002:a05:6a00:2448:b0:528:7acc:363 with SMTP id
 d8-20020a056a00244800b005287acc0363mr1403311pfj.32.1656966391468; 
 Mon, 04 Jul 2022 13:26:31 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 f80-20020a623853000000b005252380a87bsm21274606pfa.59.2022.07.04.13.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 13:26:31 -0700 (PDT)
Date: Tue, 5 Jul 2022 05:26:29 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 Openrisc <openrisc@lists.librecores.org>
Subject: Re: [PATCH v2 07/11] target/openrisc: Add interrupted CPU to log
Message-ID: <YsNM9QPAjzll8Olo@antec>
References: <20220703212823.10067-1-shorne@gmail.com>
 <20220703212823.10067-8-shorne@gmail.com>
 <4bfc20ec-962b-2017-f2ba-26cd65bd3d9f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bfc20ec-962b-2017-f2ba-26cd65bd3d9f@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Jul 04, 2022 at 03:34:52PM +0530, Richard Henderson wrote:
> On 7/4/22 02:58, Stafford Horne wrote:
> > When we are tracing it's helpful to know which CPU's are getting
> > interrupted, att that detail to the log line.
> 
> "at".
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Actually it should be "add", thanks I fixed it.

-Stafford

