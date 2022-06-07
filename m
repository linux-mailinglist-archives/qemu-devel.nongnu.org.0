Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A355403F5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 18:41:32 +0200 (CEST)
Received: from localhost ([::1]:48854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nycGp-0007Fy-3k
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 12:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nycCk-0004VO-Ld
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 12:37:19 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:37551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nycCj-0001ru-4j
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 12:37:18 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so18167711pjm.2
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 09:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DFtfFcOJ+bx364w5ODxCzMgY5LhxI/+p0J6AJC/GJfU=;
 b=vr+ygewGvoOf8GeSXAEnn/J8cs4AfJ+H/aiZJyfVNo7MP3Yy3F4jyWNElRIua3DAev
 Nb88V+eO79kBzPFi7JYu1pgxoV4yASNKne07AAOuCC4JVi9ugE7J06kT9RIuLQzg7W4m
 2mPnZFShwIpfzOE5NhU+RWTbDxg6DyfW3kYMd3MiM0YqYkSSkQFYDM1Bl3ekBoZNvzff
 Qw4HWqnmivB/0Codq1R8ekbXOCBLBnzXJafx/1SoyHkEyPG+ReYHMFf/swfHLmjFcCX2
 mKWeaV87XB4uBCfohE7KwhwQYkkcwQX/p7I7pd3UX6jpm1haxI5khyXLU0B3WZvsMeS6
 dK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DFtfFcOJ+bx364w5ODxCzMgY5LhxI/+p0J6AJC/GJfU=;
 b=nu/Z/fRnID02M+e8UnHlxH43c6+ig3JdL4E+1aqlAlzQ50/TIz1uDZUwyfh0ABeImt
 iK5kw2rYDVqo9/201QmGLMC69m3Ac+qBRONcVLeSttWNpgcsqUq2Zws3XWvnhlYQSBzT
 LDdbxCC+Frtk2PkPrbD7hOzpJzF6l4Vd7bhKnwlpYSPlzdw5vKr05HBxX1StZIxUbwbc
 jFss9hxncvqg7MG3a5jqHpzv8Ug+1pBVWJS/MhGzU8InZX5p4zP1dcZ2UBBlt+z62FT5
 yRMKz9+IWB5BLhMkbR7h7Vw/iZb7WqgB10+uY/iMaen+5q5T/gXo1csyLyGwbxmZRFIJ
 qcPw==
X-Gm-Message-State: AOAM5307pOXhfD2ByL7tcxAFa4/KTdOl6ELOiuk/KJBbZRYd1lnXYUz3
 44Tvkz4/aPDtVz5P3p6hc0j65A==
X-Google-Smtp-Source: ABdhPJxKWA6IzZzSMme5vx2WFUlcZghpEP2/nwqic825j2/C1pw4y/f+de+10V6eJTzwnoOxFmGU9A==
X-Received: by 2002:a17:90a:2c0c:b0:1ea:14c0:f0ca with SMTP id
 m12-20020a17090a2c0c00b001ea14c0f0camr1887843pjd.143.1654619835375; 
 Tue, 07 Jun 2022 09:37:15 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3cf2:c634:5b19:25f6?
 ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 ie12-20020a17090b400c00b001e2f0333a86sm12313232pjb.12.2022.06.07.09.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 09:37:14 -0700 (PDT)
Message-ID: <731a436b-5272-e103-28f1-3211dc57332d@linaro.org>
Date: Tue, 7 Jun 2022 09:37:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/3] target/mips: introduce generic Cavium Octeon CPU model
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, jiaxun.yang@flygoat.com, aurelien@aurel32.net,
 aleksandar.rikalo@syrmia.com
References: <165459235408.143371.17715826203190085295.stgit@pasha-ThinkPad-X280>
 <165459235959.143371.13189201469172149052.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <165459235959.143371.13189201469172149052.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/7/22 01:59, Pavel Dovgalyuk wrote:
> +    {
> +        /*
> +         * A generic CPU providing MIPS64 Cavium Octeon features.
> +         * PRid is taken from Octeon 68xx CPUs
> +         * FIXME: Eventually this should be replaced by a real CPU model.
> +         */

You should just add the real cpu model.  No one will ever address this FIXME otherwise.


r~

