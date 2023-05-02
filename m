Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F926F3E3F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 09:12:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptkAc-0003wk-IP; Tue, 02 May 2023 03:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ptkAV-0003uw-0X
 for qemu-devel@nongnu.org; Tue, 02 May 2023 03:11:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ptkAS-0005gM-Lj
 for qemu-devel@nongnu.org; Tue, 02 May 2023 03:11:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683011477;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=aIzcxIGiUAbG+hbyLWP6TfnE8GkEDS652SHDLMmxRjo=;
 b=SFPZv1uU61Ypuek1x0abqHwDVWpRiEuWBpFx9en1m7NLzvq9IX0KsZnUH+kecK7f8hobzL
 5+P6ihssQxRlhIp4asgiQG0YRYsV2dTaV5q7aN9H8baOjovPnd/v3V982235Tru4jA22lv
 8yId/GOExG/cnhC+dz/0ZJth1rjhE2k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-MCzvP11APGKrZLdkfgBJrA-1; Tue, 02 May 2023 03:11:15 -0400
X-MC-Unique: MCzvP11APGKrZLdkfgBJrA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f315735edeso96398735e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 00:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683011473; x=1685603473;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aIzcxIGiUAbG+hbyLWP6TfnE8GkEDS652SHDLMmxRjo=;
 b=SmoFL91FXONEqGddirSe2MN9BnnG/y8hA6Cw9gSjlLmThKPgANTLwY95BZZYTdgmzU
 vEGNFG0n9aZVjeHm5sZ9sk5oT4vCXwIrlzfof2bc+MFOQJyW9JAvUuqFAA0b0qYnyESy
 au84f+EkEM5TMo8uVSa12zX3A4gF1OwEakY4MXeJoptVyJ2s/14Bwg4+41tCk9b6JIeQ
 Z0bhSEmJaVY/Io2+bcDE1o+lSiV9+Q0ncBJ+hSwvzpWzEnP5N1CHvT+6sr7jmlKswC3V
 HR5g7GZDOO+A6jl3PRy1ipRzA2IC5Wi03zcz0WGc4kk3Zq9FYKptkoS5938na27TfI1Q
 PCQw==
X-Gm-Message-State: AC+VfDw3LlYLvvqm21w9sxvRz4xEigpQ9E0shx/okkioMuAVAq00LxU6
 R88ZRl9YK1KtzqmYe7DuEk+IRrHS5epBR7W2deB0FeMVlTMT90a2Mbs7c085y649CG18jxPwTNR
 CYDtBeJbAQlYp4e0=
X-Received: by 2002:adf:e550:0:b0:304:7bbf:7c1e with SMTP id
 z16-20020adfe550000000b003047bbf7c1emr15143413wrm.4.1683011473765; 
 Tue, 02 May 2023 00:11:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ63gOU+XRPLVzT1Uk6K3pcEgfXBTC5r2HHnZxUS6Mf8WepASubZGbkJ87bEJ2ANQg2STbMf/Q==
X-Received: by 2002:adf:e550:0:b0:304:7bbf:7c1e with SMTP id
 z16-20020adfe550000000b003047bbf7c1emr15143397wrm.4.1683011473482; 
 Tue, 02 May 2023 00:11:13 -0700 (PDT)
Received: from redhat.com ([188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 m18-20020adffa12000000b003047297a5e8sm23350137wrr.54.2023.05.02.00.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 00:11:12 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  peterx@redhat.com,  leobras@redhat.com,
 pbonzini@redhat.com
Subject: Re: [PATCH] migration/xbzrle: Use __attribute__((target)) for avx512
In-Reply-To: <20230501210555.289806-1-richard.henderson@linaro.org> (Richard
 Henderson's message of "Mon, 1 May 2023 22:05:55 +0100")
References: <20230501210555.289806-1-richard.henderson@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 02 May 2023 09:11:09 +0200
Message-ID: <87fs8fus1e.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Richard Henderson <richard.henderson@linaro.org> wrote:
> Use the attribute, which is supported by clang, instead of
> the #pragma, which is not supported and, for some reason,
> also not detected by the meson probe, so we fail by -Werror.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


